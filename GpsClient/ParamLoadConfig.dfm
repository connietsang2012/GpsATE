object frmParamDownLoadConfig: TfrmParamDownLoadConfig
  Left = 232
  Top = 160
  Width = 979
  Height = 563
  Caption = #21442#25968#37197#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 11
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 971
    Height = 65
    Align = alTop
    Caption = 'grp1'
    TabOrder = 0
    object lbl16: TLabel
      Left = 192
      Top = 30
      Width = 53
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'IMEI'#21495#27573':'
      ParentBiDiMode = False
    end
    object lbl17: TLabel
      Left = 408
      Top = 30
      Width = 17
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #8212#8212#8212#8212
      ParentBiDiMode = False
    end
    object lbl12: TLabel
      Left = 28
      Top = 28
      Width = 51
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #21333#21495':'
      ParentBiDiMode = False
    end
    object lbl1: TLabel
      Left = 596
      Top = 28
      Width = 51
      Height = 11
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = #25968#37327':'
      ParentBiDiMode = False
    end
    object edtEdt_IMEISTART: TEdit
      Left = 253
      Top = 22
      Width = 148
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 14
      TabOrder = 0
    end
    object edtEdt_IMEIEND: TEdit
      Left = 429
      Top = 22
      Width = 148
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 14
      TabOrder = 1
    end
    object edtEdtBoxNum: TEdit
      Left = 85
      Top = 24
      Width = 68
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 3
      TabOrder = 2
    end
    object edt1: TEdit
      Left = 653
      Top = 24
      Width = 68
      Height = 19
      ImeName = #26497#21697#20116#31508#36755#20837#27861'6.9'#29256
      MaxLength = 3
      TabOrder = 3
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 65
    Width = 971
    Height = 464
    ActivePage = ts1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #21442#25968#37197#32622
      object pnl1: TPanel
        Left = 0
        Top = 57
        Width = 963
        Height = 381
        Align = alClient
        TabOrder = 0
        object DBGrid_Instruction: TDBGrid
          Left = 1
          Top = 1
          Width = 961
          Height = 379
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 963
        Height = 57
        Align = alTop
        TabOrder = 1
        object cbb_SoftModel: TComboBox
          Left = 24
          Top = 16
          Width = 241
          Height = 19
          ItemHeight = 11
          TabOrder = 0
        end
        object btn_BuildOrder: TButton
          Left = 360
          Top = 16
          Width = 153
          Height = 33
          Caption = #29983#25104#35746#21333
          TabOrder = 1
        end
      end
    end
    object ts2: TTabSheet
      Caption = #35746#21333#20316#19994
      ImageIndex = 1
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 963
        Height = 438
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
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
end
