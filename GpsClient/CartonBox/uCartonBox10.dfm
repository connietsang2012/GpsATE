inherited frmCartonBox_10: TfrmCartonBox_10
  Left = 443
  Top = 284
  Caption = 'IMEI'#25171#21360#31243#24207'(10'#26465')'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlParent: TPanel
    Height = 628
    inherited grp2: TGroupBox
      inherited btnPrint: TSpeedButton
        Top = 17
        Height = 20
      end
    end
    inherited grp4: TGroupBox
      Height = 265
      inherited lbl13: TLabel
        Left = 7
        Top = 134
      end
      inherited lbl12: TLabel
        Left = 7
        Top = 60
      end
      object lbl2: TLabel [2]
        Left = 7
        Top = 24
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411':'
      end
      object lbl3: TLabel [3]
        Left = 295
        Top = 24
        Width = 61
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #39068#33394':'
      end
      object lbl4: TLabel [4]
        Left = 295
        Top = 61
        Width = 61
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37325#37327':'
      end
      object lbl1: TLabel [5]
        Left = 7
        Top = 97
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20854#20182#20449#24687':'
      end
      object lbl5: TLabel [6]
        Left = 295
        Top = 97
        Width = 61
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20854#20182#20449#24687':'
      end
      inherited lbl16: TLabel
        Left = 0
        Top = 165
      end
      inherited lbl17: TLabel
        Left = 255
        Top = 165
      end
      object EdtVersion: TEdit
        Left = 72
        Top = 19
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
      end
      object EdtColor: TEdit
        Left = 360
        Top = 19
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 3
      end
      object EdtQty: TEdit
        Left = 360
        Top = 52
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 7
        TabOrder = 0
      end
      object EdtOther1: TEdit
        Left = 72
        Top = 95
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
      end
      object EdtOther2: TEdit
        Left = 360
        Top = 92
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 4
      end
    end
  end
  inherited sp1: TUniStoredProc
    CommandStoredProcName = 'CheckTestedByImei'
    StoredProcIsQuery = True
  end
end
