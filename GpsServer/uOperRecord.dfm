object FrmOperRecord: TFrmOperRecord
  Left = 269
  Top = 130
  Width = 1141
  Height = 558
  Caption = #26597#35810#25805#20316#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1133
    Height = 91
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 53
      Width = 1131
      Height = 37
      Align = alClient
      TabOrder = 0
      object LabelModel: TLabel
        Left = 10
        Top = 6
        Width = 45
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426#22411':'
        Visible = False
      end
      object LabelVersion: TLabel
        Left = 149
        Top = 6
        Width = 52
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36719#20214#29256#26412':'
        Visible = False
      end
      object LabelIMEI: TLabel
        Left = 361
        Top = 6
        Width = 42
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SN'#32534#21495':'
      end
      object EditSoftModel: TEdit
        Left = 59
        Top = 6
        Width = 72
        Height = 19
        TabOrder = 0
        Visible = False
      end
      object EditSoftVersion: TEdit
        Left = 202
        Top = 6
        Width = 152
        Height = 19
        TabOrder = 1
        Visible = False
      end
      object EditIMEI: TEdit
        Left = 404
        Top = 6
        Width = 121
        Height = 19
        AutoSize = False
        TabOrder = 2
      end
      object BtnSearchOperRecord: TButton
        Left = 611
        Top = 6
        Width = 60
        Height = 22
        Caption = #26597'  '#35810
        TabOrder = 3
        OnClick = BtnSearchOperRecordClick
      end
      object BtnClose: TButton
        Left = 681
        Top = 6
        Width = 60
        Height = 22
        Caption = #36864'  '#20986
        TabOrder = 4
        OnClick = BtnCloseClick
      end
      object BtnDeleteRecord: TButton
        Left = 862
        Top = 8
        Width = 75
        Height = 22
        Caption = #21024#38500#21382#21490#35760#24405
        TabOrder = 5
        Visible = False
        OnClick = BtnDeleteRecordClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1131
      Height = 52
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 45
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25805#20316#21592':'
      end
      object LblTest: TLabel
        Left = 149
        Top = 10
        Width = 52
        Height = 11
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26597#35810#36873#39033':'
      end
      object Label3: TLabel
        Left = 491
        Top = 10
        Width = 23
        Height = 11
        Caption = ' '#21040' '
      end
      object LabelTestResult: TLabel
        Left = 610
        Top = 13
        Width = 55
        Height = 11
        AutoSize = False
        Caption = #27979#35797#32467#26524#65306
        Visible = False
      end
      object EdtOperName: TEdit
        Left = 58
        Top = 10
        Width = 72
        Height = 19
        TabOrder = 0
      end
      object cbbTest: TComboBox
        Left = 201
        Top = 10
        Width = 120
        Height = 19
        ItemHeight = 11
        TabOrder = 1
        OnChange = cbbTestChange
        Items.Strings = (
          #30331#20837#26597#35810
          'SMT'#33258#21160#27979#35797#20301#32467#26524
          #32806#21512#27979#35797#20301#32467#26524
          #19979#36733#21442#25968#20301#32467#26524
          'IMEI'#28903#20889#20301#32467#26524
          #21345#36890#31665#27979#35797#20301#32467#26524
          'Gps'#27979#35797#32467#26524
          #33258#21160#27979#35797#20301#32467#26524
          #27979#35797#32467#26524)
      end
      object CheckBoxOperTime: TCheckBox
        Left = 356
        Top = 10
        Width = 49
        Height = 17
        Caption = #26102#38388':'
        TabOrder = 2
      end
      object DateTimePickerFrom: TDateTimePicker
        Left = 404
        Top = 10
        Width = 88
        Height = 19
        CalAlignment = dtaLeft
        Date = 41646.0000115741
        Time = 41646.0000115741
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 3
      end
      object DateTimePickerTo: TDateTimePicker
        Left = 514
        Top = 10
        Width = 88
        Height = 19
        CalAlignment = dtaLeft
        Date = 41647.9999884259
        Time = 41647.9999884259
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 662
        Top = 2
        Width = 143
        Height = 29
        TabOrder = 5
        Visible = False
        object RadioBtnFail: TRadioButton
          Left = 96
          Top = 8
          Width = 45
          Height = 17
          Caption = #22833#36133
          TabOrder = 0
        end
        object RadioBtnSuccess: TRadioButton
          Left = 50
          Top = 8
          Width = 45
          Height = 17
          Caption = #25104#21151
          TabOrder = 1
        end
        object RadioBtnAll: TRadioButton
          Left = 2
          Top = 8
          Width = 45
          Height = 17
          Caption = #20840#37096
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 91
    Width = 1133
    Height = 433
    Align = alClient
    Caption = #30331#20837#26597#35810
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGridEhSearchOperRecord: TDBGridEh
      Left = 2
      Top = 15
      Width = 1129
      Height = 416
      Align = alClient
      DataSource = DataSrcSearchOperRecord
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEhSearchOperRecordDblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OperName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#29992#25143#21517
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'OperContent'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#20869#23481
          Width = 600
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'OperTime'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#26102#38388
          Width = 150
        end>
    end
    object DBGridEhTest: TDBGridEh
      Left = 0
      Top = 120
      Width = 1161
      Height = 209
      DataSource = DataSrcTest
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEhTestDblClick
      Columns = <
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'SN'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'SN'#32534#21495
          Width = 240
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'IMEI'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'IMEI'#32534#21495
          Width = 120
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'SoftModel'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26426'   '#22411
          Width = 120
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'Version'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36719#20214#29256#26412#21495
          Width = 220
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Result'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27979#35797#32467#26524
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'TesterId'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#29992#25143
          Width = 90
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'TestTime'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27979#35797#26102#38388
          Width = 150
        end>
    end
    object DBGridEhTestResult: TDBGridEh
      Left = 8
      Top = 216
      Width = 1105
      Height = 201
      DataSource = DataSrcTestResult
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEhTestResultDblClick
      Columns = <
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'SN'
          Footers = <>
          Width = 240
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'IMEI'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'IMEI'#32534#21495
          Width = 120
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'SoftModel'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26426'   '#22411
          Width = 120
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'Version'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36719#20214#29256#26412#21495
          Width = 220
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'Result'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27979#35797#32467#26524#32467#35770
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ParamDownloadResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21442#25968#19979#36733#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'AutoTestSMTResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'SMT'#33258#21160#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'CoupleResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #32806#21512#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'WriteImeiResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'IMEI'#28903#20889#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'FunctionResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21151#33021#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'GPSResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'GPS'#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'AutoTestResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #33258#21160#27979#35797
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'SMTIQCResult'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'IQC'#27979#35797
          Width = 80
        end>
    end
  end
  object DataSrcSearchOperRecord: TDataSource
    AutoEdit = False
    DataSet = ADOStoredProcSearchOperRecord
    Left = 518
    Top = 121
  end
  object DataSrcTest: TDataSource
    DataSet = UniQryTest
    Left = 416
    Top = 280
  end
  object UniQryTest: TUniQuery
    Connection = DMMain.UniConGpsTest
    Left = 480
    Top = 272
  end
  object DataSrcTestResult: TDataSource
    DataSet = UniQryTestResult
    Left = 384
    Top = 384
  end
  object UniQryTestResult: TUniQuery
    Connection = DMMain.UniConGpsTest
    Left = 432
    Top = 384
  end
  object ADOStoredProcSearchOperRecord: TADOStoredProc
    Connection = DMMain.conConnGpsTest
    ProcedureName = 'SelectOperRecord;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@iOperName'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OperName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@OperTimeStart'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@OperTimeEnd'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@cResult'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end>
    Left = 472
    Top = 120
  end
  object ADOStoredProcDeleteOperRecord: TADOStoredProc
    Connection = DMMain.conConnGpsTest
    ProcedureName = 'DeleOperRecord;1'
    Parameters = <
      item
        Name = '@iOperName'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OperName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@OperTimeStart'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@OperTimeEnd'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 576
    Top = 128
  end
  object UniQryDeleteTest: TUniQuery
    Connection = DMMain.UniConGpsTest
    Left = 632
    Top = 400
  end
end
