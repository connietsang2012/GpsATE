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
    //procedure SetRecordPointButton(bFirst,bPrior,bNext,bLast:Boolean);              //���ü�¼��ť��Ч��
    //procedure SetOperateButton(bAdd,bDel,bSave,bReflish,bImport,bExport:Boolean);   //���ò�����ť��Ч��
    procedure SetOpInfo(sInfo :string);             //����״̬����ʾ

    procedure SetButtons;
  end;

var
    frmTestPlanModuleForm: TfrmTestPlanModuleForm;
    {bDataChanged:boolean;           //���ݼ��Ƿ��޸�
    bPostSuccess:boolean;           //�����ύ�Ƿ�ɹ�
    nCurrentRecordNo:integer;       //��¼��ǰ�е��к�
    bIsAddOperation:boolean;        //�Ƿ�ִ������������

    bMouseDown:Boolean; }

implementation
uses
    uDmMain, uUserForm,uPublicFunc;
{$R *.dfm}
{
���̹���:����״̬����ʾ,��ʾ����״̬
���̲���:sInfo->Ҫ��ʾ������
}
procedure TfrmTestPlanModuleForm.SetOpInfo(sInfo :string);
begin
     SB_Module.Panels[1].Text :=sInfo;
end;
{
���̹���:���ü�¼��ť��Ч��
���̲���:bFirst->��һ��ť����Ч��
         bPrior->ǰһ��ť����Ч��
         bNext->��һ��ť����Ч��
         bLast->���ť����Ч��
}
{PROCEDURE TfrmTestPlanModuleForm.SetRecordPointButton(bFirst,bPrior,bNext,bLast:Boolean);
BEGIN
   TB_First.Enabled:=bFirst;
   TB_Prior.Enabled:=bPrior;
   TB_Next.Enabled:=bNext;
   TB_Last.Enabled:=bLast;
END; }
{
���̹���:���ò�����ť��Ч��
���̲���:bAdd->������ť����Ч��
         bDel->ɾ����ť����Ч��
         bSave->���水ť����Ч��
         bReflish->ˢ�°�ť����Ч��
         bImport->���밴ť����Ч��
         bExport->������ť����Ч��
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
    SetOpInfo('��¼����');
    //PageControl1.ActivePage := TabSheet2;
    nCurrentRecordNo:=MTE_DstSubItem.RecNo; //��¼����ǰ��һ�����
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
    SetOpInfo('ɾ����¼');
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
        //Application.MessageBox(PChar(strTemp),'��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion);
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
        SetOpInfo('ɾ����¼');
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
