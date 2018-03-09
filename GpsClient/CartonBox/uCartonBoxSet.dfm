object frmCartonBoxSet: TfrmCartonBoxSet
  Left = 357
  Top = 245
  Width = 361
  Height = 178
  Caption = #25171#21360#21442#25968#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 17
    Top = 26
    Width = 79
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = #25171#21360#26465#30721#25968#65306
    ParentBiDiMode = False
  end
  object lbl2: TLabel
    Left = 17
    Top = 64
    Width = 79
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = #31867#22411#36873#25321#65306
    ParentBiDiMode = False
  end
  object cbbPrintCount: TComboBox
    Left = 102
    Top = 22
    Width = 219
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbbPrintCountChange
    Items.Strings = (
      '20'
      '40'
      '60')
  end
  object cbbPrintType: TComboBox
    Left = 102
    Top = 61
    Width = 219
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = #40664#35748
    Items.Strings = (
      #20013#25991
      #33521#25991)
  end
  object btnOk: TButton
    Left = 74
    Top = 103
    Width = 76
    Height = 25
    Caption = #30830#35748'(&O)'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 219
    Top = 103
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object rg1: TRadioGroup
    Left = 113
    Top = 113
    Width = 219
    Height = 125
    Caption = 'rg1'
    TabOrder = 4
    Visible = False
  end
end
