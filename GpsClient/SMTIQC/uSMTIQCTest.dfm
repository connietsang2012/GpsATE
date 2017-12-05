inherited frmSMTIQCTest: TfrmSMTIQCTest
  Left = -24
  Top = 164
  Width = 1036
  Height = 780
  Caption = 'SMT OQC'#27979#35797#20301
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlClient: TPanel
    Width = 1028
    Height = 746
    inherited pnlLeft: TPanel
      Width = 1026
      Height = 744
      object lblPassCount: TLabel [0]
        Left = 1191
        Top = 66
        Width = 5
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl_TestCount: TLabel [1]
        Left = 1257
        Top = 151
        Width = 51
        Height = 13
        Caption = #24050#27979#21488#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel [2]
        Left = 1248
        Top = 85
        Width = 75
        Height = 13
        Caption = #35013#31665#25968#37327#35774#32622':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inherited pnlClientTop: TPanel
        Width = 1024
        Height = 59
        Visible = False
        inherited cbbCom_0: TComboBox
          Visible = True
        end
      end
      inherited pnlClientBottom: TPanel
        Top = 683
        Width = 1024
      end
      object btn2: TButton
        Left = 1257
        Top = 227
        Width = 87
        Height = 39
        Caption = #25171#21360
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn2Click
      end
      object chk1: TCheckBox
        Left = 268
        Top = 11
        Width = 115
        Height = 20
        Caption = #33258#21160#26816#27979#20018#21475
        TabOrder = 3
      end
      object edt_TestCount: TEdit
        Left = 1257
        Top = 180
        Width = 60
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object edt_setAutoTestCount: TEdit
        Left = 1257
        Top = 113
        Width = 60
        Height = 21
        TabOrder = 5
        Text = '150'
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 13
      Width = 1210
      Height = 612
      TabOrder = 1
      object grp1: TGroupBox
        Left = 0
        Top = 0
        Width = 600
        Height = 300
        Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#19968')'
        TabOrder = 0
        object pnl3: TPanel
          Left = 2
          Top = 15
          Width = 596
          Height = 229
          Align = alClient
          TabOrder = 0
          object pnl2: TPanel
            Left = 1
            Top = 1
            Width = 594
            Height = 227
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnl4: TPanel
              Left = 1
              Top = 1
              Width = 592
              Height = 47
              Align = alTop
              TabOrder = 0
              object lbl7: TLabel
                Left = 37
                Top = 11
                Width = 46
                Height = 22
                Alignment = taRightJustify
                AutoSize = False
                Caption = #20018#21475':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object imgCommGreen: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000AAAAAA00000
                  0000000000000000000AAAAAAAAAA00000000000000000000AAAAAAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA
                  0000000000000000AAAAAAAAAAAAAAAA000000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAAAAAAAAAAAAAAAAA00000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAFAAAAAAAAAAAAAAA00000000000000AAFAAAAAAAAAAAAAA
                  A00000000000000AAFFAAAAAAAAAAAAAA000000000000000AAFFAAAAAAAAAAAA
                  0000000000000000AAAFFAAAAAAAAAAA00000000000000000AAAFFAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000000AAAAAAAAAA000
                  000000000000000000000AAAAAA0000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
                Visible = False
              end
              object imgCommRed: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000099999900000
                  0000000000000000000999999999900000000000000000000999999999999990
                  0000000000000000099999999999999000000000000000009999999999999999
                  0000000000000000999999999999999900000000000000099999999999999999
                  9000000000000009999999999999999990000000000000099999999999999999
                  90000000000000099F9999999999999990000000000000099F99999999999999
                  90000000000000099FF9999999999999900000000000000099FF999999999999
                  0000000000000000999FF9999999999900000000000000000999FF9999999990
                  0000000000000000099999999999999000000000000000000009999999999000
                  0000000000000000000009999990000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
              end
              object cbbCom_1: TComboBox
                Left = 87
                Top = 8
                Width = 78
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_1: TButton
                Left = 175
                Top = 8
                Width = 85
                Height = 22
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btnStart_1Click
              end
              object btnReTest1: TButton
                Left = 492
                Top = 5
                Width = 94
                Height = 25
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest1Click
              end
              object btnBtn_ResultEnable: TButton
                Left = 386
                Top = 6
                Width = 95
                Height = 25
                Caption = #26597#30475
                TabOrder = 3
                OnClick = btnBtn_ResultEnableClick
              end
              object CheckBoxAutoTestCom1: TCheckBox
                Left = 268
                Top = 9
                Width = 105
                Height = 21
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 4
              end
            end
            object pnlTestResult_1: TPanel
              Left = 1
              Top = 48
              Width = 592
              Height = 178
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 1
              object TestResultDetail_1: TDBGrid
                Left = 1
                Top = 1
                Width = 590
                Height = 176
                Align = alClient
                DataSource = DS_TestResult_1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -16
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = TestResultDetail_1DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'SubTestItem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #23376#27979#35797#39033#30446
                    Width = 200
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TestResult'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #32467#26524
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TestValue'
                    Title.Alignment = taCenter
                    Title.Caption = #36820#22238#20540
                    Width = 300
                    Visible = True
                  end>
              end
            end
          end
        end
        object TestResult1: TPanel
          Left = 2
          Top = 244
          Width = 596
          Height = 32
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_1: TStatusBar
          Left = 2
          Top = 276
          Width = 596
          Height = 22
          Panels = <
            item
              Width = 100
            end
            item
              Width = 200
            end
            item
              Width = 200
            end>
          SimplePanel = False
        end
      end
      object grp2: TGroupBox
        Left = 600
        Top = 0
        Width = 600
        Height = 300
        Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#20108')'
        TabOrder = 1
        object pnlResult1: TPanel
          Left = 2
          Top = 15
          Width = 596
          Height = 229
          Align = alClient
          TabOrder = 0
          object pnlResult2: TPanel
            Left = 1
            Top = 1
            Width = 594
            Height = 227
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlResult3: TPanel
              Left = 1
              Top = 1
              Width = 592
              Height = 47
              Align = alTop
              TabOrder = 0
              object lbl4: TLabel
                Left = 37
                Top = 11
                Width = 46
                Height = 22
                Alignment = taRightJustify
                AutoSize = False
                Caption = #20018#21475':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object img1: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000AAAAAA00000
                  0000000000000000000AAAAAAAAAA00000000000000000000AAAAAAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA
                  0000000000000000AAAAAAAAAAAAAAAA000000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAAAAAAAAAAAAAAAAA00000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAFAAAAAAAAAAAAAAA00000000000000AAFAAAAAAAAAAAAAA
                  A00000000000000AAFFAAAAAAAAAAAAAA000000000000000AAFFAAAAAAAAAAAA
                  0000000000000000AAAFFAAAAAAAAAAA00000000000000000AAAFFAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000000AAAAAAAAAA000
                  000000000000000000000AAAAAA0000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
                Visible = False
              end
              object img2: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000099999900000
                  0000000000000000000999999999900000000000000000000999999999999990
                  0000000000000000099999999999999000000000000000009999999999999999
                  0000000000000000999999999999999900000000000000099999999999999999
                  9000000000000009999999999999999990000000000000099999999999999999
                  90000000000000099F9999999999999990000000000000099F99999999999999
                  90000000000000099FF9999999999999900000000000000099FF999999999999
                  0000000000000000999FF9999999999900000000000000000999FF9999999990
                  0000000000000000099999999999999000000000000000000009999999999000
                  0000000000000000000009999990000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
              end
              object cbbCom_2: TComboBox
                Left = 87
                Top = 8
                Width = 78
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_2: TButton
                Left = 175
                Top = 8
                Width = 85
                Height = 22
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btnStart_2Click
              end
              object btnReTest2: TButton
                Left = 480
                Top = 5
                Width = 105
                Height = 25
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest2Click
              end
              object CheckBoxAutoTestCom2: TCheckBox
                Left = 268
                Top = 11
                Width = 115
                Height = 20
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 3
              end
            end
            object pnlTestResult_2: TPanel
              Left = 1
              Top = 48
              Width = 592
              Height = 178
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 1
              object TestResultDetail_2: TDBGrid
                Left = 1
                Top = 1
                Width = 590
                Height = 176
                Align = alClient
                DataSource = DS_TestResult_2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -16
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = TestResultDetail_2DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'SubTestItem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #23376#27979#35797#39033#30446
                    Width = 200
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TestResult'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #32467#26524
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TestValue'
                    Title.Alignment = taCenter
                    Title.Caption = #36820#22238#20540
                    Width = 300
                    Visible = True
                  end>
              end
            end
          end
        end
        object TestResult2: TPanel
          Left = 2
          Top = 244
          Width = 596
          Height = 32
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_2: TStatusBar
          Left = 2
          Top = 276
          Width = 596
          Height = 22
          Panels = <
            item
              Width = 100
            end
            item
              Width = 200
            end
            item
              Width = 200
            end>
          SimplePanel = False
        end
      end
      object grp3: TGroupBox
        Left = 0
        Top = 304
        Width = 600
        Height = 300
        Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#19977')'
        TabOrder = 2
        object pnlResult4: TPanel
          Left = 2
          Top = 15
          Width = 596
          Height = 229
          Align = alClient
          TabOrder = 0
          object pnlResult5: TPanel
            Left = 1
            Top = 1
            Width = 594
            Height = 227
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlTestResult_3: TPanel
              Left = 1
              Top = 48
              Width = 592
              Height = 178
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 0
              object TestResultDetail_3: TDBGrid
                Left = 1
                Top = 1
                Width = 590
                Height = 176
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -16
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = TestResultDetail_3DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'SubTestItem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #23376#27979#35797#39033#30446
                    Width = 200
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TestResult'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #32467#26524
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TestValue'
                    Title.Alignment = taCenter
                    Title.Caption = #36820#22238#20540
                    Width = 300
                    Visible = True
                  end>
              end
            end
            object pnlResult6: TPanel
              Left = 1
              Top = 1
              Width = 592
              Height = 47
              Align = alTop
              TabOrder = 1
              object lbl2: TLabel
                Left = 37
                Top = 11
                Width = 46
                Height = 22
                Alignment = taRightJustify
                AutoSize = False
                Caption = #20018#21475':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object img3: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000AAAAAA00000
                  0000000000000000000AAAAAAAAAA00000000000000000000AAAAAAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA
                  0000000000000000AAAAAAAAAAAAAAAA000000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAAAAAAAAAAAAAAAAA00000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAFAAAAAAAAAAAAAAA00000000000000AAFAAAAAAAAAAAAAA
                  A00000000000000AAFFAAAAAAAAAAAAAA000000000000000AAFFAAAAAAAAAAAA
                  0000000000000000AAAFFAAAAAAAAAAA00000000000000000AAAFFAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000000AAAAAAAAAA000
                  000000000000000000000AAAAAA0000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
                Visible = False
              end
              object img4: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000099999900000
                  0000000000000000000999999999900000000000000000000999999999999990
                  0000000000000000099999999999999000000000000000009999999999999999
                  0000000000000000999999999999999900000000000000099999999999999999
                  9000000000000009999999999999999990000000000000099999999999999999
                  90000000000000099F9999999999999990000000000000099F99999999999999
                  90000000000000099FF9999999999999900000000000000099FF999999999999
                  0000000000000000999FF9999999999900000000000000000999FF9999999990
                  0000000000000000099999999999999000000000000000000009999999999000
                  0000000000000000000009999990000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
              end
              object cbbCom_3: TComboBox
                Left = 87
                Top = 8
                Width = 78
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_3: TButton
                Left = 175
                Top = 8
                Width = 85
                Height = 22
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btnStart_3Click
              end
              object btnReTest3: TButton
                Left = 480
                Top = 5
                Width = 105
                Height = 25
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest3Click
              end
              object CheckBoxAutoTestCom3: TCheckBox
                Left = 268
                Top = 19
                Width = 115
                Height = 20
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 3
              end
            end
          end
        end
        object TestResult3: TPanel
          Left = 2
          Top = 244
          Width = 596
          Height = 32
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_3: TStatusBar
          Left = 2
          Top = 276
          Width = 596
          Height = 22
          Panels = <
            item
              Width = 100
            end
            item
              Width = 200
            end
            item
              Width = 200
            end>
          SimplePanel = False
        end
      end
      object grp4: TGroupBox
        Left = 600
        Top = 304
        Width = 600
        Height = 300
        Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#22235')'
        TabOrder = 3
        object pnlResult9: TPanel
          Left = 2
          Top = 15
          Width = 596
          Height = 229
          Align = alClient
          TabOrder = 0
          object pnlResult10: TPanel
            Left = 1
            Top = 1
            Width = 594
            Height = 227
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlResult11: TPanel
              Left = 1
              Top = 1
              Width = 592
              Height = 47
              Align = alTop
              TabOrder = 0
              object lbl3: TLabel
                Left = 37
                Top = 11
                Width = 46
                Height = 22
                Alignment = taRightJustify
                AutoSize = False
                Caption = #20018#21475':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object img5: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000AAAAAA00000
                  0000000000000000000AAAAAAAAAA00000000000000000000AAAAAAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000AAAAAAAAAAAAAAAA
                  0000000000000000AAAAAAAAAAAAAAAA000000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAAAAAAAAAAAAAAAAA00000000000000AAAAAAAAAAAAAAAAA
                  A00000000000000AAFAAAAAAAAAAAAAAA00000000000000AAFAAAAAAAAAAAAAA
                  A00000000000000AAFFAAAAAAAAAAAAAA000000000000000AAFFAAAAAAAAAAAA
                  0000000000000000AAAFFAAAAAAAAAAA00000000000000000AAAFFAAAAAAAAA0
                  00000000000000000AAAAAAAAAAAAAA00000000000000000000AAAAAAAAAA000
                  000000000000000000000AAAAAA0000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
                Visible = False
              end
              object img6: TImage
                Left = 6
                Top = 5
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000099999900000
                  0000000000000000000999999999900000000000000000000999999999999990
                  0000000000000000099999999999999000000000000000009999999999999999
                  0000000000000000999999999999999900000000000000099999999999999999
                  9000000000000009999999999999999990000000000000099999999999999999
                  90000000000000099F9999999999999990000000000000099F99999999999999
                  90000000000000099FF9999999999999900000000000000099FF999999999999
                  0000000000000000999FF9999999999900000000000000000999FF9999999990
                  0000000000000000099999999999999000000000000000000009999999999000
                  0000000000000000000009999990000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF
                  FFE007FFFF8001FFFF0000FFFF0000FFFE00007FFE00007FFC00003FFC00003F
                  FC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFF0000FF
                  FF8001FFFFE007FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF}
              end
              object cbbCom_4: TComboBox
                Left = 87
                Top = 8
                Width = 78
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_4: TButton
                Left = 175
                Top = 8
                Width = 85
                Height = 22
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btnStart_4Click
              end
              object btnReTest4: TButton
                Left = 480
                Top = 5
                Width = 105
                Height = 25
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest4Click
              end
              object CheckBoxAutoTestCom4: TCheckBox
                Left = 268
                Top = 19
                Width = 115
                Height = 20
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 3
              end
              object cbbComAgilent_5: TComboBox
                Left = 511
                Top = 38
                Width = 78
                Height = 21
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 13
                TabOrder = 4
                Visible = False
              end
            end
            object pnlTestResult_4: TPanel
              Left = 1
              Top = 48
              Width = 592
              Height = 178
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 1
              object TestResultDetail_4: TDBGrid
                Left = 1
                Top = 1
                Width = 590
                Height = 176
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -16
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = TestResultDetail_4DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'SubTestItem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #23376#27979#35797#39033#30446
                    Width = 200
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TestResult'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #32467#26524
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TestValue'
                    Title.Alignment = taCenter
                    Title.Caption = #36820#22238#20540
                    Width = 300
                    Visible = True
                  end>
              end
            end
          end
        end
        object TestResult4: TPanel
          Left = 2
          Top = 244
          Width = 596
          Height = 32
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_4: TStatusBar
          Left = 2
          Top = 276
          Width = 596
          Height = 22
          Panels = <
            item
              Width = 100
            end
            item
              Width = 200
            end
            item
              Width = 200
            end>
          SimplePanel = False
        end
      end
    end
  end
  object UniQuery_TestResult_1: TUniQuery [23]
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result1')
    Left = 72
    Top = 136
    object intgrfldUniQuery_TestResult1Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object SFUniQuery_TestResult1TestItem: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object SFUniQuery_TestResult1SubTestItem: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object SFUniQuery_TestResult1TestResult: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object SFUniQuery_TestResult1TestValue: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object DS_TestResult_1: TDataSource [24]
    DataSet = UniQuery_TestResult_1
    Left = 40
    Top = 136
  end
  object UniQuery_TestResult_2: TUniQuery [25]
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result2')
    Left = 656
    Top = 136
    object intgrfldUniQuery_1Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object SFUniQuery_1TestItem: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object SFUniQuery_1SubTestItem: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object SFUniQuery_1TestResult: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object SFUniQuery_1TestValue: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object DS_TestResult_2: TDataSource [26]
    DataSet = UniQuery_TestResult_2
    Left = 624
    Top = 136
  end
  object tmrCheckComm1: TTimer [36]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm1Timer
    Left = 390
    Top = 104
  end
  object tmrCheckComm2: TTimer [37]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm2Timer
    Left = 422
    Top = 104
  end
  object tmrCheckComm3: TTimer [38]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm3Timer
    Left = 454
    Top = 104
  end
  object tmrCheckComm4: TTimer [39]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm4Timer
    Left = 486
    Top = 104
  end
  object unqry_TestResult_BoxCount: TUniQuery
    Connection = DMMain.UniConGpsTest
    Left = 1160
    Top = 208
  end
  object ds1_InsertOQCBoxCount: TDataSource
    DataSet = unqry_TestResult_BoxCount
    Left = 1160
    Top = 160
  end
  object btplctnSMTOQCPrint: TBTApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    Left = 1056
    Top = 288
  end
  object DS_DstSubItem: TDataSource
    DataSet = UniQuery_DstSubItem
    Left = 920
    Top = 144
  end
  object UniQuery_DstSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      
        'select * from Gps_OQC_DstSubItem WHERE Gps_OQC_DstSubItem.ItemMo' +
        'del=:ItemModel')
    Left = 952
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
    object intgrfldUniQuery_DstSubItemId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldSFUniQuery_DstSubItemItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldSFUniQuery_DstSubItemItemName: TStringField
      FieldName = 'ItemName'
      Required = True
      Size = 50
    end
  end
  object DS_TestItemParam_1: TDataSource
    DataSet = UniQuery_TestItemParam_ByItemName_1
    Left = 40
    Top = 96
  end
  object UniQuery_TestItemParam_ByItemName_1: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_OQC_SubItem')
    Left = 72
    Top = 96
    object UniQuery_TestItemParam_ByItemName_1Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1ItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1ItemName: TStringField
      FieldName = 'ItemName'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1SubItemName: TStringField
      FieldName = 'SubItemName'
      Required = True
      Size = 50
    end
    object UniQuery_TestItemParam_ByItemName_1SendAtComm: TBooleanField
      FieldName = 'SendAtComm'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1AtComm: TStringField
      FieldName = 'AtComm'
      Required = True
      Size = 100
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1ReturnText: TStringField
      FieldName = 'ReturnText'
      Required = True
      Size = 100
    end
    object UniQuery_TestItemParam_ByItemName_1ReSendNum: TIntegerField
      FieldName = 'ReSendNum'
      Required = True
    end
    object UniQuery_TestItemParam_ByItemName_1TestTimeOut: TIntegerField
      FieldName = 'TestTimeOut'
      Required = True
    end
    object UniQuery_TestItemParam_ByItemName_1Compare: TBooleanField
      FieldName = 'Compare'
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1CompareValue: TStringField
      FieldName = 'CompareValue'
      Size = 100
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1CompareRemark: TStringField
      FieldName = 'CompareRemark'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1Remark1: TStringField
      FieldName = 'Remark1'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1Remark2: TStringField
      FieldName = 'Remark2'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1Remark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1Remark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_1Remark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
    object UniQuery_TestItemParam_ByItemName_1_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object DS_TestItemParam_2: TDataSource
    AutoEdit = False
    DataSet = UniQuery_TestItemParam_ByItemName_2
    Left = 640
    Top = 96
  end
  object UniQuery_TestItemParam_ByItemName_2: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_OQC_SubItem')
    Left = 672
    Top = 96
    object UniQuery_TestItemParam_ByItemName_2Id: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2ItemModel: TStringField
      FieldName = 'ItemModel'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2ItemName: TStringField
      FieldName = 'ItemName'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2SubItemName: TStringField
      FieldName = 'SubItemName'
      Required = True
      Size = 50
    end
    object UniQuery_TestItemParam_ByItemName_2SendAtComm: TBooleanField
      FieldName = 'SendAtComm'
      Required = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2AtComm: TStringField
      FieldName = 'AtComm'
      Required = True
      Size = 100
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2ReturnText: TStringField
      FieldName = 'ReturnText'
      Required = True
      Size = 100
    end
    object UniQuery_TestItemParam_ByItemName_2ReSendNum: TIntegerField
      FieldName = 'ReSendNum'
      Required = True
    end
    object UniQuery_TestItemParam_ByItemName_2TestTimeOut: TIntegerField
      FieldName = 'TestTimeOut'
      Required = True
    end
    object UniQuery_TestItemParam_ByItemName_2Compare: TBooleanField
      FieldName = 'Compare'
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2CompareValue: TStringField
      FieldName = 'CompareValue'
      Size = 100
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2CompareRemark: TStringField
      FieldName = 'CompareRemark'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2Remark1: TStringField
      FieldName = 'Remark1'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2Remark2: TStringField
      FieldName = 'Remark2'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2Remark3: TStringField
      FieldName = 'Remark3'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2Remark4: TStringField
      FieldName = 'Remark4'
      Size = 200
    end
    object strngfldUniQuery_TestItemParam_ByItemName_2Remark5: TStringField
      FieldName = 'Remark5'
      Size = 200
    end
    object UniQuery_TestItemParam_ByItemName_2_MASK_FROM_V2: TBytesField
      FieldName = '_MASK_FROM_V2'
      ReadOnly = True
      Required = True
      Size = 8
    end
  end
  object DS_TestItemParam_3: TDataSource
    Left = 128
    Top = 368
  end
  object UniQuery_TestItemParam_ByItemName_3: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from Gps_OQC_SubItem')
    Left = 160
    Top = 368
    object intgrfldUniQuery_TestItemParam_ByItemName_3ID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3ItemModel: TStringField
      FieldName = 'ItemModel'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3ItemName: TStringField
      FieldName = 'ItemName'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3SubItemName: TStringField
      FieldName = 'SubItemName'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3SendAtComm: TStringField
      FieldName = 'SendAtComm'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3AtComm: TStringField
      FieldName = 'AtComm'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3ReturnText: TStringField
      FieldName = 'ReturnText'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3ReSendNum: TStringField
      FieldName = 'ReSendNum'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3TestTimeOut: TStringField
      FieldName = 'TestTimeOut'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3Compare: TStringField
      FieldName = 'Compare'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3CompareValue: TStringField
      FieldName = 'CompareValue'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3CompareRemark: TStringField
      FieldName = 'CompareRemark'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3Remark1: TStringField
      FieldName = 'Remark1'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3Remark2: TStringField
      FieldName = 'Remark2'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3Remark3: TStringField
      FieldName = 'Remark3'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3Remark4: TStringField
      FieldName = 'Remark4'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3Remark5: TStringField
      FieldName = 'Remark5'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_3_MASK_FROM_V2: TStringField
      FieldName = '_MASK_FROM_V2'
      Size = 255
    end
  end
  object DS_TestItemParam_4: TDataSource
    AutoEdit = False
    DataSet = UniQuery_TestItemParam_ByItemName_4
    Left = 600
    Top = 352
  end
  object UniQuery_TestItemParam_ByItemName_4: TUniQuery
    Connection = DMMain.con1
    SQL.Strings = (
      'select * from Gps_OQC_SubItem')
    Left = 632
    Top = 352
    object intgrfldUniQuery_TestItemParam_ByItemName_4ID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4ItemModel: TStringField
      FieldName = 'ItemModel'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4ItemName: TStringField
      FieldName = 'ItemName'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4SubItemName: TStringField
      FieldName = 'SubItemName'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4SendAtComm: TStringField
      FieldName = 'SendAtComm'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4AtComm: TStringField
      FieldName = 'AtComm'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4ReturnText: TStringField
      FieldName = 'ReturnText'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4ReSendNum: TStringField
      FieldName = 'ReSendNum'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4TestTimeOut: TStringField
      FieldName = 'TestTimeOut'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4Compare: TStringField
      FieldName = 'Compare'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4CompareValue: TStringField
      FieldName = 'CompareValue'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4CompareRemark: TStringField
      FieldName = 'CompareRemark'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4Remark1: TStringField
      FieldName = 'Remark1'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4Remark2: TStringField
      FieldName = 'Remark2'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4Remark3: TStringField
      FieldName = 'Remark3'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4Remark4: TStringField
      FieldName = 'Remark4'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4Remark5: TStringField
      FieldName = 'Remark5'
      Size = 255
    end
    object strngfldUniQuery_TestItemParam_ByItemName_4_MASK_FROM_V2: TStringField
      FieldName = '_MASK_FROM_V2'
      Size = 255
    end
  end
  object DS_TestResult_4: TDataSource
    DataSet = UniQuery_TestResult_4
    Left = 608
    Top = 400
  end
  object UniQuery_TestResult_4: TUniQuery
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result4')
    Left = 640
    Top = 400
    object intgrfldUniQuery_TestResult_4Id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
    end
    object strngfldSFUniQuery_TestResult_4TestItem: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object strngfldSFUniQuery_TestResult_4SubTestItem: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object strngfldSFUniQuery_TestResult_4TestResult: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object strngfldSFUniQuery_TestResult_4TestValue: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object UniQuery_TestResult_3: TUniQuery
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result3')
    Left = 152
    Top = 416
    object intgrfldUniQuery_TestResult_3Id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
    end
    object strngfldSFUniQuery_TestResult_3TestItem: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object strngfldSFUniQuery_TestResult_3SubTestItem: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object strngfldSFUniQuery_TestResult_3TestResult: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object strngfldSFUniQuery_TestResult_3TestValue: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object DS_TestResult_3: TDataSource
    AutoEdit = False
    DataSet = UniQuery_TestResult_3
    Left = 120
    Top = 416
  end
end
