unit uClientDataTestPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uClientDataModuleForm, DB, ADODB, ImgList, ActnList, ComCtrls,
  GridsEh, DBGridEh, ToolWin, StdCtrls, Mask, DBCtrls;

type
  TfrmClientTestPlan = class(TfrmClientDataModule)
    lbl1: TLabel;
    Edt_TestPlanName: TDBEdit;
    Edt_TestPlanDes: TDBEdit;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientTestPlan: TfrmClientTestPlan;

implementation

{$R *.dfm}

procedure TfrmClientTestPlan.FormCreate(Sender: TObject);
begin
  inherited;
    PrimaryKey:='TestPlanId';
    PrimaryKeyType:='String';
    TableName:='Gps_TestPlan';
end;

end.
