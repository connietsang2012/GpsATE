object FrmTestResult: TFrmTestResult
  Left = 81
  Top = 162
  Width = 1160
  Height = 688
  Caption = #21508#27979#35797#20301#32467#26524
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
  object GroupBoxSearRes: TGroupBox
    Left = 0
    Top = 65
    Width = 1152
    Height = 589
    Align = alClient
    Caption = #21508#24037#20301#27979#35797#32467#26524
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 13
      Width = 1148
      Height = 574
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
  end
  object GroupBoxSeacCon: TGroupBox
    Left = 0
    Top = 0
    Width = 1152
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 199
      Top = 15
      Width = 45
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27979#35797#21592':'
    end
    object Label2: TLabel
      Left = 5
      Top = 15
      Width = 45
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27979#35797#20301':'
    end
    object Label3: TLabel
      Left = 359
      Top = 15
      Width = 50
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #22522#24102'ID:'
    end
    object Label4: TLabel
      Left = 761
      Top = 15
      Width = 20
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Caption = #21040
    end
    object Label5: TLabel
      Left = 15
      Top = 41
      Width = 35
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'IMEI:'
    end
    object Label6: TLabel
      Left = 200
      Top = 41
      Width = 44
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26426'  '#22411':'
    end
    object Label7: TLabel
      Left = 359
      Top = 41
      Width = 50
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29256#26412#21495':'
    end
    object BtnSearch: TButton
      Left = 696
      Top = 37
      Width = 60
      Height = 25
      Caption = #26597'  '#35810
      TabOrder = 0
      OnClick = BtnSearchClick
    end
    object EditTester: TEdit
      Left = 247
      Top = 15
      Width = 100
      Height = 19
      TabOrder = 1
    end
    object ComboBoxTestPosition: TComboBox
      Left = 54
      Top = 15
      Width = 125
      Height = 19
      ItemHeight = 11
      TabOrder = 2
      OnChange = ComboBoxTestPositionChange
      Items.Strings = (
        'SMT'#33258#21160#27979#35797#20301#32467#26524
        #32806#21512#27979#35797#20301#32467#26524
        #21442#25968#19979#36733#20301#27979#35797#32467#26524
        #33258#21160#27979#35797#20301#32467#26524
        'IMEI'#28903#20889#20301#27979#35797#32467#26524
        #21345#36890#27979#35797#20301#32467#26524
        'SMTOQC'#27979#35797#20301#32467#26524
        'SMT'#27979#35797#20301#36820#24037#32467#26524
        'SMTOQC'#27979#35797#20301#36820#24037#32467#26524
        #32806#21512#27979#35797#20301#36820#24037#32467#26524
        #21442#25968#19979#36733#27979#35797#20301#36820#24037#32467#26524
        'IMEI'#28903#20889#27979#35797#20301#36820#24037#32467#26524
        #33258#21160#27979#35797#20301#36820#24037#32467#26524#21518)
    end
    object EditSN: TEdit
      Left = 411
      Top = 15
      Width = 180
      Height = 19
      TabOrder = 3
    end
    object DateTimePicker1: TDateTimePicker
      Left = 673
      Top = 15
      Width = 87
      Height = 19
      CalAlignment = dtaLeft
      Date = 41681
      Time = 41681
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
    end
    object DateTimePicker2: TDateTimePicker
      Left = 781
      Top = 15
      Width = 87
      Height = 19
      CalAlignment = dtaLeft
      Date = 41681.9999884259
      Time = 41681.9999884259
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
    end
    object CheckBoxTestTime: TCheckBox
      Left = 603
      Top = 15
      Width = 70
      Height = 17
      Caption = #27979#35797#26102#38388':'
      TabOrder = 6
    end
    object EditIMEI: TEdit
      Left = 54
      Top = 41
      Width = 125
      Height = 19
      TabOrder = 7
    end
    object BtnLogOut: TButton
      Left = 793
      Top = 37
      Width = 60
      Height = 25
      Caption = #23548' '#20986
      TabOrder = 8
      OnClick = BtnLogOutClick
    end
    object EdtSoftModel: TEdit
      Left = 247
      Top = 41
      Width = 100
      Height = 19
      TabOrder = 9
    end
    object EdtVersion: TEdit
      Left = 411
      Top = 41
      Width = 180
      Height = 19
      TabOrder = 10
    end
  end
  object DataSrcTestResult: TDataSource
    DataSet = UniQryTestResult
    Left = 544
    Top = 152
  end
  object UniQryTestResult: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from dbo.Gps_AutoTestSMT_Result')
    Left = 584
    Top = 152
  end
  object SaveDialog1: TSaveDialog
    Left = 704
    Top = 152
  end
end
