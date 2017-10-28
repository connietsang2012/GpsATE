inherited frmSubTestItem: TfrmSubTestItem
  Left = 258
  Top = 120
  Caption = #23376#27979#35797#39033#31649#29702
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
            FieldName = 'ParentName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #38582#23646#27979#35797#24037#20301
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SubTestItemName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23376#27979#35797#39033#21517#31216
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SubTestItemDes'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23376#27979#35797#39033#25551#36848
            Width = 180
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880
            Width = 200
          end
          item
            EditButtons = <>
            FieldName = 'ParentId'
            Footers = <>
            Visible = False
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl6: TLabel
        Left = 25
        Top = 31
        Width = 86
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #38582#23646#27979#35797#24037#20301':'
      end
      object lbl7: TLabel
        Left = 18
        Top = 74
        Width = 93
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23376#27979#35797#39033#21517#31216':'
      end
      object lbl1: TLabel
        Left = 52
        Top = 162
        Width = 59
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880':'
      end
      object lbl2: TLabel
        Left = 18
        Top = 118
        Width = 93
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23376#27979#35797#39033#25551#36848':'
      end
      object Edt_UserDes: TDBEdit
        Left = 118
        Top = 71
        Width = 169
        Height = 19
        DataField = 'SubTestItemName'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
      end
      object cbbParentName: TDBLookupComboboxEh
        Left = 118
        Top = 28
        Width = 169
        Height = 19
        DataField = 'ParentName'
        DataSource = DS_Module
        EditButtons = <>
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
        Visible = True
      end
      object Edt_ReturnText1: TDBEdit
        Left = 118
        Top = 158
        Width = 169
        Height = 19
        DataField = 'Remark'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
      end
      object Edt_SubTestItemName: TDBEdit
        Left = 118
        Top = 115
        Width = 169
        Height = 19
        DataField = 'SubTestItemDes'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 3
      end
    end
  end
end
