unit uSetForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls, Mask, DBCtrls,
  DBActns;

type
  TfrmSet = class(TfrmModuleForm)
    lbl1: TLabel;
    Edt_Model: TDBEdit;
    lbl2: TLabel;
    Edt_Version: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    Edt_SnPro: TDBEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    Edt_SnDate: TDBEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    Edt_SnBegin: TDBEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    Edt_SnEnd: TDBEdit;
    lbl11: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSet: TfrmSet;

implementation
uses
    uDmMain;
{$R *.dfm}

end.
