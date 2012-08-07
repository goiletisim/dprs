object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Verificador de Vers'#245'es 2010 T1'
  ClientHeight = 333
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888
    8888888888888888888888888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFF87778FFFFFFFFFFFFFFFFFFFFFFFFF811987646FFFFFFFFFFFF
    FFFFFFFFFF118937888747FFFFFFFFFFFFFFFFFFF19793988888848FFFFFFFFF
    FFFFFFFF819933378888884FFFFFFFFFFFFFFFFF179999977E767E48FFFFFFFF
    FFFFFFF819393937777777E4FFFFFFFFFFFFFFF7799999976666767CFFFFFFFF
    FFFFFFF77BBBBBB7E666E6E4FFFFFFFFFFFFFFF77BBBBBBB66666664FFFFFFFF
    888888877BBBBBBB76666664FFFFFFFF7888888898BBBBBBB6666666FFFFFFFF
    7878888738BBBBBBB7666648FFFFFFFFF87BBB35838BBBBBBB66667FFFFFFFFF
    F88BBB358938BBBBBB7664FFFFFFFFFFF87BBB3589913888B8B47FFFFFFFFFFF
    F88BBB35793931333178FFFFFFFFFFFFF87BBB357999762222FFFFFFFFFFFFFF
    F88BBB357939736220FFFFFFFFFFFFFFF87BBB3587775726228FFFFFFFFFFFFF
    F87BBB377777836262FFFFFFFFFFFFFFF838889FFFFF872222FFFFFFFFFFFFFF
    F877778FFFFFF3A262FFFFFFFFFFFFFFFFFFFFFFFFFF8288828FFFFFFFFFFFFF
    FFFFFFFFFFFFF77777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMainLabel: TLabel
    Left = 8
    Top = 10
    Width = 258
    Height = 13
    Caption = 'SESOP - Verificador de Vers'#245'es de Sistemas 2010 - T1'
  end
  object lblProfLabel: TLabel
    Left = 9
    Top = 29
    Width = 34
    Height = 13
    Caption = 'Perfil : '
  end
  object lblProfile: TLabel
    Left = 55
    Top = 29
    Width = 40
    Height = 13
    Caption = '----------'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 87
    Top = 275
    Width = 161
    Height = 51
    Caption = '&Fechar'
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnOKClick
  end
  object grdList: TEnhStringGrid
    Left = 9
    Top = 52
    Width = 489
    Height = 217
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goRowSelect, goFixedRowClick]
    TabOrder = 2
    OnClick = grdListDblClick
    OnDblClick = grdListDblClick
    OnDrawCellGetProperties = grdListDrawCellGetProperties
    ColWidths = (
      288
      102
      88)
  end
  object btnNotifSESOP: TBitBtn
    Left = 254
    Top = 273
    Width = 161
    Height = 52
    Caption = '&Informar'
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      36240000424D3624000000000000360000002800000030000000300000000100
      20000000000000240000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AAAAAA20AAAAAA40AAAAAA60A9A9A980A9A9
      A99FA9A9A9AFA9A9A93000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABABAB30ABABAB40ABABAB70ABABAB80ABAB
      ABAFABABABBFB1B1B1DFC0C0C0FFC0C0C0FFD5D5D5FFD5D5D5FFEAEAEAFFEAEA
      EAFFEAEAEAFFAAAAAADF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ADADAD40ADADAD40ADADAD60ADADAD80ADADAD80ADAD
      ADBFADADADBFB2B2B2EFC1C1C1FFC6C6C6FFD6D6D6FFDBDBDBFFEAEAEAFFEFEF
      EFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFCFCFCFFFAFAFAFFFDFD
      FDFFFFFFFFFFC0C0C0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AFAFAF30AFAF
      AF40AFAFAF40AFAFAF60AFAFAF80AFAFAF80AFAFAF9FAFAFAFBFAFAFAFBFB4B4
      B4EFC2C2C2FFC2C2C2FFCCCCCCFFD7D7D7FFD6D6D6FFEBEBEBFFEBEBEBFFF5F5
      F5FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFBFBFBFFFAFAFAFFF8F8
      F8FFF7F7F7FFF5F5F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF5F5F5FFF2F2
      F3FFF5F5F6FFC6C6C6FFACACAC3000000000000000000000000000000000B1B1
      B180B1B1B1BFB1B1B1BFB1B1B1BFB5B5B5FFC4C4C4FFC4C4C4FFC4C4C4FFD8D8
      D8FFD8D8D8FFD7D7D7FFEBEBEBFFEBEBEBFFEBEBEBFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFCFCFCFFFAFAFAFFFAFAFAFFF7F7
      F7FFF7F7F7FFF5F5F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF5F5F5FFF2F2F3FFE6E6
      E8FFFFFFFFFFD6D6D6FFADADAD40000000000000000000000000B2B2B260CFCF
      CFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFC
      FCFFFCFCFCFFFCFCFCFFFAFAFAFFFAFAFAFFFAFAFAFFF7F7F7FFF7F7F7FFF7F7
      F7FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF5F5F5FFF2F2F3FFE7E7E9FFF3F3
      F3FFFDFDFDFFD7D7D7FFAEAEAE60000000000000000000000000B3B3B380E3E3
      E3FFFFFFFFFFFAFAFAFFF5F5F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF5F5F5FFF2F2F3FFE8E8EAFFF3F3F3FFF4F4
      F4FFFCFCFCFFEBEBEBFFB0B0B080000000000000000000000000B4B4B440DADA
      DAFFF1F1F3FFF2F2F3FFF7F7F7FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF5F5F5FFF2F2F3FFE9E9EAFFF3F3F3FFF4F4F4FFF4F4
      F4FFFBFBFBFFEBEBEBFFB1B1B19F000000000000000000000000B5B5B520C8C8
      C8FFFEFEFEFFE9E9EAFFEBEBEDFFF8F8F8FFF5F5F5FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF3F3F4FFE7E7E9FFF2F2F2FFF4F4F4FFF4F4F4FFF4F4
      F4FFFAFAFAFFFFFFFFFFB2B2B2BF00000000000000000000000000000000BFBF
      BFFFFFFFFFFFF7F7F7FFEDEDEEFFE7E7E8FFF4F4F4FFF7F7F7FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFEEEEEEFFD7D7D7FFC6C6C6FFC6C6C6FFCFCFCFFFE3E3
      E3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF5F5F6FFE8E8EAFFF1F1F2FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF8F8F8FFFFFFFFFFB3B3B3DF00000000000000000000000000000000B7B7
      B7BFFFFFFFFFF9F9F9FFF4F4F4FFF2F2F2FFE8E8E9FFECECEEFFF8F8F8FFF5F5
      F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFE6E6E6FFC9C9C9FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFCCCCCCFFE3E3E3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF5F5F6FFE9E9EAFFF2F2F2FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF7F7F7FFFFFFFFFFC7C7C7FF00000000000000000000000000000000B8B8
      B89FEDEDEDFFFAFAFAFFF4F4F4FFF4F4F4FFF4F4F4FFEDEDEEFFE7E7E9FFF3F3
      F4FFF7F7F7FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFE3E3E3FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FFC6C6C6FFD2D2D2FFEEEEEEFFF4F4F4FFF4F4F4FFF4F4F4FFF7F7
      F7FFE9E9EAFFEFEFF0FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF5F5F5FFFFFFFFFFC8C8C8FFB5B5B510000000000000000000000000BABA
      BA80E9E9E9FFFCFCFCFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF1F1F1FFE8E8
      EAFFEEEEEFFFF7F7F7FFF5F5F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFE3E3
      E3FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FFC9C9C9FFE0E0E0FFF4F4F4FFF7F7F7FFEAEA
      EBFFEFEFF0FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFFFFFFFFFD6D6D6FFB6B6B640000000000000000000000000BBBB
      BB50DDDDDDFFFEFEFEFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFEDEDEEFFE8E8EAFFF5F5F5FFF6F6F6FFF4F4F4FFF4F4F4FFEBEBEBFFC9C9
      C9FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFDEDEDEFFECECEEFFEBEB
      ECFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFFEFEFEFFDBDBDBFFB7B7B750000000000000000000000000BCBC
      BC30D5D5D5FFFFFFFFFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF1F1F1FFE7E7E9FFF0F0F1FFF8F8F8FFEFEFEFFFC9C9C9FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FFC1C1C1FFB3B3B3FFA8A8A8FFADADADFFB6B6
      B6FFC3C3C3FFC6C6C6FFC6C6C6FFC6C6C6FFCCCCCCFFDBDBDCFFCACACCFFEBEB
      EBFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFFCFCFCFFE9E9E9FFB8B8B8800000000000000000000000000000
      0000CDCDCDFFFFFFFFFFF7F7F7FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF3F3F3FFEAEAECFFE8E8EAFFE0E0E1FFCCCCCCFFC6C6
      C6FFC6C6C6FFC3C3C3FFADADADFF9E9E9EFFB7B7B7FFD0D0D0FFCACACAFFB7B7
      B7FFA0A0A0FFA8A8A8FFBBBBBBFFC8C8C8FFDCDCDCFFC4C4C5FFC5C5C5FFC9C9
      C9FFE3E3E3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFFBFBFBFFEEEEEEFFB9B9B98F0000000000000000000000000000
      0000C2C2C2EFFFFFFFFFF7F7F7FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFD3D3D4FFCDCDCFFFDFDFDFFFCCCC
      CCFFBBBBBBFFA4A4A4FFC0C0C0FFEDEDEDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFF5F5F5FFDCDCDCFFB3B3B3FFADADADFFBABABBFFC5C5C5FFC6C6C6FFC6C6
      C6FFC6C6C6FFDDDDDDFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFFAFAFAFFFBFBFBFFBBBBBBBF0000000000000000000000000000
      0000BFBFBFBFFFFFFFFFFAFAFAFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFE3E3E3FFC6C6C6FFC3C3C3FFC0C0C2FFC9C9
      C9FFADADADFFE7E7E7FFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFEDEDEDFFC0C0C0FFA9A9A9FFBBBBBBFFC6C6
      C6FFC6C6C6FFC6C6C6FFD7D7D7FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF7F7F7FFFFFFFFFFBCBCBCDF0000000000000000000000000000
      0000C0C0C0AFF3F3F3FFFAFAFAFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFEBEBEBFFC9C9C9FFC6C6C6FFC6C6C6FFADADADFFC0C0
      C0FFF9F9F9FFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFF1F1F1FFCCCCCCFFABAB
      ABFFBEBEBEFFC6C6C6FFC6C6C6FFCFCFCFFFF1F1F1FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF6F6F6FFFFFFFFFFCDCDCDFF0000000000000000000000000000
      0000C1C1C180F0F0F0FFFCFCFCFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFCFCFCFFFC6C6C6FFC6C6C6FFAFAFAFFFCECECEFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFEDED
      EDFFC0C0C0FFAFAFAFFFC1C1C1FFC6C6C6FFCFCFCFFFF1F1F1FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFFFFFFFFFD6D6D6FFBEBEBE3000000000000000000000
      0000C2C2C270E5E5E5FFFCFCFCFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFDDDDDDFFC6C6C6FFC3C3C3FFABABABFFE3E3E3FFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFF9F9F9FFF7F7F7FFF6F6F6FFF6F6
      F6FFF7F7F7FFF9F9F9FFF9F9F9FFFBFBFBFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFEDEDEDFFC2C2C2FFB2B2B2FFC3C3C3FFCFCFCFFFEBEBEBFFF4F4
      F4FFF4F4F4FFF4F4F4FFFDFDFDFFDFDFDFFFBFBFBF5000000000000000000000
      0000C4C4C440E1E1E1FFFFFFFFFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFEBEBEBFFC6C6C6FFC3C3C3FFB3B3B3FFE7E7E7FFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFAFAFAFFF6F6F6FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF6F6F6FFF7F7F7FFFAFA
      FAFFFCFCFCFFFDFDFDFFFDFDFDFFE3E3E3FFB9B9B9FFB6B6B6FFC9C9C9FFEBEB
      EBFFF4F4F4FFF4F4F4FFFBFBFBFFEFEFEFFFC0C0C08000000000000000000000
      0000C5C5C540DBDBDBFFFFFFFFFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFCFCFCFFFC3C3C3FFB3B3B3FFF1F1F1FFFDFDFDFFFDFDFDFFFCFCFCFFF9F9
      F9FFF5F5F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF5F5F5FFF7F7F7FFFAFAFAFFF8F8F8FFD8D8D8FFB1B1B1FFBEBE
      BEFFEBEBEBFFF4F4F4FFFAFAFAFFF7F7F7FFC1C1C1BF00000000000000000000
      000000000000D4D4D4FFFFFFFFFFF7F7F7FFF4F4F4FFF4F4F4FFF4F4F4FFDDDD
      DDFFC3C3C3FFB3B3B3FFF1F1F1FFFDFDFDFFFCFCFCFFF9F9F9FFF5F5F5FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF7F7F7FFF1F1F1FFC7C7
      C7FFAEAEAEFFE9E9E9FFF7F7F7FFFFFFFFFFC2C2C2DF00000000000000000000
      000000000000CECECEFFFFFFFFFFF7F7F7FFF4F4F4FFF4F4F4FFEBEBEBFFC3C3
      C3FFB3B3B3FFF1F1F1FFFCFCFCFFF9F9F9FFF5F5F5FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFE7E7E7FFC5C5C5FFF5F5F5FFFFFFFFFFD2D2D2FFC4C4C410000000000000
      000000000000C8C8C8BFFFFFFFFFFAFAFAFFF4F4F4FFF4F4F4FFCFCFCFFFB3B3
      B3FFF1F1F1FFFAFAFAFFF5F5F5FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFFFFFFFFFDEDEDEFFC4C4C440000000000000
      000000000000C9C9C9BFF8F8F8FFFAFAFAFFF4F4F4FFDBDBDBFFAEAEAEFFEFEF
      EFFFF6F6F6FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF5F5F5FFF7F7F7FFF9F9F9FFFFFFFFFFE9E9E9FFC6C6C680000000000000
      000000000000CACACA80F2F2F2FFFCFCFCFFF1F1F1FFB5B5B5FFECECECFFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF7F7F7FFF7F7F7FFF7F7F7FFFAFA
      FAFFFAFAFAFFFAFAFAFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F8FFF1F1F1FFD8D8D8FFC6C6C660000000000000
      000000000000CBCBCB80EFEFEFFFFCFCFCFFE3E3E3FFEAEAEAFFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF5F5F5FFF7F7F7FFF7F7F7FFFAFAFAFFFAFAFAFFFCFC
      FCFFFCFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF2F2F2FFF2F2
      F2FFEBEBEBFFE4E4E4FFE4E4E4FFDDDDDDFFD6D6D6FFD6D6D6FFD6D6D6FFC8C8
      C8DFC8C8C8BFC8C8C8BFC8C8C8BFC8C8C88FC7C7C77000000000000000000000
      000000000000CCCCCC50E6E6E6FFFEFEFEFFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF5F5F5FFF7F7F7FFF8F8F8FFFAFAFAFFFAFAFAFFFCFC
      FCFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF2F2F2FFEFEFEFFFE5E5
      E5FFE5E5E5FFD8D8D8FFD8D8D8FFCECECEEFCACACABFCACACABFCACACA9FCACA
      CA80CACACA80C9C9C950C9C9C940C9C9C940C9C9C91000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE40E3E3E3FFFFFFFFFFFCFCFCFFFAFAFAFFFCFCFCFFFCFC
      FCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FFF3F3F3FFE9E9E9FFE6E6
      E6FFDFDFDFFFD9D9D9FFD3D3D3FFCCCCCCBFCCCCCCBFCCCCCC8FCCCCCC80CBCB
      CB50CBCBCB40CBCBCB2000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE10D5D5D5FFF6F6F6FFF3F3F3FFF3F3F3FFE7E7E7FFE7E7
      E7FFDADADAFFDADADAFFCECECEDFCECECEBFCECECEAFCDCDCD80CDCDCD70CDCD
      CD40CDCDCD400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCFCF50CFCFCFBFCFCFCF8FCFCFCF80CFCFCF60CFCF
      CF40CFCFCF200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ModalResult = 6
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnNotifSESOPClick
  end
  object pnlLog: TPanel
    Left = 87
    Top = 108
    Width = 321
    Height = 129
    Caption = '....'
    TabOrder = 3
    Visible = False
  end
end
