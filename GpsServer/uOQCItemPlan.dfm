object frmOQCItemPlan: TfrmOQCItemPlan
  Left = 372
  Top = 195
  Width = 979
  Height = 563
  Caption = 'QOC'#24037#20301#27979#35797#35745#21010
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 48
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 64
      Top = 17
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27979#35797#35745#21010#65306
    end
    object cbbCom_TestModel: TComboBox
      Left = 145
      Top = 11
      Width = 200
      Height = 21
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbbCom_TestModelChange
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 48
    Width = 971
    Height = 481
    ActivePage = ts1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #20462#25913
      ImageIndex = 1
      object lblSrcLabel: TLabel
        Left = 8
        Top = 8
        Width = 144
        Height = 16
        AutoSize = False
        Caption = #21487#36873#27979#35797#39033':'
      end
      object lblDstLabel: TLabel
        Left = 191
        Top = 8
        Width = 146
        Height = 16
        AutoSize = False
        Caption = #24050#36873#27979#35797#39033':'
      end
      object btnInclude: TSpeedButton
        Left = 161
        Top = 32
        Width = 23
        Height = 24
        Caption = '>'
        OnClick = btnIncludeClick
      end
      object btnIncAll: TSpeedButton
        Left = 160
        Top = 64
        Width = 24
        Height = 23
        Caption = '>>'
        OnClick = btnIncAllClick
      end
      object btnExclude: TSpeedButton
        Left = 160
        Top = 96
        Width = 24
        Height = 25
        Caption = '<'
        OnClick = btnExcludeClick
      end
      object btnExAll: TSpeedButton
        Left = 160
        Top = 128
        Width = 24
        Height = 24
        Caption = '<<'
        OnClick = btnExAllClick
      end
      object DBLSrcList: TDBLookupListBox
        Left = 8
        Top = 24
        Width = 144
        Height = 342
        DataField = 'Id'
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        KeyField = 'Id'
        ListField = 'ItemName'
        ListFieldIndex = 1
        ListSource = DS_SrcSubItem
        TabOrder = 0
      end
      object DBLDstList: TDBLookupListBox
        Left = 182
        Top = 24
        Width = 144
        Height = 342
        DataField = 'Id'
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        KeyField = 'ItemName'
        ListField = 'ItemName'
        ListFieldIndex = 1
        ListSource = DS_DstSubItem
        TabOrder = 1
      end
    end
  end
  object DS_AutoTestModel: TDataSource
    DataSet = UniQuery_TestModel
    Left = 416
    Top = 88
  end
  object UniQuery_TestModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model order by model')
    Active = True
    Left = 448
    Top = 88
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
  object DS_DstSubItem: TDataSource
    DataSet = UniQuery_DstSubItem
    Left = 416
    Top = 128
  end
  object UniQuery_DstSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      
        'select * from Gps_OQC_DstSubItem WHERE Gps_OQC_DstSubItem.ItemMo' +
        'del=:ItemModel')
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    Active = True
    Left = 448
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
  end
  object DS_SrcSubItem: TDataSource
    DataSet = UniQuery_SrcSubItem
    Left = 416
    Top = 168
  end
  object UniQuery_SrcSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      
        'select * from Gps_OQC_SrcSubItem  WHERE Gps_OQC_SrcSubItem.ItemM' +
        'odel=:ItemModel')
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    Active = True
    Left = 448
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
  end
end
