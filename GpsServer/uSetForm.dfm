inherited frmSet: TfrmSet
  Left = 238
  Top = 185
  Caption = #20135#21697#35268#26684#35774#32622
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Enabled = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32034#24341
            Width = 50
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Model'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26426#22411
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Version'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29256#26412
            Width = 200
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SnPro'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20135#21697#22411#21495
            Width = 60
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SnDate'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26085#26399
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SnBegin'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'Sn'#24320#22987#21495
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SnEnd'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'Sn'#32467#26463#21495
            Width = 100
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 76
        Top = 18
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36719#20214#22411#21495':'
      end
      object lbl2: TLabel
        Left = 245
        Top = 18
        Width = 230
        Height = 11
        AutoSize = False
        Caption = '('#22914':GT02,GT06)'
      end
      object lbl3: TLabel
        Left = 76
        Top = 54
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36719#20214#29256#26412':'
      end
      object lbl4: TLabel
        Left = 76
        Top = 91
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22411#21495':'
      end
      object lbl5: TLabel
        Left = 245
        Top = 91
        Width = 311
        Height = 11
        AutoSize = False
        Caption = '('#21069#20004#20301#20195#34920#20135#21697#20449#21495','#21518#19968#20301'1'#20195#34920'A,2'#20195#34920'B,0'#20026#31354')'
      end
      object lbl6: TLabel
        Left = 245
        Top = 127
        Width = 230
        Height = 11
        AutoSize = False
        Caption = '('#22914':1205=12'#24180#31532'5'#21608')'
      end
      object lbl7: TLabel
        Left = 76
        Top = 127
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26085#26399':'
      end
      object lbl8: TLabel
        Left = 76
        Top = 163
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36215#22987#33539#22260':'
      end
      object lbl9: TLabel
        Left = 245
        Top = 163
        Width = 230
        Height = 11
        AutoSize = False
        Caption = '(Sn'#24320#22987#21495')'
      end
      object lbl10: TLabel
        Left = 245
        Top = 200
        Width = 230
        Height = 11
        AutoSize = False
        Caption = '(Sn'#32467#26463#21495')'
      end
      object lbl11: TLabel
        Left = 76
        Top = 200
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #32456#27490#33539#22260':'
      end
      object Edt_Model: TDBEdit
        Left = 134
        Top = 14
        Width = 102
        Height = 19
        DataField = 'Model'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_Version: TDBEdit
        Left = 134
        Top = 50
        Width = 102
        Height = 19
        DataField = 'Version'
        DataSource = DS_Module
        TabOrder = 1
      end
      object Edt_SnPro: TDBEdit
        Left = 134
        Top = 86
        Width = 102
        Height = 19
        DataField = 'SnPro'
        DataSource = DS_Module
        TabOrder = 2
      end
      object Edt_SnDate: TDBEdit
        Left = 134
        Top = 124
        Width = 102
        Height = 19
        DataField = 'SnDate'
        DataSource = DS_Module
        TabOrder = 3
      end
      object Edt_SnBegin: TDBEdit
        Left = 134
        Top = 160
        Width = 102
        Height = 19
        DataField = 'SnBegin'
        DataSource = DS_Module
        TabOrder = 4
      end
      object Edt_SnEnd: TDBEdit
        Left = 134
        Top = 196
        Width = 102
        Height = 19
        DataField = 'SnEnd'
        DataSource = DS_Module
        TabOrder = 5
      end
    end
  end
  inherited DS_Module: TDataSource
    Left = 760
    Top = 24
  end
end
