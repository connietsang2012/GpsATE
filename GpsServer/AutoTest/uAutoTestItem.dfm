inherited frmAutoTestItem: TfrmAutoTestItem
  Left = 267
  Top = 79
  Width = 1085
  Height = 727
  Caption = #33258#21160#27979#35797#39033#30446#35774#32622
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Left = 184
    Width = 893
    Height = 590
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Width = 885
        Height = 564
        Enabled = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ItemModel'
            Footers = <>
            Title.Alignment = taCenter
            Width = 0
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ItemName'
            Footers = <>
            Title.Alignment = taCenter
            Width = 0
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SubItemName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23376#27979#35797#39033#21517#31216
            Width = 180
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SendAtComm'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26159#21542#21457#36865'AT'#25351#20196
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'AtComm'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'AT'#25351#20196
            Width = 260
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ReturnText'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'AT'#36820#22238#20540
            Width = 260
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ReSendNum'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #37325#21457#27425#25968
            Width = 60
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TestTimeOut'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36229#26102#26102#38388
            Width = 60
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Compare'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26159#21542#27604#23545#36820#22238#20540
            Width = 90
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CompareValue'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36820#22238#20540#33539#22260
            Width = 260
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'CompareRemark'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36820#22238#20540#20998#38548#20869#23481
            Width = 260
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Remark1'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#19968
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Remark2'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#20108
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Remark3'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#19977
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Remark4'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#22235
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Remark5'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#20116
            Width = 80
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel
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
      object Label2: TLabel
        Left = 7
        Top = 66
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23376#27979#35797#39033#21517#31216#65306
      end
      object Label3: TLabel
        Left = 7
        Top = 123
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'AT'#25351#20196#65306
      end
      object Label4: TLabel
        Left = 7
        Top = 94
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26159#21542#21457#36865'AT'#25351#20196#65306
      end
      object Label5: TLabel
        Left = 7
        Top = 151
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'AT'#36820#22238#20540#65306
      end
      object Label6: TLabel
        Left = 7
        Top = 179
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'AT'#37325#21457#27425#25968#65306
      end
      object Label7: TLabel
        Left = 7
        Top = 206
        Width = 101
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36229#26102#26102#38388#65306
      end
      object Label8: TLabel
        Left = 230
        Top = 38
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36820#22238#20540#33539#22260#65306
      end
      object Label9: TLabel
        Left = 230
        Top = 10
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26159#21542#27604#23545#36820#22238#20540#65306
      end
      object Label10: TLabel
        Left = 230
        Top = 66
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36820#22238#20540#20998#38548#20869#23481#65306
      end
      object Label11: TLabel
        Left = 230
        Top = 94
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#19968#65306
      end
      object Label12: TLabel
        Left = 230
        Top = 123
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#20108#65306
      end
      object Label13: TLabel
        Left = 230
        Top = 151
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#19977#65306
      end
      object Label14: TLabel
        Left = 230
        Top = 179
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#22235#65306
      end
      object Label15: TLabel
        Left = 230
        Top = 206
        Width = 102
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#20116#65306
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
        TabOrder = 1
        OnChange = Edt_TestPlanNameChange
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
        TabOrder = 2
        OnChange = Edt_TestPlanDesChange
      end
      object DBEdit1: TDBEdit
        Left = 108
        Top = 63
        Width = 103
        Height = 19
        DataField = 'SubItemName'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = DBEdit1Change
      end
      object DBEdit2: TDBEdit
        Left = 108
        Top = 118
        Width = 103
        Height = 19
        DataField = 'AtComm'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 3
        OnChange = DBEdit2Change
      end
      object DBCheckBox1: TDBCheckBox
        Left = 108
        Top = 92
        Width = 82
        Height = 15
        Caption = #21457#36865
        DataField = 'SendAtComm'
        DataSource = DS_Module
        TabOrder = 4
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBox1Click
      end
      object DBEdit3: TDBEdit
        Left = 108
        Top = 146
        Width = 103
        Height = 19
        DataField = 'ReturnText'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 5
        OnChange = DBEdit3Change
      end
      object DBEdit4: TDBEdit
        Left = 108
        Top = 174
        Width = 103
        Height = 19
        DataField = 'ReSendNum'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 6
        OnChange = DBEdit4Change
      end
      object DBEdit5: TDBEdit
        Left = 108
        Top = 203
        Width = 103
        Height = 19
        DataField = 'TestTimeOut'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 7
        OnChange = DBEdit5Change
      end
      object DBEdit6: TDBEdit
        Left = 332
        Top = 35
        Width = 254
        Height = 19
        DataField = 'CompareValue'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 8
        OnChange = DBEdit6Change
      end
      object DBCheckBox2: TDBCheckBox
        Left = 332
        Top = 10
        Width = 82
        Height = 15
        Caption = #27604#36739
        DataField = 'Compare'
        DataSource = DS_Module
        TabOrder = 9
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBox2Click
      end
      object DBEdit7: TDBEdit
        Left = 332
        Top = 63
        Width = 254
        Height = 19
        DataField = 'CompareRemark'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 10
        OnChange = DBEdit7Change
      end
      object DBEdit8: TDBEdit
        Left = 332
        Top = 91
        Width = 254
        Height = 19
        DataField = 'Remark1'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 11
        OnChange = DBEdit8Change
      end
      object DBEdit9: TDBEdit
        Left = 332
        Top = 119
        Width = 254
        Height = 19
        DataField = 'Remark2'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 12
        OnChange = DBEdit9Change
      end
      object DBEdit10: TDBEdit
        Left = 332
        Top = 147
        Width = 254
        Height = 19
        DataField = 'Remark3'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 13
        OnChange = DBEdit10Change
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
        OnChange = dbedtRemark4Change
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
        OnChange = dbedtRemark5Change
      end
    end
  end
  inherited tlb1: TToolBar
    Width = 1077
  end
  inherited SB_Module: TStatusBar
    Top = 669
    Width = 1077
  end
  object pnl2: TPanel [3]
    Left = 0
    Top = 38
    Width = 184
    Height = 590
    Align = alLeft
    TabOrder = 3
    object dblklstModel: TDBLookupListBox
      Left = 1
      Top = 35
      Width = 182
      Height = 455
      Align = alClient
      DataField = 'Model'
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      KeyField = 'ItemName'
      ListField = 'ItemName'
      ListSource = DS_AutoTestItem
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnKeyUp = dblklstModelKeyUp
    end
    object Panel1: TPanel
      Left = 1
      Top = 495
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
        DataSource = DS_AutoTestItem
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_ItemNameChange
        OnKeyDown = Edt_ItemNameKeyDown
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
        Action = DS_TestItemPost
        TabOrder = 2
      end
      object btnAdd: TButton
        Left = 113
        Top = 69
        Width = 64
        Height = 22
        Hint = 'Insert'
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
  object estResult1: TPanel [4]
    Left = 0
    Top = 628
    Width = 1077
    Height = 41
    Align = alBottom
    TabOrder = 4
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
      Width = 63
      Height = 21
      Caption = #22797'  '#21046'(&C)'
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
  end
  inherited ImageList: TImageList
    Left = 8
    Top = 32
  end
  inherited ActionList: TActionList
    Images = ImageList
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_AutoTestSubItem
    Left = 664
    Top = 176
  end
  object ActionList1: TActionList
    Left = 8
    Top = 8
    object ac_TestItemInsert: TAction
      Caption = #22686#21152'(&A)'
    end
    object ac_TestItemDelete: TAction
      Caption = #21024#38500'(&D)'
    end
    object ac_TestItemModify: TAction
      Caption = #20462#25913'(&M)'
    end
  end
  object DS_AutoTestModel: TDataSource
    DataSet = UniQuery_TestModel
    Left = 664
    Top = 208
  end
  object ActionList2: TActionList
    Left = 856
    Top = 24
    object DS_TestItemEdit: TDataSetEdit
      Category = 'Dataset'
      AutoCheck = True
      Caption = '&Edit'
      Checked = True
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = DS_AutoTestItem
    end
    object DS_TestItemPost: TDataSetPost
      Category = 'Dataset'
      AutoCheck = True
      Caption = 'P&ost'
      Checked = True
      Hint = 'Post'
      ImageIndex = 7
      DataSource = DS_AutoTestItem
    end
    object DS_TestItemInsert: TDataSetInsert
      Category = 'Dataset'
      AutoCheck = True
      Caption = '&Insert'
      Checked = True
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = DS_AutoTestItem
    end
  end
  object UniQuery_AutoTestItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTestItem'
      'Where Gps_AutoTestItem.ItemModel=:ItemModel')
    Left = 696
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
    object intgrfldUniQuery_AutoItemId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_AutoItemItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object SFUniQuery_AutoItemItemName: TStringField
      FieldName = 'ItemName'
      Required = True
      Size = 50
    end
  end
  object UniQuery_AutoTestSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTestSubItem')
    BeforeInsert = UniQuery_AutoTestSubItemBeforeInsert
    AfterInsert = UniQuery_AutoTestSubItemAfterInsert
    Left = 696
    Top = 176
  end
  object DS_AutoTestItem: TDataSource
    DataSet = UniQuery_AutoTestItem
    Left = 664
    Top = 144
  end
  object UniQuery_TestModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model order by model')
    Left = 696
    Top = 208
    object SFUniQuery_TestModelIndex: TStringField
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
    object SFUniQuery_TestModelModel: TStringField
      FieldName = 'Model'
      Required = True
    end
  end
end
