inherited frmTwiceTest: TfrmTwiceTest
  Left = 412
  Top = 77
  Width = 1135
  Height = 762
  Caption = #20135#21697#36820#24037#27979#35797#20301
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited pnlClient: TPanel
    Width = 1127
    Height = 728
    inherited pnlLeft: TPanel
      Top = 129
      Width = 1125
      Height = 598
      inherited pnlClientTop: TPanel
        Width = 1123
        Height = 49
        inherited imgCommRed_0: TImage
          Left = 49
          Top = 8
        end
        inherited imgCommGreen_0: TImage
          Left = 49
          Top = 8
        end
        inherited lbl1: TLabel
          Left = 85
          Top = 11
        end
        inherited Label1: TLabel
          Left = 536
          Top = 11
        end
        inherited btnStart_0: TButton
          Left = 231
          Top = 11
        end
        inherited cbbCom_0: TComboBox
          Left = 132
          Top = 11
          Visible = True
        end
        inherited EdtVersion_0: TEdit
          Left = 632
          Top = 11
          Height = 25
        end
        inherited BtnReTest: TButton
          Left = 334
          Top = 11
        end
        inherited CheckBoxAutoTestCom0: TCheckBox
          Left = 426
          Top = 17
        end
      end
      inherited pnlClientBottom: TPanel
        Top = 546
        Width = 1123
      end
      object EdtImei: TEdit
        Left = 194
        Top = 136
        Width = 486
        Height = 42
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -48
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
        Top = 477
        Width = 1123
        Height = 69
        Align = alBottom
        Alignment = taCenter
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -55
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
        ParentFont = False
        TabOrder = 3
      end
    end
    object rb_Imei: TRadioButton
      Left = 30
      Top = 238
      Width = 153
      Height = 42
      BiDiMode = bdRightToLeft
      Caption = 'IMEI'#36820#24037
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = #23435#20307
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = rb_ImeiClick
    end
    object rb_Rid: TRadioButton
      Left = 30
      Top = 170
      Width = 153
      Height = 43
      BiDiMode = bdRightToLeft
      Caption = 'RID'#36820#24037
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = #23435#20307
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnClick = rb_RidClick
    end
    object rbUpdateVersion: TRadioButton
      Left = 30
      Top = 305
      Width = 153
      Height = 42
      BiDiMode = bdRightToLeft
      Caption = #36719#20214#21319#32423
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
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
      Width = 1125
      Height = 128
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 4
      object grp_TestPlan: TGroupBox
        Left = 1
        Top = 62
        Width = 1123
        Height = 61
        Align = alTop
        Caption = #38656#36820#24037#30340#27979#35797#24037#20301'('#31649#29702#21592#25165#21487#36873#25321#25152#38656#36820#24037#30340#24037#20301#65292#21542#21017#20026#20840#37096#24037#20301#37117#35201#36820#24037')'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object chk_FuncTest: TCheckBox
          Left = 657
          Top = 27
          Width = 152
          Height = 14
          Caption = #21151#33021#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 0
          Visible = False
        end
        object chk_GPSTest: TCheckBox
          Left = 826
          Top = 27
          Width = 152
          Height = 14
          Caption = 'GPS'#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 1
          Visible = False
        end
        object chk_CoupleTest: TCheckBox
          Left = 287
          Top = 34
          Width = 152
          Height = 14
          Caption = #32806#21512#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object chk_WriteImei: TCheckBox
          Left = 616
          Top = 34
          Width = 152
          Height = 14
          Caption = 'IMEI'#28903#20889#20301
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object chk_ParamDownload: TCheckBox
          Left = 451
          Top = 34
          Width = 152
          Height = 14
          Caption = #36719#20214#21442#25968#19979#36733#20301
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object chk_ALL: TCheckBox
          Left = 34
          Top = 34
          Width = 82
          Height = 14
          Caption = #25152#26377
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = chk_ALLClick
        end
        object chk_AutoTest: TCheckBox
          Left = 115
          Top = 34
          Width = 152
          Height = 14
          Caption = #33258#21160#27979#35797#20301
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object chk_CartonBox: TCheckBox
          Left = 778
          Top = 47
          Width = 153
          Height = 15
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
        Width = 1123
        Height = 61
        Align = alTop
        Caption = #38656#36820#24037#30340#27979#35797#20301'(SMT)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object chk_AutoTestSMT: TCheckBox
          Left = 122
          Top = 34
          Width = 152
          Height = 14
          Caption = #33258#21160#27979#35797#20301'(SMT)'
          TabOrder = 0
        end
        object chk_SMTIQCTest: TCheckBox
          Left = 287
          Top = 34
          Width = 152
          Height = 14
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
