inherited frmOQCItem: TfrmOQCItem
  Left = 329
  Top = 173
  Width = 931
  Height = 643
  Caption = 'OQC'#24037#20301#39033#30446#35774#32622
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Left = 184
    Width = 739
    Height = 506
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Width = 731
        Height = 480
        Enabled = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'ItemModel'
            Footers = <>
            Title.Caption = 'ItemMode'
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'ItemName'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'SubItemName'
            Footers = <>
            Title.Caption = #23376#27979#35797#39033#21517#31216
            Width = 163
          end
          item
            EditButtons = <>
            FieldName = 'SendAtComm'
            Footers = <>
            Title.Caption = #26159#21542#21457#36865'AT'#25351#20196
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'AtComm'
            Footers = <>
            Title.Caption = 'AT'#25351#20196
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'ReturnText'
            Footers = <>
            Title.Caption = 'AT'#36820#22238#20540
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'ReSendNum'
            Footers = <>
            Title.Caption = #37325#21457#27425#25968
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'TestTimeOut'
            Footers = <>
            Title.Caption = #36229#26102#26102#38388
          end
          item
            EditButtons = <>
            FieldName = 'Compare'
            Footers = <>
            Title.Caption = #26159#21542#27604#23545#36820#22238#20540
            Width = 131
          end
          item
            EditButtons = <>
            FieldName = 'Remark1'
            Footers = <>
            Title.Caption = #22791#27880#19968
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'Remark2'
            Footers = <>
            Title.Caption = #22791#27880#20108
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl5: TLabel
        Left = 7
        Top = 10
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411#65306
      end
      object lbl2: TLabel
        Left = 7
        Top = 38
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#39033#21517#31216#65306
      end
      object lbl6: TLabel
        Left = 7
        Top = 66
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23376#27979#35797#39033#21517#31216#65306
      end
      object lbl7: TLabel
        Left = 7
        Top = 94
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26159#21542#21457#36865'AT'#25351#20196#65306
      end
      object lbl8: TLabel
        Left = 7
        Top = 123
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'AT'#25351#20196#65306
      end
      object lbl9: TLabel
        Left = 7
        Top = 151
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'AT'#36820#22238#20540#65306
      end
      object lbl10: TLabel
        Left = 7
        Top = 179
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'AT'#37325#21457#27425#25968#65306
      end
      object lbl11: TLabel
        Left = 7
        Top = 206
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36229#26102#26102#38388#65306
      end
      object lbl12: TLabel
        Left = 294
        Top = 10
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26159#21542#27604#23545#36820#22238#20540#65306
      end
      object lbl13: TLabel
        Left = 230
        Top = 94
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#19968#65306
      end
      object lbl14: TLabel
        Left = 230
        Top = 123
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#20108#65306
      end
      object lbl15: TLabel
        Left = 230
        Top = 38
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36820#22238#20540#33539#22260#65306
      end
      object lbl16: TLabel
        Left = 230
        Top = 66
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36820#22238#20540#20998#38548#20869#23481#65306
      end
      object lbl17: TLabel
        Left = 230
        Top = 151
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#19977#65306
      end
      object lbl18: TLabel
        Left = 230
        Top = 179
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#22235#65306
      end
      object lbl19: TLabel
        Left = 230
        Top = 206
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#20116#65306
      end
      object dbedtItemModel: TDBEdit
        Left = 108
        Top = 7
        Width = 103
        Height = 19
        DataField = 'ItemModel'
        DataSource = DS_Module
        Enabled = False
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
      end
      object dbedtItemName: TDBEdit
        Left = 108
        Top = 36
        Width = 103
        Height = 19
        DataField = 'ItemName'
        DataSource = DS_Module
        Enabled = False
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
      end
      object dbedtSubItemName: TDBEdit
        Left = 108
        Top = 63
        Width = 103
        Height = 19
        DataField = 'SubItemName'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
        OnChange = dbedtSubItemNameChange
      end
      object dbchkSendAtComm: TDBCheckBox
        Left = 108
        Top = 92
        Width = 82
        Height = 15
        Caption = #21457#36865
        DataField = 'SendAtComm'
        DataSource = DS_Module
        TabOrder = 3
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedtAtComm: TDBEdit
        Left = 108
        Top = 118
        Width = 103
        Height = 19
        DataField = 'AtComm'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 4
      end
      object dbedtReturnText: TDBEdit
        Left = 108
        Top = 146
        Width = 103
        Height = 19
        DataField = 'ReturnText'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 5
      end
      object dbedtReSendNum: TDBEdit
        Left = 108
        Top = 174
        Width = 103
        Height = 19
        DataField = 'ReSendNum'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 6
      end
      object dbedtTestTimeOut: TDBEdit
        Left = 108
        Top = 203
        Width = 103
        Height = 19
        DataField = 'TestTimeOut'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 7
      end
      object dbchkCompare: TDBCheckBox
        Left = 396
        Top = 10
        Width = 82
        Height = 15
        Caption = #27604#36739
        DataField = 'Compare'
        DataSource = DS_Module
        TabOrder = 8
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedtRemark1: TDBEdit
        Left = 332
        Top = 91
        Width = 254
        Height = 19
        DataField = 'Remark1'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 9
      end
      object dbedtRemark2: TDBEdit
        Left = 332
        Top = 119
        Width = 254
        Height = 19
        DataField = 'Remark2'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 10
      end
      object dbedtCompareValue: TDBEdit
        Left = 332
        Top = 35
        Width = 254
        Height = 19
        DataField = 'CompareValue'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 11
      end
      object dbedtCompareRemark: TDBEdit
        Left = 332
        Top = 63
        Width = 254
        Height = 19
        DataField = 'CompareRemark'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 12
      end
      object dbedtRemark3: TDBEdit
        Left = 332
        Top = 147
        Width = 254
        Height = 19
        DataField = 'Remark3'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 13
      end
      object dbedtRemark4: TDBEdit
        Left = 332
        Top = 175
        Width = 254
        Height = 19
        DataField = 'Remark4'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 14
      end
      object dbedtRemark5: TDBEdit
        Left = 332
        Top = 203
        Width = 254
        Height = 19
        DataField = 'Remark5'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 15
      end
    end
  end
  inherited tlb1: TToolBar
    Width = 923
  end
  inherited SB_Module: TStatusBar
    Top = 585
    Width = 923
  end
  object pnlResult1: TPanel [3]
    Left = 0
    Top = 544
    Width = 923
    Height = 41
    Align = alBottom
    TabOrder = 3
    object lbl3: TLabel
      Left = 34
      Top = 14
      Width = 95
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26426#22411#35774#32622#25335#36125#65306
    end
    object lbl4: TLabel
      Left = 230
      Top = 15
      Width = 14
      Height = 11
      AutoSize = False
      Caption = #33267
    end
    object btnCopy: TButton
      Left = 359
      Top = 10
      Width = 75
      Height = 21
      Caption = #20174#26412#34920#22797#21046'(&C)'
      TabOrder = 0
      OnClick = btnCopyClick
    end
    object cbb_SrcModel: TComboBox
      Left = 125
      Top = 12
      Width = 102
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      ItemHeight = 11
      TabOrder = 1
    end
    object cbb_DstModel: TComboBox
      Left = 244
      Top = 12
      Width = 101
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      ItemHeight = 11
      TabOrder = 2
    end
    object btnCopyFormAutoTest: TButton
      Left = 440
      Top = 10
      Width = 123
      Height = 21
      Caption = #20174#33258#21160#27979#35797#20301#34920#22797#21046'(&C)'
      TabOrder = 3
      OnClick = btnCopyFormAutoTestClick
    end
  end
  object pnl2: TPanel [4]
    Left = 0
    Top = 38
    Width = 184
    Height = 506
    Align = alLeft
    TabOrder = 4
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 182
      Height = 34
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 4
        Top = 8
        Width = 59
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411#65306
      end
      object cbbCom_TestModel: TComboBox
        Left = 60
        Top = 5
        Width = 102
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ItemHeight = 11
        TabOrder = 0
        OnChange = cbbCom_TestModelChange
      end
    end
    object dblklstModel: TDBLookupListBox
      Left = 1
      Top = 35
      Width = 182
      Height = 356
      Align = alClient
      DataField = 'Model'
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      KeyField = 'ItemName'
      ListField = 'ItemName'
      ListSource = DS_OQCItem
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnKeyUp = dblklstModelKeyUp
    end
    object pnl1: TPanel
      Left = 1
      Top = 392
      Width = 182
      Height = 113
      Align = alBottom
      TabOrder = 2
      object Edt_ItemName: TDBEdit
        Left = 0
        Top = 5
        Width = 178
        Height = 19
        DataField = 'ItemName'
        DataSource = DS_OQCItem
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_ItemNameChange
      end
      object Edt_TestItemNameAdd: TEdit
        Left = 0
        Top = 49
        Width = 178
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
      end
      object btnModify: TButton
        Left = 112
        Top = 27
        Width = 63
        Height = 20
        Caption = 'P&ost'
        TabOrder = 2
        OnClick = btnModifyClick
      end
      object btnAdd: TButton
        Left = 113
        Top = 69
        Width = 64
        Height = 22
        Caption = #22686#21152'(&A)'
        TabOrder = 3
        OnClick = btnAddClick
      end
    end
  end
  inherited DS_Module: TDataSource
    DataSet = unqry_OQCSubItem
    Left = 816
    Top = 96
  end
  object DS_OQCItem: TDataSource
    DataSet = unqry_OQCItem
    Left = 816
    Top = 64
  end
  object unqry_OQCItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_OQC_Item'
      'Where ItemModel=:ItemModel')
    Left = 864
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
    object intgrfldUniQuery_AutoTestSMTItemId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldSFUniQuery_AutoTestSMTItemItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldSFUniQuery_AutoTestSMTItemItemName: TStringField
      FieldName = 'ItemName'
      Required = True
      Size = 50
    end
  end
  object unqry_OQCSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_OQC_SubItem'
      'where ItemModel=:ItemModel')
    Left = 864
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
  end
  object DS_AutoTestModel1: TDataSource
    DataSet = unqry_TestModel
    Left = 816
    Top = 136
  end
  object unqry_TestModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model order by model')
    Left = 864
    Top = 136
    object strngfldSFUniQuery_TestModelIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_TestModelId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldSFUniQuery_TestModelModel: TStringField
      FieldName = 'Model'
      Required = True
    end
  end
end
