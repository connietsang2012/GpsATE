object frmSIMRel: TfrmSIMRel
  Left = 157
  Top = 161
  Width = 869
  Height = 567
  Caption = 'SIM'#21345#32465#23450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 375
    Width = 150
    Height = 41
    Alignment = taRightJustify
    AutoSize = False
    Caption = #27969#27700#21495':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GrpTestPass: TGroupBox
    Left = 516
    Top = 238
    Width = 135
    Height = 144
    Caption = #27979#35797#26410#36890#36807#24037#31449
    Enabled = False
    TabOrder = 0
    Visible = False
    object chk_FuncTest: TCheckBox
      Left = 14
      Top = 160
      Width = 120
      Height = 16
      Caption = #21151#33021#27979#35797#20301
      TabOrder = 0
      Visible = False
    end
    object chk_GPSTest: TCheckBox
      Left = 14
      Top = 182
      Width = 120
      Height = 17
      Caption = 'GPS'#27979#35797#20301
      TabOrder = 1
      Visible = False
    end
    object chk_CoupleTest: TCheckBox
      Left = 6
      Top = 26
      Width = 120
      Height = 17
      Caption = #32806#21512#27979#35797#20301
      TabOrder = 2
    end
    object chk_WriteImei: TCheckBox
      Left = 6
      Top = 52
      Width = 120
      Height = 17
      Caption = 'IMEI'#28903#20889#20301
      TabOrder = 3
    end
    object chk_ParamDownload: TCheckBox
      Left = 6
      Top = 78
      Width = 120
      Height = 17
      Caption = #36719#20214#21442#25968#19979#36733#20301
      TabOrder = 4
    end
    object chk_AutoTest: TCheckBox
      Left = 6
      Top = 104
      Width = 120
      Height = 17
      Caption = #33258#21160#27979#35797#20301
      TabOrder = 5
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 657
    Height = 217
    Caption = #25195#25551#21306
    TabOrder = 1
    object lbl_SIM: TLabel
      Left = 8
      Top = 88
      Width = 120
      Height = 41
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'SIM'#21345#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_IMEI: TLabel
      Left = 8
      Top = 152
      Width = 120
      Height = 41
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'IMEI:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblrel: TLabel
      Left = 368
      Top = 24
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #32465#23450#20851#31995':'
    end
    object Label7: TLabel
      Left = 40
      Top = 24
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21046#21333#21495':'
    end
    object lbl8: TLabel
      Left = 23
      Top = 47
      Width = 562
      Height = 25
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edt_IMEI: TEdit
      Left = 133
      Top = 145
      Width = 492
      Height = 56
      AutoSize = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -57
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 15
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edt_IMEIKeyPress
    end
    object edt_SIM: TEdit
      Left = 133
      Top = 81
      Width = 492
      Height = 56
      AutoSize = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -57
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 13
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edt_SIMKeyPress
    end
    object cbManuOrder: TComboBox
      Left = 136
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = #26080
      OnChange = cbManuOrderChange
      Items.Strings = (
        #26080
        'IMEI'#19982'SIM'#21345#32465#23450)
    end
    object cbb_Rel: TDBLookupComboBox
      Left = 432
      Top = 16
      Width = 145
      Height = 21
      DataField = 'IMEIRelDesc'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 3
    end
  end
  object grp4: TGroupBox
    Left = 6
    Top = 230
    Width = 499
    Height = 288
    Caption = #29256#26412#20449#24687#21306
    TabOrder = 2
    object lbl13: TLabel
      Left = 13
      Top = 189
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'TAC'#20449#24687':'
      ParentBiDiMode = False
    end
    object lbl12: TLabel
      Left = 13
      Top = 62
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #27969#27700#21495':'
      ParentBiDiMode = False
    end
    object Label2: TLabel
      Left = 8
      Top = 147
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'IMEI'#21495#27573':'
      ParentBiDiMode = False
    end
    object Label5: TLabel
      Left = 261
      Top = 147
      Width = 20
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '---'
      ParentBiDiMode = False
    end
    object lbl18: TLabel
      Left = 13
      Top = 104
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #29983#20135#26085#26399':'
      ParentBiDiMode = False
    end
    object Label1: TLabel
      Left = 13
      Top = 20
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #26426#22411':'
      ParentBiDiMode = False
    end
    object Label4: TLabel
      Left = 8
      Top = 235
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'SIM'#21495#27573':'
      ParentBiDiMode = False
    end
    object Label6: TLabel
      Left = 261
      Top = 235
      Width = 20
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '---'
      ParentBiDiMode = False
    end
    object edt_SoftModel: TDBEdit
      Left = 80
      Top = 16
      Width = 369
      Height = 21
      DataField = 'SoftModel'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 0
    end
    object edt_SN1: TDBEdit
      Left = 80
      Top = 56
      Width = 121
      Height = 21
      DataField = 'SN1'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 1
    end
    object edt_SN2: TDBEdit
      Left = 208
      Top = 56
      Width = 121
      Height = 21
      DataField = 'SN2'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 2
    end
    object edt_SN3: TDBEdit
      Left = 336
      Top = 56
      Width = 113
      Height = 21
      DataField = 'SN3'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 3
    end
    object edt_Date: TDBEdit
      Left = 80
      Top = 102
      Width = 369
      Height = 21
      DataField = 'ProductDate'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 4
    end
    object Edt_IMEISTART: TDBEdit
      Left = 80
      Top = 144
      Width = 185
      Height = 21
      DataField = 'IMEIStart'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 5
    end
    object Edt_IMEIEND: TDBEdit
      Left = 288
      Top = 144
      Width = 161
      Height = 21
      DataField = 'IMEIEnd'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 6
    end
    object edt_Tac: TDBEdit
      Left = 80
      Top = 184
      Width = 369
      Height = 21
      DataField = 'TACInfo'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 7
    end
    object Edt_SIMSTART: TDBEdit
      Left = 80
      Top = 232
      Width = 185
      Height = 21
      DataField = 'SIMStart'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 8
    end
    object Edt_SIMEND: TDBEdit
      Left = 288
      Top = 232
      Width = 161
      Height = 21
      DataField = 'SIMEnd'
      DataSource = DS_ManuOrderParam
      Enabled = False
      TabOrder = 9
    end
  end
  object pnlClientBottom: TPanel
    Left = 0
    Top = 518
    Width = 844
    Height = 60
    Align = alBottom
    TabOrder = 3
    object TestResult: TPanel
      Left = 1
      Top = 1
      Width = 842
      Height = 58
      Align = alClient
      Color = clRed
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object UniQuery_SIM: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  '
      'FROM DataRelativeSheet'
      'WHERE IMEI3=:SIMNo')
    Left = 648
    Top = 160
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
    Left = 712
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
  object UniQuery_InsertGiftBox: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'INSERT INTO Gps_GiftBox_Result'
      '           ([SN]'
      '           ,[IMEI]'
      '           ,[SIMNO]'
      '           ,[ZhiDan]'
      '           ,[SoftModel]'
      '           ,[Date]'
      '           ,[CompanyName]'
      '           ,[TesterId])'
      '     VALUES'
      '           (:SN, '
      '            :IMEI,'
      '           :SIMNO,'
      '           :ZhiDan,'
      '           :SoftModel,'
      '           :Date,'
      '           :CompanyName, '
      '           :TesterId '
      '           )')
    Left = 712
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN'
      end
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end
      item
        DataType = ftUnknown
        Name = 'SIMNO'
      end
      item
        DataType = ftUnknown
        Name = 'ZhiDan'
      end
      item
        DataType = ftUnknown
        Name = 'SoftModel'
      end
      item
        DataType = ftUnknown
        Name = 'Date'
      end
      item
        DataType = ftUnknown
        Name = 'CompanyName'
      end
      item
        DataType = ftUnknown
        Name = 'TesterId'
      end>
  end
  object UniQuery_GiftBoxByImei: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT * From DataRelativeSheet'
      'WHERE IMEI1=:IMEI')
    Left = 672
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
  end
  object UniQuery_GiftBoxBySIM: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT * From DataRelativeSheet'
      'WHERE IMEI1=:SIMNO')
    Left = 672
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SIMNO'
      end>
  end
  object UniQuery_ManuOrderParam: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT ZhiDan'
      '      ,SoftModel'
      '      ,SN1'
      '      ,SN2'
      '      ,SN3'
      '      ,ProductDate'
      '      ,ProductNo'
      '      ,Version'
      '      ,IMEIStart'
      '      ,IMEIEnd'
      '      ,SIMStart'
      '      ,SIMEnd'
      '      ,IMEIRel'
      '      ,TACInfo'
      '      ,CompanyName'
      '      ,Status'
      '      ,_MASK_FROM_V2'
      '  FROM Gps_ManuOrderParam'
      '  WHERE ZhiDan=:ZhiDan')
    Left = 712
    Top = 56
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
    object UniQuery_ManuOrderParamSN1: TStringField
      FieldName = 'SN1'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamSN2: TStringField
      FieldName = 'SN2'
      Required = True
      Size = 50
    end
    object UniQuery_ManuOrderParamSN3: TStringField
      FieldName = 'SN3'
      Size = 50
    end
    object UniQuery_ManuOrderParamProductDate: TStringField
      FieldName = 'ProductDate'
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
    object UniQuery_ManuOrderParamSIMStart: TStringField
      FieldName = 'SIMStart'
      Size = 50
    end
    object UniQuery_ManuOrderParamSIMEnd: TStringField
      FieldName = 'SIMEnd'
      Size = 50
    end
    object UniQuery_ManuOrderParamIMEIRel: TIntegerField
      FieldName = 'IMEIRel'
      Required = True
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
    object UniQuery_ManuOrderParamStatus: TIntegerField
      FieldName = 'Status'
      Required = True
    end
    object UniQuery_ManuOrderParam_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
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
  end
  object UniQuery_ManuOrder: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT ZhiDan      '
      '  FROM Gps_ManuOrderParam'
      '  WHERE status=1')
    Left = 672
    Top = 56
    object UniQuery_ManuOrderZhiDan: TStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 50
    end
  end
  object UniQuery_IMEIRel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_IMEIRel')
    Left = 760
    Top = 56
    object UniQuery_IMEIRelRelId: TIntegerField
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
    Top = 96
  end
  object UniQuery_UpdateSN: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'UPDATE Gps_ManuOrderParam'
      'SET SN2=:SN2'
      'WHERE ZhiDan=:ZhiDan')
    Left = 800
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN2'
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
end
