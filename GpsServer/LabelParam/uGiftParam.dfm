inherited frmGiftParam: TfrmGiftParam
  Left = 18
  Top = 160
  Caption = #24425#30418#21442#25968
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        HorzScrollBar.Tracking = True
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
            FieldName = 'Id'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ZhiDan'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SoftModel'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SN1'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SN2'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SN3'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ProductDate'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEIStart'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEIEnd'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TACInfo'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SIMStart'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SIMEnd'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEIRel'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = '_MASK_FROM_V2'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'IMEIRelDesc'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'Status'
            Footers = <>
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel
        Left = 132
        Top = 48
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = #21046#21333#65306
      end
      object Label2: TLabel
        Left = 132
        Top = 83
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = #26426#22411#65306
      end
      object Label3: TLabel
        Left = 132
        Top = 119
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = #27969#27700#21495#65306
      end
      object Label4: TLabel
        Left = 132
        Top = 154
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = #29983#20135#26085#26399#65306
      end
      object Label5: TLabel
        Left = 132
        Top = 190
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'IMEI'#21495#27573#65306
      end
      object Label6: TLabel
        Left = 132
        Top = 225
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'TAC'#20449#24687#65306
      end
      object Label7: TLabel
        Left = 132
        Top = 261
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'SIM'#21495#27573#65306
      end
      object Label8: TLabel
        Left = 132
        Top = 296
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'IMEI'#32465#23450#20851#31995#65306
      end
      object Label9: TLabel
        Left = 416
        Top = 192
        Width = 12
        Height = 13
        Caption = '__'
      end
      object Label10: TLabel
        Left = 416
        Top = 256
        Width = 12
        Height = 13
        Caption = '__'
      end
      object Label11: TLabel
        Left = 132
        Top = 324
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = #21046#21333#29366#24577#65306
      end
      object DBEdit1: TDBEdit
        Left = 232
        Top = 48
        Width = 257
        Height = 21
        DataField = 'ZhiDan'
        DataSource = DS_Module
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 232
        Top = 80
        Width = 257
        Height = 21
        DataField = 'SoftModel'
        DataSource = DS_Module
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 232
        Top = 112
        Width = 65
        Height = 21
        DataField = 'SN1'
        DataSource = DS_Module
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 304
        Top = 112
        Width = 89
        Height = 21
        DataField = 'SN2'
        DataSource = DS_Module
        MaxLength = 5
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 400
        Top = 112
        Width = 89
        Height = 21
        DataField = 'SN3'
        DataSource = DS_Module
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 232
        Top = 152
        Width = 257
        Height = 21
        DataField = 'ProductDate'
        DataSource = DS_Module
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 232
        Top = 192
        Width = 177
        Height = 21
        DataField = 'IMEIStart'
        DataSource = DS_Module
        MaxLength = 14
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 432
        Top = 192
        Width = 177
        Height = 21
        DataField = 'IMEIEnd'
        DataSource = DS_Module
        MaxLength = 14
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 232
        Top = 224
        Width = 121
        Height = 21
        DataField = 'TACInfo'
        DataSource = DS_Module
        MaxLength = 10
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 232
        Top = 256
        Width = 177
        Height = 21
        DataField = 'SIMStart'
        DataSource = DS_Module
        MaxLength = 13
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 432
        Top = 256
        Width = 177
        Height = 21
        DataField = 'SIMEnd'
        DataSource = DS_Module
        MaxLength = 13
        TabOrder = 10
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 232
        Top = 288
        Width = 377
        Height = 21
        DataField = 'IMEIRelDesc'
        DataSource = DS_Module
        TabOrder = 11
      end
      object DBLookupComboBox_Status: TDBLookupComboBox
        Left = 232
        Top = 320
        Width = 377
        Height = 21
        DataField = 'StatusDesc'
        DataSource = DS_Module
        TabOrder = 12
      end
    end
  end
  inherited ActionList: TActionList
    inherited DS_Delete: TDataSetDelete
      Visible = False
      OnExecute = DS_DeleteExecute
    end
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_GiftParam
  end
  object UniQuery_GiftParam: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_GiftParam')
    BeforeInsert = UniQuery_GiftParamBeforeInsert
    BeforeEdit = UniQuery_GiftParamBeforeEdit
    BeforePost = UniQuery_GiftParamBeforePost
    AfterScroll = UniQuery_GiftParamAfterScroll
    OnCalcFields = UniQuery_GiftParamCalcFields
    Left = 712
    Top = 72
    object UniQuery_GiftParamId: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object UniQuery_GiftParamZhiDan: TStringField
      DisplayLabel = #21046#21333
      DisplayWidth = 30
      FieldName = 'ZhiDan'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamSoftModel: TStringField
      DisplayLabel = #26426#22411
      DisplayWidth = 30
      FieldName = 'SoftModel'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamSN1: TStringField
      DisplayLabel = #27969#27700#21495#21069#32512
      DisplayWidth = 10
      FieldName = 'SN1'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamSN2: TStringField
      DisplayLabel = #27969#27700#21495
      DisplayWidth = 10
      FieldName = 'SN2'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamSN3: TStringField
      DisplayLabel = #27969#27700#21495#23614#26631
      DisplayWidth = 10
      FieldName = 'SN3'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamProductDate: TStringField
      DisplayLabel = #29983#20135#26085#26399
      DisplayWidth = 20
      FieldName = 'ProductDate'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamIMEIStart: TStringField
      DisplayLabel = 'IMEI'#24320#22987#20301
      DisplayWidth = 30
      FieldName = 'IMEIStart'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamIMEIEnd: TStringField
      DisplayLabel = 'IMEI'#32467#26463#20301
      DisplayWidth = 30
      FieldName = 'IMEIEnd'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamTACInfo: TStringField
      DisplayLabel = 'TAC'#20449#24687
      DisplayWidth = 10
      FieldName = 'TACInfo'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamSIMStart: TStringField
      DisplayLabel = 'SIM'#24320#22987#20301
      DisplayWidth = 20
      FieldName = 'SIMStart'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamSIMEnd: TStringField
      DisplayLabel = 'SIM'#32467#26463#20301
      DisplayWidth = 20
      FieldName = 'SIMEnd'
      Required = True
      Size = 50
    end
    object UniQuery_GiftParamIMEIRel: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'IMEI'#20851#31995
      FieldName = 'IMEIRel'
      Required = True
    end
    object UniQuery_GiftParam_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Visible = False
      Size = 8
    end
    object UniQuery_GiftParamIMEIRelDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'IMEIRelDesc'
      LookupDataSet = UniQuery_IMEIRelDesc
      LookupKeyFields = 'IMEIRelNo'
      LookupResultField = 'IMEIRelDes'
      KeyFields = 'IMEIRel'
      Lookup = True
    end
    object UniQuery_GiftParamIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object UniQuery_GiftParamStatus: TIntegerField
      FieldName = 'Status'
      Required = True
    end
    object UniQuery_GiftParamStatusDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'StatusDesc'
      LookupDataSet = UniQuery_ManuDesc
      LookupKeyFields = 'ManuSheetStatusNo'
      LookupResultField = 'ManuSheetStatusDes'
      KeyFields = 'Status'
      Lookup = True
    end
  end
  object UniQuery_IMEIRelDesc: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_IMEIRel')
    Left = 712
    Top = 112
    object UniQuery_IMEIRelDescRelId: TIntegerField
      FieldName = 'RelId'
      ReadOnly = True
      Required = True
    end
    object UniQuery_IMEIRelDescIMEIRelNo: TStringField
      FieldName = 'IMEIRelNo'
      Required = True
    end
    object UniQuery_IMEIRelDescIMEIRelDes: TStringField
      FieldName = 'IMEIRelDes'
      Required = True
    end
    object UniQuery_IMEIRelDesc_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object UniQuery_ManuDesc: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_ManuSheetStatus')
    Left = 712
    Top = 152
    object UniQuery_ManuDescStatusId: TIntegerField
      FieldName = 'StatusId'
      ReadOnly = True
      Required = True
    end
    object UniQuery_ManuDescManuSheetStatusNo: TStringField
      FieldName = 'ManuSheetStatusNo'
      Required = True
    end
    object UniQuery_ManuDescManuSheetStatusDes: TStringField
      FieldName = 'ManuSheetStatusDes'
      Required = True
    end
    object UniQuery_ManuDesc_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
end
