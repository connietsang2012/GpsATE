object frmDataRelResult: TfrmDataRelResult
  Left = 211
  Top = 151
  Width = 790
  Height = 480
  Caption = #25968#25454#20851#31995#26597#35810
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
    Width = 782
    Height = 129
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
      Width = 778
      Height = 106
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
        Left = 226
        Top = 24
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SIM'#21345':'
      end
      object Label8: TLabel
        Left = 18
        Top = 64
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'ICCID:'
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
      object edt_SIM: TEdit
        Left = 272
        Top = 24
        Width = 148
        Height = 21
        TabOrder = 3
      end
      object edt_ICCID: TEdit
        Left = 64
        Top = 64
        Width = 361
        Height = 21
        TabOrder = 4
      end
    end
  end
  object GroupBoxSearRes: TGroupBox
    Left = 0
    Top = 129
    Width = 782
    Height = 317
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 778
      Height = 300
      Align = alClient
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SN'
          Footers = <>
          Title.Alignment = taCenter
          Width = 230
        end
        item
          EditButtons = <>
          FieldName = 'IMEI'
          Footers = <>
          Title.Alignment = taCenter
          Width = 120
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'SoftModel'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26426#22411
          Width = 100
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
          Width = 60
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'TesterId'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27979#35797#21592
          Width = 70
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'TestTime'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27979#35797#26102#38388
          Width = 130
        end>
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 15
      Width = 778
      Height = 300
      Align = alClient
      Caption = #21345#36890#25968#25454
      TabOrder = 1
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 15
        Width = 774
        Height = 283
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
        OnDblClick = DBGridEh2DblClick
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI1'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'IMEI'
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI2'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'SN'
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI3'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'SIM'#21345
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI4'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'ICCID'
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI5'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26234#33021#38145'ID'
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI6'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #34013#29273'ID'
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI7'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35774#22791#21495
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI8'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26381#21153#21345#21495
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI9'
            Footers = <>
            Title.Alignment = taCenter
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI10'
            Footers = <>
            Title.Alignment = taCenter
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI11'
            Footers = <>
            Title.Alignment = taCenter
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'IMEI12'
            Footers = <>
            Title.Alignment = taCenter
            Width = 150
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ZhiDan'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21046#21333#21495
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'TestTime'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '_MASK_FROM_V2'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'SN'
            Footers = <>
          end>
      end
    end
  end
  object DataSrcTestResult: TDataSource
    DataSet = UniQry_DataRelResult
    Left = 536
    Top = 112
  end
  object UniQry_DataRelResult: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  FROM DataRelativeSheet')
    Active = True
    Left = 576
    Top = 112
    object UniQry_DataRelResultSN: TStringField
      FieldName = 'SN'
      Size = 50
    end
    object UniQry_DataRelResultIMEI1: TStringField
      FieldName = 'IMEI1'
      Required = True
      Size = 50
    end
    object UniQry_DataRelResultIMEI2: TStringField
      FieldName = 'IMEI2'
      Size = 50
    end
    object UniQry_DataRelResultIMEI3: TStringField
      FieldName = 'IMEI3'
      Size = 50
    end
    object UniQry_DataRelResultIMEI4: TStringField
      FieldName = 'IMEI4'
      Size = 50
    end
    object UniQry_DataRelResultIMEI5: TStringField
      FieldName = 'IMEI5'
      Size = 50
    end
    object UniQry_DataRelResultIMEI6: TStringField
      FieldName = 'IMEI6'
      Size = 50
    end
    object UniQry_DataRelResultIMEI7: TStringField
      FieldName = 'IMEI7'
      Size = 50
    end
    object UniQry_DataRelResultIMEI8: TStringField
      FieldName = 'IMEI8'
      Size = 50
    end
    object UniQry_DataRelResultIMEI9: TStringField
      FieldName = 'IMEI9'
      Size = 50
    end
    object UniQry_DataRelResultIMEI10: TStringField
      FieldName = 'IMEI10'
      Size = 50
    end
    object UniQry_DataRelResultIMEI11: TStringField
      FieldName = 'IMEI11'
      Size = 50
    end
    object UniQry_DataRelResultIMEI12: TStringField
      FieldName = 'IMEI12'
      Size = 50
    end
    object UniQry_DataRelResultZhiDan: TStringField
      FieldName = 'ZhiDan'
      Size = 50
    end
    object UniQry_DataRelResultTestTime: TDateTimeField
      FieldName = 'TestTime'
      Required = True
    end
    object UniQry_DataRelResult_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 704
    Top = 152
  end
end
