inherited frmVersionModel: TfrmVersionModel
  Left = 295
  Top = 199
  Caption = #36719#20214#29256#26412#19982#26426#22411#23545#24212#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Top = 81
    Height = 424
    ActivePage = TabSheet2
    TabIndex = 1
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
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Version'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36719#20214#29256#26412
            Width = 260
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36719#20214#26426#22411
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'bReadRID'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #33021#21542#35835#21462#22522#24102'ID'
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TotalModel'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24635#26426#22411
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl7: TLabel
        Left = 31
        Top = 118
        Width = 93
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411' :'
      end
      object Label1: TLabel
        Left = 31
        Top = 74
        Width = 93
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36719#20214#29256#26412' :'
      end
      object Label2: TLabel
        Left = 31
        Top = 162
        Width = 93
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24635#26426#22411' :'
      end
      object Edt_Model: TDBEdit
        Left = 136
        Top = 115
        Width = 250
        Height = 19
        DataField = 'Model'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
        OnChange = Edt_ModelChange
      end
      object DBEdit1: TDBEdit
        Left = 136
        Top = 71
        Width = 250
        Height = 19
        DataField = 'Version'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = DBEdit1Change
      end
      object DBCheckBoxReadRID: TDBCheckBox
        Left = 136
        Top = 228
        Width = 120
        Height = 17
        Caption = #33021#21542#35835#21462#22522#24102'ID'
        DataField = 'bReadRID'
        DataSource = DS_Module
        TabOrder = 2
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBoxReadRIDClick
      end
      object DBEdit2: TDBEdit
        Left = 136
        Top = 158
        Width = 250
        Height = 19
        DataField = 'TotalModel'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 3
        OnChange = Edt_ModelChange
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
    object Edt_VersionModel: TEdit
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
    DataSet = UniQuery_VersionModel
  end
  object UniQuery_VersionModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_VersionModel')
    BeforeInsert = UniQuery_VersionModelBeforeInsert
    AfterPost = UniQuery_VersionModelAfterPost
    OnCalcFields = UniQuery_VersionModelCalcFields
    Left = 712
    Top = 72
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
      DisplayWidth = 30
      FieldName = 'Model'
      Required = True
      Size = 30
    end
    object UniQuery_VersionModelbReadRID: TBooleanField
      FieldName = 'bReadRID'
      Required = True
    end
    object UniQuery_VersionModelTotalModel: TStringField
      FieldName = 'TotalModel'
      Size = 50
    end
  end
end
