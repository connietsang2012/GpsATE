object frmMessagebox: TfrmMessagebox
  Left = 354
  Top = 306
  Width = 342
  Height = 222
  Caption = 'frmMessagebox'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 32
    Top = 40
    Width = 289
    Height = 41
    AutoSize = False
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPass: TBitBtn
    Left = 63
    Top = 128
    Width = 75
    Height = 25
    Caption = #36890#36807'(&P)'
    ModalResult = 6
    TabOrder = 0
    OnClick = btnPassClick
  end
  object btnFail: TBitBtn
    Left = 192
    Top = 128
    Width = 75
    Height = 25
    Caption = #22833#36133'(&F)'
    ModalResult = 7
    TabOrder = 1
    OnClick = btnFailClick
  end
end
