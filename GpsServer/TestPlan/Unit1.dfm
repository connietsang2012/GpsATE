inherited frmGT06BTestPlan: TfrmGT06BTestPlan
  Left = 328
  Top = 269
  Caption = 'frmGT06BTestPlan'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited estRuslt1: TDBGridEh
        OnDblClick = nil
      end
    end
  end
  inherited MTE_TestPlan: TMemTableEh
    inherited MemTableData: TMemTableDataEh
      inherited RecordsList: TRecordsListEh
        Data = (
          (
            1
            'FuncTest'
            #21151#33021#27979#35797#20301)
          (
            2
            'GpsTc'
            'Gps'#36879#20256))
      end
    end
  end
  inherited MTE_Module: TMemTableEh
    DataDriver = DMMain.DSD_UserType
  end
end
