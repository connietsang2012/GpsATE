inherited frmIncomCheck: TfrmIncomCheck
  Left = 226
  Top = 145
  Caption = #20837#24211#26816#27979#20301
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 11
  inherited pnlClient: TPanel
    Width = 1441
    inherited pnlLeft: TPanel
      Width = 1439
      inherited pnlClientTop: TPanel
        Width = 1437
      end
      inherited pnlClientBottom: TPanel
        Width = 1437
      end
      object pnl1: TPanel
        Left = -8
        Top = 59
        Width = 1022
        Height = 518
        TabOrder = 2
        object grp1: TGroupBox
          Left = 0
          Top = 0
          Width = 508
          Height = 254
          Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#19968')'
          TabOrder = 0
          object pnl3: TPanel
            Left = 2
            Top = 13
            Width = 504
            Height = 187
            Align = alClient
            TabOrder = 0
            object pnl2: TPanel
              Left = 1
              Top = 1
              Width = 502
              Height = 185
              Align = alClient
              Caption = 'Panel1'
              TabOrder = 0
              object pnl4: TPanel
                Left = 1
                Top = 1
                Width = 500
                Height = 40
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
                end
                object btnBtn_ResultEnable: TButton
                  Left = 327
                  Top = 5
                  Width = 80
                  Height = 21
                  Caption = #26597#30475
                  TabOrder = 3
                end
                object chkAutoTestCom: TCheckBox
                  Left = 227
                  Top = 8
                  Width = 89
                  Height = 17
                  Caption = #33258#21160#26816#27979#20018#21475
                  TabOrder = 4
                end
              end
              object pnlTestResult_1: TPanel
                Left = 1
                Top = 41
                Width = 500
                Height = 143
                Align = alClient
                Caption = 'pnlTestResult_1'
                TabOrder = 1
                object dbgrdTestResultDetail_1: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 498
                  Height = 141
                  Align = alClient
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
          object pnlTestResult1: TPanel
            Left = 2
            Top = 200
            Width = 504
            Height = 30
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
          object statSB_TestStatus_1: TStatusBar
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
          Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#20108')'
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
                Height = 40
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
                end
                object chkAutoTestCom1: TCheckBox
                  Left = 227
                  Top = 9
                  Width = 97
                  Height = 17
                  Caption = #33258#21160#26816#27979#20018#21475
                  TabOrder = 3
                end
              end
              object pnlTestResult_2: TPanel
                Left = 1
                Top = 41
                Width = 499
                Height = 146
                Align = alClient
                Caption = 'pnlTestResult_1'
                TabOrder = 1
                object dbgrdTestResultDetail_2: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 497
                  Height = 144
                  Align = alClient
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
          object pnlTestResult2: TPanel
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
          object statSB_TestStatus_2: TStatusBar
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
          Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#19977')'
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
                Top = 41
                Width = 500
                Height = 146
                Align = alClient
                Caption = 'pnlTestResult_1'
                TabOrder = 0
                object dbgrdTestResultDetail_3: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 498
                  Height = 144
                  Align = alClient
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
                Height = 40
                Align = alTop
                TabOrder = 1
                object lbl5: TLabel
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
                end
                object chkAutoTestCom2: TCheckBox
                  Left = 227
                  Top = 16
                  Width = 97
                  Height = 17
                  Caption = #33258#21160#26816#27979#20018#21475
                  TabOrder = 3
                end
              end
            end
          end
          object pnlTestResult3: TPanel
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
          object statSB_TestStatus_3: TStatusBar
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
          Caption = 'SMT OQC'#27979#35797#32467#26524'('#20018#21475#22235')'
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
                Height = 40
                Align = alTop
                TabOrder = 0
                object lbl6: TLabel
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
                end
                object chkAutoTestCom3: TCheckBox
                  Left = 227
                  Top = 16
                  Width = 97
                  Height = 17
                  Caption = #33258#21160#26816#27979#20018#21475
                  TabOrder = 3
                end
                object cbbComAgilent_5: TComboBox
                  Left = 432
                  Top = 32
                  Width = 66
                  Height = 19
                  ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
                  ItemHeight = 11
                  TabOrder = 4
                  Visible = False
                end
              end
              object pnlTestResult_4: TPanel
                Left = 1
                Top = 41
                Width = 499
                Height = 146
                Align = alClient
                Caption = 'pnlTestResult_1'
                TabOrder = 1
                object dbgrdTestResultDetail_4: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 497
                  Height = 144
                  Align = alClient
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
          object pnlTestResult4: TPanel
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
          object statSB_TestStatus_4: TStatusBar
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
    end
  end
  object pnlBox: TPanel [3]
    Left = 0
    Top = 0
    Width = 1441
    Height = 57
    Caption = 'pnlBox'
    TabOrder = 2
    object lbl2: TLabel
      Left = 32
      Top = 24
      Width = 53
      Height = 21
      Caption = #31665#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 479
      Top = 24
      Width = 95
      Height = 21
      Caption = #27979#35797#21488#25968':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 770
      Top = 24
      Width = 137
      Height = 21
      Caption = #26412#31665#27979#35797#32467#26524':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 232
      Top = 24
      Width = 74
      Height = 21
      Caption = #30334#20998#27604':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtBoxNo: TEdit
      Left = 90
      Top = 24
      Width = 121
      Height = 19
      TabOrder = 0
    end
    object edtPercentage: TEdit
      Left = 321
      Top = 24
      Width = 121
      Height = 19
      TabOrder = 1
    end
    object edtTCount: TEdit
      Left = 587
      Top = 24
      Width = 121
      Height = 19
      TabOrder = 2
    end
    object pnlTestResultBox: TPanel
      Left = 944
      Top = 16
      Width = 465
      Height = 41
      Caption = 'pnlTestResultBox'
      Color = clGreen
      TabOrder = 3
    end
  end
end
