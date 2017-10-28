unit uParamLoadConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, StdCtrls, Grids, DBGrids, ExtCtrls,
  ComCtrls;

type
  TfrmParamDownLoadConfig = class(TForm)
    grp1: TGroupBox;
    lbl16: TLabel;
    edtEdt_IMEISTART: TEdit;
    lbl17: TLabel;
    edtEdt_IMEIEND: TEdit;
    lbl12: TLabel;
    edtEdtBoxNum: TEdit;
    edt1: TEdit;
    lbl1: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    cbb_SoftModel: TComboBox;
    DBGrid_Instruction: TDBGrid;
    dbgrd2: TDBGrid;
    btn_BuildOrder: TButton;
    DS_Module: TDataSource;
    unqry_ParamDownloadDstSubItem: TUniQuery;
    DS_SoftModel: TDataSource;
    UniQuery_SoftModel: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamDownLoadConfig: TfrmParamDownLoadConfig;

implementation
uses uDmMain, uParamLoadConfig;
{$R *.dfm}

end.
