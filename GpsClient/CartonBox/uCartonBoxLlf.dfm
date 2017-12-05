inherited frmCartonBoxLlf: TfrmCartonBoxLlf
  Left = 184
  Top = 42
  Width = 1036
  Height = 780
  Caption = #22269#20869#24086#32440'(20)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape [0]
    Left = 520
    Top = 331
    Width = 77
    Height = 77
  end
  inherited pnlParent: TPanel
    Top = 18
    Width = 967
    Height = 636
    inherited grp2: TGroupBox
      inherited lbl10: TLabel
        Left = 318
      end
    end
    inherited grp3: TGroupBox
      inherited mmoMEI: TMemo
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20')
      end
    end
    inherited grp4: TGroupBox
      Left = 1
      Top = 355
      Width = 701
      Height = 331
      object lbl11: TLabel [2]
        Left = 5
        Top = 24
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #26426#22411':'
        ParentBiDiMode = False
      end
      object lbl14: TLabel [3]
        Left = 303
        Top = 24
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #39068#33394':'
      end
      object lbl15: TLabel [4]
        Left = 303
        Top = 52
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37325#37327':'
      end
      object lbl1: TLabel [5]
        Left = 162
        Top = 52
        Width = 3
        Height = 13
        Caption = '-'
      end
      object lbl2: TLabel [6]
        Left = 5
        Top = 80
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #21046#21333':'
        ParentBiDiMode = False
      end
      object lbl3: TLabel [7]
        Left = 303
        Top = 80
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26085#26399':'
      end
      object lbl4: TLabel [8]
        Left = 5
        Top = 108
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #20135#21697#21495':'
        ParentBiDiMode = False
      end
      object lbl6: TLabel [9]
        Left = 303
        Top = 165
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25968#37327':'
      end
      object lbl7: TLabel [10]
        Left = 5
        Top = 134
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #20844#21496#21517#31216':'
        ParentBiDiMode = False
      end
      inherited lbl16: TLabel
        Left = 0
        Top = 194
        Width = 63
      end
      inherited lbl17: TLabel
        Left = 255
        Top = 194
        Width = 20
      end
      inherited lbl18: TLabel
        Left = 5
        Top = 233
      end
      object EdtVersion: TEdit [16]
        Left = 72
        Top = 19
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 2
      end
      object EdtColor: TEdit [17]
        Left = 350
        Top = 19
        Width = 220
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 3
      end
      object EdtQty: TEdit [18]
        Left = 350
        Top = 47
        Width = 220
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 20
        TabOrder = 4
      end
      object EdtBoxNum1: TEdit [19]
        Left = 176
        Top = 47
        Width = 105
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 10
        TabOrder = 5
      end
      object Edtzhidan: TEdit [20]
        Left = 72
        Top = 74
        Width = 210
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 6
      end
      object EdtDate: TEdit [21]
        Left = 350
        Top = 74
        Width = 220
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 7
      end
      object EdtProNo: TEdit [22]
        Left = 72
        Top = 103
        Width = 500
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 8
      end
      object EdtQty1: TEdit [23]
        Left = 350
        Top = 160
        Width = 220
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 9
      end
      object EdtCpName: TEdit [24]
        Left = 72
        Top = 225
        Width = 500
        Height = 21
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 100
        TabOrder = 10
      end
      inherited Edt_IMEISTART: TEdit
        Left = 72
        Top = 188
        TabOrder = 11
      end
      inherited Edt_IMEIEND: TEdit
        Left = 290
        Top = 188
        TabOrder = 12
      end
      inherited EdtParamVersion: TEdit
        Left = 72
        Top = 132
        Width = 500
        TabOrder = 13
      end
    end
  end
  object StringGrid1: TStringGrid [2]
    Left = 749
    Top = 252
    Width = 161
    Height = 141
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
  inherited sp1: TUniStoredProc
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Size = 2038695129
        Value = 0
      end
      item
        DataType = ftString
        Name = 'cIMEI'
        ParamType = ptInput
        Size = 15
      end
      item
        DataType = ftInteger
        Name = 'iRecordCount'
        ParamType = ptInputOutput
        Value = 1
      end>
    CommandStoredProcName = 'CheckTestedByImei'
    StoredProcIsQuery = True
  end
  inherited UniQuery_FindRidByImei: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT SN as Rid'
      'FROM Gps_TestResult '
      '  where IMEI=:IMEI')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
end
