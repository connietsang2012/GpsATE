object frmCartonBoxSet: TfrmCartonBoxSet
  Left = 518
  Top = 277
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
  TextHeight = 11
  object lbl1: TLabel
    Left = 14
    Top = 22
    Width = 67
    Height = 12
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = #25171#21360#26465#30721#25968#65306
    ParentBiDiMode = False
  end
  object lbl2: TLabel
    Left = 14
    Top = 54
    Width = 67
    Height = 11
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = #31867#22411#36873#25321#65306
    ParentBiDiMode = False
  end
  object cbbPrintCount: TComboBox
    Left = 86
    Top = 19
    Width = 186
    Height = 19
    Style = csDropDownList
    ItemHeight = 11
    ItemIndex = 1
    TabOrder = 0
    Text = '20'
    OnChange = cbbPrintCountChange
    Items.Strings = (
      '10'
      '20')
  end
  object cbbPrintType: TComboBox
    Left = 86
    Top = 52
    Width = 186
    Height = 19
    ItemHeight = 11
    TabOrder = 1
    Text = #40664#35748
    Items.Strings = (
      #40664#35748
      #20013#25991
      #33521#25991)
  end
  object btnOk: TButton
    Left = 63
    Top = 87
    Width = 64
    Height = 21
    Caption = #30830#35748'(&O)'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 185
    Top = 87
    Width = 64
    Height = 21
    Caption = #21462#28040'(&C)'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object rg1: TRadioGroup
    Left = 96
    Top = 96
    Width = 185
    Height = 105
    Caption = 'rg1'
    TabOrder = 4
    Visible = False
  end
end
