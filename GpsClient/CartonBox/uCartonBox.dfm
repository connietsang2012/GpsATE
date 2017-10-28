object frmCartonBox: TfrmCartonBox
  Left = 284
  Top = 148
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
  TextHeight = 11
  object pnlParent: TPanel
    Left = 7
    Top = 7
    Width = 834
    Height = 508
    TabOrder = 0
    object grp1: TGroupBox
      Left = 5
      Top = 0
      Width = 604
      Height = 65
      Caption = #25195#25551#21306
      TabOrder = 0
      object EdtMEI: TEdit
        Left = 0
        Top = 14
        Width = 583
        Height = 48
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -48
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
      Left = 5
      Top = 68
      Width = 604
      Height = 38
      Caption = #21151#33021#21306
      TabOrder = 1
      object lbl8: TLabel
        Left = 270
        Top = 13
        Width = 323
        Height = 21
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl9: TLabel
        Left = 178
        Top = 14
        Width = 52
        Height = 16
        AutoSize = False
        Caption = #25968#25454#26465#25968':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl10: TLabel
        Left = 245
        Top = 13
        Width = 27
        Height = 19
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPrint: TSpeedButton
        Left = 74
        Top = 13
        Width = 20
        Height = 18
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
      object chkAuto: TCheckBox
        Left = 8
        Top = 16
        Width = 61
        Height = 14
        Caption = #33258#21160#25171#21360
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object btnClear: TButton
        Left = 108
        Top = 10
        Width = 64
        Height = 21
        Caption = #28165#31354#37325#25195
        TabOrder = 1
        OnClick = btnClearClick
      end
    end
    object grp3: TGroupBox
      Left = 5
      Top = 106
      Width = 604
      Height = 183
      Caption = #26174#31034#21306
      TabOrder = 2
      object mmoMEI: TMemo
        Left = 2
        Top = 13
        Width = 600
        Height = 168
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -27
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
      Left = 5
      Top = 294
      Width = 604
      Height = 190
      Caption = #29256#26412#20449#24687#21306
      TabOrder = 3
      object lbl13: TLabel
        Left = 4
        Top = 140
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'TAC'#20449#24687':'
        ParentBiDiMode = False
      end
      object lbl12: TLabel
        Left = 4
        Top = 44
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #31665#21495':'
        ParentBiDiMode = False
      end
      object lbl16: TLabel
        Left = 32
        Top = 92
        Width = 55
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'IMEI'#21495#27573':'
        ParentBiDiMode = False
      end
      object lbl17: TLabel
        Left = 248
        Top = 92
        Width = 33
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #8212#8212#8212#8212
        ParentBiDiMode = False
      end
      object lbl18: TLabel
        Left = 12
        Top = 60
        Width = 51
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #29256#26412#21495':'
        ParentBiDiMode = False
      end
      object EdtTac: TEdit
        Left = 61
        Top = 135
        Width = 178
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 15
        TabOrder = 0
        OnKeyPress = EdtTacKeyPress
      end
      object EdtBoxNum: TEdit
        Left = 61
        Top = 40
        Width = 68
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 3
        TabOrder = 1
      end
      object Edt_IMEISTART: TEdit
        Left = 93
        Top = 87
        Width = 148
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 14
        TabOrder = 2
      end
      object Edt_IMEIEND: TEdit
        Left = 285
        Top = 87
        Width = 148
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 14
        TabOrder = 3
      end
      object EdtParamVersion: TEdit
        Left = 69
        Top = 56
        Width = 68
        Height = 19
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 50
        TabOrder = 4
      end
    end
    object GrpTestPass: TGroupBox
      Left = 660
      Top = 94
      Width = 114
      Height = 122
      Caption = #27979#35797#26410#36890#36807#24037#31449
      Enabled = False
      TabOrder = 4
      Visible = False
      object chk_FuncTest: TCheckBox
        Left = 12
        Top = 135
        Width = 101
        Height = 14
        Caption = #21151#33021#27979#35797#20301
        TabOrder = 0
        Visible = False
      end
      object chk_GPSTest: TCheckBox
        Left = 12
        Top = 154
        Width = 101
        Height = 14
        Caption = 'GPS'#27979#35797#20301
        TabOrder = 1
        Visible = False
      end
      object chk_CoupleTest: TCheckBox
        Left = 5
        Top = 22
        Width = 102
        Height = 14
        Caption = #32806#21512#27979#35797#20301
        TabOrder = 2
      end
      object chk_WriteImei: TCheckBox
        Left = 5
        Top = 44
        Width = 102
        Height = 14
        Caption = 'IMEI'#28903#20889#20301
        TabOrder = 3
      end
      object chk_ParamDownload: TCheckBox
        Left = 5
        Top = 66
        Width = 102
        Height = 14
        Caption = #36719#20214#21442#25968#19979#36733#20301
        TabOrder = 4
      end
      object chk_AutoTest: TCheckBox
        Left = 5
        Top = 88
        Width = 102
        Height = 14
        Caption = #33258#21160#27979#35797#20301
        TabOrder = 5
      end
    end
    object chkMustParamterDownload: TCheckBox
      Left = 612
      Top = 20
      Width = 156
      Height = 15
      Caption = #26159#21542#26816#27979#36719#20214#21442#25968#19979#36733#20301
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 5
      OnClick = chkMustParamterDownloadClick
    end
    object medtParamterDownload: TMaskEdit
      Left = 612
      Top = 41
      Width = 156
      Height = 19
      PasswordChar = '*'
      TabOrder = 6
    end
    object btnParamterDownload: TBitBtn
      Left = 708
      Top = 68
      Width = 63
      Height = 21
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
  object btappBtnPrint: TBTApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    Left = 344
    Top = 56
  end
  object btappAutoPrint: TBTApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    Left = 312
    Top = 56
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
    Left = 872
    Top = 224
  end
end
