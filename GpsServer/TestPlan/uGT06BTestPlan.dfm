inherited frmGT06BTestPlan: TfrmGT06BTestPlan
  Left = 258
  Caption = 'GT06B'#27979#35797#39033#30446#37197#32622
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    inherited cbbParentName: TDBLookupComboboxEh
      DataField = 'TestPlanDesDes'
      DataSource = DMMain.DS_TestPlan
    end
  end
  inherited PageControl1: TPageControl
    ActivePage = nil
    TabIndex = -1
    inherited TabSheet1: TTabSheet
      TabVisible = False
    end
  end
end
