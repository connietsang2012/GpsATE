inherited frmClientUserType: TfrmClientUserType
  Left = 195
  Top = 146
  Caption = #29992#25143#31867#22411#31649#29702
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    TabIndex = 1
    inherited TabSheet2: TTabSheet
      object lbl1: TLabel
        Left = 56
        Top = 44
        Width = 59
        Height = 13
        Caption = #29992#25143#31867#22411'ID'
      end
      object lbl2: TLabel
        Left = 48
        Top = 100
        Width = 72
        Height = 13
        Caption = #29992#25143#31867#22411#21517#31216
      end
      object Edt_TypeName: TDBEdit
        Left = 128
        Top = 40
        Width = 121
        Height = 21
        DataField = 'TypeName'
        DataSource = DS_Module
        TabOrder = 0
      end
      object Edt_TypeDes: TDBEdit
        Left = 128
        Top = 96
        Width = 121
        Height = 21
        DataField = 'TypeDes'
        DataSource = DS_Module
        TabOrder = 1
      end
    end
  end
  inherited ActionList: TActionList
    inherited ac_Export: TAction
      OnExecute = ac_ExportExecute
    end
  end
end
