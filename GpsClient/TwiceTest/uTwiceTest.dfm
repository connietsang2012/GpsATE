inherited frmTwiceTest: TfrmTwiceTest
  Left = 190
  Top = 114
  Width = 1036
  Height = 762
  Caption = #20135#21697#36820#24037#27979#35797#20301
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlClient: TPanel
    Width = 1028
    Height = 728
    inherited pnlLeft: TPanel
      Top = 152
      Width = 1026
      Height = 575
      inherited pnlClientTop: TPanel
        Width = 1024
        Height = 58
        inherited imgCommRed_0: TImage
          Left = 58
          Top = 9
        end
        inherited imgCommGreen_0: TImage
          Left = 58
          Top = 9
        end
        inherited lbl1: TLabel
          Left = 100
          Top = 13
        end
        inherited Label1: TLabel
          Left = 633
          Top = 13
        end
        inherited btnStart_0: TButton
          Left = 273
          Top = 13
        end
        inherited cbbCom_0: TComboBox
          Left = 156
          Top = 13
          Visible = True
        end
        inherited EdtVersion_0: TEdit
          Left = 747
          Top = 13
          Height = 25
        end
        inherited BtnReTest: TButton
          Left = 395
          Top = 13
        end
        inherited CheckBoxAutoTestCom0: TCheckBox
          Left = 503
          Top = 20
        end
      end
      inherited pnlClientBottom: TPanel
        Top = 514
        Width = 1024
      end
      object EdtImei: TEdit
        Left = 229
        Top = 161
        Width = 575
        Height = 49
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -57
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        MaxLength = 15
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EdtImeiKeyPress
      end
      object redtPrompt: TRichEdit
        Left = 1
        Top = 432
        Width = 1024
        Height = 82
        Align = alBottom
        Alignment = taCenter
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ParentFont = False
        TabOrder = 3
      end
      object chk_CheckImei: TCheckBox
        Left = 824
        Top = 176
        Width = 97
        Height = 17
        Caption = #26657#39564'IMEI'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object rb_Imei: TRadioButton
      Left = 35
      Top = 281
      Width = 181
      Height = 50
      BiDiMode = bdRightToLeft
      Caption = 'IMEI'#36820#24037
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = #23435#20307
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = rb_ImeiClick
    end
    object rb_Rid: TRadioButton
      Left = 35
      Top = 201
      Width = 181
      Height = 51
      BiDiMode = bdRightToLeft
      Caption = 'RID'#36820#24037
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = #23435#20307
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnClick = rb_RidClick
    end
    object rbUpdateVersion: TRadioButton
      Left = 35
      Top = 360
      Width = 181
      Height = 50
      BiDiMode = bdRightToLeft
      Caption = #36719#20214#21319#32423
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = #23435#20307
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnClick = rbUpdateVersionClick
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1026
      Height = 151
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 4
      object grp_TestPlan: TGroupBox
        Left = 1
        Top = 73
        Width = 1024
        Height = 72
        Align = alTop
        Caption = #38656#36820#24037#30340#27979#35797#24037#20301'('#31649#29702#21592#25165#21487#36873#25321#25152#38656#36820#24037#30340#24037#20301#65292#21542#21017#20026#20840#37096#24037#20301#37117#35201#36820#24037')'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object chk_FuncTest: TCheckBox
          Left = 776
          Top = 32
          Width = 180
          Height = 16
          Caption = #21151#33021#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 0
          Visible = False
        end
        object chk_GPSTest: TCheckBox
          Left = 976
          Top = 32
          Width = 180
          Height = 16
          Caption = 'GPS'#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 1
          Visible = False
        end
        object chk_CoupleTest: TCheckBox
          Left = 339
          Top = 40
          Width = 180
          Height = 17
          Caption = #32806#21512#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object chk_WriteImei: TCheckBox
          Left = 728
          Top = 40
          Width = 180
          Height = 17
          Caption = 'IMEI'#28903#20889#20301
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object chk_ParamDownload: TCheckBox
          Left = 533
          Top = 40
          Width = 180
          Height = 17
          Caption = #36719#20214#21442#25968#19979#36733#20301
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object chk_ALL: TCheckBox
          Left = 40
          Top = 40
          Width = 97
          Height = 17
          Caption = #25152#26377
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = chk_ALLClick
        end
        object chk_AutoTest: TCheckBox
          Left = 136
          Top = 40
          Width = 180
          Height = 17
          Caption = #33258#21160#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object chk_CartonBox: TCheckBox
          Left = 919
          Top = 56
          Width = 181
          Height = 17
          Caption = #33258#21160#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 7
          Visible = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 1024
        Height = 72
        Align = alTop
        Caption = #38656#36820#24037#30340#27979#35797#20301'(SMT)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object chk_AutoTestSMT: TCheckBox
          Left = 144
          Top = 40
          Width = 180
          Height = 17
          Caption = #33258#21160#27979#35797#20301'(SMT)'
          TabOrder = 0
        end
        object chk_SMTIQCTest: TCheckBox
          Left = 339
          Top = 40
          Width = 180
          Height = 17
          Caption = 'SMT IQC'#27979#35797#20301
          TabOrder = 1
        end
      end
    end
  end
  inherited tmrRecCommTimeOut_0: TTimer
    Left = 294
    Top = 32
  end
  inherited tmrRecCommTimeOut_1: TTimer
    Left = 326
    Top = 32
  end
  inherited tmrRecCommTimeOut_2: TTimer
    OnTimer = nil
    Left = 910
    Top = 64
  end
  inherited tmrRecCommTimeOut_3: TTimer
    OnTimer = nil
    Left = 942
    Top = 64
  end
  inherited tmrRecCommTimeOut_4: TTimer
    OnTimer = nil
    Left = 974
    Top = 64
  end
  inherited tmrCountdown_0: TTimer
    Left = 16
    Top = 0
  end
  inherited tmrCountdown_1: TTimer
    Left = 24
    Top = 32
  end
  inherited tmrCountdown_2: TTimer
    Left = 56
    Top = 32
  end
  inherited tmrCountdown_3: TTimer
    Left = 88
    Top = 32
  end
  inherited tmrCountdown_4: TTimer
    Left = 120
    Top = 32
  end
  inherited tmrCheckAllowTest_1: TTimer
    OnTimer = nil
    Left = 878
  end
  inherited tmrCheckAllowTest_0: TTimer
    Left = 846
  end
  inherited tmrCheckComm0: TTimer
    Left = 512
    Top = 160
  end
  inherited Comm_0: TComm
    Left = 64
    Top = 65535
  end
  inherited Comm_1: TComm
    Left = 96
    Top = 65535
  end
  inherited Comm_2: TComm
    Left = 128
    Top = 65535
  end
  inherited Comm_3: TComm
    Left = 160
    Top = 65535
  end
  inherited Comm_4: TComm
    Left = 192
    Top = 65535
  end
end
