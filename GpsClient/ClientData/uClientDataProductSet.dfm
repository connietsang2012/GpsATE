inherited frmClientProductSet: TfrmClientProductSet
  Caption = #20135#21697#35268#26684
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 90
        Top = 21
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36719#20214#22411#21495':'
      end
      object lbl2: TLabel
        Left = 290
        Top = 21
        Width = 271
        Height = 13
        AutoSize = False
        Caption = '('#22914':GT02,GT06)'
      end
      object lbl3: TLabel
        Left = 90
        Top = 64
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36719#20214#29256#26412':'
      end
      object lbl4: TLabel
        Left = 90
        Top = 107
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22411#21495':'
      end
      object lbl5: TLabel
        Left = 290
        Top = 107
        Width = 367
        Height = 13
        AutoSize = False
        Caption = '('#21069#20004#20301#20195#34920#20135#21697#20449#21495','#21518#19968#20301'1'#20195#34920'A,2'#20195#34920'B,0'#20026#31354')'
      end
      object lbl6: TLabel
        Left = 290
        Top = 150
        Width = 271
        Height = 13
        AutoSize = False
        Caption = '('#22914':1205=12'#24180#31532'5'#21608')'
      end
      object lbl7: TLabel
        Left = 90
        Top = 150
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26085#26399':'
      end
      object lbl8: TLabel
        Left = 90
        Top = 193
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36215#22987#33539#22260':'
      end
      object lbl9: TLabel
        Left = 290
        Top = 193
        Width = 271
        Height = 13
        AutoSize = False
        Caption = '(Sn'#24320#22987#21495')'
      end
      object lbl10: TLabel
        Left = 290
        Top = 236
        Width = 271
        Height = 13
        AutoSize = False
        Caption = '(Sn'#32467#26463#21495')'
      end
      object lbl11: TLabel
        Left = 90
        Top = 236
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #32456#27490#33539#22260':'
      end
      object Edt_Model: TDBEdit
        Left = 158
        Top = 16
        Width = 121
        Height = 21
        DataField = 'Model'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_Version: TDBEdit
        Left = 158
        Top = 59
        Width = 121
        Height = 21
        DataField = 'Version'
        DataSource = DS_Module
        TabOrder = 1
      end
      object Edt_SnPro: TDBEdit
        Left = 158
        Top = 102
        Width = 121
        Height = 21
        DataField = 'SnPro'
        DataSource = DS_Module
        TabOrder = 2
      end
      object Edt_SnDate: TDBEdit
        Left = 158
        Top = 146
        Width = 121
        Height = 21
        DataField = 'SnDate'
        DataSource = DS_Module
        TabOrder = 3
      end
      object Edt_SnBegin: TDBEdit
        Left = 158
        Top = 189
        Width = 121
        Height = 21
        DataField = 'SnBegin'
        DataSource = DS_Module
        TabOrder = 4
      end
      object Edt_SnEnd: TDBEdit
        Left = 158
        Top = 232
        Width = 121
        Height = 21
        DataField = 'SnEnd'
        DataSource = DS_Module
        TabOrder = 5
      end
    end
  end
  inherited ActionList: TActionList
    inherited ac_Export: TAction
      OnExecute = ac_ExportExecute
    end
  end
end
