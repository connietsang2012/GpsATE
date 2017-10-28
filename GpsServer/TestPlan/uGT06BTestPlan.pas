unit uGT06BTestPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTestPlanModuleForm, ExtCtrls, ActnList, ImgList, GridsEh,
  DBGridEh, ComCtrls, DBCtrls, StdCtrls, ToolWin, MemTableDataEh, Db,
  MemTableEh, Buttons, Mask, DBCtrlsEh, DBLookupEh,uDmMain;

type
  TfrmGT06BTestPlan = class(TfrmTestPlanModuleForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGT06BTestPlan: TfrmGT06BTestPlan;

implementation

{$R *.dfm}

procedure TfrmGT06BTestPlan.FormCreate(Sender: TObject);
var
    i:Integer;
    strTemp:string;
begin

    Font.Charset :=DEFAULT_CHARSET;
    Font.Name :='Arial';
    Font.Size :=9;

    KeyPreview :=true;
    Position :=poDesktopCenter;

    PageControl1.ActivePage :=TabSheet1 ;
    {bDataChanged:=false;
    bPostSuccess:=false;
    nCurrentRecordNo:=0;
    bIsAddOperation:=false; }

    {DMMain.MTE_DstSubItem.Active:=False;
    DMMain.MTE_DstSubItem.Active:=True;
    DMMain.MTE_SrcSubItem.Active:=False;
    DMMain.MTE_SrcSubItem.Active:=True;}

    SetButtons;

    {while not MTE_TestPlan.Eof do
    begin
        strTemp:=MTE_TestPlan.FieldByName('TestPlanDes').Value;
        dbcbbTestPlan.Items.Add(strTemp);
        //dblstId.Items.Add(strTemp);
        MTE_TestPlan.Next;
    end;}

  PageControl1.ActivePage :=TabSheet2;

end;

end.
