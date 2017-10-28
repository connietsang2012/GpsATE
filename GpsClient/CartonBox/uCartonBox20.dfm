inherited frmCartonBox_20: TfrmCartonBox_20
  Left = 369
  Top = 235
  Height = 528
  Caption = 'IMEI'#25171#21360#31243#24207'(20'#26465')'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlParent: TPanel
    Height = 481
    inherited grp4: TGroupBox
      Height = 126
      inherited lbl13: TLabel
        Left = 3
        Top = 93
        Width = 75
      end
      inherited lbl12: TLabel
        Left = 3
        Top = 59
        Width = 75
        Caption = #31665#21495#20449#24687':'
      end
      object lbl1: TLabel [2]
        Left = 3
        Top = 24
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29256#26412#20449#24687':'
      end
      object lbl2: TLabel [3]
        Left = 300
        Top = 24
        Width = 45
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #39068#33394':'
      end
      object lbl3: TLabel [4]
        Left = 300
        Top = 59
        Width = 45
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37325#37327':'
      end
      inherited EdtTac: TEdit
        Left = 79
        Top = 90
        Width = 490
      end
      inherited EdtBoxNum: TEdit
        Left = 79
        Top = 55
        Width = 220
        OnExit = EdtBoxNumExit
        OnKeyPress = EdtBoxNumKeyPress
      end
      object EdtVersion: TEdit
        Left = 79
        Top = 19
        Width = 220
        Height = 21
        TabOrder = 2
      end
      object EdtColor: TEdit
        Left = 349
        Top = 19
        Width = 220
        Height = 21
        TabOrder = 3
      end
      object EdtQty: TEdit
        Left = 349
        Top = 55
        Width = 220
        Height = 21
        MaxLength = 7
        TabOrder = 4
      end
    end
  end
end
