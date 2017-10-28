inherited frmTestPlan: TfrmTestPlan
  Left = 255
  Top = 128
  Caption = #27979#35797#35745#21010
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
            Width = 80
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TestPlanName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#35745#21010#21517#31216
            Width = 200
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TestPlanDes'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#35745#21010#25551#36848
            Width = 200
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 34
        Top = 37
        Width = 84
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#35745#21010#21517#31216#65306
      end
      object lbl2: TLabel
        Left = 34
        Top = 85
        Width = 84
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#35745#21010#25551#36848#65306
      end
      object Edt_TestPlanName: TDBEdit
        Left = 122
        Top = 34
        Width = 102
        Height = 19
        DataField = 'TestPlanName'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_TestPlanDes: TDBEdit
        Left = 122
        Top = 81
        Width = 102
        Height = 19
        DataField = 'TestPlanDes'
        DataSource = DS_Module
        TabOrder = 1
      end
    end
  end
end
