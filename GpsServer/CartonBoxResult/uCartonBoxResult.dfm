object frmCartonBoxResult: TfrmCartonBoxResult
  Left = 46
  Top = 126
  Width = 1026
  Height = 480
  Caption = #21345#36890#25968#25454#26597#35810
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
    Width = 1018
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
      Width = 1014
      Height = 106
      Align = alTop
      TabOrder = 10
      object Label2: TLabel
        Left = 2
        Top = 76
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22522#24102'ID:'
      end
      object Label9: TLabel
        Left = 18
        Top = 40
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'IMEI:'
      end
      object Label10: TLabel
        Left = 223
        Top = 40
        Width = 52
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26426'  '#22411':'
      end
      object Label11: TLabel
        Left = 450
        Top = 43
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #29256#26412#21495':'
      end
      object Label12: TLabel
        Left = 0
        Top = 10
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #31665#21495':'
      end
      object Label13: TLabel
        Left = 216
        Top = 10
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21046#21333':'
      end
      object Label8: TLabel
        Left = 450
        Top = 15
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#30721':'
      end
      object Button1: TButton
        Left = 494
        Top = 67
        Width = 70
        Height = 29
        Caption = #26597'  '#35810
        TabOrder = 0
        OnClick = Button1Click
      end
      object edt_Rid: TEdit
        Left = 64
        Top = 72
        Width = 369
        Height = 21
        TabOrder = 1
      end
      object edt_IMEI: TEdit
        Left = 64
        Top = 40
        Width = 148
        Height = 21
        TabOrder = 2
      end
      object Button2: TButton
        Left = 608
        Top = 67
        Width = 71
        Height = 29
        Caption = #23548' '#20986
        TabOrder = 3
      end
      object edt_SoftModel: TEdit
        Left = 286
        Top = 40
        Width = 147
        Height = 21
        TabOrder = 4
      end
      object edt_Version: TEdit
        Left = 509
        Top = 43
        Width = 212
        Height = 21
        TabOrder = 5
      end
      object edt_BoxNo: TEdit
        Left = 64
        Top = 10
        Width = 145
        Height = 21
        TabOrder = 6
      end
      object edt_ZhiDan: TEdit
        Left = 286
        Top = 10
        Width = 147
        Height = 21
        TabOrder = 7
      end
      object edt_ProductCode: TEdit
        Left = 509
        Top = 10
        Width = 212
        Height = 21
        TabOrder = 8
      end
    end
  end
  object GroupBoxSearRes: TGroupBox
    Left = 0
    Top = 129
    Width = 1018
    Height = 317
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 1014
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
      Width = 1014
      Height = 300
      Align = alClient
      Caption = #21345#36890#25968#25454
      TabOrder = 1
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 15
        Width = 1010
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
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'BoxNo'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #31665#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'IMEI'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'IMEI'#21495
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'ZhiDan'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21046#21333
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'SoftModel'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26426#22411
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'Version'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36719#20214#29256#26412
            Width = 280
          end
          item
            EditButtons = <>
            FieldName = 'ProductCode'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20135#21697#32534#21495
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'Color'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #39068#33394
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'Qty'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25968#25454
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Weight'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #37325#37327
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'Date'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26085#26399
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'TACInfo'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'TAC'#20449#24687
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'CompanyName'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20844#21496#21517
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'TesterId'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#21592
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'TestTime'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#26102#38388
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'Remark1'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#19968
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'Remark2'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22522#24102'ID'
            Width = 260
          end
          item
            EditButtons = <>
            FieldName = 'Remark3'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#19977
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'Remark4'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#22235
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'Remark5'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880#20116
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = '_MASK_FROM_V2'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end>
      end
    end
  end
  object DataSrcTestResult: TDataSource
    DataSet = UniQry_CartonBoxResult
    Left = 544
    Top = 152
  end
  object UniQry_CartonBoxResult: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'SELECT *  FROM Gps_CartonBoxTwenty_Result')
    Left = 584
    Top = 152
  end
  object SaveDialog1: TSaveDialog
    Left = 704
    Top = 152
  end
end
