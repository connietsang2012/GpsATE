inherited frmClientTestPlan: TfrmClientTestPlan
  Left = 345
  Top = 272
  Caption = #27979#35797#39033#30446
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 40
        Top = 44
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#35745#21010#21517#31216#65306
      end
      object lbl2: TLabel
        Left = 40
        Top = 100
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#35745#21010#25551#36848#65306
      end
      object Edt_TestPlanName: TDBEdit
        Left = 144
        Top = 40
        Width = 121
        Height = 21
        DataField = 'TestPlanName'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_TestPlanDes: TDBEdit
        Left = 144
        Top = 96
        Width = 121
        Height = 21
        DataField = 'TestPlanDes'
        DataSource = DS_Module
        TabOrder = 1
      end
    end
  end
  inherited ActionList: TActionList
    inherited ac_Export: TAction
      OnExecute = ac_ExportExecute
    end
  end
end
