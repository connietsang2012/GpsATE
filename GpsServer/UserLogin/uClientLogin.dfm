object frmClientLogin: TfrmClientLogin
  Left = 501
  Top = 305
  BorderStyle = bsToolWindow
  Caption = 'GPS'#29983#20135#21806#21518#25511#21046#31995#32479'--<'#26381#21153#22120'>'#29992#25143#30331#24405
  ClientHeight = 157
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = '@Arial Unicode MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 23
    Width = 78
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29992#25143#21517':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #38582#20070
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 34
    Top = 67
    Width = 78
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23494#30721':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #38582#20070
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 276
    Top = 28
    Width = 98
    Height = 98
    AutoSize = False
    Caption = #35831#36755#20837#30456#24212#30340#29992#25143#21517#21644#23494#30721','#36755#23436#23494#30721#21518#25353#22238#36710#38190#21363#21487#30331#24405
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = #38582#20070
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Shape1: TShape
    Left = 261
    Top = 0
    Width = 1
    Height = 156
    Pen.Color = clSilver
  end
  object Edt_UserName: TEdit
    Left = 114
    Top = 22
    Width = 104
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
    ParentFont = False
    TabOrder = 0
    OnKeyPress = Edt_UserNameKeyPress
  end
  object Edt_UserPassword: TEdit
    Left = 114
    Top = 65
    Width = 104
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = Edt_UserPasswordKeyPress
  end
  object Btn_Ok: TButton
    Left = 21
    Top = 111
    Width = 99
    Height = 29
    Caption = #30830#23450'(&E)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #38582#20070
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Btn_OkClick
  end
  object Btn_Cancle: TButton
    Left = 136
    Top = 111
    Width = 100
    Height = 29
    Caption = #21462#28040'(&C)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #38582#20070
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object DS_Module: TDataSource
    Left = 16
  end
  object UniQuery_UserType: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_UserType')
    Active = True
    Left = 48
    object SFUniQuery_UserTypeIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_UserTypeTypeId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'TypeId'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_UserTypeTypeName: TStringField
      FieldName = 'TypeName'
      Required = True
    end
    object SFUniQuery_UserTypeTypeDes: TStringField
      FieldName = 'TypeDes'
      Required = True
    end
  end
  object UniQuery_User: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_User')
    Active = True
    Left = 80
    object SFUniQuery_UserIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_UserUserId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'UserId'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_UserUserName: TStringField
      FieldName = 'UserName'
      Required = True
    end
    object SFUniQuery_UserUserDes: TStringField
      FieldName = 'UserDes'
      Required = True
    end
    object SFUniQuery_UserUserPwd: TStringField
      FieldName = 'UserPwd'
      Required = True
    end
    object SFUniQuery_UserUserType: TStringField
      FieldName = 'UserType'
      Required = True
    end
    object SFUniQuery_UserUserTypeDes: TStringField
      FieldKind = fkLookup
      FieldName = 'UserTypeDes'
      LookupDataSet = UniQuery_UserType
      LookupKeyFields = 'TypeName'
      LookupResultField = 'TypeDes'
      KeyFields = 'UserType'
      Lookup = True
    end
  end
end
