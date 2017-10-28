inherited frmClientUser: TfrmClientUser
  Left = 296
  Top = 213
  Caption = #29992#25143#31649#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 56
        Top = 40
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#21517':'
      end
      object lbl2: TLabel
        Left = 56
        Top = 90
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#25551#36848':'
      end
      object lbl3: TLabel
        Left = 56
        Top = 140
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#23494#30721':'
      end
      object lbl4: TLabel
        Left = 56
        Top = 190
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29992#25143#31867#22411':'
      end
      object lbl5: TLabel
        Left = 56
        Top = 240
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27979#35797#24037#20301':'
      end
      object Edt_UserName: TDBEdit
        Left = 136
        Top = 32
        Width = 130
        Height = 21
        DataField = 'UserName'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_UserDes: TDBEdit
        Left = 136
        Top = 84
        Width = 130
        Height = 21
        DataField = 'UserDes'
        DataSource = DS_Module
        TabOrder = 1
      end
      object Edt_UserPwd: TDBEdit
        Left = 136
        Top = 136
        Width = 130
        Height = 21
        DataField = 'UserPwd'
        DataSource = DS_Module
        TabOrder = 2
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 136
        Top = 188
        Width = 130
        Height = 21
        DataField = 'UserType'
        DataSource = DS_Module
        EditButtons = <>
        KeyField = 'TypeName'
        ListField = 'TypeDes'
        ListSource = DS_UserType
        TabOrder = 3
        Visible = True
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 136
        Top = 240
        Width = 130
        Height = 21
        DataField = 'UserTestPlan'
        DataSource = DS_Module
        EditButtons = <>
        KeyField = 'TestPlanName'
        ListField = 'TestPlanDes'
        ListSource = DS_TestPlan
        TabOrder = 4
        Visible = True
      end
    end
  end
  inherited ActionList: TActionList
    inherited ac_Export: TAction
      OnExecute = ac_ExportExecute
    end
  end
  object ADS_UserType: TADODataSet
    AfterEdit = ADS_ModuleAfterEdit
    BeforePost = ADS_ModuleBeforePost
    Parameters = <>
    Left = 480
    Top = 104
  end
  object DS_UserType: TDataSource
    DataSet = ADS_UserType
    Left = 448
    Top = 104
  end
  object DS_TestPlan: TDataSource
    DataSet = ADS_TestPlan
    Left = 448
    Top = 152
  end
  object ADS_TestPlan: TADODataSet
    AfterEdit = ADS_ModuleAfterEdit
    BeforePost = ADS_ModuleBeforePost
    Parameters = <>
    Left = 480
    Top = 152
  end
end
