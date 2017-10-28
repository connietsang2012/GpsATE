object frmIncomCheck: TfrmIncomCheck
  Left = 74
  Top = 138
  Width = 1260
  Height = 691
  Caption = #20837#24211#26816#27979#20301
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
  object lbl4: TLabel
    Left = 103
    Top = 33
    Width = 39
    Height = 19
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
  object pnlBox: TPanel
    Left = 0
    Top = 0
    Width = 1252
    Height = 657
    Align = alClient
    TabOrder = 0
    object lbl2: TLabel
      Left = 136
      Top = 72
      Width = 75
      Height = 21
      Caption = #31665'  '#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 756
      Top = 72
      Width = 95
      Height = 21
      Caption = #27979#35797#21488#25968':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 90
      Top = 512
      Width = 137
      Height = 21
      Caption = #26412#31665#27979#35797#32467#26524':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 417
      Top = 72
      Width = 74
      Height = 21
      Caption = #30334#20998#27604':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 657
      Top = 72
      Width = 11
      Height = 21
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtBoxNo: TEdit
      Left = 250
      Top = 72
      Width = 121
      Height = 19
      TabOrder = 0
      OnKeyPress = edtBoxNoKeyPress
    end
    object edtPercentage: TEdit
      Left = 530
      Top = 72
      Width = 121
      Height = 19
      TabOrder = 1
      Text = '50'
    end
    object edtTCount: TEdit
      Left = 890
      Top = 72
      Width = 121
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object pnlTestResultBox: TPanel
      Left = 248
      Top = 504
      Width = 985
      Height = 41
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object grp1: TGroupBox
      Left = 136
      Top = 144
      Width = 897
      Height = 337
      TabOrder = 4
      object lbl7: TLabel
        Left = 53
        Top = 15
        Width = 39
        Height = 19
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
      object lbl1: TLabel
        Left = 53
        Top = 100
        Width = 39
        Height = 19
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
      object lbl5: TLabel
        Left = 53
        Top = 166
        Width = 39
        Height = 19
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
      object lbl6: TLabel
        Left = 53
        Top = 256
        Width = 39
        Height = 19
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
      object cbbCom_1: TComboBox
        Left = 122
        Top = 15
        Width = 66
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ItemHeight = 11
        ParentFont = False
        TabOrder = 0
      end
      object cbbCom_2: TComboBox
        Left = 122
        Top = 98
        Width = 66
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ItemHeight = 11
        ParentFont = False
        TabOrder = 1
      end
      object cbbCom_3: TComboBox
        Left = 122
        Top = 176
        Width = 66
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ItemHeight = 11
        ParentFont = False
        TabOrder = 2
      end
      object cbbCom_4: TComboBox
        Left = 122
        Top = 256
        Width = 66
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ItemHeight = 11
        ParentFont = False
        TabOrder = 3
      end
      object pnl1: TPanel
        Left = 480
        Top = 15
        Width = 200
        Height = 25
        Color = clWhite
        TabOrder = 4
      end
      object pnl2: TPanel
        Left = 480
        Top = 95
        Width = 200
        Height = 25
        Color = clGreen
        TabOrder = 5
      end
      object pnl3: TPanel
        Left = 480
        Top = 176
        Width = 200
        Height = 25
        Color = clGreen
        TabOrder = 6
      end
      object pnl4: TPanel
        Left = 480
        Top = 256
        Width = 200
        Height = 25
        Color = clGreen
        TabOrder = 7
      end
      object btnStart_1: TButton
        Left = 216
        Top = 15
        Width = 75
        Height = 19
        Caption = #36830#25509
        TabOrder = 8
        OnClick = btnStart_1Click
      end
      object btnStart_2: TButton
        Left = 216
        Top = 96
        Width = 75
        Height = 19
        Caption = #36830#25509
        TabOrder = 9
        OnClick = btnStart_2Click
      end
      object btnStart_3: TButton
        Left = 216
        Top = 176
        Width = 75
        Height = 19
        Caption = #36830#25509
        TabOrder = 10
        OnClick = btnStart_3Click
      end
      object btnStart_4: TButton
        Left = 216
        Top = 256
        Width = 75
        Height = 19
        Caption = #36830#25509
        TabOrder = 11
        OnClick = btnStart_4Click
      end
      object btnReTest_1: TButton
        Left = 312
        Top = 15
        Width = 75
        Height = 19
        Caption = #37325#26032#27979#35797
        TabOrder = 12
        OnClick = btnReTest_1Click
      end
      object btnReTest_2: TButton
        Left = 312
        Top = 95
        Width = 75
        Height = 19
        Caption = #37325#26032#27979#35797
        TabOrder = 13
        OnClick = btnReTest_2Click
      end
      object btnReTest_3: TButton
        Left = 312
        Top = 176
        Width = 75
        Height = 19
        Caption = #37325#26032#27979#35797
        TabOrder = 14
        OnClick = btnReTest_3Click
      end
      object btnReTest_4: TButton
        Left = 312
        Top = 256
        Width = 75
        Height = 19
        Caption = #37325#26032#27979#35797
        TabOrder = 15
        OnClick = btnReTest_4Click
      end
    end
    object btn_twiceAll: TButton
      Left = 520
      Top = 576
      Width = 225
      Height = 33
      Caption = #25972#31665#36820#24037
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = btn_twiceAllClick
    end
  end
  object ds1: TDataSource
    DataSet = unqry_BoxCount
    Left = 1112
    Top = 64
  end
  object unqry_BoxCount: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTestSMT_BoxCont where BoxNo=:BOXNO')
    Left = 1152
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BOXNO'
      end>
  end
  object ds2: TDataSource
    DataSet = unqry_LoadSMTIncomingBOXNO
    Left = 1112
    Top = 112
  end
  object unqry_LoadSMTIncomingBOXNO: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from t_AutoTest_IncomingBoxNo')
    Left = 1152
    Top = 112
    object unqry_LoadSMTIncomingBOXNOID: TIntegerField
      FieldName = 'ID'
    end
    object unqry_LoadSMTIncomingBOXNOBoxNo: TStringField
      FieldName = 'BoxNo'
    end
    object unqry_LoadSMTIncomingBOXNOSN: TStringField
      FieldName = 'SN'
    end
  end
  object Comm_1: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = True
    Inx_XonXoffFlow = True
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
    ReadIntervalTimeout = 100
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_1ReceiveData
    Left = 1048
    Top = 200
  end
  object Comm_2: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = True
    Inx_XonXoffFlow = True
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
    ReadIntervalTimeout = 100
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_2ReceiveData
    Left = 1096
    Top = 200
  end
  object Comm_3: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = True
    Inx_XonXoffFlow = True
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
    ReadIntervalTimeout = 100
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_3ReceiveData
    Left = 1144
    Top = 200
  end
  object Comm_4: TComm
    CommName = 'COM2'
    BaudRate = 9600
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = True
    Outx_XonXoffFlow = True
    Inx_XonXoffFlow = True
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
    ReadIntervalTimeout = 100
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_4ReceiveData
    Left = 1184
    Top = 200
  end
  object Comm_01: TCommPortDriver
    OnReceiveData = Comm_01ReceiveData
    Left = 1064
    Top = 256
  end
  object Comm_02: TCommPortDriver
    OnReceiveData = Comm_02ReceiveData
    Left = 1104
    Top = 256
  end
  object Comm_03: TCommPortDriver
    OnReceiveData = Comm_03ReceiveData
    Left = 1152
    Top = 256
  end
  object Comm_04: TCommPortDriver
    OnReceiveData = Comm_04ReceiveData
    Left = 1200
    Top = 256
  end
  object tmrCheckAllowTest_1: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_1Timer
    Left = 1048
    Top = 152
  end
  object tmrCheckAllowTest_2: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_2Timer
    Left = 1080
    Top = 152
  end
  object tmrCheckAllowTest_3: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_3Timer
    Left = 1112
    Top = 152
  end
  object tmrCheckAllowTest_4: TTimer
    Enabled = False
    OnTimer = tmrCheckAllowTest_4Timer
    Left = 1144
    Top = 152
  end
  object tmrRecCommTimeOut_1: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_1Timer
    Left = 1062
    Top = 376
  end
  object tmrRecCommTimeOut_2: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_2Timer
    Left = 1094
    Top = 376
  end
  object tmrRecCommTimeOut_3: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_3Timer
    Left = 1126
    Top = 376
  end
  object tmrRecCommTimeOut_4: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_4Timer
    Left = 1158
    Top = 376
  end
  object unqry_TestResult_2: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from t_AutoTest_IncomingBoxNo where SN=:SN')
    Left = 760
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN'
      end>
  end
  object unqry_TestResult_1: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from t_AutoTest_IncomingBoxNo where SN=:SN')
    Left = 760
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN'
      end>
  end
  object unqry_TestResult_3: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from t_AutoTest_IncomingBoxNo where SN=:SN')
    Left = 760
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN'
      end>
  end
  object unqry_TestResult_4: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from t_AutoTest_IncomingBoxNo where SN=:SN')
    Left = 760
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN'
      end>
  end
  object dsDS_TestResult_1: TDataSource
    DataSet = unqry_TestResult_1
    Left = 720
    Top = 168
  end
  object dsDS_TestResult_2: TDataSource
    DataSet = unqry_TestResult_2
    Left = 720
    Top = 240
  end
  object dsDS_TestResult_3: TDataSource
    DataSet = unqry_TestResult_3
    Left = 720
    Top = 320
  end
  object dsDS_TestResult_4: TDataSource
    DataSet = unqry_TestResult_4
    Left = 720
    Top = 400
  end
end
