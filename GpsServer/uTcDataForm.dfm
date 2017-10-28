inherited frmTcData: TfrmTcData
  Left = 315
  Top = 54
  Width = 1024
  Height = 573
  Caption = 'GPS'#36879#20256#25968#25454#26597#35810
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    Top = 81
    Width = 1016
    Height = 434
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Width = 1008
        Height = 408
        Enabled = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32034#24341
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'ID'
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'SN'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35774#22791'SN'
            Width = 220
          end
          item
            EditButtons = <>
            FieldName = 'FixMode'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23450#20301#27169#24335
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_0'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'1'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_1'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'2'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_2'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'3'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_3'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'4'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_4'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'5'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_5'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'6'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_6'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'7'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_7'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'8'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_8'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'9'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_9'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'10'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_10'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'11'#20449#21495#24378#24230
          end
          item
            EditButtons = <>
            FieldName = 'GpsDb_11'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'12'#20449#21495#24378#24230
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      TabVisible = False
    end
  end
  inherited tlb1: TToolBar
    Width = 1016
    inherited TB_Insert: TToolButton
      Enabled = False
      Visible = False
    end
    inherited btnac_Exit: TToolButton
      Enabled = False
    end
    inherited TB_Edit: TToolButton
      Visible = False
    end
    inherited TB_Cancel: TToolButton
      Action = ac_Cancel
    end
    inherited TB_Delete: TToolButton
      Enabled = False
      Visible = False
    end
  end
  inherited SB_Module: TStatusBar
    Top = 515
    Width = 1016
  end
  object grp_Query: TGroupBox [3]
    Left = 0
    Top = 38
    Width = 1016
    Height = 43
    Align = alTop
    Caption = #26597#35810#26465#20214
    TabOrder = 3
    object lbl_SN: TLabel
      Left = 11
      Top = 14
      Width = 21
      Height = 13
      Caption = 'SN:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #26032#23435#20307
      Font.Style = []
      ParentFont = False
    end
    object ET_SN: TEdit
      Left = 49
      Top = 11
      Width = 305
      Height = 19
      Hint = #35831#36755#20837#26597#35810#26465#20214'SN'#25968#20540
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 32
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  inherited ImageList: TImageList
    Left = 760
    Top = 8
  end
  inherited ActionList: TActionList
    inherited ac_Find: TAction
      OnExecute = ac_FindExecute
    end
    object ac_Cancel: TAction
      Caption = #21462#28040
      OnExecute = ac_CancelExecute
    end
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_GpsTcData
    Left = 640
    Top = 64
  end
  object UniQuery_GpsTcData: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from GpsTcData')
    OnCalcFields = UniQuery_GpsTcDataCalcFields
    Left = 672
    Top = 64
    object SFUniQuery_GpsTcDataIndex: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_GpsTcDataId: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_GpsTcDataSN: TStringField
      FieldName = 'SN'
      Required = True
      Size = 32
    end
    object SFUniQuery_GpsTcDataFixMode: TStringField
      Alignment = taCenter
      FieldName = 'FixMode'
      Required = True
      Size = 30
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_0: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_0'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_1: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_1'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_2: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_2'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_3: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_3'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_4: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_4'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_5: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_5'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_6: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_6'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_7: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_7'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_8: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_8'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_9: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_9'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_10: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_10'
    end
    object intgrfldUniQuery_GpsTcDataGpsDb_11: TIntegerField
      Alignment = taCenter
      FieldName = 'GpsDb_11'
    end
  end
end
