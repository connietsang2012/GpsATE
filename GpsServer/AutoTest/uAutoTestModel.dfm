inherited frmAutoTestModel: TfrmAutoTestModel
  Left = 320
  Top = 126
  Caption = #27979#35797#26426#22411
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Top = 81
    Height = 424
    ActivePage = TabSheet1
    TabIndex = 0
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Height = 398
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
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26426#22411
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'bReadRID'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #33021#21542#35835#21462#22522#24102'ID'
            Width = 120
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl7: TLabel
        Left = 25
        Top = 34
        Width = 93
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411' :'
      end
      object Edt_UserDes: TDBEdit
        Left = 120
        Top = 30
        Width = 170
        Height = 19
        DataField = 'Model'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_UserDesChange
      end
      object DBCheckBox1: TDBCheckBox
        Left = 120
        Top = 72
        Width = 153
        Height = 17
        Caption = #33021#21542#35835#21462#22522#24102'ID'
        DataField = 'bReadRID'
        DataSource = DS_Module
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBox1Click
      end
    end
  end
  object grp_Query: TGroupBox [3]
    Left = 0
    Top = 38
    Width = 971
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
    DataSet = UniQuery_TestModel
  end
  object UniQuery_TestModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model')
    BeforeInsert = UniQuery_TestModelBeforeInsert
    AfterPost = UniQuery_TestModelAfterPost
    OnCalcFields = UniQuery_TestModelCalcFields
    Left = 488
    Top = 64
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
    object UniQuery_TestModelbReadRID: TBooleanField
      FieldName = 'bReadRID'
      Required = True
    end
  end
end
