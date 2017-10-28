inherited frmTestWrong: TfrmTestWrong
  Left = 352
  Top = 181
  Caption = #27979#35797#38169#35823#25551#36848
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited DBGridEh1: TDBGridEh
        Enabled = True
        SortLocal = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'Index'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24207#21495
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'WrongName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#38169#35823#21517#31216
            Width = 200
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'WrongDes'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#38169#35823#25551#36848
            Width = 600
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 34
        Top = 34
        Width = 68
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22833#36133#20195#30721':'
      end
      object lbl2: TLabel
        Left = 34
        Top = 68
        Width = 68
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22833#36133#25551#36848':'
      end
      object Edt_WrongName: TDBEdit
        Left = 108
        Top = 29
        Width = 103
        Height = 19
        DataField = 'WrongName'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 0
        OnChange = Edt_WrongNameChange
      end
      object Edt_WrongDes: TDBEdit
        Left = 108
        Top = 64
        Width = 489
        Height = 19
        DataField = 'WrongDes'
        DataSource = DS_Module
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        TabOrder = 1
        OnChange = Edt_WrongDesChange
      end
    end
  end
  inherited DS_Module: TDataSource
    DataSet = UniQuery_TestWrong
  end
  object UniQuery_TestWrong: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_TestWrong')
    Active = True
    OnCalcFields = UniQuery_TestWrongCalcFields
    Left = 720
    Top = 88
    object SFUniQuery_TestWrongIndex: TStringField
      FieldKind = fkCalculated
      FieldName = 'Index'
      Calculated = True
    end
    object intgrfldUniQuery_TestWrongWrongId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'WrongId'
      ReadOnly = True
      Required = True
    end
    object SFUniQuery_TestWrongWrongName: TStringField
      FieldName = 'WrongName'
      Required = True
    end
    object SFUniQuery_TestWrongWrongDes: TStringField
      FieldName = 'WrongDes'
      Required = True
      Size = 100
    end
  end
end
