unit uTestPlanForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls, Mask, DBCtrls,
  DBActns;

type
  TfrmTestPlan = class(TfrmModuleForm)
    lbl1: TLabel;
    Edt_TestPlanName: TDBEdit;
    Edt_TestPlanDes: TDBEdit;
    lbl2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestPlan: TfrmTestPlan;

implementation
uses
    uDmMain;
{$R *.dfm}

end.
