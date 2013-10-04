{$IFDEF svclBiometricFiles}
{$DEFINE DEBUG_UNIT}
{$ENDIF}
{$I SvcLoader.inc}
unit svclBiometricFiles;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, svclTransBio, ExtCtrls,
    IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
    IdMessageClient, IdSMTPBase, IdSMTP, FileInfo, XPThreads;

type
    TBioFilesService = class(TService)
        tmrCycleEvent : TTimer;
        smtpSender :    TIdSMTP;
        mailMsgNotify : TIdMessage;
        fvInfo :        TFileVersionInfo;
        procedure ServiceAfterInstall(Sender : TService);
        procedure ServiceBeforeInstall(Sender : TService);
        procedure ServiceCreate(Sender : TObject);
        procedure ServicePause(Sender : TService; var Paused : boolean);
        procedure ServiceStart(Sender : TService; var Started : boolean);
        procedure ServiceStop(Sender : TService; var Stopped : boolean);
        procedure ServiceContinue(Sender : TService; var Continued : boolean);
        procedure tmrCycleEventTimer(Sender : TObject);
    private
        { Private declarations }
        FSvcThread :    TXPNamedThread; // Dualidade entre o thread de cliente e de servidor
        FLastLogCheck : Word;
        procedure AddDestinations;
        procedure CheckLogs();
    public
        class function LogFilePrefix() : string;
        constructor CreateNew(AOwner : TComponent; Dummy : Integer = 0); override;
        function GetServiceController : TServiceController; override;
        procedure ServiceThreadPulse();
        procedure SendMailNotification(const NotificationText : string);
        { Public declarations }
    end;

var
    BioFilesService : TBioFilesService;

implementation

uses
    AppLog, WinReg32, FileHnd, svclConfig, svclUtils, WinnetHnd, APIHnd, svclEditConfigForm, Str_Pas,
    IdEMailAddress, XPFileEnumerator, StrHnd, svclTCPTransfer;

{$R *.DFM}

const
    SUBJECT_TEMPLATE = 'BioFilesService - Vers�o: %s - %s - %s';

procedure ServiceController(CtrlCode : DWord); stdcall;
begin
    BioFilesService.Controller(CtrlCode);
end;

procedure InitServiceLog();
/// Altera o nome do log a ser gerado para esta inicia��o do servi�o de modo a ser unico por dia de levantameto
var
    LogFileName : string;
begin
    LogFileName := TFileHnd.ConcatPath([GlobalConfig.PathServiceLog, TBioFilesService.LogFilePrefix() +
        FormatDateTime('YYYYMMDD', Now())]) + '.log';
    try
        AppLog.TLogFile.GetDefaultLogFile.FileName := LogFileName;
    except
        on E : Exception do begin
            AppLog.AppFatalError('Erro fatal iniciando aplicativo'#13#10 + E.Message, 10);
        end;
    end;
end;

procedure TBioFilesService.AddDestinations;
var
    dst : TIdEMailAddressItem;
    lst : TStringList;
    x :   Integer;
begin
    lst := TStringList.Create;
    try
        lst.Delimiter     := ';';
        lst.DelimitedText := GlobalConfig.NotificationList;
        for x := 0 to lst.Count - 1 do begin
            dst      := Self.mailMsgNotify.Recipients.Add();
            dst.Address := lst.Strings[x];
            dst.Name := 'SESOP - Verificador de Sistemas eleitorais';
        end;
    finally
        lst.Free;
    end;
end;

procedure TBioFilesService.CheckLogs;
 /// <summary>
 /// Buscar por logs posteriores a data de registro, enviando todos aqueles que possuirem erros.
/// A cada envio com sucesso avancar a data de registro para a data do respectivo arquivo de log e buscar pelo mais antigo at� chegar ao log atual
 /// </summary>
 /// <remarks>
 ///
 /// </remarks>
var
    Files :  IEnumerable<TFileSystemEntry>;
    f :      TFileSystemEntry;
    currLogName, newLogName, sentPath : string;
    logText : TXPStringList;
    dummy :  Integer;
    sentOK : boolean;
    lt :     TSystemTime;
begin
    // Registra a hora da ultima passagem de verifica��o de log
    currLogName := AppLog.TLogFile.GetDefaultLogFile.FileName;
    GetLocalTime(lt);
    if (Self.FLastLogCheck <> lt.wHour) then begin
        newLogName := TFileHnd.ConcatPath([GlobalConfig.PathServiceLog, TBioFilesService.LogFilePrefix() +
            FormatDateTime('YYYYMMDD', Now())]) + '.log';
        if (currLogName <> newLogName) then begin
            AppLog.TLogFile.GetDefaultLogFile.FileName := newLogName;
            currLogName := newLogName;
        end;
        Self.FLastLogCheck := lt.wHour; //Registra a mudanca de hora
    end;
    // filtra arquivos referentes apenas a este runtime
    Files := TDirectory.FileSystemEntries(GlobalConfig.PathServiceLog, TBioFilesService.LogFilePrefix + '*.log', False);
    for f in Files do begin
        if (not Sametext(f.FullName, currLogName)) then begin // Pula o arquivo em uso no momento como saida de log
            logText := TXPStringList.Create;
            try
                logText.LoadFromFile(f.FullName);
                dummy  := 1; // Sempre do inicio
				 sentOK := not logText.FindPos('erro:', dummy, dummy);
				 sentOK := sentOK and ( not logText.FindPos('Alarme:', dummy, dummy) );
				 {TODO -oroger -cdsg : Idem acima para o caso de alarmes}
                if (not sentOK) then begin
                    try
                        Self.SendMailNotification(logText.Text);
                        sentOK := True;
                    except
                        on E : Exception do begin // Apenas logar a falha de envio e continuar com os demais arquivos
                            TLogFile.Log('Envio de notifica��es de erro falhou:'#13#10 + E.Message, lmtError);
                            sentOK := False;
                        end;
                    end;
                end;
                // mover arquivo para a pasta de enviados applog
                if (sentOK) then begin
                    sentPath := GlobalConfig.PathServiceLog + '\Sent\';
                    ForceDirectories(sentPath);
                    sentPath := sentPath + f.Name;
                    sentPath := TFileHnd.NextFamilyFilename(sentPath);
                    if (not MoveFile(PWideChar(f.FullName), PWideChar((sentPath)))) then begin
                        TLogFile.Log('Final do processamento de arquivo de log falhou:'#13#10 +
                            SysErrorMessage(GetLastError()), lmtError);
                    end;
                end;
            finally
                logText.Free;
            end;
        end;
    end;
end;

constructor TBioFilesService.CreateNew(AOwner : TComponent; Dummy : Integer);
begin
    inherited;
    //Para aplica��es externas de teste instancia criada a parte, ao contrario do modo de servi�os
    if (not Assigned(DMTCPTransfer)) then begin
        Application.CreateForm(TDMTCPTransfer, DMTCPTransfer);
    end;
end;

function TBioFilesService.GetServiceController : TServiceController;
begin
    Result := ServiceController;
end;

class function TBioFilesService.LogFilePrefix : string;
begin
    Result := APP_SERVICE_NAME + '_' + TFileHnd.ExtractFilenamePure(ParamStr(0)) + '_';
end;

procedure TBioFilesService.SendMailNotification(const NotificationText : string);
begin
    mailMsgNotify.ConvertPreamble := True;
    mailMsgNotify.AttachmentEncoding := 'UUE';
    mailMsgNotify.Encoding      := meDefault;
    mailMsgNotify.From.Address  := GlobalConfig.NotificationSender;
    mailMsgNotify.From.Name     := Application.Title;
    mailMsgNotify.From.Text     := Format(' %s <%s>', [Application.Title, GlobalConfig.NotificationSender]);
    mailMsgNotify.From.Domain   := Str_Pas.GetDelimitedSubStr('@', GlobalConfig.NotificationSender, 1);
    mailMsgNotify.From.User     := Str_Pas.GetDelimitedSubStr('@', GlobalConfig.NotificationSender, 0);
    mailMsgNotify.Sender.Address := GlobalConfig.NotificationSender;
    mailMsgNotify.Sender.Name   := APP_NOTIFICATION_DESCRIPTION;
    mailMsgNotify.Sender.Text   := Format('"%s" <%s>', [APP_NOTIFICATION_DESCRIPTION, GlobalConfig.NotificationSender]);
    mailMsgNotify.Sender.Domain := mailMsgNotify.From.Domain;
    mailMsgNotify.Sender.User   := mailMsgNotify.From.User;

    // Coletar informa��es de destino de mensagem com possibilidade de macros no mesmo arquivo de configura��o
    Self.AddDestinations();

    Self.mailMsgNotify.Subject   := Format(SUBJECT_TEMPLATE, [Self.fvInfo.FileVersion, WinnetHnd.GetComputerName(),
        FormatDateTime('yyyyMMDDhhmm', Now())]);
	 Self.mailMsgNotify.Body.Text := NotificationText;
	 {TODO -oroger -cdsg : Capturar o erro isolando a causa }
    Self.smtpSender.Connect;
    Self.smtpSender.Send(Self.mailMsgNotify);
    Self.smtpSender.Disconnect(True);
end;

procedure TBioFilesService.ServiceAfterInstall(Sender : TService);
 /// <summary>
 /// Registra as informa��es de fun��o deste servi�o
 /// </summary>
var
	 Reg : TRegistryNT;
	 svcType : Integer;
	 svcKey : string;
begin
	 Reg := TRegistryNT.Create();
	 try
		svcKey := TFileHnd.ConcatPath([ 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services', Self.Name]);
		 Reg.WriteFullString( svcKey + '\Description',
			 'Replica os arquivos de dados biom�tricos para m�quina prim�ria, possibilitando o transporte centralizado.', True);
		 Reg.ReadFullInteger(svcKey + '\Type', svcType );
		 svcType := svcType or $100; //Nono bit para indicar interativo
		 Reg.WriteFullInteger(svcKey + '\Type', svcType, True );
	 finally
        Reg.Free;
    end;
end;

procedure TBioFilesService.ServiceBeforeInstall(Sender : TService);
 /// <summary>
 /// Ajusta os parametros do servi�o antes de sua instala��o. Dentre as a��es est� levantar o servi�o como o �ltimo da lista de
 /// servi�os
 /// </summary>
 /// <remarks>
 ///
 /// </remarks>
var
    Reg : TRegistryNT;
    lst : TStringList;
begin
	{TODO -oroger -cdsg : Remover dependencia de NetLogon e colocar a do cliente dns}
	{TODO -oroger -cdsg : Inserir um lmtAlarm para envio de notifica��o}
	 try
		{TODO -oroger -cdsg : N�o invocar dialogo para o caso de instala��o automatica}
		if ( not FindCmdLineSwitch( 'noconfig' ) ) then begin
			TEditConfigForm.EditConfig; // Chama janela de configura��o para exibi��o
		end;
    except
        on E : Exception do begin
            AppFatalError('Configura��es do servi�o n�o efetivadas'#13#10 + E.Message, 8666, True);
        end;
    end;

    Reg := TRegistryNT.Create;
    lst := TStringList.Create;
    try
        Reg.ReadFullMultiSZ('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ServiceGroupOrder\List', lst);
        if ((lst.IndexOf(APP_SERVICE_GROUP) < 0)) then begin
            lst.Add(APP_SERVICE_GROUP);
            TLogFile.Log('Alterando ordem de inicializa�ao dos servi�os no registro local', lmtInformation);
            if (not IsDebuggerPresent()) then begin
                Reg.WriteFullMultiSZ('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ServiceGroupOrder\List', lst, True);
            end;
        end;
    finally
        Reg.Free;
        lst.Free;
    end;
    TLogFile.Log('Ordem de carga do servi�o alterada com SUCESSO no computador local', lmtInformation);
end;

procedure TBioFilesService.ServiceContinue(Sender : TService; var Continued : boolean);
 /// <summary>
 /// Reincio do servico
 /// </summary>
 /// <remarks>
 ///
 /// </remarks>
begin
    TLogFile.LogDebug('Chamada de ServiceContinue em execu��o', DBGLEVEL_ULTIMATE);
    // Rotina de inicio do servico, dispara thread da opera��o
    if Assigned(Self.FSvcThread) then begin
        if Self.FSvcThread.Suspended then begin
            TLogFile.LogDebug('Liberando thread de servi�o', DBGLEVEL_ULTIMATE);
            Self.FSvcThread.Start; //Dispara o thread de servi�o
            Sleep(300);
        end;
        Continued := (not Self.FSvcThread.Finished);
    end else begin
        Continued := False;
        TLogFile.Log('Thread de Servi�o n�o criado anteriormente!');
    end;
     {
     // Para de aceitar conexoes se no modo servidor
     TLogFile.LogDebug('Abrindo conex�es de rede', DBGLEVEL_DETAILED);
     if (GlobalConfig.RunAsServer) then begin
         try
             DMTCPTransfer.tcpsrvr.StartListening;
             Continued := True;
         except
             on E : Exception do begin
                 Continued := False;
                 TLogFile.Log(Format('Servi�o n�o foi capaz de iniciar escuta na porta:%d'#13#10 + E.Message,
                     [GlobalConfig.NetServicePort]), lmtError);
             end;
         end;
      end;
     }
end;

procedure TBioFilesService.ServiceCreate(Sender : TObject);
begin
    {DONE -oroger -cdsg : Inserir hint no tray o servico }
    {DONE -oroger -cdsg : Registrar servico par interagir com o desktop}
    {DONE -oroger -cdsg : Parar thread ao final de ciclo de opera��o }
    {TODO -oroger -cdsg : testar forma de atribuir depura��o para carga por attachprocess }
    (*
    while DebugHook <> 0 do begin
        Break;
    end;
    *)
    Self.DisplayName := APP_SERVICE_DISPLAYNAME;
    Self.LoadGroup   := APP_SERVICE_GROUP;
end;

procedure TBioFilesService.ServicePause(Sender : TService; var Paused : boolean);
 /// <summary>
 /// Pause do servico
 /// </summary>
 /// <remarks>
 ///
 /// </remarks>
begin
    Self.tmrCycleEvent.Enabled := False; // Suspende timer de libera��o do thread do servi�o
    if Assigned(Self.FSvcThread) and (not Self.FSvcThread.Suspended) then begin
        Self.FSvcThread.Suspended := True;
    end;

    // Para de aceitar conexoes se no modo servidor
    if (GlobalConfig.RunAsServer) then begin
        DMTCPTransfer.tcpsrvr.StopListening;
    end;

    Paused := Self.FSvcThread.Suspended;
end;

procedure TBioFilesService.ServiceStart(Sender : TService; var Started : boolean);
var
    msvc : string;
begin
    if (GlobalConfig.RunAsServer) then begin
        TLogFile.Log('Iniciando o servi�o no modo servidor....', lmtInformation);
    end else begin
        TLogFile.Log('Iniciando o servi�o no modo cliente...', lmtInformation);
    end;

    try
        Self.CheckLogs(); // proteger chamada ,pois rede pode estar instavel neste momento
    except
        on E : Exception do begin
            TLogFile.Log('Checagem de logs falhou.'#13#10 + E.Message, lmtWarning);
        end;
    end;


    case Self.Status of
        csStopped : begin
            msvc := 'csStopped';
        end;
        csStartPending : begin
            msvc := 'csStartPending';
        end;
        csStopPending : begin
            msvc := 'csStopPending';
        end;
        csRunning : begin
            msvc := 'csRunning';
        end;
        csContinuePending : begin
            msvc := 'csContinuePending';
        end;
        csPausePending : begin
            msvc := 'csPausePending';
        end;
        csPaused : begin
            msvc := 'csPaused';
        end;
        else begin
            msvc := 'Estado desconhecido';
        end
    end;

    TLogFile.LogDebug('Transi��o de estado durante in�cio do servi�o. Estado anterior = ' + msvc, DBGLEVEL_ULTIMATE);

    if (Self.Status in [csStartPending, csStopped]) then begin
        if (GlobalConfig.RunAsServer) then begin // veio de parada(n�o pause)
            TLogFile.Log('Criando thread de servi�o no modo servidor', lmtInformation);
            Self.FSvcThread := TTransBioServerThread.Create(True);
        end else begin
            TLogFile.Log('Criando thread de servi�o no modo cliente', lmtInformation);
            Self.FSvcThread := TTransBioThread.Create(True);
        end;
        Self.FSvcThread.Name := APP_SERVICE_DISPLAYNAME; // Nome de exibi��o do thread prim�rio
    end;

    Self.ServiceContinue(Sender, Started); // Rotinas de resumo do thread de servico
    if (Started) then begin
        Self.tmrCycleEvent.Interval := GlobalConfig.CycleInterval;
        Self.tmrCycleEvent.Enabled  := True; // Liberar disparo de libera��o de thread de servi�o
        TLogFile.Log('Servi�o iniciado com sucesso.', lmtInformation);
    end else begin
        TLogFile.Log('Servi�o falhou em sua carga.', lmtWarning);
    end;
end;

procedure TBioFilesService.ServiceStop(Sender : TService; var Stopped : boolean);
 /// <summary>
 /// Destroi o thread de servico parando o servico
 /// </summary>
 /// <remarks>
 ///
 /// </remarks>
var
    cnt : Word;
begin
    // Para timer de gatilho do thread de servi�o
    if (Assigned(Self.FSvcThread)) then begin
        Self.FSvcThread.Terminate; // informa do fim da vida deste thread
        cnt := 0;
        while ((not Self.FSvcThread.Finished) and (cnt < 5)) do begin // aguarda tempo para libera��o(tempo chutado)
            Sleep(300);
            Inc(cnt);
        end;
        if (not Self.FSvcThread.Finished) then begin
            TLogFile.Log('Thread de servi�o n�o parou em tempo h�bil', lmtError);
        end;
        FreeAndNil(Self.FSvcThread);
    end;
    Self.tmrCycleEvent.Interval := GlobalConfig.CycleInterval;
    Self.tmrCycleEvent.Enabled := False; // Para a reativa��o do thread de servi�o
    Stopped := True;
end;

procedure TBioFilesService.ServiceThreadPulse;
/// Dispara libera o thread de servi�o de seu estado de ociosidade
begin
    if (Assigned(Self.FSvcThread) and (not Self.FSvcThread.Finished)) then begin
        Self.FSvcThread.Suspended := False;
    end;
end;

procedure TBioFilesService.tmrCycleEventTimer(Sender : TObject);
begin
    // Realiza a checkagem dos logs a cada mudan�a de hora
    Self.CheckLogs;
    Self.ServiceThreadPulse();
end;

initialization

    begin
        InitServiceLog();
    end;

end.
