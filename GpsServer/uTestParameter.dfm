inherited frmTestParameter: TfrmTestParameter
  Left = 281
  Top = 206
  Width = 1036
  Caption = #27979#35797#21442#25968
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Width = 1028
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Width = 1020
        Enabled = True
        SortLocal = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32034#24341
            Width = 50
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CoupleTestTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32806#21512#27979#35797#20301#36229#26102#26102#38388
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ParamDownloadTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36719#20214#19979#36733#20301#36229#26102#26102#38388
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'AutoTestTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #33258#21160#27979#35797#20301#36229#26102#26102#38388
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'WriteImeiTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'IMEI'#28903#20889#20301#36229#26102#26102#38388
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TwiceTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20135#21697#36820#24037#20301#36229#26102#26102#38388
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GPSNumbers'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'GPS'#21355#26143#39063#25968
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GPSDb'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'GPS'#21355#26143#24378#24230
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'EPOLatitude'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'EPO'#32463#24230
            Width = 60
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'EPOLongitude'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'EPO'#32428#24230
            Width = 60
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'EPOAltitude'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'EPO'#39640#24230
            Width = 60
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CheckTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979#38388#38548#26102#38388
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CheckTestAtCommand'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979'AT'#25351#20196
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CheckTestAtReturn'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979'AT'#36820#22238#20540
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CheckTestAtTimeOut'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979'AT'#36229#26102#26102#38388
            Width = 90
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CheckTestAllowTestCount'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979#20801#35768#27425#25968
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SMT_AutoTestTestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'SMT'#33258#21160#27979#35797#20301#36229#26102#26102#38388
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Percentage'
            Footers = <>
            Title.Caption = #20837#24211#20301#30334#20998#27604
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object GroupBox1: TGroupBox
        Left = 14
        Top = 14
        Width = 258
        Height = 227
        Caption = #27979#35797#36229#26102#26102#38388
        TabOrder = 0
        object lbl1: TLabel
          Left = 6
          Top = 18
          Width = 127
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #32806#21512#27979#35797#20301#36229#26102#26102#38388':'
        end
        object lbl3: TLabel
          Left = 6
          Top = 47
          Width = 127
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #36719#20214#19979#36733#20301#36229#26102#26102#38388':'
        end
        object lbl4: TLabel
          Left = 6
          Top = 74
          Width = 127
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #33258#21160#27979#35797#20301#36229#26102#26102#38388':'
        end
        object lbl7: TLabel
          Left = 6
          Top = 103
          Width = 127
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'IMEI'#28903#20889#20301#36229#26102#26102#38388':'
        end
        object lbl8: TLabel
          Left = 6
          Top = 132
          Width = 127
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #20135#21697#36820#24037#20301#36229#26102#26102#38388':'
        end
        object Label10: TLabel
          Left = 8
          Top = 161
          Width = 128
          Height = 11
          Caption = 'SMT'#33258#21160#27979#35797#20301#36229#26102#26102#38388#65306
        end
        object lbl2: TLabel
          Left = 8
          Top = 193
          Width = 77
          Height = 11
          Caption = #20837#24211#20301#30334#20998#27604#65306
        end
        object Edt_CoupleTestTestTime: TDBEdit
          Left = 134
          Top = 14
          Width = 102
          Height = 19
          DataField = 'CoupleTestTestTime'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
          OnChange = Edt_CoupleTestTestTimeChange
        end
        object Edt_ParamDownloadTestTime: TDBEdit
          Left = 134
          Top = 42
          Width = 102
          Height = 19
          DataField = 'ParamDownloadTestTime'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 1
          OnChange = Edt_ParamDownloadTestTimeChange
        end
        object Edt_AutoTestTestTime: TDBEdit
          Left = 134
          Top = 71
          Width = 102
          Height = 19
          DataField = 'AutoTestTestTime'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
          OnChange = Edt_AutoTestTestTimeChange
        end
        object Edt_WriteImeiTestTime: TDBEdit
          Left = 134
          Top = 101
          Width = 102
          Height = 19
          DataField = 'WriteImeiTestTime'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 3
          OnChange = Edt_WriteImeiTestTimeChange
        end
        object Edt_TwiceTestTime: TDBEdit
          Left = 134
          Top = 129
          Width = 102
          Height = 19
          DataField = 'TwiceTestTime'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 4
          OnChange = Edt_TwiceTestTimeChange
        end
        object Edt_SMT_AutoTestTestTime: TDBEdit
          Left = 133
          Top = 158
          Width = 102
          Height = 19
          DataField = 'SMT_AutoTestTestTime'
          DataSource = DS_Module
          TabOrder = 5
          OnChange = Edt_SMT_AutoTestTestTimeChange
        end
        object dbedtSMT_INPercentage: TDBEdit
          Left = 133
          Top = 190
          Width = 102
          Height = 19
          DataField = 'Percentage'
          DataSource = DS_Module
          TabOrder = 6
          OnChange = Edt_SMT_AutoTestTestTimeChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 284
        Top = 14
        Width = 258
        Height = 227
        Caption = 'GPS'#36879#20256
        TabOrder = 1
        object lbl11: TLabel
          Left = 7
          Top = 18
          Width = 86
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'GPS'#21355#26143#39063#25968':'
        end
        object Label1: TLabel
          Left = 7
          Top = 47
          Width = 86
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'GPS'#21355#26143#24378#24230':'
        end
        object Label2: TLabel
          Left = 7
          Top = 74
          Width = 86
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EPO'#32463#24230':'
        end
        object Label3: TLabel
          Left = 7
          Top = 103
          Width = 86
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EPO'#32428#24230':'
        end
        object Label4: TLabel
          Left = 7
          Top = 132
          Width = 86
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EPO'#39640#24230':'
        end
        object Edt_GPSNumbers: TDBEdit
          Left = 95
          Top = 14
          Width = 143
          Height = 19
          DataField = 'GPSNumbers'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
          OnChange = Edt_GPSNumbersChange
        end
        object Edt_GPSDb: TDBEdit
          Left = 95
          Top = 42
          Width = 143
          Height = 19
          DataField = 'GPSDb'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 1
          OnChange = Edt_GPSDbChange
        end
        object Edt_EPOLatitude: TDBEdit
          Left = 95
          Top = 71
          Width = 143
          Height = 19
          DataField = 'EPOLatitude'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
          OnChange = Edt_EPOLatitudeChange
        end
        object Edt_EPOLongitude: TDBEdit
          Left = 95
          Top = 101
          Width = 143
          Height = 19
          DataField = 'EPOLongitude'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 3
          OnChange = Edt_EPOLongitudeChange
        end
        object Edt_EPOAltitude: TDBEdit
          Left = 95
          Top = 129
          Width = 143
          Height = 19
          DataField = 'EPOAltitude'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 4
          OnChange = Edt_EPOAltitudeChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 555
        Top = 14
        Width = 258
        Height = 227
        Caption = #33258#21160#26816#27979#35774#22791#25554#20837#27979#35797
        TabOrder = 2
        object Label7: TLabel
          Left = 2
          Top = 74
          Width = 103
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979'AT'#36820#22238#20540':'
        end
        object Label8: TLabel
          Left = 2
          Top = 103
          Width = 103
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979'AT'#36229#26102#26102#38388':'
        end
        object Label9: TLabel
          Left = 2
          Top = 132
          Width = 103
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979#20801#35768#27425#25968':'
        end
        object Label5: TLabel
          Left = 2
          Top = 18
          Width = 103
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26816#27979#38388#38548#26102#38388':'
        end
        object Label6: TLabel
          Left = 2
          Top = 47
          Width = 103
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
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 0
          OnChange = Edt_CheckTestAtReturnChange
        end
        object Edt_CheckTestAtTimeOut: TDBEdit
          Left = 104
          Top = 101
          Width = 135
          Height = 19
          DataField = 'CheckTestAtTimeOut'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 1
          OnChange = Edt_CheckTestAtTimeOutChange
        end
        object Edt_CheckTestAllowTestCount: TDBEdit
          Left = 104
          Top = 129
          Width = 135
          Height = 19
          DataField = 'CheckTestAllowTestCount'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 2
          OnChange = Edt_CheckTestAllowTestCountChange
        end
        object Edt_CheckTestTime: TDBEdit
          Left = 104
          Top = 14
          Width = 135
          Height = 19
          DataField = 'CheckTestTime'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 3
          OnChange = Edt_CheckTestTimeChange
        end
        object Edt_CheckTestAtCommand: TDBEdit
          Left = 104
          Top = 42
          Width = 135
          Height = 19
          DataField = 'CheckTestAtCommand'
          DataSource = DS_Module
          ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
          TabOrder = 4
          OnChange = Edt_CheckTestAtCommandChange
        end
      end
    end
  end
  inherited tlb1: TToolBar
    Width = 1028
  end
  inherited SB_Module: TStatusBar
    Width = 1028
  end
  inherited ImageList: TImageList
    Left = 440
    Top = 8
  end
  inherited ActionList: TActionList
    Left = 952
    Top = 8
  end
  inherited SaveDialog1: TSaveDialog
    Left = 952
    Top = 40
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_TestParameter
    Left = 520
    Top = 32
  end
  inherited tmr1: TTimer
    Left = 920
    Top = 8
  end
  object UniQuery_TestParameter: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_TestParamter')
    OnCalcFields = UniQuery_TestParameterCalcFields
    Left = 552
    Top = 32
    object SFUniQuery_TestParameterIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_TestParameterId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object intgrfldUniQuery_TestParameterCoupleTestTestTime: TIntegerField
      FieldName = 'CoupleTestTestTime'
    end
    object intgrfldUniQuery_TestParameterParamDownloadTestTime: TIntegerField
      FieldName = 'ParamDownloadTestTime'
    end
    object intgrfldUniQuery_TestParameterAutoTestTestTime: TIntegerField
      FieldName = 'AutoTestTestTime'
    end
    object intgrfldUniQuery_TestParameterWriteImeiTestTime: TIntegerField
      FieldName = 'WriteImeiTestTime'
    end
    object intgrfldUniQuery_TestParameterTwiceTestTime: TIntegerField
      FieldName = 'TwiceTestTime'
    end
    object intgrfldUniQuery_TestParameterGPSNumbers: TIntegerField
      FieldName = 'GPSNumbers'
    end
    object intgrfldUniQuery_TestParameterGPSDb: TIntegerField
      FieldName = 'GPSDb'
    end
    object SFUniQuery_TestParameterEPOLatitude: TStringField
      FieldName = 'EPOLatitude'
    end
    object SFUniQuery_TestParameterEPOLongitude: TStringField
      FieldName = 'EPOLongitude'
    end
    object SFUniQuery_TestParameterEPOAltitude: TStringField
      FieldName = 'EPOAltitude'
    end
    object intgrfldUniQuery_TestParameterCheckTestTime: TIntegerField
      FieldName = 'CheckTestTime'
    end
    object SFUniQuery_TestParameterCheckTestAtCommand: TStringField
      FieldName = 'CheckTestAtCommand'
      Size = 50
    end
    object SFUniQuery_TestParameterCheckTestAtReturn: TStringField
      FieldName = 'CheckTestAtReturn'
      Size = 50
    end
    object intgrfldUniQuery_TestParameterCheckTestAtTimeOut: TIntegerField
      FieldName = 'CheckTestAtTimeOut'
    end
    object intgrfldUniQuery_TestParameterCheckTestAllowTestCount: TIntegerField
      FieldName = 'CheckTestAllowTestCount'
    end
    object UniQuery_TestParameterSMT_AutoTestTestTime: TIntegerField
      FieldName = 'SMT_AutoTestTestTime'
    end
    object intgrfldUniQuery_TestParameterPercentage: TIntegerField
      FieldName = 'Percentage'
    end
  end
end
