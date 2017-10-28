object frmBasicTestParam: TfrmBasicTestParam
  Left = 339
  Top = 160
  Width = 969
  Height = 499
  Caption = #27979#35797#21442#25968#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 11
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 465
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 959
      Height = 224
      Align = alTop
      TabOrder = 0
      object GroupBox6: TGroupBox
        Left = 656
        Top = 1
        Width = 302
        Height = 222
        Align = alRight
        Caption = #33258#21160#26816#27979#35774#22791#25554#20837#27979#35797
        Enabled = False
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 74
          Width = 85
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979'AT'#36820#22238#20540':'
        end
        object Label12: TLabel
          Left = 16
          Top = 103
          Width = 85
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979'AT'#36229#26102#26102#38388':'
        end
        object Label13: TLabel
          Left = 16
          Top = 132
          Width = 85
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979#20801#35768#27425#25968':'
        end
        object Label14: TLabel
          Left = 16
          Top = 18
          Width = 85
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979#38388#38548#26102#38388':'
        end
        object Label15: TLabel
          Left = 16
          Top = 47
          Width = 85
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979'AT'#25351#20196':'
        end
        object Edt_CheckTestAtReturn: TDBEdit
          Left = 104
          Top = 71
          Width = 135
          Height = 19
          DataField = 'CheckTestAtReturn'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
        end
        object Edt_CheckTestAtTimeOut: TDBEdit
          Left = 104
          Top = 101
          Width = 135
          Height = 19
          DataField = 'CheckTestAtTimeOut'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 1
        end
        object Edt_CheckTestAllowTestCount: TDBEdit
          Left = 104
          Top = 129
          Width = 135
          Height = 19
          DataField = 'CheckTestAllowTestCount'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
        end
        object Edt_CheckTestTime: TDBEdit
          Left = 104
          Top = 14
          Width = 135
          Height = 19
          DataField = 'CheckTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 3
        end
        object Edt_CheckTestAtCommand: TDBEdit
          Left = 104
          Top = 42
          Width = 135
          Height = 19
          DataField = 'CheckTestAtCommand'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 4
        end
      end
      object GroupBox5: TGroupBox
        Left = 281
        Top = 1
        Width = 305
        Height = 222
        Align = alLeft
        Caption = 'GPS'#36879#20256
        TabOrder = 1
        object lbl11: TLabel
          Left = 34
          Top = 26
          Width = 76
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'GPS'#21355#26143#39063#25968':'
        end
        object Label8: TLabel
          Left = 34
          Top = 115
          Width = 76
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EPO'#32463#24230':'
        end
        object Label9: TLabel
          Left = 34
          Top = 143
          Width = 76
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EPO'#32428#24230':'
        end
        object Label10: TLabel
          Left = 34
          Top = 172
          Width = 76
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EPO'#39640#24230':'
        end
        object Label3: TLabel
          Left = 30
          Top = 87
          Width = 80
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'GPS'#21355#26143#24378#24230':'
        end
        object Label16: TLabel
          Left = 195
          Top = 87
          Width = 6
          Height = 11
          AutoSize = False
          Caption = '~'
        end
        object lbl5: TLabel
          Left = 7
          Top = 58
          Width = 103
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'GPS'#21355#26143#39063#25968'(DY):'
        end
        object Edt_GPSNumbers: TDBEdit
          Left = 127
          Top = 22
          Width = 143
          Height = 19
          DataField = 'GPSNumbers'
          DataSource = DS_GpsTestParamter
          Enabled = False
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
        end
        object Edt_EPOLatitude: TDBEdit
          Left = 127
          Top = 112
          Width = 143
          Height = 19
          DataField = 'EPOLatitude'
          DataSource = DS_GpsTestParamter
          Enabled = False
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 1
        end
        object Edt_EPOLongitude: TDBEdit
          Left = 127
          Top = 140
          Width = 143
          Height = 19
          DataField = 'EPOLongitude'
          DataSource = DS_GpsTestParamter
          Enabled = False
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
        end
        object Edt_EPOAltitude: TDBEdit
          Left = 127
          Top = 169
          Width = 143
          Height = 19
          DataField = 'EPOAltitude'
          DataSource = DS_GpsTestParamter
          Enabled = False
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 3
        end
        object Edt_GpsDBMin: TEdit
          Left = 127
          Top = 83
          Width = 67
          Height = 19
          TabOrder = 4
        end
        object Edt_GpsDBMax: TEdit
          Left = 203
          Top = 83
          Width = 67
          Height = 19
          TabOrder = 5
        end
        object BtnGpsSet: TButton
          Left = 194
          Top = 196
          Width = 77
          Height = 21
          Caption = 'GPS'#36879#20256#35774#32622
          TabOrder = 6
          OnClick = BtnGpsSetClick
        end
        object edtEdt_GPSNumbersDY: TEdit
          Left = 127
          Top = 51
          Width = 146
          Height = 19
          TabOrder = 7
          Text = '1'
        end
      end
      object GroupBox4: TGroupBox
        Left = 1
        Top = 1
        Width = 280
        Height = 222
        Align = alLeft
        Caption = #27979#35797#36229#26102#26102#38388
        Enabled = False
        TabOrder = 2
        object lbl1: TLabel
          Left = 15
          Top = 18
          Width = 120
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #32806#21512#27979#35797#20301#36229#26102#26102#38388':'
        end
        object Label4: TLabel
          Left = 15
          Top = 47
          Width = 120
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #36719#20214#19979#36733#20301#36229#26102#26102#38388':'
        end
        object lbl4: TLabel
          Left = 15
          Top = 74
          Width = 120
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #33258#21160#27979#35797#20301#36229#26102#26102#38388':'
        end
        object lbl7: TLabel
          Left = 15
          Top = 103
          Width = 120
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'IMEI'#28903#20889#20301#36229#26102#26102#38388':'
        end
        object Label6: TLabel
          Left = 15
          Top = 132
          Width = 120
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #20135#21697#36820#24037#20301#36229#26102#26102#38388':'
        end
        object Label2: TLabel
          Left = 12
          Top = 160
          Width = 123
          Height = 11
          Alignment = taRightJustify
          Caption = 'SMT'#33258#21160#27979#35797#20301#36229#26102#26102#38388':'
        end
        object lbl6: TLabel
          Left = 40
          Top = 184
          Width = 94
          Height = 11
          Caption = #20837#24211#20301#27979#35797#30334#20998#27604':'
        end
        object lbl8: TLabel
          Left = 248
          Top = 184
          Width = 8
          Height = 16
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edt_CoupleTestTestTime: TDBEdit
          Left = 138
          Top = 14
          Width = 102
          Height = 19
          DataField = 'CoupleTestTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
        end
        object Edt_ParamDownloadTestTime: TDBEdit
          Left = 138
          Top = 42
          Width = 102
          Height = 19
          DataField = 'ParamDownloadTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 1
        end
        object Edt_AutoTestTestTime: TDBEdit
          Left = 138
          Top = 71
          Width = 102
          Height = 19
          DataField = 'AutoTestTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
        end
        object Edt_WriteImeiTestTime: TDBEdit
          Left = 138
          Top = 101
          Width = 102
          Height = 19
          DataField = 'WriteImeiTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 3
        end
        object Edt_TwiceTestTime: TDBEdit
          Left = 138
          Top = 129
          Width = 102
          Height = 19
          DataField = 'TwiceTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 4
        end
        object Edt_SMTAutoTestTestTime: TDBEdit
          Left = 138
          Top = 160
          Width = 102
          Height = 19
          DataField = 'SMT_AutoTestTestTime'
          DataSource = DS_GpsTestParamter
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 5
        end
        object edt_INPercentage: TEdit
          Left = 136
          Top = 184
          Width = 105
          Height = 19
          TabOrder = 6
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 225
      Width = 959
      Height = 239
      Align = alClient
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 262
        Height = 237
        Align = alLeft
        Caption = #26381#21153#22120#37197#32622
        TabOrder = 0
        object lbl2: TLabel
          Left = 8
          Top = 18
          Width = 67
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26381#21153#22120'IP'#65306
        end
        object lbl3: TLabel
          Left = 8
          Top = 47
          Width = 67
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #31471#21475#65306
        end
        object edtTCPIp: TMaskEdit
          Left = 74
          Top = 14
          Width = 164
          Height = 19
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          MaxLength = 15
          TabOrder = 0
        end
        object edtTCPPort: TMaskEdit
          Left = 74
          Top = 43
          Width = 164
          Height = 19
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          MaxLength = 5
          TabOrder = 1
        end
        object chkTCPAuto: TCheckBox
          Left = 73
          Top = 69
          Width = 84
          Height = 14
          Caption = 'TCP'#33258#21160#36830#25509
          TabOrder = 2
          Visible = False
        end
        object btnStopTcp: TBitBtn
          Left = 66
          Top = 87
          Width = 75
          Height = 25
          Caption = #26029#24320#26381#21153#22120
          TabOrder = 3
          Visible = False
        end
        object btnStartTcp: TBitBtn
          Left = 170
          Top = 87
          Width = 75
          Height = 25
          Caption = #36830#25509#26381#21153#22120
          TabOrder = 4
          Visible = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 263
        Top = 1
        Width = 695
        Height = 237
        Align = alClient
        Caption = #29256#26412#21495'/'#27979#35797#26426#22411
        TabOrder = 1
        object LabelCom6EI_1: TLabel
          Left = 126
          Top = 18
          Width = 76
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #27979#35797#29256#26412#21495#65306
        end
        object Label5: TLabel
          Left = 126
          Top = 47
          Width = 76
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = #27979#35797#26426#22411#65306
        end
        object Label1: TLabel
          Left = 3
          Top = 47
          Width = 41
          Height = 15
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
        object Splitter1: TSplitter
          Left = 129
          Top = 4
          Width = 2
          Height = 113
          Cursor = crHSplit
          HelpType = htKeyword
          Align = alNone
        end
        object edtCompareVersion: TMaskEdit
          Left = 200
          Top = 14
          Width = 238
          Height = 19
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
        end
        object chkFailContinue: TCheckBox
          Left = 138
          Top = 101
          Width = 177
          Height = 15
          Caption = #23376#27979#35797#39033#22833#36133#26159#21542#25509#30528#27979#35797
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbbCom_0: TComboBox
          Left = 49
          Top = 41
          Width = 74
          Height = 19
          Style = csDropDownList
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          ItemHeight = 11
          TabOrder = 2
        end
        object btnStart_0: TButton
          Left = 39
          Top = 95
          Width = 76
          Height = 25
          Caption = #36830#25509
          TabOrder = 3
          OnClick = btnStart_0Click
        end
        object btnEnter: TBitBtn
          Left = 362
          Top = 95
          Width = 64
          Height = 21
          Caption = #30830'  '#35748
          Enabled = False
          ModalResult = 1
          TabOrder = 4
          OnClick = btnEnterClick
        end
        object btnCancel: TBitBtn
          Left = 442
          Top = 95
          Width = 64
          Height = 21
          Caption = #21462'  '#28040
          Enabled = False
          ModalResult = 2
          TabOrder = 5
        end
        object Cbb_Model: TDBLookupComboBox
          Left = 200
          Top = 41
          Width = 122
          Height = 19
          DataField = 'Model'
          DataSource = DS_Model
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          KeyField = 'Model'
          ListField = 'Model'
          ListSource = DS_VersionModel
          TabOrder = 6
        end
        object dbchkbReadRID: TDBCheckBox
          Left = 200
          Top = 68
          Width = 112
          Height = 14
          Caption = #33021#21542#35835#21462#22522#24102'ID'
          DataField = 'bReadRID'
          DataSource = DS_VersionModel
          Enabled = False
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object chkUSB: TCheckBox
          Left = 24
          Top = 68
          Width = 97
          Height = 17
          Caption = #20351#29992'USB'#25968#25454#32447
          TabOrder = 8
          OnClick = chkUSBClick
        end
      end
    end
  end
  object tmrRecCommTimeOut_0: TTimer
    Enabled = False
    OnTimer = tmrRecCommTimeOut_0Timer
    Left = 534
    Top = 144
  end
  object DS_VersionModel: TDataSource
    DataSet = UniQuery_VersionModel
    Left = 480
    Top = 212
  end
  object UniQuery_VersionModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_VersionModel')
    Left = 512
    Top = 212
    object SFUniQuery_VersionModelIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_VersionModelId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_VersionModelVersion: TStringField
      FieldName = 'Version'
      Required = True
      Size = 100
    end
    object SFUniQuery_VersionModelModel: TStringField
      FieldName = 'Model'
      Required = True
    end
    object UniQuery_VersionModelbReadRID: TBooleanField
      FieldName = 'bReadRID'
      Required = True
    end
  end
  object UniQuery_GpsTestParamter: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_TestParamter')
    Left = 176
    Top = 8
    object intgrfldUniQuery_GpsTestParamterId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object intgrfldUniQuery_GpsTestParamterCoupleTestTestTime: TIntegerField
      FieldName = 'CoupleTestTestTime'
    end
    object intgrfldUniQuery_GpsTestParamterParamDownloadTestTime: TIntegerField
      FieldName = 'ParamDownloadTestTime'
    end
    object intgrfldUniQuery_GpsTestParamterAutoTestTestTime: TIntegerField
      FieldName = 'AutoTestTestTime'
    end
    object intgrfldUniQuery_GpsTestParamterWriteImeiTestTime: TIntegerField
      FieldName = 'WriteImeiTestTime'
    end
    object intgrfldUniQuery_GpsTestParamterTwiceTestTime: TIntegerField
      FieldName = 'TwiceTestTime'
    end
    object intgrfldUniQuery_GpsTestParamterGPSNumbers: TIntegerField
      FieldName = 'GPSNumbers'
    end
    object intgrfldUniQuery_GpsTestParamterGPSDb: TIntegerField
      FieldName = 'GPSDb'
    end
    object SFUniQuery_GpsTestParamterEPOLatitude: TStringField
      FieldName = 'EPOLatitude'
    end
    object SFUniQuery_GpsTestParamterEPOLongitude: TStringField
      FieldName = 'EPOLongitude'
    end
    object SFUniQuery_GpsTestParamterEPOAltitude: TStringField
      FieldName = 'EPOAltitude'
    end
    object intgrfldUniQuery_GpsTestParamterCheckTestTime: TIntegerField
      FieldName = 'CheckTestTime'
    end
    object SFUniQuery_GpsTestParamterCheckTestAtCommand: TStringField
      FieldName = 'CheckTestAtCommand'
      Size = 50
    end
    object SFUniQuery_GpsTestParamterCheckTestAtReturn: TStringField
      FieldName = 'CheckTestAtReturn'
      Size = 50
    end
    object intgrfldUniQuery_GpsTestParamterCheckTestAtTimeOut: TIntegerField
      FieldName = 'CheckTestAtTimeOut'
    end
    object intgrfldUniQuery_GpsTestParamterCheckTestAllowTestCount: TIntegerField
      FieldName = 'CheckTestAllowTestCount'
    end
    object UniQuery_GpsTestParamterSMT_AutoTestTestTime: TIntegerField
      FieldName = 'SMT_AutoTestTestTime'
    end
  end
  object DS_GpsTestParamter: TDataSource
    DataSet = UniQuery_GpsTestParamter
    Left = 144
  end
  object UniQuery_1: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_TestParamter')
    Left = 216
    object intgrfld1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object intgrfld2: TIntegerField
      FieldName = 'CoupleTestTestTime'
    end
    object intgrfld3: TIntegerField
      FieldName = 'ParamDownloadTestTime'
    end
    object intgrfld4: TIntegerField
      FieldName = 'AutoTestTestTime'
    end
    object intgrfld5: TIntegerField
      FieldName = 'WriteImeiTestTime'
    end
    object intgrfld6: TIntegerField
      FieldName = 'TwiceTestTime'
    end
    object intgrfld7: TIntegerField
      FieldName = 'GPSNumbers'
    end
    object intgrfld8: TIntegerField
      FieldName = 'GPSDb'
    end
    object SF1: TStringField
      FieldName = 'EPOLatitude'
    end
    object SF2: TStringField
      FieldName = 'EPOLongitude'
    end
    object SF3: TStringField
      FieldName = 'EPOAltitude'
    end
    object intgrfld9: TIntegerField
      FieldName = 'CheckTestTime'
    end
    object SF4: TStringField
      FieldName = 'CheckTestAtCommand'
      Size = 50
    end
    object SF5: TStringField
      FieldName = 'CheckTestAtReturn'
      Size = 50
    end
    object intgrfld10: TIntegerField
      FieldName = 'CheckTestAtTimeOut'
    end
    object intgrfld11: TIntegerField
      FieldName = 'CheckTestAllowTestCount'
    end
    object UniQuery_1SMT_AutoTestTestTime: TIntegerField
      FieldName = 'SMT_AutoTestTestTime'
    end
  end
  object UniQuery_Model: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model')
    Left = 584
    Top = 212
    object intgrfldUniQuery_ModelId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_ModelModel: TStringField
      FieldName = 'Model'
      Required = True
    end
    object blnfldUniQuery_ModelbReadRID: TBooleanField
      FieldName = 'bReadRID'
      Required = True
    end
  end
  object DS_Model: TDataSource
    DataSet = UniQuery_Model
    Left = 552
    Top = 212
  end
  object Comm_00: TCommPortDriver
    ComPortSpeed = br115200
    OnReceiveData = Comm_00ReceiveData
    Left = 432
    Top = 336
  end
  object Comm_0: TComm
    CommName = 'COM2'
    BaudRate = 115200
    ParityCheck = False
    Outx_CtsFlow = False
    Outx_DsrFlow = False
    DtrControl = DtrEnable
    DsrSensitivity = False
    TxContinueOnXoff = False
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
    ReadIntervalTimeout = 50
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_0ReceiveData
    OnReceiveError = Comm_0ReceiveError
    Left = 472
    Top = 335
  end
  object UniQuery_GetIEMIRANG: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_ParamConfigOrder'
      'WHERE IMEISTART<=:IMEI AND IMEIEND>=:IMEI')
    Left = 832
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
end
