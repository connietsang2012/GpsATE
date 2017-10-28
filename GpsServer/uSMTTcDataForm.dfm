object FrmSMTTcDataForm: TFrmSMTTcDataForm
  Left = 190
  Top = 139
  Width = 1011
  Height = 595
  Caption = 'SMT_GPS'#36879#20256#25968#25454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1003
    Height = 59
    Align = alTop
    Caption = #26597#35810#26465#20214
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 26
      Width = 45
      Height = 11
      Caption = 'SN'#32534#21495#65306
    end
    object EditSMT_SN: TEdit
      Left = 72
      Top = 26
      Width = 225
      Height = 19
      TabOrder = 0
    end
    object BtnSearch: TButton
      Left = 312
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = BtnSearchClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 59
    Width = 1003
    Height = 502
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #35814#32454#21015#34920
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 995
        Height = 476
        Align = alClient
        DataSource = DataSc_SMT
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Title.Alignment = taCenter
            Width = 60
          end
          item
            Alignment = taRightJustify
            EditButtons = <>
            FieldName = 'SN'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35774#22791'SN'
            Width = 220
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'FixMode'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23450#20301#27169#24335
            Width = 70
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_0'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'1'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_1'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'2'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_2'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'3'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_3'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'4'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_4'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'5'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_5'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'6'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_6'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'7'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_7'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'8'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_8'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'9'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_9'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'10'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_10'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'11'#20449#21495#24378#24230
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'GpsDb_11'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #215'12'#20449#21495#24378#24230
          end>
      end
    end
  end
  object DataSc_SMT: TDataSource
    DataSet = UniQuery_SMT_GpsTcData
    Left = 480
    Top = 184
  end
  object UniQuery_SMT_GpsTcData: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from GpsSMT_TcData')
    Left = 544
    Top = 176
  end
end
