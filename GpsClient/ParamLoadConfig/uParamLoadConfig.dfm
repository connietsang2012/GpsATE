object frmParamDownLoadConfig: TfrmParamDownLoadConfig
  Left = -73
  Top = 215
  Width = 979
  Height = 563
  Caption = #19979#36733#21442#25968#37197#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 971
    Height = 77
    Align = alTop
    TabOrder = 0
    object lbl16: TLabel
      Left = 227
      Top = 28
      Width = 110
      Height = 39
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'IMEI'#21495#27573':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 529
      Top = 35
      Width = 21
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #8212#8212#8212#8212
      ParentBiDiMode = False
    end
    object lbl12: TLabel
      Left = 19
      Top = 33
      Width = 77
      Height = 34
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #21333#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 728
      Top = 33
      Width = 103
      Height = 34
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #25968#37327':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object edtEdt_IMEIEND: TEdit
      Left = 554
      Top = 26
      Width = 175
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 15
      ParentFont = False
      TabOrder = 0
      OnChange = edtEdt_IMEIENDChange
      OnKeyPress = edtEdt_IMEIENDKeyPress
    end
    object edtEdtOrNum: TEdit
      Left = 100
      Top = 28
      Width = 119
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      ParentFont = False
      TabOrder = 1
      OnChange = edtEdtOrNumChange
    end
    object edt_NUM: TEdit
      Left = 838
      Top = 28
      Width = 203
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      ParentFont = False
      TabOrder = 2
    end
    object edtEdt_IMEISTART: TEdit
      Left = 351
      Top = 26
      Width = 175
      Height = 25
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 15
      ParentFont = False
      TabOrder = 3
      OnChange = edtEdt_IMEISTARTChange
      OnKeyPress = edtEdt_IMEISTARTKeyPress
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 77
    Width = 971
    Height = 452
    ActivePage = ts1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabIndex = 0
    TabOrder = 1
    OnChange = pgc1Change
    object ts1: TTabSheet
      Caption = #21442#25968#37197#32622
      object pnl1: TPanel
        Left = 0
        Top = 67
        Width = 963
        Height = 350
        Align = alClient
        TabOrder = 0
        object DBGrid_Instruction: TDBGrid
          Left = 1
          Top = 1
          Width = 961
          Height = 348
          Align = alClient
          DataSource = DS_Module
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ItemModel'
              Title.Caption = #26426#22411
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ItemName'
              Title.Caption = #27979#35797#39033
              Width = 200
              Visible = True
            end>
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 963
        Height = 67
        Align = alTop
        TabOrder = 1
        object lbl_Result: TLabel
          Left = 681
          Top = 28
          Width = 6
          Height = 29
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -25
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cbb_SoftModel: TComboBox
          Left = 28
          Top = 19
          Width = 285
          Height = 28
          ItemHeight = 20
          TabOrder = 0
          OnChange = cbb_SoftModelChange
        end
        object btn_BuildOrder: TButton
          Left = 425
          Top = 19
          Width = 181
          Height = 39
          Caption = #29983#25104#35746#21333
          TabOrder = 1
          OnClick = btn_BuildOrderClick
        end
      end
    end
    object ts2: TTabSheet
      Caption = #35746#21333#20316#19994
      ImageIndex = 1
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 1138
        Height = 515
        Align = alClient
        DataSource = DS_BuileOrder
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'OrderNum'
            Title.Caption = #35746#21333#21495
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ItemModel'
            Title.Caption = #26426#22411
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMEISTART'
            Title.Caption = 'IMEI'#36215#22987
            Width = 185
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMEIEND'
            Title.Caption = 'IMEI'#32467#26463
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Count'
            Title.Caption = #25968#37327
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OrderTime'
            Title.Caption = #20135#29983#26085#26399
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Title.Caption = #35746#21333#29366#24577
            Width = 68
            Visible = True
          end>
      end
    end
  end
  object DS_Module: TDataSource
    DataSet = unqry_ParamDownloadDstSubItem
    Left = 816
    Top = 96
  end
  object unqry_ParamDownloadDstSubItem: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_ParamDownload_DstSubItem'
      'where ItemModel=:ItemModel')
    Left = 856
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ItemModel'
      end>
  end
  object DS_SoftModel: TDataSource
    DataSet = UniQuery_SoftModel
    Left = 816
    Top = 152
  end
  object UniQuery_SoftModel: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_AutoTest_Model order by model')
    Left = 856
    Top = 152
  end
  object DS_BuileOrder: TDataSource
    DataSet = UniQuery_BuileOrder
    Left = 816
    Top = 208
  end
  object UniQuery_BuileOrder: TUniQuery
    Connection = DMMain.UniConGpsTest
    SQL.Strings = (
      'select * from Gps_ParamConfigOrder'
      'order by ordertime desc')
    Left = 856
    Top = 208
  end
  object sp_BuildOr: TUniStoredProc
    StoredProcName = 'UpdateOrder'
    Connection = DMMain.UniConGpsTest
    Left = 816
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftWideString
        Name = 'cOrderNum'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'cImeiStart'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'cImeiEnd'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'cItemModel'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cCount'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cTestedCount'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Status'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UpdateResult'
        ParamType = ptOutput
        Value = 0
      end>
    CommandStoredProcName = 'UpdateOrder'
    StoredProcIsQuery = True
  end
end
