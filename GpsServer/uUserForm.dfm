inherited frmUser: TfrmUser
  Left = 92
  Top = 276
  Caption = #29992#25143#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Enabled = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32034#24341
            Width = 50
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'UserName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29992#25143#21517
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'UserDes'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29992#25143#25551#36848
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'UserId'
            Footers = <>
            Visible = False
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'UserTypeDes'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29992#25143#31867#22411
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'UserTestPlanDes'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#24037#31449
            Width = 200
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'InService'
            Footers = <>
            Title.Caption = #26159#21542#26377#25928
            Width = 80
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 47
        Top = 34
        Width = 60
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#21517':'
      end
      object lbl2: TLabel
        Left = 47
        Top = 76
        Width = 60
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#25551#36848':'
      end
      object lbl3: TLabel
        Left = 47
        Top = 118
        Width = 60
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#23494#30721':'
      end
      object lbl4: TLabel
        Left = 47
        Top = 159
        Width = 60
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#31867#22411':'
      end
      object lbl5: TLabel
        Left = 47
        Top = 201
        Width = 60
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#24037#31449':'
      end
      object Label1: TLabel
        Left = 232
        Top = 160
        Width = 10
        Height = 11
        Alignment = taCenter
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 232
        Top = 208
        Width = 10
        Height = 11
        Alignment = taCenter
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 56
        Top = 240
        Width = 50
        Height = 11
        Caption = #26159#21542#26377#25928':'
      end
      object Edt_UserName: TDBEdit
        Left = 115
        Top = 30
        Width = 110
        Height = 19
        DataField = 'UserName'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_UserNameChange
      end
      object Edt_UserDes: TDBEdit
        Left = 115
        Top = 73
        Width = 110
        Height = 19
        DataField = 'UserDes'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
        OnChange = Edt_UserDesChange
      end
      object Edt_UserPwd: TDBEdit
        Left = 115
        Top = 115
        Width = 110
        Height = 19
        DataField = 'UserPwd'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        PasswordChar = '*'
        TabOrder = 2
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 115
        Top = 158
        Width = 110
        Height = 19
        DataField = 'UserTypeDes'
        DataSource = DS_Module
        EditButtons = <>
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        Style = csDropDownEh
        TabOrder = 3
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
      object cbbUserTypeDes: TDBLookupComboboxEh
        Left = 115
        Top = 201
        Width = 110
        Height = 19
        DataField = 'UserTestPlanDes'
        DataSource = DS_Module
        EditButtons = <>
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        Style = csDropDownEh
        TabOrder = 4
        Visible = True
        OnChange = cbbUserTypeDesChange
      end
      object dbchkInService: TDBCheckBox
        Left = 112
        Top = 240
        Width = 97
        Height = 17
        DataField = 'InService'
        DataSource = DS_Module
        TabOrder = 5
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
  end
  inherited tlb1: TToolBar
    object TB_Post: TToolButton
      Left = 441
      Top = 2
      OnClick = TB_PostClick
    end
  end
  inherited ActionList: TActionList
    Left = 712
  end
  inherited SaveDialog1: TSaveDialog
    Left = 744
    Top = 64
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_User
    Left = 736
    Top = 136
  end
  object UniQuery_User: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_User')
    OnCalcFields = UniQuery_UserCalcFields
    Left = 664
    Top = 64
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
    object SFUniQuery_UserUserTestPlan: TStringField
      FieldName = 'UserTestPlan'
      Required = True
    end
    object SFUniQuery_UserUserTestPlanDes: TStringField
      FieldKind = fkLookup
      FieldName = 'UserTestPlanDes'
      LookupDataSet = UniQuery_TestPlan
      LookupKeyFields = 'TestPlanName'
      LookupResultField = 'TestPlanDes'
      KeyFields = 'UserTestPlan'
      Size = 50
      Lookup = True
    end
    object UniQuery_UserInService: TBooleanField
      FieldName = 'InService'
      Required = True
    end
  end
  object UniQuery_UserType: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_UserType')
    Left = 632
    Top = 64
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
  object UniQuery_TestPlan: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_TestPlan')
    Left = 632
    Top = 96
    object intgrfldUniQuery_TestPlanTestPlanId: TIntegerField
      FieldName = 'TestPlanId'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_TestPlanTestPlanName: TStringField
      FieldName = 'TestPlanName'
      Required = True
    end
    object SFUniQuery_TestPlanTestPlanDes: TStringField
      FieldName = 'TestPlanDes'
      Required = True
    end
  end
end
