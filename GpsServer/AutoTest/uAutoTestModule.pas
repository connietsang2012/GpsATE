unit uAutoTestModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls,uDmMain,
  DBCtrls, Grids, DBGrids, ImgList, ActnList, GridsEh, ComCtrls, ToolWin,
  DB;

type
  TfrmAutoTestModule = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    cbbModel: TDBLookupComboboxEh;
    DBLTestItem: TDBLookupListBox;
    DBGridEh1: TDBGridEh;
    ImageList: TImageList;
    ImageList1: TImageList;
    ActionList: TActionList;
    act_Edit: TAction;
    act_Delete: TAction;
    act_Cancel: TAction;
    act_Post: TAction;
    act_First: TAction;
    act_Prior: TAction;
    act_Next: TAction;
    act_Last: TAction;
    act_Find: TAction;
    act_Refresh: TAction;
    act_Commit: TAction;
    act_Print: TAction;
    act_Exit: TAction;
    act_Import: TAction;
    act_Export: TAction;
    act_Insert: TAction;
    tlb1: TToolBar;
    TB_First: TToolButton;
    TB_Prior: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    TB_btn1: TToolButton;
    btnInsert: TToolButton;
    btnDelete: TToolButton;
    btnPost: TToolButton;
    btnRefresh: TToolButton;
    btnEdit: TToolButton;
    btnCancel: TToolButton;
    TB_btn4: TToolButton;
    btnExport: TToolButton;
    TB_btn5: TToolButton;
    btnFind: TToolButton;
    btnExit: TToolButton;
    DS_AutoTestModel: TDataSource;
    procedure cbbModelChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutoTestModule: TfrmAutoTestModule;

implementation

{$R *.dfm}

procedure TfrmAutoTestModule.cbbModelChange(Sender: TObject);
var
    strCondtion:string;
    iTestPlanId:integer;
    strFiledValue:string;
begin
    //strCondtion:=Format('ItemModel=''%s''',[cbbModel.Text]);
    //strFiledValue:=GetFiledValue('Gps_TestPlan','TestPlanId',strCondtion);
    {strFiledValue:=cbbModel.Text;
    if strFiledValue<>'NULL' then
    begin
        //iTestPlanId:=StrToInt(strFiledValue);
        DMMain.QR_AutoTestItem.Parameters.ParamByName('ItemModel').Value:=strFiledValue;
        //DMMain.QR_SrcSubItem.Parameters.ParamByName('TestPlanId').Value:=iTestPlanId;
        //DMMain.QR_SrcSubItem.Parameters.ParamByName('SoftModel').Value:='GT06B';
        DMMain.QR_AutoTestItem.Active:=True;
        DMMain.MTE_AutoTestItem.Active:=False;
        DMMain.MTE_AutoTestItem.Active:=True;
        //MTE_DstSubItem.Params.ParamByName('TestPlanId').Value:=iTestPlanId;
        DMMain.QR_DstSubItem.Parameters.ParamByName('TestPlanId').Value:=iTestPlanId;
        DMMain.QR_DstSubItem.Parameters.ParamByName('SoftModel').Value:='GT06B';
        DMMain.QR_DstSubItem.Active:=True;
        DMMain.MTE_DstSubItem.Active:=False;
        DMMain.MTE_DstSubItem.Active:=True;
        //Application.MessageBox(PChar(strTemp),'提示信息！',MB_YesNo+MB_IconQuestion);
    end; }
    //SetButtons;


end;

procedure TfrmAutoTestModule.FormCreate(Sender: TObject);
begin
    DMMain.UniQuery_TestModel.Open;
end;

end.
