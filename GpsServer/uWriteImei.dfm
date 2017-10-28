inherited frmWriteImei: TfrmWriteImei
  Left = 311
  Top = 245
  Height = 564
  Caption = 'IMEI'#28903#20889#20301#39033#30446#35774#32622
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Left = 184
    Width = 787
    Height = 427
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Width = 779
        Height = 401
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
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'ItemName'
            Footers = <>
            Title.Caption = #23376#27979#35797#39033#21517#31216
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'SubItemName'
            Footers = <>
            Title.Caption = #23376#27979#35797#39033#21517#31216
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'SendAtComm'
            Footers = <>
            Title.Caption = #26159#21542#21457#36865'AT'#25351#20196
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'AtComm'
            Footers = <>
            Title.Caption = 'AT'#25351#20196
          end
          item
            EditButtons = <>
            FieldName = 'ReturnText'
            Footers = <>
            Title.Caption = 'AT'#36820#22238#20540
          end
          item
            EditButtons = <>
            FieldName = 'ReSendNum'
            Footers = <>
            Title.Caption = #37325#21457#27425#25968
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
            Title.Caption = #23545#27604
          end
          item
            EditButtons = <>
            FieldName = 'Remark1'
            Footers = <>
            Title.Caption = #22791#27880#19968
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
        Left = 238
        Top = 94
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#19968#65306
      end
      object lbl14: TLabel
        Left = 238
        Top = 123
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#20108#65306
      end
      object lbl17: TLabel
        Left = 238
        Top = 151
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#19977#65306
      end
      object lbl18: TLabel
        Left = 238
        Top = 179
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#22235#65306
      end
      object lbl19: TLabel
        Left = 238
        Top = 206
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#20116#65306
      end
      object lbl16: TLabel
        Left = 238
        Top = 66
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36820#22238#20540#20998#38548#20869#23481#65306
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
      object Edt_TestPlanName: TDBEdit
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
      object Edt_TestPlanDes: TDBEdit
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
        Left = 340
        Top = 91
        Width = 254
        Height = 19
        DataField = 'Remark1'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 9
      end
      object dbedtRemark2: TDBEdit
        Left = 340
        Top = 119
        Width = 254
        Height = 19
        DataField = 'Remark2'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 10
      end
      object dbedtRemark3: TDBEdit
        Left = 340
        Top = 147
        Width = 254
        Height = 19
        DataField = 'Remark3'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 11
      end
      object dbedtRemark4: TDBEdit
        Left = 340
        Top = 175
        Width = 254
        Height = 19
        DataField = 'Remark4'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 12
      end
      object dbedtRemark5: TDBEdit
        Left = 340
        Top = 203
        Width = 254
        Height = 19
        DataField = 'Remark5'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 13
      end
      object dbedtCompareRemark: TDBEdit
        Left = 340
        Top = 63
        Width = 254
        Height = 19
        DataField = 'CompareRemark'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 14
      end
      object dbedtCompareValue: TDBEdit
        Left = 340
        Top = 35
        Width = 254
        Height = 19
        DataField = 'CompareValue'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 15
      end
    end
  end
  inherited SB_Module: TStatusBar
    Top = 506
  end
  object pnlResult1: TPanel [3]
    Left = 0
    Top = 465
    Width = 971
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
    Height = 427
    Align = alLeft
    TabOrder = 4
    object dblklstModel: TDBLookupListBox
      Left = 1
      Top = 35
      Width = 182
      Height = 290
      Align = alClient
      DataField = 'Model'
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      KeyField = 'ItemName'
      ListField = 'ItemName'
      ListSource = DS_WriteImeiItem
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnKeyUp = dblklstModelKeyUp
    end
    object pnl3: TPanel
      Left = 1
      Top = 332
      Width = 182
      Height = 94
      Align = alBottom
      TabOrder = 1
      object Edt_ItemName: TDBEdit
        Left = 0
        Top = 5
        Width = 178
        Height = 19
        DataField = 'ItemName'
        DataSource = DS_WriteImeiItem
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
        Caption = 'Post'
        TabOrder = 2
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
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 182
      Height = 34
      Align = alTop
      TabOrder = 2
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
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_WriteImeiSubItem
    Left = 816
    Top = 96
  end
  object DS_WriteImeiItem: TDataSource
    DataSet = UniQuery_WriteImeiItem
    Left = 816
    Top = 64
  end
  object UniQuery_WriteImeiItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_WriteImei_Item'
      'Where ItemModel=:ItemModel')
    Left = 864
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
    object intgrfldUniQuery_WriteImeiItemId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldUniQuery_WriteImeiItemItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldUniQuery_WriteImeiItemItemName: TStringField
      FieldName = 'ItemName'
      Required = True
      Size = 50
    end
    object UniQuery_WriteImeiItem_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object DS_AutoTestModel1: TDataSource
    DataSet = UniQuery_TestModel
    Left = 816
    Top = 136
  end
  object UniQuery_TestModel: TUniQuery
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
  object UniQuery_WriteImeiSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_WriteImei_SubItem'
      'Where ItemModel=:ItemModel')
    Active = True
    Left = 864
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
    object UniQuery_WriteImeiSubItemId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldUniQuery_WriteImeiSubItemItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldUniQuery_WriteImeiSubItemItemName: TStringField
      FieldName = 'ItemName'
      Required = True
    end
    object strngfldUniQuery_WriteImeiSubItemSubItemName: TStringField
      FieldName = 'SubItemName'
      Required = True
      Size = 50
    end
    object UniQuery_WriteImeiSubItemSendAtComm: TBooleanField
      FieldName = 'SendAtComm'
      Required = True
    end
    object strngfldUniQuery_WriteImeiSubItemAtComm: TStringField
      FieldName = 'AtComm'
      Required = True
      Size = 100
    end
    object strngfldUniQuery_WriteImeiSubItemReturnText: TStringField
      FieldName = 'ReturnText'
      Required = True
      Size = 100
    end
    object UniQuery_WriteImeiSubItemReSendNum: TIntegerField
      FieldName = 'ReSendNum'
      Required = True
    end
    object UniQuery_WriteImeiSubItemTestTimeOut: TIntegerField
      FieldName = 'TestTimeOut'
      Required = True
    end
    object UniQuery_WriteImeiSubItemCompare: TBooleanField
      FieldName = 'Compare'
    end
    object strngfldUniQuery_WriteImeiSubItemCompareValue: TStringField
      FieldName = 'CompareValue'
      Size = 100
    end
    object strngfldUniQuery_WriteImeiSubItemCompareRemark: TStringField
      FieldName = 'CompareRemark'
      Size = 200
    end
    object UniQuery_WriteImeiSubItemRemark1: TWideStringField
      FieldName = 'Remark1'
      FixedChar = True
      Size = 10
    end
    object UniQuery_WriteImeiSubItemRemark2: TWideStringField
      FieldName = 'Remark2'
      FixedChar = True
      Size = 10
    end
    object strngfldUniQuery_WriteImeiSubItemRemark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object strngfldUniQuery_WriteImeiSubItemRemark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object strngfldUniQuery_WriteImeiSubItemRemark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
    object UniQuery_WriteImeiSubItem_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
end
