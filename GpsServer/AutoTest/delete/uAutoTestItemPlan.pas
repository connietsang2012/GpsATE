unit uAutoTestItemPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGT06BTestPlan, DBGridEh, DBCtrls, Buttons, GridsEh, ComCtrls,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls,uDmMain, MemTableDataEh,
  Db, MemTableEh;

type
  TfrmAutoTestItemPlan = class(TfrmGT06BTestPlan)
    DS_AutoTestModel: TDataSource;
    MTE_AutoTestModel: TMemTableEh;
    MTE_AutoTestModelId: TAutoIncField;
    MTE_AutoTestModelModel: TStringField;
    MTE_AutoTestModelModelDes: TStringField;
    cbbModel: TDBLookupComboboxEh;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutoTestItemPlan: TfrmAutoTestItemPlan;

implementation

{$R *.dfm}

procedure TfrmAutoTestItemPlan.FormCreate(Sender: TObject);
begin
  inherited;
    Sleep(1);
end;

end.
