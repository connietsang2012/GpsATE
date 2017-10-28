inherited frmAutoTestItemPlan: TfrmAutoTestItemPlan
  Left = 351
  Top = 153
  Caption = #33258#21160#27979#35797#39033#30446#35745#21010
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    inherited lbl1: TLabel
      Caption = #26426#22411#65306
    end
    inherited cbbParentName: TDBLookupComboboxEh
      Left = 531
      DataField = ''
      DataSource = nil
      Visible = False
    end
    object cbbModel: TDBLookupComboboxEh
      Left = 147
      Top = 14
      Width = 110
      Height = 21
      DataField = 'ModelDes'
      DataSource = DMMain.DS_AutoTestModel
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
  end
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 0
  end
  object DS_AutoTestModel: TDataSource
    DataSet = MTE_AutoTestModel
    Left = 536
    Top = 88
  end
  object MTE_AutoTestModel: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Model'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 640
    Top = 96
    object MTE_AutoTestModelId: TAutoIncField
      FieldName = 'Id'
    end
    object MTE_AutoTestModelModel: TStringField
      FieldName = 'Model'
    end
    object MTE_AutoTestModelModelDes: TStringField
      FieldKind = fkLookup
      FieldName = 'ModelDes'
      LookupDataSet = DMMain.QR_AutoTestModel
      LookupKeyFields = 'Id'
      LookupResultField = 'Model'
      KeyFields = 'Model'
      Lookup = True
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object Id: TMTNumericDataFieldEh
          FieldName = 'Id'
          NumericDataType = fdtAutoIncEh
          Alignment = taRightJustify
          DisplayLabel = 'Id'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object Model: TMTStringDataFieldEh
          FieldName = 'Model'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'Model'
          DisplayWidth = 20
          Required = False
          Visible = True
          Size = 20
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            1
            'GT06'))
      end
    end
  end
end
