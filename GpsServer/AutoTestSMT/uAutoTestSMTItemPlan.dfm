object frmAutoTestSMTItemPlan: TfrmAutoTestSMTItemPlan
  Left = 336
  Top = 220
  Width = 928
  Height = 480
  Caption = #33258#21160#27979#35797#35745#21010'(SMT)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 54
      Top = 14
      Width = 69
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27979#35797#35745#21010#65306
    end
    object cbbCom_TestModel: TComboBox
      Left = 123
      Top = 9
      Width = 169
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      ItemHeight = 11
      TabOrder = 0
      OnChange = cbbCom_TestModelChange
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 920
    Height = 405
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = #20462#25913
      ImageIndex = 1
      object lblSrcLabel: TLabel
        Left = 7
        Top = 7
        Width = 122
        Height = 13
        AutoSize = False
        Caption = #21487#36873#27979#35797#39033':'
      end
      object lblDstLabel: TLabel
        Left = 162
        Top = 7
        Width = 123
        Height = 13
        AutoSize = False
        Caption = #24050#36873#27979#35797#39033':'
      end
      object btnInclude: TSpeedButton
        Left = 135
        Top = 27
        Width = 21
        Height = 20
        Caption = '>'
        OnClick = btnIncludeClick
      end
      object btnIncAll: TSpeedButton
        Left = 135
        Top = 54
        Width = 21
        Height = 20
        Caption = '>>'
        OnClick = btnIncAllClick
      end
      object btnExclude: TSpeedButton
        Left = 135
        Top = 81
        Width = 21
        Height = 21
        Caption = '<'
        Enabled = False
        OnClick = btnExcludeClick
      end
      object btnExAll: TSpeedButton
        Left = 135
        Top = 108
        Width = 21
        Height = 21
        Caption = '<<'
        Enabled = False
        OnClick = btnExAllClick
      end
      object DBLSrcList: TDBLookupListBox
        Left = 7
        Top = 20
        Width = 122
        Height = 290
        DataField = 'Id'
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        KeyField = 'Id'
        ListField = 'ItemName'
        ListFieldIndex = 1
        ListSource = DS_SrcSubItem
        TabOrder = 0
      end
      object DBLDstList: TDBLookupListBox
        Left = 162
        Top = 20
        Width = 122
        Height = 290
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
  object DS_DstSubItem: TDataSource
    DataSet = UniQuery_DstSubItem
    Left = 416
    Top = 128
  end
  object DS_SrcSubItem: TDataSource
    DataSet = UniQuery_SrcSubItem
    Left = 416
    Top = 168
  end
  object UniQuery_TestModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model order by model')
    Left = 448
    Top = 88
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
  object UniQuery_DstSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      
        'select * from Gps_AutoTestSMT_DstSubItem WHERE Gps_AutoTestSMT_D' +
        'stSubItem.ItemModel=:ItemModel')
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    Left = 448
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
  end
  object UniQuery_SrcSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      
        'select * from Gps_AutoTestSMT_SrcSubItem  WHERE Gps_AutoTestSMT_' +
        'SrcSubItem.ItemModel=:ItemModel')
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    Left = 448
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
  end
end
