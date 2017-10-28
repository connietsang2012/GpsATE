inherited frmUserType: TfrmUserType
  Left = 273
  Top = 160
  Caption = #29992#25143#31867#22411
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Enabled = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        SortLocal = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'TypeName'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TypeDes'
            Footers = <>
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'TestAutoTestSMT'
            Footers = <>
            Title.Caption = #33258#21160#27979#35797#20301'SMT'
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestSMTOQC'
            Footers = <>
            Title.Caption = 'SMTOQC'#27979#35797#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestCouple'
            Footers = <>
            Title.Caption = #32806#21512#27979#35797#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestParamDownload'
            Footers = <>
            Title.Caption = #21442#25968#19979#36733#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestAutoTest'
            Footers = <>
            Title.Caption = #33258#21160#27979#35797#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestWriteImei'
            Footers = <>
            Title.Caption = 'IMEI'#28903#20889#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestTwice'
            Footers = <>
            Title.Caption = #20135#21697#36820#24037#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestIncomCheck'
            Footers = <>
            Title.Caption = #20837#24211#26816#27979#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestReadBackRom'
            Footers = <>
            Title.Caption = #35835#21462'ROM'#20301
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TestCartonBox'
            Footers = <>
            Title.Caption = #21345#36890#31665#27979#35797#20301
            Width = 90
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 35
        Top = 37
        Width = 68
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#31867#22411'ID'
      end
      object lbl2: TLabel
        Left = 25
        Top = 85
        Width = 78
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#31867#22411#21517#31216
      end
      object Edt_TypeName: TDBEdit
        Left = 108
        Top = 34
        Width = 120
        Height = 19
        DataField = 'TypeName'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_TypeNameChange
      end
      object Edt_TypeDes: TDBEdit
        Left = 108
        Top = 81
        Width = 120
        Height = 19
        DataField = 'TypeDes'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
        OnChange = Edt_TypeDesChange
      end
      object grp1: TGroupBox
        Left = 39
        Top = 138
        Width = 577
        Height = 135
        Caption = #38656#27979#35797#24037#31449
        TabOrder = 2
        object dbchkTestFunction: TDBCheckBox
          Left = 41
          Top = 27
          Width = 112
          Height = 14
          Caption = #33258#21160#27979#35797#20301'(SMT)'
          DataField = 'TestAutoTestSMT'
          DataSource = DS_Module
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestFunction3: TDBCheckBox
          Left = 175
          Top = 64
          Width = 84
          Height = 14
          Caption = 'IMEI'#28903#20889#20301
          DataField = 'TestWriteImei'
          DataSource = DS_Module
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestFunction1: TDBCheckBox
          Left = 175
          Top = 27
          Width = 98
          Height = 14
          Caption = 'SMT OQC'#27979#35797#20301
          DataField = 'TestSMTOQC'
          DataSource = DS_Module
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestGPS: TDBCheckBox
          Left = 423
          Top = 27
          Width = 104
          Height = 14
          Caption = #36719#20214#19979#36733#21442#25968#20301
          DataField = 'TestParamDownload'
          DataSource = DS_Module
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
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
        end
        object dbchkTestCouple: TDBCheckBox
          Left = 175
          Top = 101
          Width = 96
          Height = 14
          Caption = #21345#36890#31665#27979#35797#20301
          DataField = 'TestCartonBox'
          DataSource = DS_Module
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestAutoTest: TDBCheckBox
          Left = 41
          Top = 64
          Width = 84
          Height = 14
          Caption = #33258#21160#27979#35797#20301
          DataField = 'TestAutoTest'
          DataSource = DS_Module
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestAutoTest1: TDBCheckBox
          Left = 309
          Top = 64
          Width = 111
          Height = 14
          Caption = #20135#21697#36820#24037#20301
          DataField = 'TestTwice'
          DataSource = DS_Module
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestAutoTestSMT: TDBCheckBox
          Left = 423
          Top = 64
          Width = 111
          Height = 14
          Caption = #20837#24211#26816#27979#20301
          DataField = 'TestIncomCheck'
          DataSource = DS_Module
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbchkTestAutoTestSMT1: TDBCheckBox
          Left = 41
          Top = 101
          Width = 111
          Height = 14
          Caption = #35835#21462'ROM'#20301
          DataField = 'TestReadBackRom'
          DataSource = DS_Module
          TabOrder = 9
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_UserType
    Left = 840
    Top = 24
  end
  object UniQuery_UserType: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_UserType')
    OnCalcFields = UniQuery_UserTypeCalcFields
    Left = 864
    Top = 24
    object SFUniQuery_UserTypeIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object UniQuery_UserTypeTypeId: TIntegerField
      FieldName = 'TypeId'
      ReadOnly = True
      Required = True
    end
    object UniQuery_UserTypeTypeName: TStringField
      FieldName = 'TypeName'
      Required = True
    end
    object UniQuery_UserTypeTypeDes: TStringField
      FieldName = 'TypeDes'
      Required = True
    end
    object UniQuery_UserTypeTestAutoTestSMT: TBooleanField
      FieldName = 'TestAutoTestSMT'
      Required = True
    end
    object UniQuery_UserTypeTestSMTOQC: TBooleanField
      FieldName = 'TestSMTOQC'
      Required = True
    end
    object UniQuery_UserTypeTestCouple: TBooleanField
      FieldName = 'TestCouple'
      Required = True
    end
    object UniQuery_UserTypeTestParamDownload: TBooleanField
      FieldName = 'TestParamDownload'
      Required = True
    end
    object UniQuery_UserTypeTestAutoTest: TBooleanField
      FieldName = 'TestAutoTest'
      Required = True
    end
    object UniQuery_UserTypeTestWriteImei: TBooleanField
      FieldName = 'TestWriteImei'
      Required = True
    end
    object UniQuery_UserTypeTestTwice: TBooleanField
      FieldName = 'TestTwice'
      Required = True
    end
    object UniQuery_UserTypeTestIncomCheck: TBooleanField
      FieldName = 'TestIncomCheck'
      Required = True
    end
    object UniQuery_UserTypeTestReadBackRom: TBooleanField
      FieldName = 'TestReadBackRom'
      Required = True
    end
    object UniQuery_UserTypeTestCartonBox: TBooleanField
      FieldName = 'TestCartonBox'
      Required = True
    end
    object UniQuery_UserType_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
end
