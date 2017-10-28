inherited frmWriteImeiTest: TfrmWriteImeiTest
  Left = 190
  Top = 97
  Width = 1036
  Height = 727
  Caption = 'IMEI'#28903#20889#20301
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlClient: TPanel
    Width = 1028
    Height = 693
    TabOrder = 1
    inherited pnlLeft: TPanel
      Width = 1026
      Height = 691
      object lbl2: TLabel [0]
        Left = 248
        Top = 214
        Width = 94
        Height = 60
        AutoSize = False
        Caption = 'IMEI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -41
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblPrompt: TLabel [1]
        Left = 360
        Top = 269
        Width = 433
        Height = 31
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel [2]
        Left = 90
        Top = 142
        Width = 252
        Height = 60
        AutoSize = False
        Caption = #21069#19968#26426#23376'IMEI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -41
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel [3]
        Left = 90
        Top = 397
        Width = 252
        Height = 60
        AutoSize = False
        Caption = #23376#39033#27979#35797#32467#26524
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -41
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      inherited pnlClientTop: TPanel
        Width = 1024
        inherited Label1: TLabel
          Left = 528
          Top = 15
        end
        inherited cbbCom_0: TComboBox
          Visible = True
        end
        inherited EdtVersion_0: TEdit
          Left = 638
          Top = 15
        end
      end
      inherited pnlClientBottom: TPanel
        Top = 568
        Width = 1024
        inherited EdtResult_0: TEdit
          Left = -9
          Width = 1447
          Height = 61
          AutoSize = True
        end
      end
      object EdtImei: TEdit
        Left = 360
        Top = 214
        Width = 575
        Height = 47
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -47
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 15
        ParentFont = False
        TabOrder = 2
        OnChange = EdtImeiChange
        OnKeyPress = EdtImeiKeyPress
      end
      object Edt_PreImei: TEdit
        Left = 360
        Top = 142
        Width = 575
        Height = 47
        AutoSize = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -47
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 15
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EdtImeiKeyPress
      end
      object grp3: TGroupBox
        Left = 56
        Top = 64
        Width = 601
        Height = 65
        Caption = #28903#20889#39034#24207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object rbPowerFirst: TRadioButton
          Left = 48
          Top = 32
          Width = 201
          Height = 16
          Caption = #20808#19978#30005#21518#25195#25551'IMEI'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbPowerFirstClick
        end
        object rbScanImei: TRadioButton
          Left = 312
          Top = 32
          Width = 209
          Height = 16
          Caption = #20808#25195#25551'IMEI'#21518#19978#30005
          TabOrder = 1
          OnClick = rbScanImeiClick
        end
      end
      object GrpTestPass: TGroupBox
        Left = 1005
        Top = 87
        Width = 135
        Height = 138
        Caption = #27979#35797#26410#36890#36807#24037#31449
        Enabled = False
        TabOrder = 5
        Visible = False
        object chk_FuncTest: TCheckBox
          Left = 14
          Top = 160
          Width = 120
          Height = 16
          Caption = #21151#33021#27979#35797#20301
          TabOrder = 0
          Visible = False
        end
        object chk_GPSTest: TCheckBox
          Left = 14
          Top = 182
          Width = 120
          Height = 17
          Caption = 'GPS'#27979#35797#20301
          TabOrder = 1
          Visible = False
        end
        object chk_CoupleTest: TCheckBox
          Left = 6
          Top = 26
          Width = 120
          Height = 17
          Caption = #32806#21512#27979#35797#20301
          TabOrder = 2
        end
        object chk_ParamDownload: TCheckBox
          Left = 6
          Top = 61
          Width = 120
          Height = 17
          Caption = #36719#20214#21442#25968#19979#36733#20301
          TabOrder = 3
        end
        object chk_AutoTest: TCheckBox
          Left = 6
          Top = 95
          Width = 120
          Height = 17
          Caption = #33258#21160#27979#35797#20301
          TabOrder = 4
        end
      end
      object grp1: TGroupBox
        Left = 719
        Top = 66
        Width = 237
        Height = 77
        TabOrder = 6
        Visible = False
        object chkRF_BAR: TCheckBox
          Left = 15
          Top = 19
          Width = 213
          Height = 29
          Caption = #26159#21542#36827#34892'RF'#26657#20934#26816#27979
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
      object grp2: TGroupBox
        Left = 1
        Top = 628
        Width = 1024
        Height = 62
        Align = alBottom
        Caption = #25195#25551#26538#35774#32622
        TabOrder = 7
        object lbl3: TLabel
          Left = 28
          Top = 30
          Width = 49
          Height = 18
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
        object cbbComAgilent_1: TComboBox
          Left = 83
          Top = 28
          Width = 87
          Height = 21
          Style = csDropDownList
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          ItemHeight = 13
          TabOrder = 0
        end
        object btnScan: TButton
          Left = 181
          Top = 22
          Width = 90
          Height = 30
          Caption = #36830#25509
          TabOrder = 1
          OnClick = btnScanClick
        end
      end
      object grp4: TGroupBox
        Left = 359
        Top = 321
        Width = 601
        Height = 229
        TabOrder = 8
        object pnl3: TPanel
          Left = 2
          Top = 15
          Width = 597
          Height = 185
          Align = alClient
          TabOrder = 0
          object pnl2: TPanel
            Left = 1
            Top = 1
            Width = 595
            Height = 183
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlTestResult_1: TPanel
              Left = 1
              Top = 1
              Width = 593
              Height = 181
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 0
              object TestResultDetail_0: TDBGrid
                Left = 1
                Top = 1
                Width = 591
                Height = 179
                Align = alClient
                DataSource = DS_TestResult_0
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -16
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = TestResultDetail_0DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'SubTestItem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #23376#27979#35797#39033#30446
                    Width = 200
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TestResult'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #32467#26524
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TestValue'
                    Title.Alignment = taCenter
                    Title.Caption = #36820#22238#20540
                    Width = 300
                    Visible = True
                  end>
              end
            end
          end
        end
        object SB_TestStatus_0: TStatusBar
          Left = 2
          Top = 200
          Width = 597
          Height = 27
          Panels = <
            item
              Width = 100
            end
            item
              Width = 200
            end
            item
              Width = 200
            end>
          SimplePanel = False
        end
      end
    end
  end
  inherited btnStart_StartTest: TButton
    Left = 1243
    Top = 557
    TabOrder = 0
  end
  inherited tmrRecCommTimeOut_0: TTimer
    Left = 838
    Top = 472
  end
  inherited tmrRecCommTimeOut_1: TTimer
    Left = 870
    Top = 472
  end
  inherited tmrRecCommTimeOut_2: TTimer
    Left = 902
    Top = 472
  end
  inherited tmrRecCommTimeOut_3: TTimer
    Left = 934
    Top = 472
  end
  inherited tmrRecCommTimeOut_4: TTimer
    Left = 966
    Top = 472
  end
  inherited tmrCountdown_0: TTimer
    Top = 24
  end
  inherited tmrCountdown_1: TTimer
    Top = 24
  end
  inherited tmrCountdown_2: TTimer
    Top = 24
  end
  inherited tmrCountdown_3: TTimer
    Top = 24
  end
  inherited tmrCountdown_4: TTimer
    Top = 24
  end
  inherited tmrCheckAllowTest_1: TTimer
    Left = 486
    Top = 88
  end
  inherited tmrCheckAllowTest_2: TTimer
    Left = 518
    Top = 88
  end
  inherited tmrCheckAllowTest_3: TTimer
    Left = 550
    Top = 88
  end
  inherited tmrCheckAllowTest_4: TTimer
    Left = 582
    Top = 88
  end
  inherited tmrCheckAllowTest_0: TTimer
    Left = 454
    Top = 88
  end
  inherited Comm_0: TComm
    Left = 728
    Top = 79
  end
  inherited Comm_1: TComm
    Left = 760
    Top = 79
  end
  inherited Comm_2: TComm
    Left = 792
    Top = 79
  end
  inherited Comm_3: TComm
    Left = 824
    Top = 79
  end
  inherited Comm_4: TComm
    Left = 856
    Top = 79
  end
  object Comm_Scan: TComm
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
    ByteSize = _7
    Parity = Even
    StopBits = _1
    XonChar = #17
    XoffChar = #19
    ReplacedChar = #0
    ReadIntervalTimeout = 30
    ReadTotalTimeoutMultiplier = 0
    ReadTotalTimeoutConstant = 0
    WriteTotalTimeoutMultiplier = 0
    WriteTotalTimeoutConstant = 0
    OnReceiveData = Comm_ScanReceiveData
    Left = 760
    Top = 519
  end
  object tmrRecScanTimeOut: TTimer
    Enabled = False
    OnTimer = tmrRecScanTimeOutTimer
    Left = 822
    Top = 520
  end
  object DS_TestItemParam_0: TDataSource
    DataSet = UniQuery_TestItemParam_ByItemName_0
    Left = 792
    Top = 264
  end
  object UniQuery_TestItemParam_ByItemName_0: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_WriteImei_SubItem')
    Left = 824
    Top = 264
    object intgrfldUniQuery_TestItemParam_ByItemName_1Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1ItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1ItemName: TStringField
      FieldName = 'ItemName'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1SubItemName: TStringField
      FieldName = 'SubItemName'
      Required = True
      Size = 50
    end
    object UniQuery_TestItemParam_ByItemName_0SendAtComm: TBooleanField
      FieldName = 'SendAtComm'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1AtComm: TStringField
      FieldName = 'AtComm'
      Required = True
      Size = 100
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1ReturnText: TStringField
      FieldName = 'ReturnText'
      Required = True
      Size = 100
    end
    object intgrfldUniQuery_TestItemParam_ByItemName_1ReSendNum: TIntegerField
      FieldName = 'ReSendNum'
      Required = True
    end
    object intgrfldUniQuery_TestItemParam_ByItemName_1TestTimeOut: TIntegerField
      FieldName = 'TestTimeOut'
      Required = True
    end
    object UniQuery_TestItemParam_ByItemName_0Compare: TBooleanField
      FieldName = 'Compare'
    end
    object UniQuery_TestItemParam_ByItemName_0Remark1: TWideStringField
      FieldName = 'Remark1'
      FixedChar = True
      Size = 10
    end
    object UniQuery_TestItemParam_ByItemName_0Remark2: TWideStringField
      FieldName = 'Remark2'
      FixedChar = True
      Size = 10
    end
  end
  object DS_TestResult_0: TDataSource
    DataSet = UniQuery_TestResult_0
    Left = 792
    Top = 304
  end
  object UniQuery_TestResult_0: TUniQuery
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result0')
    Left = 824
    Top = 304
    object intgrfldUniQuery_TestResult_0Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object strngfldUniQuery_TestResult_0TestItem: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object strngfldUniQuery_TestResult_0SubTestItem: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object strngfldUniQuery_TestResult_0TestResult: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object strngfldUniQuery_TestResult_0TestValue: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object UniQuery_DstSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      
        'select * from Gps_WriteImei_DstSubItem WHERE Gps_WriteImei_DstSu' +
        'bItem.ItemModel=:ItemModel')
    Left = 1016
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
    object intgrfldUniQuery_DstSubItemId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldSFUniQuery_DstSubItemItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldSFUniQuery_DstSubItemItemName: TStringField
      FieldName = 'ItemName'
      Required = True
      Size = 50
    end
  end
  object DS_DstSubItem: TDataSource
    DataSet = UniQuery_DstSubItem
    Left = 984
    Top = 272
  end
end
