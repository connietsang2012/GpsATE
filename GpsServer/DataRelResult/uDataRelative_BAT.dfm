object frmDataRelative_BAT: TfrmDataRelative_BAT
  Left = 132
  Top = 199
  Width = 809
  Height = 480
  Caption = #30005#27744#25968#25454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxSeacCon: TGroupBox
    Left = 0
    Top = 0
    Width = 801
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 424
      Top = 18
      Width = 59
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #22522#24102'ID:'
    end
    object Label4: TLabel
      Left = 899
      Top = 18
      Width = 24
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #21040
    end
    object Label5: TLabel
      Left = 18
      Top = 48
      Width = 41
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'IMEI:'
    end
    object Label6: TLabel
      Left = 236
      Top = 48
      Width = 52
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26426'  '#22411':'
    end
    object Label7: TLabel
      Left = 424
      Top = 48
      Width = 59
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29256#26412#21495':'
    end
    object Label1: TLabel
      Left = 0
      Top = 18
      Width = 59
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #31665#21495':'
    end
    object BtnSearch: TButton
      Left = 823
      Top = 44
      Width = 70
      Height = 29
      Caption = #26597'  '#35810
      TabOrder = 0
    end
    object EditSN: TEdit
      Left = 486
      Top = 18
      Width = 212
      Height = 21
      TabOrder = 1
    end
    object DateTimePicker1: TDateTimePicker
      Left = 795
      Top = 18
      Width = 103
      Height = 19
      CalAlignment = dtaLeft
      Date = 41681
      Time = 41681
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object DateTimePicker2: TDateTimePicker
      Left = 923
      Top = 18
      Width = 103
      Height = 19
      CalAlignment = dtaLeft
      Date = 41681.9999884259
      Time = 41681.9999884259
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object CheckBoxTestTime: TCheckBox
      Left = 713
      Top = 18
      Width = 82
      Height = 20
      Caption = #27979#35797#26102#38388':'
      TabOrder = 4
    end
    object EditIMEI: TEdit
      Left = 64
      Top = 48
      Width = 148
      Height = 21
      TabOrder = 5
    end
    object BtnLogOut: TButton
      Left = 937
      Top = 44
      Width = 71
      Height = 29
      Caption = #23548' '#20986
      TabOrder = 6
    end
    object EdtSoftModel: TEdit
      Left = 292
      Top = 48
      Width = 118
      Height = 21
      TabOrder = 7
    end
    object EdtVersion: TEdit
      Left = 486
      Top = 48
      Width = 212
      Height = 21
      TabOrder = 8
    end
    object Edit1: TEdit
      Left = 64
      Top = 18
      Width = 145
      Height = 21
      TabOrder = 9
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 15
      Width = 797
      Height = 58
      Align = alTop
      TabOrder = 10
      object Label9: TLabel
        Left = 18
        Top = 24
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'IMEI:'
      end
      object Label2: TLabel
        Left = 232
        Top = 24
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #30005#27744#21495':'
      end
      object Button1: TButton
        Left = 534
        Top = 19
        Width = 70
        Height = 29
        Caption = #26597'  '#35810
        TabOrder = 0
        OnClick = Button1Click
      end
      object edt_IMEI: TEdit
        Left = 64
        Top = 24
        Width = 148
        Height = 21
        TabOrder = 1
      end
      object Button2: TButton
        Left = 648
        Top = 19
        Width = 71
        Height = 29
        Caption = #23548' '#20986
        TabOrder = 2
        OnClick = Button2Click
      end
      object edt_BAT: TEdit
        Left = 296
        Top = 24
        Width = 148
        Height = 21
        TabOrder = 3
      end
    end
  end
  object GroupBoxSearRes: TGroupBox
    Left = 0
    Top = 81
    Width = 801
    Height = 365
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 2
      Top = 15
      Width = 797
      Height = 348
      Align = alClient
      Caption = #26597#35810#25968#25454
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 2
        Top = 15
        Width = 793
        Height = 331
        Align = alClient
        DataSource = DataSrcTestResult
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Visible = False
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI'
            Footers = <>
            Title.Alignment = taCenter
            Width = 200
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'BAT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #30005#27744#21495
            Width = 120
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ZhiDan'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21046#21333
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TesterId'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32465#23450#21592
            Width = 100
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'TestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #32465#23450#26102#38388
            Width = 220
          end>
      end
    end
  end
  object UniQry_DataRelResult: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  FROM DataRelative_BAT')
    Left = 576
    Top = 112
    object UniQry_DataRelResultId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object UniQry_DataRelResultIMEI: TWideStringField
      FieldName = 'IMEI'
      Required = True
      Size = 50
    end
    object UniQry_DataRelResultBAT: TWideStringField
      FieldName = 'BAT'
      Required = True
      Size = 50
    end
    object UniQry_DataRelResultZhiDan: TWideStringField
      FieldName = 'ZhiDan'
      Required = True
      Size = 50
    end
    object UniQry_DataRelResultTesterId: TWideStringField
      FieldName = 'TesterId'
      Required = True
      Size = 50
    end
    object UniQry_DataRelResultTestTime: TDateTimeField
      FieldName = 'TestTime'
      Required = True
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 704
    Top = 152
  end
  object DataSrcTestResult: TDataSource
    DataSet = UniQry_DataRelResult
    Left = 536
    Top = 112
  end
end
