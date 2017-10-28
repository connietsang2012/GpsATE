inherited frmCartonBoxEls: TfrmCartonBoxEls
  Left = 507
  Top = 127
  Height = 635
  Caption = #20420#32599#26031#21345#36890#31665
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlParent: TPanel
    Height = 585
    inherited grp4: TGroupBox
      inherited lbl13: TLabel
        Top = 197
        Caption = 'TAC:'
      end
      inherited lbl12: TLabel
        Top = 53
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
        Caption = 'CON NO:'
        ParentBiDiMode = False
      end
      object lbl4: TLabel [3]
        Left = 285
        Top = 24
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'OrderNO:'
        ParentBiDiMode = False
      end
      object lbl16: TLabel [4]
        Left = 285
        Top = 53
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Consignee:'
        ParentBiDiMode = False
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
        Top = 82
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Destin:'
      end
      object lbl11: TLabel [7]
        Left = 285
        Top = 82
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'TYPE:'
        ParentBiDiMode = False
      end
      object lbl17: TLabel [8]
        Left = 285
        Top = 111
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'DATE:'
        ParentBiDiMode = False
      end
      object lbl14: TLabel [9]
        Left = 5
        Top = 111
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'COLOR:'
      end
      object lbl6: TLabel [10]
        Left = 5
        Top = 139
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'QUAN:'
      end
      object lbl15: TLabel [11]
        Left = 285
        Top = 140
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'G.W:'
      end
      object lbl18: TLabel [12]
        Left = 285
        Top = 169
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'MO NAME:'
      end
      object lbl5: TLabel [13]
        Left = 5
        Top = 168
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Version:'
        ParentBiDiMode = False
      end
      inherited EdtTac: TEdit
        Top = 191
        Width = 473
      end
      object EdtConNo: TEdit
        Left = 72
        Top = 19
        Width = 209
        Height = 21
        TabOrder = 2
      end
      object EdtOrderNo: TEdit
        Left = 360
        Top = 19
        Width = 185
        Height = 21
        MaxLength = 100
        TabOrder = 3
      end
      object EdtConsignee: TEdit
        Left = 360
        Top = 48
        Width = 185
        Height = 21
        MaxLength = 100
        TabOrder = 4
      end
      object EdtBoxNum1: TEdit
        Left = 176
        Top = 47
        Width = 105
        Height = 21
        MaxLength = 10
        TabOrder = 5
      end
      object EdtDestin: TEdit
        Left = 72
        Top = 77
        Width = 209
        Height = 21
        TabOrder = 6
      end
      object EdtModel: TEdit
        Left = 360
        Top = 77
        Width = 185
        Height = 21
        TabOrder = 7
      end
      object EdtDate: TEdit
        Left = 360
        Top = 106
        Width = 185
        Height = 21
        TabOrder = 8
      end
      object EdtColor: TEdit
        Left = 72
        Top = 106
        Width = 209
        Height = 21
        TabOrder = 9
      end
      object EdtQuan: TEdit
        Left = 72
        Top = 135
        Width = 209
        Height = 21
        TabOrder = 10
      end
      object EdtGW: TEdit
        Left = 360
        Top = 135
        Width = 185
        Height = 21
        MaxLength = 7
        TabOrder = 11
      end
      object EdtMoName: TEdit
        Left = 360
        Top = 164
        Width = 185
        Height = 21
        MaxLength = 100
        TabOrder = 12
      end
      object EdtVersion: TEdit
        Left = 72
        Top = 164
        Width = 209
        Height = 21
        MaxLength = 100
        TabOrder = 13
      end
    end
  end
end
