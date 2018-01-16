object frmCartonBox: TfrmCartonBox
  Left = 88
  Top = 125
  Width = 936
  Height = 634
  Caption = #24086#32440#27169#26495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlParent: TPanel
    Left = 8
    Top = 8
    Width = 986
    Height = 601
    TabOrder = 0
    object grp1: TGroupBox
      Left = 6
      Top = 0
      Width = 714
      Height = 77
      Caption = #25195#25551#21306
      TabOrder = 0
      object EdtMEI: TEdit
        Left = 0
        Top = 17
        Width = 689
        Height = 56
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -57
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EdtMEIKeyPress
      end
    end
    object grp2: TGroupBox
      Left = 6
      Top = 80
      Width = 714
      Height = 45
      Caption = #21151#33021#21306
      TabOrder = 1
      object lbl9: TLabel
        Left = 210
        Top = 17
        Width = 62
        Height = 18
        AutoSize = False
        Caption = #25968#25454#26465#25968':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl10: TLabel
        Left = 290
        Top = 15
        Width = 31
        Height = 23
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPrint: TSpeedButton
        Left = 87
        Top = 15
        Width = 24
        Height = 22
        Hint = #25171#21360
        Glyph.Data = {
          26050000424D26050000000000003604000028000000100000000F0000000100
          080000000000F0000000CE0E0000C40E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
          A400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000FFFFFFFF0007070707
          0707070707000700FFFF000000000000000000000000000700FF000707070707
          07FBFBFB0707000000FF000707070707071010100707000700FF000000000000
          0000000000000007070000070707070707070707070007000700FF0000000000
          00000000000700070000FFFF00FFFFFFFFFFFFFFFF0007000700FFFFFF00FF00
          00000000FF00000000FFFFFFFF00FFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FF
          0000000000FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF00
          0000000000000000FFFF}
        OnClick = btnPrintClick
      end
      object lbl8: TLabel
        Left = 319
        Top = 15
        Width = 382
        Height = 25
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chkAuto: TCheckBox
        Left = 9
        Top = 19
        Width = 73
        Height = 16
        Caption = #33258#21160#25171#21360
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object btnClear: TButton
        Left = 128
        Top = 12
        Width = 75
        Height = 25
        Caption = #28165#31354#37325#25195
        TabOrder = 1
        OnClick = btnClearClick
      end
    end
    object grp3: TGroupBox
      Left = 6
      Top = 125
      Width = 714
      Height = 217
      Caption = #26174#31034#21306
      TabOrder = 2
      object mmoMEI: TMemo
        Left = 2
        Top = 15
        Width = 710
        Height = 200
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -32
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object grp4: TGroupBox
      Left = 6
      Top = 347
      Width = 714
      Height = 225
      Caption = #29256#26412#20449#24687#21306
      TabOrder = 3
      object lbl13: TLabel
        Left = 5
        Top = 165
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'TAC'#20449#24687':'
        ParentBiDiMode = False
      end
      object lbl12: TLabel
        Left = 5
        Top = 52
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #31665#21495':'
        ParentBiDiMode = False
      end
      object lbl16: TLabel
        Left = 38
        Top = 109
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'IMEI'#21495#27573':'
        ParentBiDiMode = False
      end
      object lbl17: TLabel
        Left = 293
        Top = 109
        Width = 39
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #8212#8212#8212#8212
        ParentBiDiMode = False
      end
      object lbl18: TLabel
        Left = 14
        Top = 71
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #29256#26412#21495':'
        ParentBiDiMode = False
      end
    end
    object GrpTestPass: TGroupBox
      Left = 780
      Top = 111
      Width = 135
      Height = 144
      Caption = #27979#35797#26410#36890#36807#24037#31449
      Enabled = False
      TabOrder = 4
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
    object chkMustParamterDownload: TCheckBox
      Left = 723
      Top = 24
      Width = 185
      Height = 17
      Caption = #26159#21542#26816#27979#36719#20214#21442#25968#19979#36733#20301
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 5
      OnClick = chkMustParamterDownloadClick
    end
    object medtParamterDownload: TMaskEdit
      Left = 723
      Top = 48
      Width = 185
      Height = 21
      PasswordChar = '*'
      TabOrder = 6
    end
    object btnParamterDownload: TBitBtn
      Left = 837
      Top = 80
      Width = 74
      Height = 25
      Caption = #30830'    '#23450
      TabOrder = 7
      OnClick = btnParamterDownloadClick
    end
  end
  object DS_IMEI: TDataSource
    DataSet = UniQuery_IMEI
    Left = 429
    Top = 5
  end
  object UniQuery_IMEI: TUniQuery
    Left = 464
    Top = 8
  end
  object UniQuery_IMEI_20: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  '
      'FROM Gps_CartonBoxTwenty_Result '
      'WHERE IMEI=:IMEI')
    Left = 464
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'IMEI'
        ParamType = ptInput
      end>
    object UniQuery_IMEI_20Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object UniQuery_IMEI_20BoxNo: TStringField
      FieldName = 'BoxNo'
      Required = True
      Size = 50
    end
    object UniQuery_IMEI_20IMEI: TStringField
      FieldName = 'IMEI'
      Required = True
      Size = 15
    end
    object UniQuery_IMEI_20ZhiDan: TStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 100
    end
    object UniQuery_IMEI_20SoftModel: TStringField
      FieldName = 'SoftModel'
      Required = True
    end
    object UniQuery_IMEI_20Version: TStringField
      FieldName = 'Version'
      Required = True
      Size = 50
    end
    object UniQuery_IMEI_20ProductCode: TStringField
      FieldName = 'ProductCode'
      Size = 100
    end
    object UniQuery_IMEI_20Color: TStringField
      FieldName = 'Color'
      Size = 50
    end
    object UniQuery_IMEI_20Qty: TStringField
      FieldName = 'Qty'
      Size = 50
    end
    object UniQuery_IMEI_20Weight: TStringField
      FieldName = 'Weight'
      Size = 50
    end
    object UniQuery_IMEI_20Date: TStringField
      FieldName = 'Date'
      Size = 50
    end
    object UniQuery_IMEI_20TACInfo: TStringField
      FieldName = 'TACInfo'
      Size = 200
    end
    object UniQuery_IMEI_20CompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 200
    end
    object UniQuery_IMEI_20TesterId: TStringField
      FieldName = 'TesterId'
      Required = True
    end
    object UniQuery_IMEI_20TestTime: TDateTimeField
      FieldName = 'TestTime'
      Required = True
    end
    object UniQuery_IMEI_20Remark1: TStringField
      FieldName = 'Remark1'
      Size = 200
    end
    object UniQuery_IMEI_20Remark2: TStringField
      FieldName = 'Remark2'
      Size = 200
    end
    object UniQuery_IMEI_20Remark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object UniQuery_IMEI_20Remark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object UniQuery_IMEI_20Remark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
  end
  object UniQuery_IMEI_10: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  '
      'FROM Gps_CartonBoxTen_Result '
      'WHERE IMEI=:IMEI')
    Left = 464
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'IMEI'
        ParamType = ptInput
      end>
    object UniQuery_IMEI_10Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object UniQuery_IMEI_10BoxNo: TStringField
      FieldName = 'BoxNo'
      Required = True
      Size = 50
    end
    object UniQuery_IMEI_10IMEI: TStringField
      FieldName = 'IMEI'
      Required = True
      Size = 15
    end
    object UniQuery_IMEI_10Color: TStringField
      FieldName = 'Color'
      Size = 50
    end
    object UniQuery_IMEI_10Weight: TStringField
      FieldName = 'Weight'
      Size = 50
    end
    object UniQuery_IMEI_10TACInfo: TStringField
      FieldName = 'TACInfo'
      Size = 200
    end
    object UniQuery_IMEI_10OtherInfo: TStringField
      FieldName = 'OtherInfo'
      Size = 200
    end
    object UniQuery_IMEI_10TesterId: TStringField
      FieldName = 'TesterId'
      Required = True
    end
    object UniQuery_IMEI_10TestTime: TDateTimeField
      FieldName = 'TestTime'
      Required = True
    end
    object UniQuery_IMEI_10Remark1: TStringField
      FieldName = 'Remark1'
      Size = 200
    end
    object UniQuery_IMEI_10Remark2: TStringField
      FieldName = 'Remark2'
      Size = 200
    end
    object UniQuery_IMEI_10Remark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object UniQuery_IMEI_10Remark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object UniQuery_IMEI_10Remark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
  end
  object UniQueryUser: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *'
      '  FROM [Gps_User]'
      '  WHERE UserName='#39'CartonAdmin'#39' and UserPwd=:UserPwd')
    Left = 856
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UserPwd'
      end>
    object UniQueryUserUserId: TIntegerField
      FieldName = 'UserId'
      ReadOnly = True
      Required = True
    end
    object UniQueryUserUserName: TStringField
      FieldName = 'UserName'
      Required = True
    end
    object UniQueryUserUserDes: TStringField
      FieldName = 'UserDes'
      Required = True
    end
    object UniQueryUserUserPwd: TStringField
      FieldName = 'UserPwd'
      Required = True
    end
    object UniQueryUserUserType: TStringField
      FieldName = 'UserType'
      Required = True
    end
    object UniQueryUserUserTestPlan: TStringField
      FieldName = 'UserTestPlan'
      Required = True
    end
  end
  object unqry_ParamVersion: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select VersionS from Gps_ParamDownVersionCpd'
      'WHERE IMEI=:IMEI')
    Left = 856
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMEI'
      end>
    object strngfld_ParamVersionVersionS: TStringField
      FieldName = 'VersionS'
      Size = 50
    end
  end
  object ds1: TDataSource
    DataSet = unqry_ParamVersion
    Left = 800
    Top = 168
  end
  object sp1: TUniStoredProc
    StoredProcName = 'CheckTestedByImei'
    Connection = DMMain.UniConGpsTest
    Left = 856
    Top = 224
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
        Value = '357404080086880'
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
  object UniQuery_FindRidByImei: TUniQuery
    Left = 536
    Top = 8
  end
end
