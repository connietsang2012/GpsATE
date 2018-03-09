inherited frmCartonBoxLlf: TfrmCartonBoxLlf
  Left = 93
  Top = 107
  Width = 1036
  Height = 703
  Caption = #22269#20869#24086#32440
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape [0]
    Left = 520
    Top = 331
    Width = 77
    Height = 87
  end
  object Label2: TLabel [1]
    Left = 13
    Top = 630
    Width = 60
    Height = 23
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = #20844#21496#21517#31216':'
    ParentBiDiMode = False
  end
  inherited pnlParent: TPanel
    Left = 0
    Top = 41
    Width = 1028
    Height = 628
    Align = alClient
    object Label1: TLabel [0]
      Left = 746
      Top = 354
      Width = 31
      Height = 17
      AutoSize = False
      Caption = #31665#21495':'
    end
    inherited grp1: TGroupBox
      Left = 22
      Top = 104
      Width = 899
      Height = 113
      object lbl_IMEI: TLabel [0]
        Left = 352
        Top = 16
        Width = 80
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'IMEI:'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [1]
        Left = 8
        Top = 17
        Width = 80
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SIM:'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel [2]
        Left = 8
        Top = 57
        Width = 80
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'PSIM:'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel [3]
        Left = 352
        Top = 56
        Width = 80
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'PIMEI:'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inherited EdtMEI: TEdit
        Tag = 1
        Left = 436
        Width = 245
        Height = 32
        Font.Color = clGray
        Font.Height = -27
        TabOrder = 1
      end
      object edt_SIM: TEdit
        Left = 92
        Top = 18
        Width = 245
        Height = 32
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -27
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 13
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edt_SIMKeyPress
      end
      object edt_preSim: TEdit
        Left = 92
        Top = 58
        Width = 245
        Height = 32
        AutoSize = False
        Color = clScrollBar
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -27
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 13
        ParentFont = False
        TabOrder = 2
        OnKeyPress = edt_SIMKeyPress
      end
      object edt_preIMEI: TEdit
        Tag = 1
        Left = 436
        Top = 57
        Width = 245
        Height = 32
        AutoSize = False
        Color = clScrollBar
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -27
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 15
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EdtMEIKeyPress
      end
    end
    inherited grp2: TGroupBox
      Left = 22
      Top = 8
      Height = 89
      inherited lbl10: TLabel
        Left = 318
      end
      inherited lbl8: TLabel
        Left = 15
        Top = 47
        Width = 690
      end
      object edt_IMEI1: TDBEdit
        Left = 536
        Top = 16
        Width = 121
        Height = 21
        DataField = 'IMEI1'
        DataSource = ds_SIM
        TabOrder = 2
      end
    end
    inherited grp3: TGroupBox
      Left = 22
      Top = 224
      Height = 185
      inherited mmoMEI: TMemo
        Height = 168
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
      Left = 22
      Top = 416
      Width = 882
      Height = 233
      Caption = #20449#24687#21306
      inherited lbl13: TLabel
        Left = 637
        Top = 261
      end
      inherited lbl12: TLabel
        Top = 54
      end
      object lbl11: TLabel [2]
        Left = 5
        Top = 21
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #26426#22411':'
        ParentBiDiMode = False
      end
      object lbl14: TLabel [3]
        Left = 599
        Top = 21
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #39068#33394':'
      end
      object lbl15: TLabel [4]
        Left = 599
        Top = 55
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
        Left = 285
        Top = 24
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #21046#21333':'
        ParentBiDiMode = False
      end
      object lbl3: TLabel [7]
        Left = 599
        Top = 88
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26085#26399':'
      end
      object lbl4: TLabel [8]
        Left = 285
        Top = 60
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #20135#21697#21495':'
        ParentBiDiMode = False
      end
      object lbl6: TLabel [9]
        Left = 599
        Top = 121
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25968#37327':'
      end
      object lbl7: TLabel [10]
        Left = 5
        Top = 188
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
        Top = 155
        Width = 63
      end
      inherited lbl17: TLabel
        Left = 255
        Top = 154
        Width = 20
        Caption = '__'
      end
      inherited lbl18: TLabel
        Left = 5
        Top = 121
      end
      object Label3: TLabel
        Left = 578
        Top = 155
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #22791#27880':'
        ParentBiDiMode = False
      end
      object Label5: TLabel
        Left = 0
        Top = 88
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'SIM'#21495#27573':'
        ParentBiDiMode = False
      end
      object Label6: TLabel
        Left = 253
        Top = 83
        Width = 20
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '---'
        ParentBiDiMode = False
      end
      object EdtSoftModel: TDBEdit
        Left = 72
        Top = 16
        Width = 209
        Height = 21
        DataField = 'SoftModel'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 0
      end
      object EdtColor: TDBEdit
        Left = 648
        Top = 16
        Width = 210
        Height = 21
        DataField = 'Color'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 1
      end
      object EdtBoxNum: TDBEdit
        Left = 72
        Top = 49
        Width = 81
        Height = 21
        DataField = 'BoxNo1'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 2
      end
      object EdtBoxNum1: TDBEdit
        Left = 168
        Top = 49
        Width = 113
        Height = 21
        DataField = 'BoxNo2'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 3
      end
      object EdtWeight: TDBEdit
        Left = 648
        Top = 49
        Width = 210
        Height = 21
        DataField = 'Weight'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 4
      end
      object Edtzhidan: TDBEdit
        Left = 352
        Top = 16
        Width = 217
        Height = 21
        DataField = 'ZhiDan'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 5
      end
      object EdtDate: TDBEdit
        Left = 648
        Top = 83
        Width = 210
        Height = 21
        DataField = 'ProductDate'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 6
      end
      object EdtProNo: TDBEdit
        Left = 352
        Top = 49
        Width = 217
        Height = 21
        DataField = 'ProductNo'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 7
      end
      object EdtVersion: TDBEdit
        Left = 72
        Top = 116
        Width = 497
        Height = 21
        DataField = 'Version'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 8
      end
      object EdtTac: TDBEdit
        Left = 704
        Top = 256
        Width = 217
        Height = 21
        DataField = 'TACInfo'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 9
      end
      object EdtQty: TDBEdit
        Left = 648
        Top = 117
        Width = 210
        Height = 21
        DataField = 'Qty'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 10
      end
      object Edt_IMEISTART: TDBEdit
        Left = 72
        Top = 150
        Width = 185
        Height = 21
        DataField = 'IMEIStart'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 11
      end
      object Edt_IMEIEND: TDBEdit
        Left = 280
        Top = 150
        Width = 185
        Height = 21
        DataField = 'IMEIEnd'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 12
      end
      object EdtCpName: TDBEdit
        Left = 72
        Top = 183
        Width = 497
        Height = 21
        DataField = 'CompanyName'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 13
      end
      object edt_Remark1: TDBEdit
        Left = 648
        Top = 150
        Width = 210
        Height = 21
        DataField = 'Remark1'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 14
      end
      object Edt_SIMSTART: TDBEdit
        Left = 72
        Top = 83
        Width = 185
        Height = 21
        DataField = 'SIMStart'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 15
      end
      object Edt_SIMEND: TDBEdit
        Left = 280
        Top = 83
        Width = 161
        Height = 21
        DataField = 'SIMEnd'
        DataSource = DS_ManuOrderParam
        Enabled = False
        TabOrder = 16
      end
    end
    inherited GrpTestPass: TGroupBox
      Left = 756
      Top = 216
      Height = 129
    end
    inherited chkMustParamterDownload: TCheckBox
      Left = 739
      Top = 8
    end
    inherited medtParamterDownload: TMaskEdit
      Left = 739
      Top = 32
    end
    inherited btnParamterDownload: TBitBtn
      Top = 56
    end
    object edt_RePrint: TEdit
      Left = 777
      Top = 350
      Width = 113
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object btn_RePrint: TButton
      Left = 744
      Top = 376
      Width = 161
      Height = 25
      Caption = #37325#25171
      TabOrder = 9
      OnClick = btn_RePrintClick
    end
    object ch_CheckInfo: TCheckBox
      Left = 752
      Top = 80
      Width = 97
      Height = 17
      Caption = #26816#26597#20449#24687
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  object StringGrid1: TStringGrid [3]
    Left = 917
    Top = -12
    Width = 161
    Height = 151
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
  object Panel1: TPanel [4]
    Left = 0
    Top = 0
    Width = 1028
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label7: TLabel
      Left = 24
      Top = 12
      Width = 81
      Height = 23
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21046#21333#21495':'
    end
    object lblrel: TLabel
      Left = 328
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #32465#23450#20851#31995':'
    end
    object cbManuOrder: TComboBox
      Left = 112
      Top = 8
      Width = 201
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = #26080
      OnChange = cbManuOrderChange
      Items.Strings = (
        #26080
        'IMEI'#19982'SIM'#21345#32465#23450)
    end
    object cbb_Rel: TDBLookupComboBox
      Left = 392
      Top = 8
      Width = 145
      Height = 21
      DataField = 'IMEIRelDesc'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 1
    end
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
      '  where IMEI=:IMEI and WriteImeiResult=1')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
  object UniQuery_RePrint: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT BoxNo'
      '      ,IMEI'
      '      ,ZhiDan'
      '      ,SoftModel'
      '      ,Version'
      '      ,ProductCode'
      '      ,Color'
      '      ,Qty'
      '      ,Weight'
      '      ,Date'
      '      ,TACInfo'
      '      ,CompanyName'
      '      ,TesterId'
      '      ,TestTime'
      '      ,Remark1'
      '      ,Remark2'
      '      ,Remark3'
      '      ,Remark4'
      '      ,Remark5'
      '      ,_MASK_FROM_V2'
      '  FROM Gps_CartonBoxTwenty_Result'
      '  where BoxNo=:BoxNo and ZhiDan=:ZhiDan'
      'order by id')
    Left = 736
    Top = 624
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BoxNo'
      end
      item
        DataType = ftUnknown
        Name = 'ZhiDan'
      end>
    object UniQuery_RePrintBoxNo: TStringField
      FieldName = 'BoxNo'
      Required = True
      Size = 50
    end
    object UniQuery_RePrintIMEI: TStringField
      FieldName = 'IMEI'
      Required = True
      Size = 15
    end
    object UniQuery_RePrintZhiDan: TStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 100
    end
    object UniQuery_RePrintSoftModel: TStringField
      FieldName = 'SoftModel'
      Required = True
    end
    object UniQuery_RePrintVersion: TStringField
      FieldName = 'Version'
      Required = True
      Size = 50
    end
    object UniQuery_RePrintProductCode: TStringField
      FieldName = 'ProductCode'
      Size = 100
    end
    object UniQuery_RePrintColor: TStringField
      FieldName = 'Color'
      Size = 50
    end
    object UniQuery_RePrintQty: TStringField
      FieldName = 'Qty'
      Size = 50
    end
    object UniQuery_RePrintWeight: TStringField
      FieldName = 'Weight'
      Size = 50
    end
    object UniQuery_RePrintDate: TStringField
      FieldName = 'Date'
      Size = 50
    end
    object UniQuery_RePrintTACInfo: TStringField
      FieldName = 'TACInfo'
      Size = 200
    end
    object UniQuery_RePrintCompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 200
    end
    object UniQuery_RePrintTesterId: TStringField
      FieldName = 'TesterId'
      Required = True
    end
    object UniQuery_RePrintTestTime: TDateTimeField
      FieldName = 'TestTime'
      Required = True
    end
    object UniQuery_RePrintRemark1: TStringField
      FieldName = 'Remark1'
      Size = 200
    end
    object UniQuery_RePrintRemark2: TStringField
      FieldName = 'Remark2'
      Size = 200
    end
    object UniQuery_RePrintRemark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object UniQuery_RePrintRemark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object UniQuery_RePrintRemark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
    object UniQuery_RePrint_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object UniQuery_ManuOrder: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT ZhiDan      '
      '  FROM Gps_ManuOrderParam'
      '  WHERE status=1')
    Left = 672
    Top = 8
    object UniQuery_ManuOrderZhiDan: TStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 50
    end
  end
  object UniQuery_ManuOrderParam: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *'
      '  FROM Gps_ManuOrderParam'
      'WHERE ZhiDan=:ZhiDan')
    Left = 712
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ZhiDan'
      end>
    object UniQuery_ManuOrderParamZhiDan: TStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamSoftModel: TStringField
      FieldName = 'SoftModel'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamBoxNo1: TStringField
      FieldName = 'BoxNo1'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamBoxNo2: TStringField
      FieldName = 'BoxNo2'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamProductDate: TStringField
      FieldName = 'ProductDate'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamColor: TStringField
      FieldName = 'Color'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamWeight: TStringField
      FieldName = 'Weight'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamQty: TStringField
      FieldName = 'Qty'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamProductNo: TStringField
      FieldName = 'ProductNo'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamVersion: TStringField
      FieldName = 'Version'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamIMEIStart: TStringField
      FieldName = 'IMEIStart'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamIMEIEnd: TStringField
      FieldName = 'IMEIEnd'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamTACInfo: TStringField
      FieldName = 'TACInfo'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamCompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 50
    end
    object UniQuery_ManuOrderParamRemark1: TStringField
      FieldName = 'Remark1'
      Size = 50
    end
    object UniQuery_ManuOrderParamRemark2: TStringField
      FieldName = 'Remark2'
      Size = 50
    end
    object UniQuery_ManuOrderParamRemark3: TStringField
      FieldName = 'Remark3'
      Size = 50
    end
    object UniQuery_ManuOrderParamRemark4: TStringField
      FieldName = 'Remark4'
      Size = 50
    end
    object UniQuery_ManuOrderParamRemark5: TStringField
      FieldName = 'Remark5'
      Size = 50
    end
    object UniQuery_ManuOrderParamIMEIRelDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'IMEIRelDesc'
      LookupDataSet = UniQuery_IMEIRel
      LookupKeyFields = 'IMEIRelNo'
      LookupResultField = 'IMEIRelDes'
      KeyFields = 'IMEIRel'
      Lookup = True
    end
    object UniQuery_ManuOrderParamIMEIRel: TIntegerField
      FieldName = 'IMEIRel'
      Required = True
    end
    object UniQuery_ManuOrderParamSIMStart: TStringField
      FieldName = 'SIMStart'
      Size = 50
    end
    object UniQuery_ManuOrderParamSIMEnd: TStringField
      FieldName = 'SIMEnd'
      Size = 50
    end
  end
  object UniQuery_IMEIRel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_IMEIRel')
    Left = 760
    Top = 8
    object UniQuery_IMEIRelRelId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'RelId'
      ReadOnly = True
      Required = True
    end
    object UniQuery_IMEIRelIMEIRelNo: TStringField
      FieldName = 'IMEIRelNo'
      Required = True
    end
    object UniQuery_IMEIRelIMEIRelDes: TStringField
      FieldName = 'IMEIRelDes'
      Required = True
    end
    object UniQuery_IMEIRel_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object DS_ManuOrderParam: TDataSource
    DataSet = UniQuery_ManuOrderParam
    Left = 712
    Top = 48
  end
  object UniQuery_UpdateBoxNo: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'UPDATE Gps_ManuOrderParam'
      'SET BoxNo2=:BoxNo2'
      'WHERE ZhiDan=:ZhiDan')
    Left = 792
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BoxNo2'
      end
      item
        DataType = ftUnknown
        Name = 'ZhiDan'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'RelId'
      ReadOnly = True
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'IMEIRelNo'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'IMEIRelDes'
      Required = True
    end
    object BytesField1: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object UniQuery_DataRelativeSheetByImei: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *'
      'FROM DataRelativeSheet'
      'WHERE IMEI1=:IMEI')
    Left = 728
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
  object UniQuery_SIM: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT IMEI1  '
      'FROM DataRelativeSheet'
      'WHERE IMEI3=:SIMNo'
      'ORDER BY IMEI1 DESC')
    Left = 520
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SIMNO'
      end>
    object UniQuery_SIMIMEI1: TStringField
      FieldName = 'IMEI1'
      Required = True
      Size = 50
    end
  end
  object UniQuery_DataRelativeSheetBySIM: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT IMEI1 From DataRelativeSheet'
      'WHERE IMEI1=:SIMNO'
      'ORDER BY IMEI1 DESC')
    Left = 560
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SIMNO'
      end>
  end
  object qry_UpdateDataRel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'UPDATE DataRelativeSheet'
      'SET IMEI1=:IMEI'
      'WHERE IMEI3=:SIMNo')
    Left = 728
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end
      item
        DataType = ftUnknown
        Name = 'SIMNO'
      end>
  end
  object btappAutoPrint: TBTApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    Left = 600
    Top = 88
  end
  object btappBtnPrint: TBTApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    Left = 632
    Top = 88
  end
  object sp_CheckSim: TUniStoredProc
    StoredProcName = 'CheckSIM'
    Connection = DMMain.UniConGpsTest
    Left = 360
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = 'cIMEI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cSIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iRecordCount'
        ParamType = ptInputOutput
        Value = 0
      end>
    CommandStoredProcName = 'CheckSIM'
  end
  object ds_SIM: TDataSource
    DataSet = UniQuery_SIM
    Left = 557
    Top = 93
  end
  object UniQuery_DataRelativeSheetByImeiSIM: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *'
      'FROM DataRelativeSheet'
      'WHERE IMEI1=:IMEI and IMEI3=:SIMNO')
    Left = 768
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end
      item
        DataType = ftUnknown
        Name = 'SIMNO'
      end>
  end
  object UniQuery_DataRelative_ByIMEI: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  '
      'FROM DataRelative_BAT'
      'WHERE IMEI=:IMEI')
    Left = 880
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
  object spCheckTestpass: TUniStoredProc
    StoredProcName = 'CheckTestPass'
    Connection = DMMain.UniConGpsTest
    Left = 832
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
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
        Name = 'iFunctionPass'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'iGPSPass'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'iCouplePass'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'iWriteImeiPass'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'iParamDownloadPass'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'iAutoPass'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cResult'
        ParamType = ptInputOutput
        Value = 0
      end>
    CommandStoredProcName = 'CheckTestPass'
    StoredProcIsQuery = True
  end
  object UniQuery_DataRelative_VIP_ByIMEI: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  '
      'FROM DataRelative_VIP'
      'WHERE IMEI=:IMEI')
    Left = 880
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
end
