program SvcLoaderInteractiveDebugger;

uses
  Forms,
  svclDemoForm in 'svclDemoForm.pas' {Form1},
  svclTransBio in 'svclTransBio.pas',
  svclBiometricFiles in 'svclBiometricFiles.pas' {BioFilesService: TService},
  svclConfig in 'svclConfig.pas',
  svclTCPTransfer in 'svclTCPTransfer.pas',
  StrHnd in '..\..\..\..\Pcks\XPLib\Src\StrHnd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBioFilesService, BioFilesService);
  Application.CreateForm(TDMTCPTransfer, DMTCPTransfer);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
