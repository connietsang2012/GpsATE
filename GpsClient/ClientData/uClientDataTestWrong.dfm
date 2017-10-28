inherited frmClientTestWrong: TfrmClientTestWrong
  Caption = #27979#35797#38169#35823#25551#36848
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 40
        Top = 40
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22833#36133#20195#30721':'
      end
      object lbl2: TLabel
        Left = 40
        Top = 80
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22833#36133#25551#36848':'
      end
      object Edt_WrongName: TDBEdit
        Left = 128
        Top = 34
        Width = 121
        Height = 21
        DataField = 'WrongName'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_WrongDes: TDBEdit
        Left = 128
        Top = 76
        Width = 577
        Height = 21
        DataField = 'WrongDes'
        DataSource = DS_Module
        TabOrder = 1
      end
    end
  end
  inherited ActionList: TActionList
    inherited ac_Edit: TAction
      OnExecute = ac_EditExecute
    end
    inherited ac_Export: TAction
      OnExecute = ac_ExportExecute
    end
  end
end
