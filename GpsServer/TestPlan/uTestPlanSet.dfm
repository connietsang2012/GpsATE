inherited frmTestPlanSet: TfrmTestPlanSet
  Left = 361
  Top = 210
  Width = 999
  Caption = #27979#35797#24037#31449#37197#21046
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Top = 81
    Width = 991
    Height = 424
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Width = 983
        Height = 398
        Enabled = True
        SortLocal = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32034#24341
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Version'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26426#22411
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TestFunction'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21151#33021#27979#35797#20301
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TestGPS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'GPS'#27979#35797#20301
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TestCouple'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32806#21512#27979#35797#20301
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TestWriteImei'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'IMEI'#28903#20889#20301
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TestParamDownload'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36719#20214#19979#36733#21442#25968#20301
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TestCartonBox'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21345#36890#31665#27979#35797#20301
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TestAutoTest'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #33258#21160#27979#35797#20301
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TestAutoTestSMT'
            Footers = <>
            Title.Caption = #33258#21160#27979#35797#20301'(SMT)'
            Width = 101
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 47
        Top = 37
        Width = 55
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411':'
      end
      object Edt_TypeName: TDBEdit
        Left = 108
        Top = 34
        Width = 103
        Height = 19
        DataField = 'Version'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_TypeNameChange
      end
      object grp1: TGroupBox
        Left = 47
        Top = 74
        Width = 577
        Height = 103
        Caption = #38656#27979#35797#24037#31449
        TabOrder = 1
        object dbchkTestFunction: TDBCheckBox
          Left = 41
          Top = 27
          Width = 84
          Height = 14
          Caption = #21151#33021#27979#35797#20301
          DataField = 'TestFunction'
          DataSource = DS_Module
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestFunctionClick
        end
        object dbchkTestFunction3: TDBCheckBox
          Left = 41
          Top = 61
          Width = 84
          Height = 14
          Caption = 'IMEI'#28903#20889#20301
          DataField = 'TestWriteImei'
          DataSource = DS_Module
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestFunction3Click
        end
        object dbchkTestFunction1: TDBCheckBox
          Left = 175
          Top = 27
          Width = 85
          Height = 14
          Caption = 'GPS'#27979#35797#20301
          DataField = 'TestGPS'
          DataSource = DS_Module
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestFunction1Click
        end
        object dbchkTestGPS: TDBCheckBox
          Left = 175
          Top = 61
          Width = 104
          Height = 14
          Caption = #36719#20214#19979#36733#21442#25968#20301
          DataField = 'TestParamDownload'
          DataSource = DS_Module
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestGPSClick
        end
        object dbchkTestFunction2: TDBCheckBox
          Left = 309
          Top = 27
          Width = 84
          Height = 14
          Caption = #32806#21512#27979#35797#20301
          DataField = 'TestCouple'
          DataSource = DS_Module
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestFunction2Click
        end
        object dbchkTestCouple: TDBCheckBox
          Left = 309
          Top = 61
          Width = 96
          Height = 14
          Caption = #21345#36890#31665#27979#35797#20301
          DataField = 'TestCartonBox'
          DataSource = DS_Module
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestCoupleClick
        end
        object dbchkTestAutoTest: TDBCheckBox
          Left = 431
          Top = 27
          Width = 84
          Height = 14
          Caption = #33258#21160#27979#35797#20301
          DataField = 'TestAutoTest'
          DataSource = DS_Module
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestAutoTestClick
        end
        object dbchkTestAutoTest1: TDBCheckBox
          Left = 431
          Top = 61
          Width = 111
          Height = 14
          Caption = #33258#21160#27979#35797#20301'(SMT)'
          DataField = 'TestAutoTestSMT'
          DataSource = DS_Module
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkTestAutoTest1Click
        end
      end
    end
  end
  inherited tlb1: TToolBar
    Width = 991
  end
  inherited SB_Module: TStatusBar
    Width = 991
  end
  object grp_Query: TGroupBox [3]
    Left = 0
    Top = 38
    Width = 991
    Height = 43
    Align = alTop
    Caption = #26597#35810#26465#20214
    TabOrder = 3
    object lbl_SN: TLabel
      Left = 11
      Top = 14
      Width = 35
      Height = 13
      Caption = #26426#22411':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #26032#23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edt_Model: TEdit
      Left = 49
      Top = 11
      Width = 243
      Height = 19
      Hint = #35831#36755#20837#26597#35810#26465#20214'SN'#25968#20540
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 32
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  inherited ActionList: TActionList
    inherited ac_Find: TAction
      OnExecute = ac_FindExecute
    end
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_TestPlanSet
  end
  object UniQuery_TestPlanSet: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_TestPlanSet')
    AfterInsert = UniQuery_TestPlanSetAfterInsert
    OnCalcFields = UniQuery_TestPlanSetCalcFields
    Left = 712
    Top = 72
    object SFUniQuery_TestPlanSetIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_TestPlanSetId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_TestPlanSetVersion: TStringField
      FieldName = 'Version'
      Required = True
      Size = 50
    end
    object blnfldUniQuery_TestPlanSetTestFunction: TBooleanField
      FieldName = 'TestFunction'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestGPS: TBooleanField
      FieldName = 'TestGPS'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestCouple: TBooleanField
      FieldName = 'TestCouple'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestWriteImei: TBooleanField
      FieldName = 'TestWriteImei'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestParamDownload: TBooleanField
      FieldName = 'TestParamDownload'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestCartonBox: TBooleanField
      FieldName = 'TestCartonBox'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestAutoTest: TBooleanField
      FieldName = 'TestAutoTest'
      Required = True
    end
    object blnfldUniQuery_TestPlanSetTestAutoTestSMT: TBooleanField
      FieldName = 'TestAutoTestSMT'
      Required = True
    end
  end
end
