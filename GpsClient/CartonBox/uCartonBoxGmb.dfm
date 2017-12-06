inherited frmCartonBoxGmb: TfrmCartonBoxGmb
  Left = 338
  Top = 108
  Width = 862
  Height = 631
  Caption = #22269#22806#21345#36890#31665#24086
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlParent: TPanel
    Height = 647
    inherited grp2: TGroupBox
      inherited lbl8: TLabel
        Left = 336
        Width = 349
      end
    end
    inherited grp4: TGroupBox
      Height = 294
      inherited lbl13: TLabel
        Top = 164
        Caption = 'TAC:'
      end
      inherited lbl12: TLabel
        Caption = 'BOX NO:'
      end
      object lbl2: TLabel [2]
        Left = 5
        Top = 24
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'S MARK:'
        ParentBiDiMode = False
      end
      object lbl4: TLabel [3]
        Left = 293
        Top = 24
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'PRODUCT:'
        ParentBiDiMode = False
      end
      object lbl14: TLabel [4]
        Left = 293
        Top = 52
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Color:'
      end
      object lbl1: TLabel [5]
        Left = 162
        Top = 52
        Width = 3
        Height = 13
        Caption = '-'
      end
      object lbl3: TLabel [6]
        Left = 5
        Top = 80
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Date:'
      end
      object lbl6: TLabel [7]
        Left = 293
        Top = 80
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'QTY:'
      end
      object lbl7: TLabel [8]
        Left = 293
        Top = 108
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'P Code:'
        ParentBiDiMode = False
      end
      object lbl15: TLabel [9]
        Left = 5
        Top = 108
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'G.W:'
      end
      object lbl11: TLabel [10]
        Left = 293
        Top = 136
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Type:'
        ParentBiDiMode = False
      end
      inherited lbl16: TLabel
        Left = 0
        Top = 194
        Caption = 'IMEIRang:'
      end
      inherited lbl17: TLabel
        Left = 255
        Top = 194
      end
      inherited lbl18: TLabel
        Left = 5
        Top = 137
        Caption = 'Version:'
      end
      inherited EdtTac: TEdit
        Width = 498
      end
      object EdtSMark: TEdit [16]
        Left = 72
        Top = 19
        Width = 209
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
      end
      object EdtProduct: TEdit [17]
        Left = 360
        Top = 19
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 3
      end
      object EdtColor: TEdit [18]
        Left = 360
        Top = 47
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 13
      end
      object EdtBoxNum1: TEdit [19]
        Left = 176
        Top = 47
        Width = 105
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 10
        TabOrder = 5
      end
      object EdtDate: TEdit [20]
        Left = 72
        Top = 74
        Width = 209
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 6
      end
      object EdtQty: TEdit [21]
        Left = 360
        Top = 74
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 7
      end
      object EdtPCode: TEdit [22]
        Left = 360
        Top = 103
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 8
      end
      object EdtGW: TEdit [23]
        Left = 72
        Top = 103
        Width = 209
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 20
        TabOrder = 9
      end
      object EdtModel: TEdit [24]
        Left = 360
        Top = 131
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 10
      end
      inherited Edt_IMEISTART: TEdit
        Left = 72
        Top = 188
        TabOrder = 11
      end
      inherited Edt_IMEIEND: TEdit
        Left = 299
        Top = 188
        TabOrder = 12
      end
    end
  end
  inherited UniQuery_IMEI: TUniQuery
    Connection = DMMain.UniConGpsTest
  end
  inherited sp1: TUniStoredProc
    CommandStoredProcName = 'CheckTestedByImei'
    StoredProcIsQuery = True
  end
end
