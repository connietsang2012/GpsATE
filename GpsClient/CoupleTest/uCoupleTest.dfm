inherited frmCoupleTest: TfrmCoupleTest
  Left = 94
  Top = 192
  Width = 1344
  Height = 641
  Caption = #32806#21512#27979#35797#20301
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 11
  inherited pnlClient: TPanel
    Width = 1336
    Height = 607
    inherited pnlLeft: TPanel
      Width = 1231
      Height = 605
      inherited pnlClientTop: TPanel
        Width = 1229
        Visible = False
        inherited cbbCom_0: TComboBox
          Visible = True
        end
      end
      inherited pnlClientBottom: TPanel
        Top = 544
        Width = 1229
        Height = 60
        Visible = False
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 1231
      Height = 605
      Align = alClient
      TabOrder = 1
      object grp1: TGroupBox
        Left = 0
        Top = 0
        Width = 508
        Height = 254
        Caption = #30333#21345#27979#35797#32467#26524'('#20018#21475#19968')'
        TabOrder = 0
        object pnl3: TPanel
          Left = 2
          Top = 13
          Width = 504
          Height = 190
          Align = alClient
          TabOrder = 0
          object pnl2: TPanel
            Left = 1
            Top = 1
            Width = 502
            Height = 188
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnl4: TPanel
              Left = 1
              Top = 1
              Width = 500
              Height = 47
              Align = alTop
              TabOrder = 0
              object lbl7: TLabel
                Left = 31
                Top = 9
                Width = 39
                Height = 19
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
                Left = 5
                Top = 4
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
                Left = 5
                Top = 4
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
                Left = 74
                Top = 7
                Width = 66
                Height = 19
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_1: TButton
                Left = 148
                Top = 7
                Width = 72
                Height = 18
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
                Left = 416
                Top = 4
                Width = 80
                Height = 21
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest1Click
              end
              object btnBtn_ResultEnable: TButton
                Left = 327
                Top = 5
                Width = 80
                Height = 21
                Caption = #26597#30475
                TabOrder = 3
                OnClick = btnBtn_ResultEnableClick
              end
              object cbbComAgilent_1: TComboBox
                Left = 74
                Top = 27
                Width = 66
                Height = 19
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 4
              end
              object btnStartAgilent_1: TButton
                Left = 148
                Top = 27
                Width = 72
                Height = 18
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                OnClick = btnStartAgilent_1Click
              end
              object CheckBoxAutoTestCom1: TCheckBox
                Left = 227
                Top = 16
                Width = 89
                Height = 17
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 6
              end
            end
            object pnlTestResult_1: TPanel
              Left = 1
              Top = 48
              Width = 500
              Height = 139
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 1
              object TestResultDetail_1: TDBGrid
                Left = 1
                Top = 1
                Width = 498
                Height = 137
                Align = alClient
                DataSource = DS_TestResult_1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
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
          Top = 203
          Width = 504
          Height = 27
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_1: TStatusBar
          Left = 2
          Top = 230
          Width = 504
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
        Left = 508
        Top = 0
        Width = 507
        Height = 254
        Caption = #30333#21345#27979#35797#32467#26524'('#20018#21475#20108')'
        TabOrder = 1
        object pnlResult1: TPanel
          Left = 2
          Top = 13
          Width = 503
          Height = 190
          Align = alClient
          TabOrder = 0
          object pnlResult2: TPanel
            Left = 1
            Top = 1
            Width = 501
            Height = 188
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlResult3: TPanel
              Left = 1
              Top = 1
              Width = 499
              Height = 47
              Align = alTop
              TabOrder = 0
              object lbl4: TLabel
                Left = 31
                Top = 9
                Width = 39
                Height = 19
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
                Left = 5
                Top = 4
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
                Left = 5
                Top = 4
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
                Left = 74
                Top = 7
                Width = 66
                Height = 19
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_2: TButton
                Left = 148
                Top = 7
                Width = 72
                Height = 18
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
                Left = 406
                Top = 4
                Width = 89
                Height = 21
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest2Click
              end
              object cbbComAgilent_2: TComboBox
                Left = 74
                Top = 27
                Width = 66
                Height = 19
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 3
              end
              object btnStartAgilent_2: TButton
                Left = 148
                Top = 27
                Width = 72
                Height = 18
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnClick = btnStartAgilent_2Click
              end
              object CheckBoxAutoTestCom2: TCheckBox
                Left = 227
                Top = 16
                Width = 97
                Height = 17
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 5
              end
            end
            object pnlTestResult_2: TPanel
              Left = 1
              Top = 48
              Width = 499
              Height = 139
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 1
              object TestResultDetail_2: TDBGrid
                Left = 1
                Top = 1
                Width = 497
                Height = 137
                Align = alClient
                DataSource = DS_TestResult_2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
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
          Top = 203
          Width = 503
          Height = 27
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_2: TStatusBar
          Left = 2
          Top = 230
          Width = 503
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
        Top = 257
        Width = 508
        Height = 254
        Caption = #30333#21345#27979#35797#32467#26524'('#20018#21475#19977')'
        TabOrder = 2
        object pnlResult4: TPanel
          Left = 2
          Top = 13
          Width = 504
          Height = 190
          Align = alClient
          TabOrder = 0
          object pnlResult5: TPanel
            Left = 1
            Top = 1
            Width = 502
            Height = 188
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlTestResult_3: TPanel
              Left = 1
              Top = 48
              Width = 500
              Height = 139
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 0
              object TestResultDetail_3: TDBGrid
                Left = 1
                Top = 1
                Width = 498
                Height = 137
                Align = alClient
                DataSource = DS_TestResult_3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
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
              Width = 500
              Height = 47
              Align = alTop
              TabOrder = 1
              object lbl2: TLabel
                Left = 31
                Top = 9
                Width = 39
                Height = 19
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
                Left = 5
                Top = 4
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
                Left = 5
                Top = 4
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
                Left = 74
                Top = 7
                Width = 66
                Height = 19
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_3: TButton
                Left = 148
                Top = 7
                Width = 72
                Height = 18
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
                Left = 406
                Top = 4
                Width = 89
                Height = 21
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest3Click
              end
              object cbbComAgilent_3: TComboBox
                Left = 74
                Top = 27
                Width = 66
                Height = 19
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 3
              end
              object btnStartAgilent_3: TButton
                Left = 148
                Top = 27
                Width = 72
                Height = 18
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnClick = btnStartAgilent_3Click
              end
              object CheckBoxAutoTestCom3: TCheckBox
                Left = 227
                Top = 16
                Width = 97
                Height = 17
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 5
              end
            end
          end
        end
        object TestResult3: TPanel
          Left = 2
          Top = 203
          Width = 504
          Height = 27
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_3: TStatusBar
          Left = 2
          Top = 230
          Width = 504
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
        Left = 508
        Top = 257
        Width = 507
        Height = 254
        Caption = #30333#21345#27979#35797#32467#26524'('#20018#21475#22235')'
        TabOrder = 3
        object pnlResult9: TPanel
          Left = 2
          Top = 13
          Width = 503
          Height = 190
          Align = alClient
          TabOrder = 0
          object pnlResult10: TPanel
            Left = 1
            Top = 1
            Width = 501
            Height = 188
            Align = alClient
            Caption = 'Panel1'
            TabOrder = 0
            object pnlResult11: TPanel
              Left = 1
              Top = 1
              Width = 499
              Height = 47
              Align = alTop
              TabOrder = 0
              object lbl3: TLabel
                Left = 31
                Top = 9
                Width = 39
                Height = 19
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
                Left = 5
                Top = 4
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
                Left = 5
                Top = 4
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
                Left = 74
                Top = 7
                Width = 66
                Height = 19
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 0
              end
              object btnStart_4: TButton
                Left = 148
                Top = 7
                Width = 72
                Height = 18
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
                Left = 406
                Top = 4
                Width = 89
                Height = 21
                BiDiMode = bdLeftToRight
                Caption = #37325#26032#27979#35797
                ParentBiDiMode = False
                TabOrder = 2
                OnClick = btnReTest4Click
              end
              object cbbComAgilent_4: TComboBox
                Left = 74
                Top = 27
                Width = 66
                Height = 19
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                ParentFont = False
                TabOrder = 3
              end
              object btnStartAgilent_4: TButton
                Left = 148
                Top = 27
                Width = 72
                Height = 18
                Caption = #36830#25509
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnClick = btnStartAgilent_4Click
              end
              object CheckBoxAutoTestCom4: TCheckBox
                Left = 227
                Top = 16
                Width = 97
                Height = 17
                Caption = #33258#21160#26816#27979#20018#21475
                TabOrder = 5
              end
              object cbbComAgilent_5: TComboBox
                Left = 432
                Top = 32
                Width = 66
                Height = 19
                ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                ItemHeight = 11
                TabOrder = 6
                Visible = False
              end
            end
            object pnlTestResult_4: TPanel
              Left = 1
              Top = 48
              Width = 499
              Height = 139
              Align = alClient
              Caption = 'pnlTestResult_1'
              TabOrder = 1
              object TestResultDetail_4: TDBGrid
                Left = 1
                Top = 1
                Width = 497
                Height = 137
                Align = alClient
                DataSource = DS_TestResult_4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
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
          Top = 203
          Width = 503
          Height = 27
          Align = alBottom
          Color = clRed
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object SB_TestStatus_4: TStatusBar
          Left = 2
          Top = 230
          Width = 503
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
    object Panel1: TPanel
      Left = 1232
      Top = 1
      Width = 103
      Height = 605
      Align = alRight
      TabOrder = 2
      object rbUseBox: TRadioButton
        Left = 7
        Top = 81
        Width = 95
        Height = 15
        Caption = #20351#29992#23631#34109#31665
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbUseBoxClick
      end
      object rbDisUseBox: TRadioButton
        Left = 7
        Top = 108
        Width = 95
        Height = 15
        Caption = #19981#20351#29992#23631#34109#31665
        TabOrder = 1
        OnClick = rbDisUseBoxClick
      end
    end
  end
  inherited CommAgilent_1: TComm
    OnReceiveData = CommAgilent_1ReceiveData
  end
  inherited CommAgilent_2: TComm
    OnReceiveData = CommAgilent_2ReceiveData
  end
  inherited CommAgilent_3: TComm
    OnReceiveData = CommAgilent_3ReceiveData
  end
  inherited CommAgilent_4: TComm
    OnReceiveData = CommAgilent_4ReceiveData
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
  object UniQuery_TestResult_3: TUniQuery [27]
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result3')
    Left = 72
    Top = 368
    object intgrfld5: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object SF11: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object SF12: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object SF13: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object SF14: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object DS_TestResult_3: TDataSource [28]
    DataSet = UniQuery_TestResult_3
    Left = 40
    Top = 368
  end
  object UniQuery_TestResult_4: TUniQuery [29]
    Connection = DMMain.UniConnectionAutoTest
    SQL.Strings = (
      'select * from t_Test_Result4')
    Left = 672
    Top = 384
    object intgrfld6: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object SF15: TStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object SF16: TStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object SF17: TStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object SF18: TStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object DS_TestResult_4: TDataSource [30]
    DataSet = UniQuery_TestResult_4
    Left = 640
    Top = 384
  end
  object tmrCheckComm1: TTimer [40]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm1Timer
    Left = 374
    Top = 112
  end
  object tmrCheckComm2: TTimer [41]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm2Timer
    Left = 406
    Top = 112
  end
  object tmrCheckComm3: TTimer [42]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm3Timer
    Left = 438
    Top = 112
  end
  object tmrCheckComm4: TTimer [43]
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckComm4Timer
    Left = 470
    Top = 112
  end
end
