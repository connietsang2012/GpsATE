object frmModule: TfrmModule
  Left = 282
  Top = 175
  Width = 1024
  Height = 627
  Caption = #27169#29256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 11
  object Label42: TLabel
    Left = 521
    Top = 257
    Width = 42
    Height = 11
    Caption = 'Label42'
  end
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 593
    Align = alClient
    TabOrder = 0
    OnResize = pnlClientResize
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 1014
      Height = 591
      Align = alClient
      TabOrder = 0
      object pnlClientTop: TPanel
        Left = 1
        Top = 1
        Width = 1012
        Height = 53
        Align = alTop
        TabOrder = 0
        object imgCommRed_0: TImage
          Left = 4
          Top = 3
          Width = 32
          Height = 32
          AutoSize = True
          Picture.Data = {
            055449636F6E0000010001002020100000000000E80200001600000028000000
            2000000040000000010004000000000080020000000000000000000000000000
            0000000000000000000080000080000000808000800000008000800080800000
            C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000099999900000
            0000000000000000000999999999900000000000000000000999999999999990
            0000000000000000099999999999999000000000000000009999999999999999
            0000000000000000999999999999999900000000000000099999999999999999
            9000000000000009999999999999999990000000000000099999999999999999
            90000000000000099F9999999999999990000000000000099F99999999999999
            90000000000000099FF9999999999999900000000000000099FF999999999999
            0000000000000000999FF9999999999900000000000000000999FF9999999990
            0000000000000000099999999999999000000000000000000009999999999000
            0000000000000000000009999990000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
            FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
            FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
            FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF}
        end
        object imgCommGreen_0: TImage
          Left = 4
          Top = 3
          Width = 32
          Height = 32
          AutoSize = True
          Picture.Data = {
            055449636F6E0000010001002020100000000000E80200001600000028000000
            2000000040000000010004000000000080020000000000000000000000000000
            0000000000000000000080000080000000808000800000008000800080800000
            C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000AAAAAA00000
            0000000000000000000AAAAAAAAAA00000000000000000000AAAAAAAAAAAAAA0
            00000000000000000AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA
            0000000000000000AAAAAAAAAAAAAAAA000000000000000AAAAAAAAAAAAAAAAA
            A00000000000000AAAAAAAAAAAAAAAAAA00000000000000AAAAAAAAAAAAAAAAA
            A00000000000000AAFAAAAAAAAAAAAAAA00000000000000AAFAAAAAAAAAAAAAA
            A00000000000000AAFFAAAAAAAAAAAAAA000000000000000AAFFAAAAAAAAAAAA
            0000000000000000AAAFFAAAAAAAAAAA00000000000000000AAAFFAAAAAAAAA0
            00000000000000000AAAAAAAAAAAAAA00000000000000000000AAAAAAAAAA000
            000000000000000000000AAAAAA0000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
            FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
            FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
            FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF}
          Visible = False
        end
        object lbl1: TLabel
          Left = 30
          Top = 10
          Width = 42
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          Caption = #20018#21475':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 444
          Top = 12
          Width = 84
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26426#23376#36719#20214#29256#26412':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btnStart_0: TButton
          Left = 160
          Top = 8
          Width = 76
          Height = 25
          Caption = #36830#25509
          TabOrder = 0
          OnClick = btnStart_0Click
        end
        object cbbCom_0: TComboBox
          Left = 77
          Top = 10
          Width = 74
          Height = 19
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          ItemHeight = 11
          TabOrder = 1
          Visible = False
        end
        object EdtVersion_0: TEdit
          Left = 532
          Top = 12
          Width = 221
          Height = 19
          Enabled = False
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
        end
        object BtnReTest: TButton
          Left = 255
          Top = 8
          Width = 76
          Height = 25
          Caption = #37325#26032#27979#35797
          TabOrder = 3
          OnClick = BtnReTestClick
        end
        object CheckBoxAutoTestCom0: TCheckBox
          Left = 345
          Top = 14
          Width = 96
          Height = 14
          Caption = #33258#21160#26816#27979#20018#21475
          TabOrder = 4
        end
      end
      object pnlClientBottom: TPanel
        Left = 1
        Top = 539
        Width = 1012
        Height = 51
        Align = alBottom
        TabOrder = 1
        OnResize = pnlClientBottomResize
        object EdtResult_0: TEdit
          Left = 0
          Top = 0
          Width = 725
          Height = 55
          AutoSize = False
          Color = clSilver
          Enabled = False
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -45
          Font.Name = #38582#20070
          Font.Style = []
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object btnStart_StartTest: TButton
    Left = 7
    Top = 386
    Width = 135
    Height = 51
    Caption = #24320#22987#27979#35797
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = btnStart_StartTestClick
  end
  object tmrRecCommTimeOut_0: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_0Timer
    Left = 182
    Top = 480
  end
  object tmrRecCommTimeOut_1: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_1Timer
    Left = 214
    Top = 480
  end
  object tmrRecCommTimeOut_2: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_2Timer
    Left = 246
    Top = 480
  end
  object tmrRecCommTimeOut_3: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_3Timer
    Left = 278
    Top = 480
  end
  object tmrRecCommTimeOut_4: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_4Timer
    Left = 310
    Top = 480
  end
  object tmrCountdown_0: TTimer
    Enabled = False
    OnTimer = tmrCountdown_0Timer
    Left = 88
    Top = 64
  end
  object tmrCountdown_1: TTimer
    Enabled = False
    OnTimer = tmrCountdown_1Timer
    Left = 120
    Top = 64
  end
  object tmrCountdown_2: TTimer
    Enabled = False
    OnTimer = tmrCountdown_2Timer
    Left = 152
    Top = 64
  end
  object tmrCountdown_3: TTimer
    Enabled = False
    OnTimer = tmrCountdown_3Timer
    Left = 184
    Top = 64
  end
  object tmrCountdown_4: TTimer
    Enabled = False
    OnTimer = tmrCountdown_4Timer
    Left = 216
    Top = 64
  end
  object tmrCheckAllowTest_1: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_1Timer
    Left = 390
    Top = 64
  end
  object tmrCheckAllowTest_2: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_2Timer
    Left = 422
    Top = 64
  end
  object tmrCheckAllowTest_3: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_3Timer
    Left = 454
    Top = 64
  end
  object tmrCheckAllowTest_4: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_4Timer
    Left = 486
    Top = 64
  end
  object tmrCheckAllowTest_0: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_0Timer
    Left = 358
    Top = 64
  end
  object CommAgilent_1: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    Left = 120
    Top = 191
  end
  object CommAgilent_2: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    Left = 152
    Top = 191
  end
  object CommAgilent_3: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    Left = 184
    Top = 191
  end
  object CommAgilent_4: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    Left = 216
    Top = 191
  end
  object tmrRecAgilentCommTimeOut_1: TTimer
    Enabled = False
    OnTimer = tmrRecAgilentCommTimeOut_1Timer
    Left = 118
    Top = 160
  end
  object tmrRecAgilentCommTimeOut_2: TTimer
    Enabled = False
    OnTimer = tmrRecAgilentCommTimeOut_2Timer
    Left = 150
    Top = 160
  end
  object tmrRecAgilentCommTimeOut_3: TTimer
    Enabled = False
    OnTimer = tmrRecAgilentCommTimeOut_3Timer
    Left = 182
    Top = 160
  end
  object tmrRecAgilentCommTimeOut_4: TTimer
    Enabled = False
    OnTimer = tmrRecAgilentCommTimeOut_4Timer
    Left = 214
    Top = 160
  end
  object CommAgilent_0: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    Left = 88
    Top = 191
  end
  object Comm_00: TCommPortDriver
    ComPortSpeed = br115200
    OnReceiveData = Comm_00ReceiveData
    Left = 88
    Top = 112
  end
  object Comm_01: TCommPortDriver
    ComPortSpeed = br115200
    OnReceiveData = Comm_01ReceiveData
    Left = 128
    Top = 112
  end
  object Comm_02: TCommPortDriver
    ComPortSpeed = br115200
    OnReceiveData = Comm_02ReceiveData
    Left = 168
    Top = 112
  end
  object Comm_03: TCommPortDriver
    ComPortSpeed = br115200
    OnReceiveData = Comm_03ReceiveData
    Left = 208
    Top = 112
  end
  object Comm_04: TCommPortDriver
    ComPortSpeed = br115200
    OnReceiveData = Comm_04ReceiveData
    Left = 248
    Top = 112
  end
  object tmrCheckComm0: TTimer
    Enabled = False
    OnTimer = tmrCheckComm0Timer
    Left = 432
    Top = 40
  end
  object Comm_0: TComm
    CommName = 'COM2'
    BaudRate = 115200
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_0ReceiveData
    Left = 296
    Top = 143
  end
  object Comm_1: TComm
    CommName = 'COM2'
    BaudRate = 115200
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_1ReceiveData
    Left = 328
    Top = 143
  end
  object Comm_2: TComm
    CommName = 'COM2'
    BaudRate = 115200
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_2ReceiveData
    Left = 360
    Top = 143
  end
  object Comm_3: TComm
    CommName = 'COM2'
    BaudRate = 115200
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_3ReceiveData
    Left = 392
    Top = 143
  end
  object Comm_4: TComm
    CommName = 'COM2'
    BaudRate = 115200
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = False
    Inx_XonXoffFlow = False
    ReplaceWhenParityError = False
    IgnoreNullChar = False
    RtsControl = RtsEnable
    XonLimit = 500
    XoffLimit = 500
    ByteSize = _8
    Parity = None
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_4ReceiveData
    Left = 424
    Top = 143
  end
end
