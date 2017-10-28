unit uTestPlanModuleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemTableDataEh, Db, ComCtrls, ToolWin, ExtCtrls, ADODB,
  DataDriverEh, MemTableEh, ActnList, ImgList, GridsEh, DBGridEh,DBCtrls,DBGridEhImpExp,
  StdCtrls, Buttons, Mask, DBCtrlsEh, Grids, DBGrids, DBLookupEh;

type
  TfrmTestPlanModuleForm = class(TForm)
    SB_Module: TStatusBar;
    pnl1: TPanel;
    lbl1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1:TDBGridEh;
    lblSrcLabel: TLabel;
    lblDstLabel: TLabel;
    DBLSrcList: TDBLookupListBox;
    DBLDstList: TDBLookupListBox;
    btnInclude: TSpeedButton;
    btnIncAll: TSpeedButton;
    btnExclude: TSpeedButton;
    btnExAll: TSpeedButton;
    cbbParentName: TDBLookupComboboxEh;
    procedure FormCreate(Sender: TObject);

    //procedure DS_ModuleStateChange(Sender: TObject);
    //procedure DBGridEh1DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    //procedure ac_MoveUpExecute(Sender: TObject);
    procedure btnIncludeClick(Sender: TObject);
    procedure btnExcludeClick(Sender: TObject);
    procedure cbbParentNameChange(Sender: TObject);
    procedure btnIncAllClick(Sender: TObject);
    procedure btnExAllClick(Sender: TObject);
    
  private
    { Private declarations }

  public
    { Public declarations }
    //procedure SetRecordPointButton(bFirst,bPrior,bNext,bLast:Boolean);              //设置记录按钮有效性
    //procedure SetOperateButton(bAdd,bDel,bSave,bReflish,bImport,bExport:Boolean);   //设置操作按钮有效性
    procedure SetOpInfo(sInfo :string);             //设置状态栏显示

    procedure SetButtons;
  end;

var
    frmTestPlanModuleForm: TfrmTestPlanModuleForm;
    {bDataChanged:boolean;           //数据集是否被修改
    bPostSuccess:boolean;           //数据提交是否成功
    nCurrentRecordNo:integer;       //记录当前行的行号
    bIsAddOperation:boolean;        //是否执行了新增操作

    bMouseDown:Boolean; }

implementation
uses
    uDmMain, uUserForm,uPublicFunc;
{$R *.dfm}
{
过程功能:设置状态栏显示,表示数据状态
过程参数:sInfo->要显示的内容
}
procedure TfrmTestPlanModuleForm.SetOpInfo(sInfo :string);
begin
     SB_Module.Panels[1].Text :=sInfo;
end;
{
过程功能:设置记录按钮有效性
过程参数:bFirst->第一按钮的有效性
         bPrior->前一按钮的有效性
         bNext->后一按钮的有效性
         bLast->最后按钮的有效性
}
{PROCEDURE TfrmTestPlanModuleForm.SetRecordPointButton(bFirst,bPrior,bNext,bLast:Boolean);
BEGIN
   TB_First.Enabled:=bFirst;
   TB_Prior.Enabled:=bPrior;
   TB_Next.Enabled:=bNext;
   TB_Last.Enabled:=bLast;
END; }
{
过程功能:设置操作按钮有效性
过程参数:bAdd->新增按钮的有效性
         bDel->删除按钮的有效性
         bSave->保存按钮的有效性
         bReflish->刷新按钮的有效性
         bImport->导入按钮的有效性
         bExport->导出按钮的有效性
}
{procedure TfrmTestPlanModuleForm.SetOperateButton(bAdd,bDel,bSave,bReflish,bImport,bExport:Boolean);
BEGIN
   TB_Insert.Enabled:=bAdd;
   TB_Delete.Enabled:=bDel;
   TB_Post.Enabled:=bSave;
   TB_Refresh.Enabled:=bReflish;
   //TB_Import.Enabled:=bImport;
   TB_Export.Enabled:=bExport;
END;}

procedure TfrmTestPlanModuleForm.FormCreate(Sender: TObject);
var
    i:Integer;
    strTemp:string;
begin

    {Font.Charset :=DEFAULT_CHARSET;
    Font.Name :='Arial';
    Font.Size :=9;

    KeyPreview :=true;
    Position :=poDesktopCenter;

    PageControl1.ActivePage :=TabSheet1 ;}
    {bDataChanged:=false;
    bPostSuccess:=false;
    nCurrentRecordNo:=0;
    bIsAddOperation:=false; }

    {DMMain.MTE_DstSubItem.Active:=False;
    DMMain.MTE_DstSubItem.Active:=True;
    DMMain.MTE_SrcSubItem.Active:=False;
    DMMain.MTE_SrcSubItem.Active:=True;

    SetButtons;}

    {while not MTE_TestPlan.Eof do
    begin
        strTemp:=MTE_TestPlan.FieldByName('TestPlanDes').Value;
        dbcbbTestPlan.Items.Add(strTemp);
        //dblstId.Items.Add(strTemp);
        MTE_TestPlan.Next;
    end;}
end;

{procedure TfrmTestPlanModuleForm.DS_ModuleStateChange(Sender: TObject);
begin
    if MTE_DstSubItem.State in [dsedit,dsinsert] then
    begin
        bDataChanged:=True;
        bPostSuccess:=False;
    end;
end;

procedure TfrmTestPlanModuleForm.MTE_ModuleAfterOpen(DataSet: TDataSet);
begin
    MTE_DstSubItem.Last;
    MTE_DstSubItem.First;
end;

procedure TfrmTestPlanModuleForm.MTE_ModuleCalcFields(DataSet: TDataSet);
begin
    DataSet.FieldByName('Index').AsInteger := DataSet.RecNo;
end;

procedure TfrmTestPlanModuleForm.DBGridEh1DblClick(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet2;
    PageControl1.OnChange(Sender);
end;}

procedure TfrmTestPlanModuleForm.PageControl1Change(Sender: TObject);
var
    i:Integer;
begin
    if PageControl1.ActivePageIndex=1 then
    begin
        for i:=0 to ComponentCount-1 do
        begin
            if (Components[i] is TDBEdit) and ((Components[i] as TDBEdit).TabOrder=0) then
                (Components[i] as TDBEdit).SetFocus;
        end;
    end;
end;

{procedure TfrmTestPlanModuleForm.ac_MoveUpExecute(Sender: TObject);
begin
    MTE_DstSubItem.CheckBrowseMode;
    SetOpInfo('记录上移');
    //PageControl1.ActivePage := TabSheet2;
    nCurrentRecordNo:=MTE_DstSubItem.RecNo; //记录新增前的一行序号
    //bMoveUpOperation:=true;
    //MTE_Module.Append;
    
    //DBGridEh1.Enabled:=false;
    SetRecordPointButton(false,false,false,false);
    SetOperateButton(False,False,true,true,false,False);
end; }

procedure TfrmTestPlanModuleForm.btnIncludeClick(Sender: TObject);
var
  Index: Integer;
  strSrcText:string;
begin
    {DMMain.MTE_DstSubItem.Append;
    DMMain.MTE_DstSubItem.FieldByName('SoftModel').Value:=DMMain.MTE_SrcSubItem.FieldByName('SoftModel').Value;
    DMMain.MTE_DstSubItem.FieldByName('ParentId').Value:=DMMain.MTE_SrcSubItem.FieldByName('ParentId').Value;
    DMMain.MTE_DstSubItem.FieldByName('SubTestItemId').Value:=DMMain.MTE_SrcSubItem.FieldByName('SubTestItemId').Value;
    DMMain.MTE_DstSubItem.FieldByName('SubTestItemName').Value:=DMMain.MTE_SrcSubItem.FieldByName('SubTestItemName').Value;
    DMMain.MTE_DstSubItem.FieldByName('SubTestItemDes').Value:=DMMain.MTE_SrcSubItem.FieldByName('SubTestItemDes').Value;
    DMMain.MTE_DstSubItem.CheckBrowseMode;

    DMMain.MTE_DstSubItem.ApplyUpdates(-1);

    DMMain.MTE_DstSubItem.Active:=False;
    DMMain.MTE_DstSubItem.Active:=True;
    DMMain.MTE_SrcSubItem.Active:=False;
    DMMain.MTE_SrcSubItem.Active:=True;
    SetButtons; }
end;

procedure TfrmTestPlanModuleForm.btnExcludeClick(Sender: TObject);
begin
    {DMMain.MTE_DstSubItem.CheckBrowseMode;
    DMMain.MTE_DstSubItem.Edit;
    DMMain.MTE_DstSubItem.delete;
    SetOpInfo('删除记录');
    DMMain.MTE_DstSubItem.ApplyUpdates(-1);

    DMMain.MTE_DstSubItem.Active:=False;
    DMMain.MTE_DstSubItem.Active:=True;
    DMMain.MTE_SrcSubItem.Active:=False;
    DMMain.MTE_SrcSubItem.Active:=True;

    SetButtons; }
end;
procedure TfrmTestPlanModuleForm.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  {SrcEmpty:=DMMain.MTE_SrcSubItem.RecordCount=0;
  DstEmpty := DMMain.MTE_DstSubItem.RecordCount = 0;

  btnInclude.Enabled := not SrcEmpty;
  btnIncAll.Enabled := not SrcEmpty;
  btnExclude.Enabled := not DstEmpty;
  btnExAll.Enabled := not DstEmpty;}
end;

procedure TfrmTestPlanModuleForm.cbbParentNameChange(Sender: TObject);
var
    strCondtion:string;
    iTestPlanId:integer;
    strFiledValue:string;
begin
    strCondtion:=Format('TestPlanDes=''%s''',[cbbParentName.Text]);
    strFiledValue:=GetFiledValue('Gps_TestPlan','TestPlanId',strCondtion);
    {if strFiledValue<>'NULL' then
    begin
        iTestPlanId:=StrToInt(strFiledValue);
        DMMain.QR_SrcSubItem.Parameters.ParamByName('TestPlanId').Value:=iTestPlanId;
        DMMain.QR_SrcSubItem.Parameters.ParamByName('SoftModel').Value:='GT06B';
        DMMain.QR_SrcSubItem.Active:=True;
        DMMain.MTE_SrcSubItem.Active:=False;
        DMMain.MTE_SrcSubItem.Active:=True;
        //MTE_DstSubItem.Params.ParamByName('TestPlanId').Value:=iTestPlanId;
        DMMain.QR_DstSubItem.Parameters.ParamByName('TestPlanId').Value:=iTestPlanId;
        DMMain.QR_DstSubItem.Parameters.ParamByName('SoftModel').Value:='GT06B';
        DMMain.QR_DstSubItem.Active:=True;
        DMMain.MTE_DstSubItem.Active:=False;
        DMMain.MTE_DstSubItem.Active:=True;
        //Application.MessageBox(PChar(strTemp),'提示信息！',MB_YesNo+MB_IconQuestion);
    end;
    SetButtons;}


end;

procedure TfrmTestPlanModuleForm.btnIncAllClick(Sender: TObject);
var
    I:Integer;
begin
    {DMMain.MTE_SrcSubItem.First;
    while not DMMain.MTE_SrcSubItem.Eof do
    begin
        DMMain.MTE_DstSubItem.Edit;
        DMMain.MTE_DstSubItem.Append;
        DMMain.MTE_DstSubItem.FieldByName('SoftModel').Value:=DMMain.MTE_SrcSubItem.FieldByName('SoftModel').Value;
        DMMain.MTE_DstSubItem.FieldByName('ParentId').Value:=DMMain.MTE_SrcSubItem.FieldByName('ParentId').Value;
        DMMain.MTE_DstSubItem.FieldByName('SubTestItemId').Value:=DMMain.MTE_SrcSubItem.FieldByName('SubTestItemId').Value;;
        DMMain.MTE_DstSubItem.FieldByName('SubTestItemName').Value:=DMMain.MTE_SrcSubItem.FieldByName('SubTestItemName').Value;
        DMMain.MTE_DstSubItem.FieldByName('SubTestItemDes').Value:=DMMain.MTE_SrcSubItem.FieldByName('SubTestItemDes').Value;
        DMMain.MTE_DstSubItem.CheckBrowseMode;

        DMMain.MTE_SrcSubItem.First;
        DMMain.MTE_DstSubItem.Active:=False;
        DMMain.MTE_DstSubItem.Active:=True;
        DMMain.MTE_SrcSubItem.Active:=False;
        DMMain.MTE_SrcSubItem.Active:=True;
    end;

    SetButtons;}
end;

procedure TfrmTestPlanModuleForm.btnExAllClick(Sender: TObject);
var
    I:Integer;
begin
    {DMMain.MTE_DstSubItem.First;
    while not DMMain.MTE_DstSubItem.Eof do
    begin
        DMMain.MTE_DstSubItem.CheckBrowseMode;
        DMMain.MTE_DstSubItem.Edit;
        DMMain.MTE_DstSubItem.delete;
        SetOpInfo('删除记录');
        DMMain.MTE_DstSubItem.ApplyUpdates(-1);

        DMMain.MTE_DstSubItem.Active:=False;
        DMMain.MTE_DstSubItem.Active:=True;
        DMMain.MTE_SrcSubItem.Active:=False;
        DMMain.MTE_SrcSubItem.Active:=True;
        DMMain.MTE_DstSubItem.First;
    end;
    SetButtons;}

end;

end.
