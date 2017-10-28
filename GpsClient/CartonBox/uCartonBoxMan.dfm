object frmCartonBoxMan: TfrmCartonBoxMan
  Left = 471
  Top = 296
  Width = 552
  Height = 429
  Caption = 'IMEI'#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 5
    Width = 532
    Height = 57
    Caption = #25968#25454#26597#35810
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 34
      Height = 13
      Caption = 'IMEI'#65306
    end
    object Edit1: TEdit
      Left = 56
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 208
      Top = 19
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 68
    Width = 532
    Height = 321
    Caption = #25968#25454#27983#35272
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 16
      Width = 520
      Height = 297
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      SortLocal = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'id'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #32034#24341
          Title.TitleButton = True
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'imei'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'IMEI'#21495#30721
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'xh'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31665#21495
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'addtime'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25195#25551#26102#38388
          Title.TitleButton = True
          Width = 190
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 24
    object V1: TMenuItem
      Caption = #21024#38500#36873#20013#25968#25454'(&V)'
      OnClick = V1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object V3: TMenuItem
      Caption = #21047#26032#25968#25454'(&Z)'
      OnClick = V3Click
    end
  end
end
