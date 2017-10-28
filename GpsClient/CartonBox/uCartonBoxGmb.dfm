inherited frmCartonBoxGmb: TfrmCartonBoxGmb
  Left = 338
  Top = 108
  Width = 862
  Height = 593
  Caption = #22269#22806#21345#36890#31665#24086
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited pnlParent: TPanel
    Height = 546
    inherited grp2: TGroupBox
      inherited lbl8: TLabel
        Left = 284
        Width = 296
      end
    end
    inherited grp4: TGroupBox
      Height = 195
      inherited lbl13: TLabel
        Top = 139
        Caption = 'TAC:'
      end
      inherited lbl12: TLabel
        Caption = 'BOX NO:'
      end
      object lbl2: TLabel [2]
        Left = 4
        Top = 20
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'S MARK:'
        ParentBiDiMode = False
      end
      object lbl4: TLabel [3]
        Left = 248
        Top = 20
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'PRODUCT:'
        ParentBiDiMode = False
      end
      object lbl14: TLabel [4]
        Left = 248
        Top = 44
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Color:'
      end
      object lbl1: TLabel [5]
        Left = 137
        Top = 44
        Width = 6
        Height = 11
        Caption = '-'
      end
      object lbl3: TLabel [6]
        Left = 4
        Top = 68
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Date:'
      end
      object lbl6: TLabel [7]
        Left = 248
        Top = 68
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'QTY:'
      end
      object lbl7: TLabel [8]
        Left = 248
        Top = 91
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'P Code:'
        ParentBiDiMode = False
      end
      object lbl15: TLabel [9]
        Left = 4
        Top = 91
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'G.W:'
      end
      object lbl11: TLabel [10]
        Left = 248
        Top = 115
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Type:'
        ParentBiDiMode = False
      end
      inherited lbl16: TLabel
        Left = 0
        Top = 164
        Caption = 'IMEIRang:'
      end
      inherited lbl17: TLabel
        Left = 216
        Top = 164
      end
      inherited lbl18: TLabel
        Left = 4
        Top = 116
        Caption = 'Version:'
      end
      inherited EdtTac: TEdit
        Width = 421
      end
      object EdtSMark: TEdit [16]
        Left = 61
        Top = 16
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
      end
      object EdtProduct: TEdit [17]
        Left = 305
        Top = 16
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 3
      end
      object EdtColor: TEdit [18]
        Left = 305
        Top = 40
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 4
      end
      object EdtBoxNum1: TEdit [19]
        Left = 149
        Top = 40
        Width = 89
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 10
        TabOrder = 5
      end
      object EdtDate: TEdit [20]
        Left = 61
        Top = 63
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 6
      end
      object EdtQty: TEdit [21]
        Left = 305
        Top = 63
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 7
      end
      object EdtPCode: TEdit [22]
        Left = 305
        Top = 87
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 8
      end
      object EdtGW: TEdit [23]
        Left = 61
        Top = 87
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 20
        TabOrder = 9
      end
      object EdtModel: TEdit [24]
        Left = 305
        Top = 111
        Width = 177
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 10
      end
      inherited Edt_IMEISTART: TEdit
        Left = 61
        Top = 159
        TabOrder = 11
      end
      inherited Edt_IMEIEND: TEdit
        Left = 253
        Top = 159
        TabOrder = 12
      end
      inherited EdtParamVersion: TEdit
        Left = 61
        Top = 112
        Width = 177
        TabOrder = 13
      end
    end
  end
  inherited UniQuery_IMEI: TUniQuery
    Connection = DMMain.UniConGpsTest
  end
end
