inherited frmCartonBoxLlf: TfrmCartonBoxLlf
  Left = 88
  Top = 175
  Width = 1448
  Height = 878
  Caption = #32769#26469#31119#24086#32440'(20)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  object shp1: TShape [0]
    Left = 440
    Top = 280
    Width = 65
    Height = 65
  end
  inherited pnlParent: TPanel
    Top = 15
    Width = 818
    Height = 538
    inherited grp2: TGroupBox
      inherited lbl10: TLabel
        Left = 269
      end
    end
    inherited grp4: TGroupBox
      Left = 8
      Width = 593
      Height = 227
      object lbl11: TLabel [2]
        Left = 4
        Top = 20
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #26426#22411':'
        ParentBiDiMode = False
      end
      object lbl14: TLabel [3]
        Left = 256
        Top = 20
        Width = 33
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #39068#33394':'
      end
      object lbl15: TLabel [4]
        Left = 256
        Top = 44
        Width = 33
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37325#37327':'
      end
      object lbl1: TLabel [5]
        Left = 137
        Top = 44
        Width = 6
        Height = 11
        Caption = '-'
      end
      object lbl2: TLabel [6]
        Left = 4
        Top = 68
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #21046#21333':'
        ParentBiDiMode = False
      end
      object lbl3: TLabel [7]
        Left = 256
        Top = 68
        Width = 33
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26085#26399':'
      end
      object lbl4: TLabel [8]
        Left = 4
        Top = 91
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #20135#21697#21495':'
        ParentBiDiMode = False
      end
      object lbl6: TLabel [9]
        Left = 256
        Top = 140
        Width = 33
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25968#37327':'
      end
      object lbl7: TLabel [10]
        Left = 4
        Top = 195
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #20844#21496#21517#31216':'
        ParentBiDiMode = False
      end
      inherited lbl16: TLabel
        Left = 0
        Top = 164
        Width = 53
      end
      inherited lbl17: TLabel
        Left = 216
        Top = 164
        Width = 17
      end
      inherited lbl18: TLabel
        Left = 4
        Top = 116
      end
      object EdtVersion: TEdit [16]
        Left = 61
        Top = 16
        Width = 178
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
      end
      object EdtColor: TEdit [17]
        Left = 296
        Top = 16
        Width = 186
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 3
      end
      object EdtQty: TEdit [18]
        Left = 296
        Top = 40
        Width = 186
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 20
        TabOrder = 4
      end
      object EdtBoxNum1: TEdit [19]
        Left = 149
        Top = 40
        Width = 89
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 10
        TabOrder = 5
      end
      object Edtzhidan: TEdit [20]
        Left = 61
        Top = 63
        Width = 178
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 6
      end
      object EdtDate: TEdit [21]
        Left = 296
        Top = 63
        Width = 186
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 7
      end
      object EdtProNo: TEdit [22]
        Left = 61
        Top = 87
        Width = 423
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 8
      end
      object EdtQty1: TEdit [23]
        Left = 296
        Top = 135
        Width = 186
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 9
      end
      object EdtCpName: TEdit [24]
        Left = 61
        Top = 190
        Width = 423
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 10
      end
      inherited Edt_IMEISTART: TEdit
        Left = 61
        Top = 159
        TabOrder = 11
      end
      inherited Edt_IMEIEND: TEdit
        Left = 245
        Top = 159
        TabOrder = 12
      end
      inherited EdtParamVersion: TEdit
        Left = 61
        Top = 112
        Width = 423
        TabOrder = 13
      end
    end
  end
  object StringGrid1: TStringGrid [2]
    Left = 688
    Top = 504
    Width = 136
    Height = 120
    ColCount = 11
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    Visible = False
    ColWidths = (
      64
      64
      64
      54
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24)
  end
  inherited UniQuery_IMEI: TUniQuery
    Connection = DMMain.UniConGpsTest
    object UniQuery_IMEIId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object UniQuery_IMEIBoxNo: TStringField
      FieldName = 'BoxNo'
      Required = True
      Size = 50
    end
    object UniQuery_IMEIIMEI: TStringField
      FieldName = 'IMEI'
      Required = True
      Size = 15
    end
    object UniQuery_IMEIZhiDan: TStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 100
    end
    object UniQuery_IMEISoftModel: TStringField
      FieldName = 'SoftModel'
      Required = True
    end
    object UniQuery_IMEIVersion: TStringField
      FieldName = 'Version'
      Required = True
      Size = 50
    end
    object UniQuery_IMEIProductCode: TStringField
      FieldName = 'ProductCode'
      Size = 100
    end
    object UniQuery_IMEIColor: TStringField
      FieldName = 'Color'
      Size = 50
    end
    object UniQuery_IMEIQty: TStringField
      FieldName = 'Qty'
      Size = 50
    end
    object UniQuery_IMEIWeight: TStringField
      FieldName = 'Weight'
      Size = 50
    end
    object UniQuery_IMEIDate: TStringField
      FieldName = 'Date'
      Size = 50
    end
    object UniQuery_IMEITACInfo: TStringField
      FieldName = 'TACInfo'
      Size = 200
    end
    object UniQuery_IMEICompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 200
    end
    object UniQuery_IMEITesterId: TStringField
      FieldName = 'TesterId'
      Required = True
    end
    object UniQuery_IMEITestTime: TDateTimeField
      FieldName = 'TestTime'
      Required = True
    end
    object UniQuery_IMEIRemark1: TStringField
      FieldName = 'Remark1'
      Size = 200
    end
    object UniQuery_IMEIRemark2: TStringField
      FieldName = 'Remark2'
      Size = 200
    end
    object UniQuery_IMEIRemark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object UniQuery_IMEIRemark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object UniQuery_IMEIRemark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
  end
  inherited UniQuery_IMEI_20: TUniQuery
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
  object unqry1: TUniQuery [10]
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  '
      'FROM Gps_User')
    Left = 768
    Top = 192
  end
  object ExcelApplication1: TExcelApplication [11]
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 456
    Top = 240
  end
  object ExcelWorksheet1: TExcelWorksheet [12]
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 456
    Top = 296
  end
  object ExcelWorkbook1: TExcelWorkbook [13]
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 528
    Top = 296
  end
end
