unit uSubTestItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh, uDmMain, DBCtrlsEh,
  DBLookupEh, StdCtrls, Mask, DBCtrls, DBActns;

type
  TfrmSubTestItem = class(TfrmModuleForm)
    Edt_UserDes: TDBEdit;
    cbbParentName: TDBLookupComboboxEh;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl1: TLabel;
    Edt_ReturnText1: TDBEdit;
    lbl2: TLabel;
    Edt_SubTestItemName: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSubTestItem: TfrmSubTestItem;

implementation

{$R *.dfm}

end.
