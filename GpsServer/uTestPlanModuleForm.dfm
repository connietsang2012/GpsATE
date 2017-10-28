object frmTestPlanModuleForm: TfrmTestPlanModuleForm
  Left = 56
  Top = 177
  Width = 979
  Height = 563
  Caption = #27979#35797#35745#21010#27169#26495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 11
  object SB_Module: TStatusBar
    Left = 0
    Top = 505
    Width = 971
    Height = 24
    Panels = <
      item
        Alignment = taRightJustify
        Text = #25968#25454#29366#24577
        Width = 100
      end
      item
        Width = 300
      end
      item
        Alignment = taRightJustify
        Text = #24403#21069#26102#38388
        Width = 80
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 54
      Top = 14
      Width = 69
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27979#35797#35745#21010#65306
    end
    object cbbParentName: TDBLookupComboboxEh
      Left = 124
      Top = 9
      Width = 170
      Height = 19
      EditButtons = <>
      TabOrder = 0
      Visible = True
      OnChange = cbbParentNameChange
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 971
    Height = 464
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #27983#35272
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 963
        Height = 438
        Align = alClient
        ColumnDefValues.Title.TitleButton = True
        ShowSerialNo = False
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
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
        Height = 147
        DataField = 'Id'
        KeyField = 'SubTestItemId'
        ListField = 'SubTestItemDes'
        ListFieldIndex = 1
        TabOrder = 0
      end
      object DBLDstList: TDBLookupListBox
        Left = 162
        Top = 20
        Width = 122
        Height = 147
        DataField = 'Id'
        KeyField = 'SubTestItemId'
        ListField = 'SubTestItemDes'
        ListFieldIndex = 1
        TabOrder = 1
      end
    end
  end
end
