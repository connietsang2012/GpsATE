unit uOQCItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, DB, DBActns, ActnList, ImgList, ComCtrls,
  ToolWin, GridsEh, DBGridEh, MemDS, DBAccess, Uni, StdCtrls, Mask, DBCtrls,
  uPublicFunc,uGlobalVar;

type
  TfrmOQCItem = class(TfrmModuleForm)
    pnlResult1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnCopy: TButton;
    cbb_SrcModel: TComboBox;
    cbb_DstModel: TComboBox;
    btnCopyFormAutoTest: TButton;
    DS_OQCItem: TDataSource;
    unqry_OQCItem: TUniQuery;
    intgrfldUniQuery_AutoTestSMTItemId: TIntegerField;
    strngfldSFUniQuery_AutoTestSMTItemItemModel: TStringField;
    strngfldSFUniQuery_AutoTestSMTItemItemName: TStringField;
    unqry_OQCSubItem: TUniQuery;
    DS_AutoTestModel1: TDataSource;
    unqry_TestModel: TUniQuery;
    strngfldSFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    strngfldSFUniQuery_TestModelModel: TStringField;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    cbbCom_TestModel: TComboBox;
    dblklstModel: TDBLookupListBox;
    pnl1: TPanel;
    Edt_ItemName: TDBEdit;
    Edt_TestItemNameAdd: TEdit;
    btnModify: TButton;
    btnAdd: TButton;
    lbl5: TLabel;
    dbedtItemModel: TDBEdit;
    lbl2: TLabel;
    dbedtItemName: TDBEdit;
    lbl6: TLabel;
    dbedtSubItemName: TDBEdit;
    lbl7: TLabel;
    dbchkSendAtComm: TDBCheckBox;
    lbl8: TLabel;
    dbedtAtComm: TDBEdit;
    lbl9: TLabel;
    dbedtReturnText: TDBEdit;
    lbl10: TLabel;
    dbedtReSendNum: TDBEdit;
    lbl11: TLabel;
    dbedtTestTimeOut: TDBEdit;
    lbl12: TLabel;
    dbchkCompare: TDBCheckBox;
    lbl13: TLabel;
    dbedtRemark1: TDBEdit;
    lbl14: TLabel;
    dbedtRemark2: TDBEdit;
    lbl15: TLabel;
    dbedtCompareValue: TDBEdit;
    lbl16: TLabel;
    dbedtCompareRemark: TDBEdit;
    lbl17: TLabel;
    dbedtRemark3: TDBEdit;
    lbl18: TLabel;
    dbedtRemark4: TDBEdit;
    lbl19: TLabel;
    dbedtRemark5: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);
     procedure dblklstModelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_ItemNameChange(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnCopyFormAutoTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedtSubItemNameChange(Sender: TObject);
    procedure UniQuery_AutoTestSMTSubItemBeforeInsert(DataSet: TDataSet);

  private
    { Private declarations }

  public
    procedure updateOperRec;
     procedure DeleteTestItem();
    //procedure PostSubItemMessage;
    { Public declarations }
  end;

var
  frmOQCItem: TfrmOQCItem;
  sTemp : string;

implementation

uses uServerMain;

{$R *.dfm}

procedure TfrmOQCItem.FormCreate(Sender: TObject);
begin
  inherited;
  dbchkSendAtComm.Checked:=True;
    unqry_TestModel.Open;
   unqry_OQCItem.Open;
    if unqry_TestModel.RecordCount>0 then
    begin
        unqry_TestModel.First;
        cbbCom_TestModel.Items.Clear;
        cbb_SrcModel.Items.Clear;
        cbb_DstModel.Items.Clear;
        while not unqry_TestModel.Eof do
        begin
            cbbCom_TestModel.Items.Add(unqry_TestModel.FieldByName('Model').AsString);
            cbb_SrcModel.Items.Add(unqry_TestModel.FieldByName('Model').AsString);
            cbb_DstModel.Items.Add(unqry_TestModel.FieldByName('Model').AsString);
            unqry_TestModel.Next;
        end;
    end;
    cbbCom_TestModel.ItemIndex:=0;
    cbbCom_TestModelChange(cbbCom_TestModel);

    DS_Insert.Visible:=True;
    DS_Delete.Visible:=True;
    TB_Delete.Enabled:=True;
    {DS_Edit.Visible:=True;
    DS_Module.AutoEdit:=True;
    DBGridEh1.ReadOnly:=False;
    TabSheet2.Enabled:=True; }
end;

procedure TfrmOQCItem.UniQuery_AutoTestSMTSubItemBeforeInsert(
  DataSet: TDataSet);
var
  i:Integer;
begin
  inherited;
  DS_Module.AutoEdit:=True;
  DBGridEh1.ReadOnly:=False;
  TabSheet2.Enabled:=True;
  if PageControl1.ActivePageIndex=1 then
  begin
      for i:=0 to ComponentCount-1 do
      begin
      	if (Components[i] is TDBEdit) and ((Components[i] as TDBEdit).TabOrder=0) then
          if ((Components[i] as TDBEdit).Enabled)and ((Components[i] as TDBEdit).Visible) then
              (Components[i] as TDBEdit).SetFocus;
      end;
  end;
end;


procedure TfrmOQCItem.cbbCom_TestModelChange(Sender: TObject);
var
    strFiledValue:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        unqry_OQCItem.Close;
        unqry_OQCItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        unqry_OQCItem.Open;
    end;
     Edt_ItemNameChange(Edt_ItemName);
end;


procedure TfrmOQCItem.Edt_ItemNameChange(Sender: TObject);
var
    strTemp:string;
begin
  inherited;
   strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
        [cbbCom_TestModel.Text,Edt_ItemName.Text]);
   unqry_OQCSubItem.SQL.Clear;
   unqry_OQCSubItem.SQL.Text:='select * from Gps_OQC_SubItem where ' +strTemp;
   //unqry_OQCSubItem.Params.ParamByName('ItemModel').Value:=cbbCom_TestModel.Text;
   //     unqry_OQCSubItem.Open;
   unqry_OQCSubItem.ExecSQL;

   dbedtItemModel.Text:=cbbCom_TestModel.Text;
   dbedtItemName.Text:=Edt_ItemName.Text;
   dbedtSubItemName.Text:=unqry_OQCSubItem.FieldByName('SubItemName').AsString;
   dbchkSendAtComm.Checked:=unqry_OQCSubItem.FieldByName('SendAtComm').AsBoolean;
   dbedtAtComm.Text:=unqry_OQCSubItem.FieldByName('AtComm').AsString;
   dbedtReturnText.Text:= unqry_OQCSubItem.FieldByName('ReturnText').AsString;
   dbedtReSendNum.Text:=unqry_OQCSubItem.FieldByName('ReSendNum').AsString;
   dbedtTestTimeOut.Text:= unqry_OQCSubItem.FieldByName('TestTimeOut').AsString;
   dbchkCompare.Checked:= unqry_OQCSubItem.FieldByName('Compare').AsBoolean;
   dbedtRemark1.Text:=unqry_OQCSubItem.FieldByName('Remark1').AsString;
   dbedtRemark2.Text:= unqry_OQCSubItem.FieldByName('Remark2').AsString;
end;

procedure TfrmOQCItem.updateOperRec;
var
  sTestModel : string;
begin
  if unqry_OQCSubItem.RecordCount > 0 then
  begin
    if Length(Trim(cbbCom_TestModel.Text)) > 0 then
    begin
      sTestModel := Trim(cbbCom_TestModel.Text);
      sTemp := '机型:' + sTestModel + '/测试项:' + Trim(Edt_ItemName.Text);
      InsertOperRecord(User.UserName,'修改 自动测试项目设置#[' + sTemp + ']',DateTimeToStr(Now));
      Application.MessageBox('测试项修改成功！','提示信息',MB_YesNo+MB_IconQuestion);
    end
    else
    begin
      Application.MessageBox('请选择机型!','提示信息',MB_ICONERROR);
      cbbCom_TestModel.SetFocus;
    end;
  end;
end;

procedure TfrmOQCItem.btnModifyClick(Sender: TObject);
begin
  inherited;
  updateOperRec;
end;

procedure TfrmOQCItem.btnAddClick(Sender: TObject);
begin
  inherited;
    if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    if Application.MessageBox('是否要增加测试项？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      unqry_OQCItem.Append;
      unqry_OQCItem.FieldByName('ItemModel').Value:=cbbCom_TestModel.Text;
      unqry_OQCItem.FieldByName('ItemName').Value:=Edt_TestItemNameAdd.Text;
      unqry_OQCItem.Edit;
      unqry_OQCItem.Post;
      unqry_OQCItem.Last;
      SetOpInfo('保存成功');     //自动测试项目设置(SMT)

      sTemp := '机型:' + Trim(cbbCom_TestModel.Text) + '/测试项名称:' + Trim(Edt_TestItemNameAdd.Text);
      InsertOperRecord(User.UserName,'增加 自动测试项目设置SMT#[' + sTemp + ']',DateTimeToStr(Now));
      Edt_TestItemNameAdd.Text:='';
    end;
  end
  else
  begin
    Application.MessageBox('机型不能为空，请选择!','提示信息',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmOQCItem.btnCopyClick(Sender: TObject);
var
    strTemp,strSrcModel,strDstModel:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) > 0) then
  begin
    if Application.MessageBox('是否要从本表复制？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      strSrcModel:=Trim(cbb_SrcModel.Text);
      strDstModel:=Trim(cbb_DstModel.Text);
      with frmServerMain.spOQCParamCopy do
      begin
        Close;
        Parameters.ParamByName('@cSrcModel').Value:=strSrcModel;
        Parameters.ParamByName('@cDstModel').Value:=strDstModel;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制失败!','信息警告',MB_ICONINFORMATION);
      end
      else
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制成功!','信息警告',MB_ICONINFORMATION);
      end;
      InsertOperRecord(User.UserName,'复制 自动测试项目设置(SMTOQC)#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end
  else
  begin
    Application.MessageBox('机型设置拷贝不能为空，请选择!','提示信息',MB_ICONERROR);
    cbb_SrcModel.SetFocus;
  end;
end;

procedure TfrmOQCItem.btnCopyFormAutoTestClick(Sender: TObject);
var
  strSrcModel,strDstModel,strTemp:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) > 0) then
  begin
    if Application.MessageBox('是否要从自动测试位表复制？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      strSrcModel:=Trim(cbb_SrcModel.Text);
      strDstModel:=Trim(cbb_DstModel.Text);
      with frmServerMain.spTestParamFormAutoTest do
      begin
        Close;
        Parameters.ParamByName('@cFormName').Value:='Gps_OQC';
        Parameters.ParamByName('@cSrcModel').Value:=strSrcModel;
        Parameters.ParamByName('@cDstModel').Value:=strDstModel;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制失败!','信息警告',MB_ICONINFORMATION);
      end
      else
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制成功!','信息警告',MB_ICONINFORMATION);
      end;
      InsertOperRecord(User.UserName,'复制 参数设置#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end
  else
  begin
    Application.MessageBox('机型设置拷贝不能为空，请选择!','提示信息',MB_ICONERROR);
    cbb_SrcModel.SetFocus;
  end;
end;

procedure TfrmOQCItem.dblklstModelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if ( User.UserType='FacSuperAdmin')  then Exit;  //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  if Key=VK_DELETE  then
  begin
    if (unqry_OQCItem.RecordCount > 0) then
    	DeleteTestItem;
  end;
end;



procedure TfrmOQCItem.DeleteTestItem();
begin
  inherited;
  if Application.MessageBox('是否要删除记录？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    {InsertOperRecord(User.UserName,'删除 自动测试项目设置SMT_删除记录#[机型:'
    									+ unqry_OQCItem.fieldbyname('ItemModel').AsString
                      + '/测试项目:' + unqry_OQCItem.fieldbyname('ItemName').AsString
                      + ']',DateTimeToStr(Now));    }
    unqry_OQCItem.Edit;
    unqry_OQCItem.delete;
    //SetOpInfo('删除记录');
  end
  else
    exit;
end;

procedure TfrmOQCItem.FormShow(Sender: TObject);
begin
  inherited;
  unqry_TestModel.Close;
  unqry_OQCItem.Close;
  unqry_TestModel.Open;
  unqry_OQCItem.Open;
  if unqry_TestModel.RecordCount>0 then
  begin
    unqry_TestModel.First;
    cbbCom_TestModel.Items.Clear;
    cbb_SrcModel.Items.Clear;
    cbb_DstModel.Items.Clear;
    while not unqry_TestModel.Eof do
    begin
      cbbCom_TestModel.Items.Add(unqry_TestModel.FieldByName('Model').AsString);
      cbb_SrcModel.Items.Add(unqry_TestModel.FieldByName('Model').AsString);
      cbb_DstModel.Items.Add(unqry_TestModel.FieldByName('Model').AsString);
      unqry_TestModel.Next;
    end;
  end;
  cbbCom_TestModel.ItemIndex:=0;
  cbbCom_TestModelChange(cbbCom_TestModel);
end;




  
procedure TfrmOQCItem.dbedtSubItemNameChange(Sender: TObject);
begin
  inherited;
   dbedtItemModel.Text:=cbbCom_TestModel.Text;
   dbedtItemName.Text:=Edt_ItemName.Text;
end;

end.
