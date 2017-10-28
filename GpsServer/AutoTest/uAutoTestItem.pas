unit uAutoTestItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,uDmMain, DBCtrls, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, DataDriverEh, ADODB, DBActns, MemDS,
  DBAccess, Uni,Clipbrd,uGlobalVar;

type
  TfrmAutoTestItem = class(TfrmModuleForm)
    pnl2: TPanel;
    dblklstModel: TDBLookupListBox;
    Edt_TestItemNameAdd: TEdit;
    Edt_ItemName: TDBEdit;
    Panel1: TPanel;
    btnModify: TButton;
    btnAdd: TButton;
    ActionList1: TActionList;
    ac_TestItemInsert: TAction;
    ac_TestItemDelete: TAction;
    ac_TestItemModify: TAction;
    Label1: TLabel;
    Edt_TestPlanName: TDBEdit;
    lbl2: TLabel;
    Edt_TestPlanDes: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBCheckBox2: TDBCheckBox;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    dbedtRemark4: TDBEdit;
    Label15: TLabel;
    dbedtRemark5: TDBEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    estResult1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnCopy: TButton;
    cbb_SrcModel: TComboBox;
    cbb_DstModel: TComboBox;
    DS_AutoTestModel: TDataSource;
    cbbCom_TestModel: TComboBox;
    ActionList2: TActionList;
    DS_TestItemEdit: TDataSetEdit;
    DS_TestItemPost: TDataSetPost;
    UniQuery_AutoTestItem: TUniQuery;
    UniQuery_AutoTestSubItem: TUniQuery;
    DS_AutoTestItem: TDataSource;
    DS_TestItemInsert: TDataSetInsert;
    intgrfldUniQuery_AutoItemId: TIntegerField;
    SFUniQuery_AutoItemItemModel: TStringField;
    SFUniQuery_AutoItemItemName: TStringField;
    UniQuery_TestModel: TUniQuery;
    SFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    SFUniQuery_TestModelModel: TStringField;
    procedure dblklstModelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbModelChange(Sender: TObject);
    procedure Edt_ItemNameChange(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure UniQuery_AutoTestSubItemAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Edt_ItemNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniQuery_AutoTestSubItemBeforeInsert(DataSet: TDataSet);

    procedure DeleteTestItem();
    procedure Edt_TestPlanNameChange(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure Edt_TestPlanDesChange(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure dbedtRemark4Change(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure dbedtRemark5Change(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure saveOperRec;
    procedure deleteOperRec;override;
    procedure updateOperRec;
  end;

var
  frmAutoTestItem: TfrmAutoTestItem;
  sTemp :string;
  i:Integer;

  //原参数，修改前的数据
  sA : array[0..17] of string;
  sTestModel : string;  //下拉框中的机型
implementation

uses uServerMain,uPublicFunc;


{$R *.dfm}
procedure TfrmAutoTestItem.FormShow(Sender: TObject);
begin
  inherited;
  {//FormCreate()里面实现的，和FormShow()的操作代码一样
  UniQuery_TestModel.Close;
  UniQuery_AutoTestItem.Close;
  UniQuery_TestModel.Open;
  UniQuery_AutoTestItem.Open;
  if UniQuery_TestModel.RecordCount>0 then
  begin
    UniQuery_TestModel.First;
    cbbCom_TestModel.Items.Clear;
    cbb_SrcModel.Items.Clear;
    cbb_DstModel.Items.Clear;
    while not UniQuery_TestModel.Eof do
    begin
      cbbCom_TestModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
      cbb_SrcModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
      cbb_DstModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
      UniQuery_TestModel.Next;
    end;
  end;
  cbbCom_TestModel.ItemIndex:=0;
  cbbCom_TestModelChange(cbbCom_TestModel);

  DS_Insert.Visible:=True; }
  {DS_Edit.Visible:=True;
  DS_Module.AutoEdit:=True;
  DBGridEh1.ReadOnly:=False;
  TabSheet2.Enabled:=True;}

  UniQuery_TestModel.Close;
  UniQuery_AutoTestItem.Close;
  UniQuery_TestModel.Open;
  UniQuery_AutoTestItem.Open;
  if UniQuery_TestModel.RecordCount>0 then
  begin
    UniQuery_TestModel.First;
    cbbCom_TestModel.Items.Clear;
    cbb_SrcModel.Items.Clear;
    cbb_DstModel.Items.Clear;
    while not UniQuery_TestModel.Eof do
    begin
      cbbCom_TestModel.Items.Add(trim(UniQuery_TestModel.FieldByName('Model').AsString));
      cbb_SrcModel.Items.Add(trim(UniQuery_TestModel.FieldByName('Model').AsString));
      cbb_DstModel.Items.Add(trim(UniQuery_TestModel.FieldByName('Model').AsString));
      UniQuery_TestModel.Next;
    end;
  end;
  cbbCom_TestModel.ItemIndex:=0;
  cbbCom_TestModelChange(cbbCom_TestModel);

  DS_Insert.Visible:=True;
  {DS_Edit.Visible:=True;
  DS_Module.AutoEdit:=True;
  DBGridEh1.ReadOnly:=False;
  TabSheet2.Enabled:=True;}
  //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  //if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;

procedure TfrmAutoTestItem.dblklstModelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if ( User.UserType='FacSuperAdmin')  then Exit; //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  if Key=VK_DELETE  then
  begin
    if (UniQuery_AutoTestItem.RecordCount >0) and (UniQuery_AutoTestItem.RecordCount >0) then
    	DeleteTestItem;
  end;
end;

procedure TfrmAutoTestItem.cbbModelChange(Sender: TObject);
var
    strFiledValue,strTemp:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        strTemp:=Format('ItemModel=''%s''',[strFiledValue]);
        UniQuery_AutoTestItem.Refresh;
        UniQuery_AutoTestItem.Filter:=strTemp;
        UniQuery_AutoTestItem.Filtered:=True;
        //UniQuery_AutoTestItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        //UniQuery_AutoTestItem.Open;
    end;
end;

procedure TfrmAutoTestItem.Edt_ItemNameChange(Sender: TObject);
var
    strTemp:string;
begin
  inherited;
     strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
          [UniQuery_AutoTestItem.FieldByName('ItemModel').AsString,
          UniQuery_AutoTestItem.FieldByName('ItemName').AsString]);
     UniQuery_AutoTestSubItem.Refresh;
     UniQuery_AutoTestSubItem.Filter:=strTemp;
     UniQuery_AutoTestSubItem.Filtered:=True;
end;

procedure TfrmAutoTestItem.cbbCom_TestModelChange(Sender: TObject);
var
    strFiledValue:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        UniQuery_AutoTestItem.Close;
        UniQuery_AutoTestItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        UniQuery_AutoTestItem.Open;
        //说明有找到与数据表中的数据，当前下拉文本框输入的机型是有效的 2014.2.21
        if UniQuery_AutoTestItem.RecordCount > 0 then
           sTestModel := strFiledValue;
    end;
    Edt_ItemNameChange(Edt_ItemName);
end;

procedure TfrmAutoTestItem.btnAddClick(Sender: TObject);
begin
  inherited;
  //只有当数据表中存在机型的时候才可以是否要增加测试项 2014.2.21
  //if (Length(sTestModel) > 0) and (CompareStr(sTestModel,Trim(cbbCom_TestModel.Text))= 0) then
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    if Application.MessageBox('是否要增加测试项？','提示信息',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      UniQuery_AutoTestItem.Append;
      UniQuery_AutoTestItem.FieldByName('ItemModel').Value:=cbbCom_TestModel.Text;
      UniQuery_AutoTestItem.FieldByName('ItemName').Value:=Edt_TestItemNameAdd.Text;
      UniQuery_AutoTestItem.Edit;
      UniQuery_AutoTestItem.Post;
      UniQuery_AutoTestItem.Last;
      SetOpInfo('保存成功');

      sTemp := '机型:' + sTestModel + '/测试项:' + Trim(Edt_TestItemNameAdd.Text);
      InsertOperRecord(User.UserName,'增加 自动测试项目设置#[' + sTemp + ']',DateTimeToStr(Now));
      Edt_TestItemNameAdd.Text:='';
    end;
  end
  else
  begin
    Application.MessageBox('机型不能为空，请选择!','提示信息',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmAutoTestItem.btnCopyClick(Sender: TObject);
var
  strTemp:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) >0) then
  begin
    if Application.MessageBox('是否要机型设置复制？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      with frmServerMain.spModelTestParamCopy do
      begin
        Close;
        Parameters.ParamByName('@cSrcModel').Value:=cbb_SrcModel.Text;
        Parameters.ParamByName('@cDstModel').Value:=cbb_DstModel.Text;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        Application.MessageBox('测试参数复制失败!','信息警告',MB_ICONINFORMATION);
      end
      else
        Application.MessageBox('测试参数复制成功!','信息警告',MB_ICONINFORMATION);
      sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
      InsertOperRecord(User.UserName,'复制 自动测试项目设置#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end;
end;

procedure TfrmAutoTestItem.UniQuery_AutoTestSubItemAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ItemModel').AsString:=cbbCom_TestModel.text;
  DataSet.FieldByName('ItemName').AsString:=Edt_ItemName.Text;
  DataSet.FieldByName('SendAtComm').Value:=True;
  DataSet.FieldByName('Compare').Value:=False;
end;

procedure TfrmAutoTestItem.Edt_ItemNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(ssctrl in shift)and(key = Ord('X'))   then
  begin
     Key := 0;
  end;
end;

{procedure TfrmAutoTestItem.UniQuery_AutoTestSubItemAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  if (User.UserType<>'SuperAdmin') then
  begin    //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
    DS_Module.AutoEdit:=False;
    DBGridEh1.ReadOnly:=True;
    TabSheet2.Enabled:=False;
  end;
end;}

procedure TfrmAutoTestItem.UniQuery_AutoTestSubItemBeforeInsert(
  DataSet: TDataSet);
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
        if ((Components[i] as TDBEdit).Enabled) and ((Components[i] as TDBEdit).Visible) then
          (Components[i] as TDBEdit).SetFocus;
    end;
  end;
end;

procedure TfrmAutoTestItem.DeleteTestItem;
var
  sTmp : string;
begin
  if Application.MessageBox('是否要删除记录？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    sTmp := '删除 自动测试项目设置_删除记录#[机型:';
    sTmp := sTmp + UniQuery_AutoTestItem.fieldbyname('ItemModel').AsString + '/子测试项目:';
    sTmp := sTmp + UniQuery_AutoTestItem.fieldbyname('ItemName').AsString;
    InsertOperRecord(User.UserName,sTmp + ']',DateTimeToStr(Now));
    UniQuery_AutoTestItem.Edit;
    UniQuery_AutoTestItem.delete;
    SetOpInfo('删除记录');
  end
  else
    exit;
end;

{sTemp := '机型:' + Trim(Edt_TestPlanName.Text);
  if DBCheckBox2.Checked then
    sTemp := sTemp + '/比较:是'
  else
    sTemp := sTemp + '/比较:否';
  if Length(Trim(Edt_TestPlanDes.Text)) > 0 then
  	sTemp := sTemp + '/测试项:'+ Trim(Edt_TestPlanDes.Text);
  if Length(Trim(DBEdit6.Text)) > 0 then
  	sTemp := sTemp + '/返回值范围:' + Trim(DBEdit6.Text);
  if Length(Trim(DBEdit1.Text)) > 0 then
  	sTemp := sTemp	+ '/子测试项:' + Trim(DBEdit1.Text);
  if Length(Trim(DBEdit7.Text)) > 0 then
    sTemp := sTemp + '/返回值分隔:'+ Trim(DBEdit7.Text);
  if DBCheckBox1.Checked then
    sTemp := sTemp + '/发送:是'
  else
    sTemp := sTemp + '/发送:否';
  if Length(Trim(DBEdit8.Text)) > 0 then
  	sTemp := sTemp + '/备注1:'+ Trim(DBEdit8.Text);
  if Length(Trim(DBEdit2.Text)) > 0 then
  	sTemp := sTemp + '/AT指令:' + Trim(DBEdit2.Text);
  if Length(Trim(DBEdit9.Text)) > 0 then
    sTemp := sTemp+ '/备注2:'+ Trim(DBEdit9.Text);
  if Length(Trim(DBEdit3.Text)) > 0 then
  	sTemp := sTemp+ '/AT返回值:' + Trim(DBEdit3.Text);
  if Length(Trim(DBEdit10.Text)) > 0 then
  	sTemp := sTemp+ '/备注3:' + Trim(DBEdit10.Text);
  if Length(Trim(DBEdit4.Text)) > 0 then
  	sTemp := sTemp + '/AT重发次数:' + Trim(DBEdit4.Text);
  if Length(Trim(dbedtRemark4.Text)) > 0 then
    sTemp := sTemp + '/备注4:' + Trim(dbedtRemark4.Text);
  if Length(Trim(DBEdit5.Text)) > 0 then
    sTemp := sTemp + '/超时时间:' + Trim(DBEdit5.Text);
  if Length(Trim(dbedtRemark5.Text)) > 0 then
    sTemp := sTemp + '/备注5:' + Trim(dbedtRemark5.Text);
  InsertOperRecord(User.UserName,'保存 自动测试项目#[' + sTemp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;}
procedure TfrmAutoTestItem.saveOperRec;
begin
  sTemp := '机型:' + Trim(Edt_TestPlanName.Text);
  if DBCheckBox2.Checked then
    sTemp := sTemp + '/比较:Y'
  else
    sTemp := sTemp + '/不比较:N';

  if Length(Trim(Edt_TestPlanDes.Text)) > 0 then
    sTemp := sTemp + '/测试项:'+ Trim(Edt_TestPlanDes.Text);

  if ansicomparestr(Trim(DBEdit6.Text),sA[4])<>0 then
  begin
    if Length(Trim(DBEdit6.Text)) > 0 then
    begin
      if Length(sA[4]) > 0 then
      	sTemp := sTemp +'/返回范围:' + Trim(DBEdit6.Text)+ '(后)' + sA[4] + '(前)'
    	else
        sTemp := sTemp +'/返回范围:' + Trim(DBEdit6.Text);
    end
    else
    begin
      if Length(sA[4]) > 0 then
    		sTemp := sTemp +'/返回范围:' + sA[4] + '(前)';
    end;
  end;
  if ansicomparestr(Trim(DBEdit1.Text),sA[5])<>0 then
  begin
    if Length(Trim(DBEdit1.Text)) > 0 then
    begin
      if Length(sA[5]) > 0 then
      	sTemp := sTemp + '/子测试项:'+ Trim(DBEdit1.Text)+ '(后)' + sA[5] + '(前)'
      else
      	sTemp := sTemp + '/子测试项:'+ Trim(DBEdit1.Text);
    end
    else
    begin
      if Length(sA[5]) > 0 then
        sTemp := sTemp + sA[5] + '(前)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit7.Text),sA[6])<>0 then
  begin
    if Length(Trim(DBEdit7.Text)) > 0 then
    begin
      if Length(sA[6]) > 0 then
      	sTemp := sTemp +'/分隔内容:'+ Trim(DBEdit7.Text) + '(后)' + sA[6] + '(前)'
      else
      	sTemp := sTemp +'/分隔内容:'+ Trim(DBEdit7.Text);
    end
    else
    begin
      if Length(sA[6]) > 0 then
        sTemp := sTemp + sA[6] + '(前)';
    end;  
  end;
  if DBCheckBox1.Checked then
    sTemp := sTemp + '/发送AT:Y'
  else
    sTemp := sTemp + '/不发送AT:N';
  if ansicomparestr(Trim(DBEdit8.Text),sA[8])<>0 then  //数据有改时才记录操作动作
  begin
    if Length(Trim(DBEdit8.Text)) > 0 then
    begin
      if Length(sA[8]) > 0 then
        sTemp := sTemp + '/备注1:'+ Trim(DBEdit8.Text) + '(后)' + sA[8] + '(前)'
      else
        sTemp := sTemp + '/备注1:'+ Trim(DBEdit8.Text);
    end
    else
    begin
      if Length(sA[8]) > 0 then
        sTemp := sTemp + '/备注1:'+  sA[8] + '(前)';
    end;
  end;
  if ansicomparestr(Trim(DBEdit2.Text),sA[9])<>0 then
  begin
    if Length(Trim(DBEdit2.Text)) > 0 then
    begin
      if Length(sA[9]) > 0 then
      	sTemp := sTemp + '/AT指令:'+ Trim(DBEdit2.Text)+ '(后)' + sA[9] + '(前)'
      else
      	sTemp := sTemp + '/AT指令:'+ Trim(DBEdit2.Text);
    end
    else
    begin
      if Length(sA[9]) > 0 then
        sTemp := sTemp + '/AT指令:' + sA[9] + '(前)';
    end;
  end;
  if ansicomparestr(Trim(DBEdit9.Text),sA[10])<>0 then
  begin
    if Length(Trim(DBEdit9.Text)) > 0 then
    begin
      if Length(sA[10]) > 0 then
      	sTemp := sTemp + '/备注2:' + Trim(DBEdit9.Text) + '(后)' + sA[10] + '(前)'
      else
      	sTemp := sTemp + '/备注2:' + Trim(DBEdit9.Text);
    end
    else
    begin
      if Length(sA[10]) > 0 then
        sTemp := sTemp + sA[10] + '(前)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit3.Text),sA[11])<>0 then
  begin
    if Length(Trim(DBEdit3.Text)) > 0 then
    begin
      if Length(sA[11]) > 0 then
      	sTemp := sTemp + '/AT返回值:'+ Trim(DBEdit3.Text) + '(后)' + sA[11] + '(前)'
      else
      	sTemp := sTemp + '/AT返回值:'+ Trim(DBEdit3.Text);
    end
    else
    begin
      if Length(sA[11]) > 0 then
      	sTemp := sTemp + sA[11] + '(前)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit10.Text),sA[12])<>0 then
  begin
    if Length(Trim(DBEdit10.Text)) > 0 then
    begin
      if Length(sA[12]) > 0 then
      	sTemp := sTemp + '/备注3:' + Trim(DBEdit10.Text) + '(后)' + sA[12] + '(前)'
      else
      	sTemp := sTemp + '/备注3:' + Trim(DBEdit10.Text);
    end
    else
    begin
      if Length(sA[12]) > 0 then
        sTemp := sTemp + '/备注3:' + sA[12] + '(前)'
    end;  
  end;
  if ansicomparestr(Trim(DBEdit4.Text),sA[13])<>0 then
  begin
    if Length(Trim(DBEdit4.Text)) > 0 then
    begin
      if Length(sA[13]) > 0 then
      	sTemp := sTemp + '/AT重发次数:' + Trim(DBEdit4.Text) + '(后)' + sA[13] + '(前)'
      else
      	sTemp := sTemp + '/AT重发次数:' + Trim(DBEdit4.Text);
    end
    else
    begin
      if Length(sA[13]) > 0 then
        sTemp := sTemp + sA[13] + '(前)';
    end;  
  end;
  if ansicomparestr(Trim(dbedtRemark4.Text),sA[14])<>0 then
  begin
    if Length(Trim(dbedtRemark4.Text)) > 0 then
    begin
      if Length(sA[14]) > 0 then
      	sTemp := sTemp + '/备注4:'+ Trim(dbedtRemark4.Text) + '(后)' + sA[14] + '(前)'
      else
      	sTemp := sTemp + '/备注4:'+ Trim(dbedtRemark4.Text);
    end
    else
    begin
      if Length(sA[14]) > 0 then
        sTemp := sTemp + sA[14] + '(前)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit5.Text),sA[15])<>0 then
  begin
    if Length(Trim(DBEdit5.Text)) > 0 then
    begin
      if Length(sA[15]) > 0 then
      	sTemp := sTemp + '/超时:' + Trim(DBEdit5.Text) + '(后)' + sA[15] + '(前)'
      else
      	sTemp := sTemp + '/超时:' + Trim(DBEdit5.Text);
    end
    else
    begin
      if Length(sA[15]) > 0 then
        sTemp := sTemp + sA[15] + '(前)';
    end;
  end;
  if ansicomparestr(Trim(dbedtRemark5.Text),sA[16])<>0 then
  begin
    if Length(Trim(dbedtRemark5.Text)) > 0 then
    begin
      if Length(sA[16]) > 0 then
      	sTemp := sTemp + '/备注5:' + Trim(dbedtRemark5.Text) + '(后)' + sA[16] + '(前)'
      else
      	sTemp := sTemp + '/备注5:' + Trim(dbedtRemark5.Text);
    end
    else
    begin
      if Length(sA[16]) > 0 then
        sTemp := sTemp + sA[16] + '(前)';
    end;  
  end;
  for i := 1 to 16 do
  begin
    sA[i] := '';
  end;
  InsertOperRecord(User.UserName,'保存 下载参数#[' + sTemp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmAutoTestItem.Edt_TestPlanNameChange(Sender: TObject);
begin
  inherited;
  sA[1] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ItemModel').AsString);
end;

procedure TfrmAutoTestItem.DBCheckBox2Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_AutoTestSubItem.FIeldbyname('Compare').AsBoolean;
  if b then
  	sA[2] := '是'
  else
  	sA[2] := '否';
end;

procedure TfrmAutoTestItem.Edt_TestPlanDesChange(Sender: TObject);
begin
  inherited;
  sA[3] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ItemName').AsString);
end;

procedure TfrmAutoTestItem.DBEdit6Change(Sender: TObject);
begin
  inherited;
	sA[4] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('CompareValue').AsString);
end;

procedure TfrmAutoTestItem.DBEdit1Change(Sender: TObject);
begin
  inherited;
  sA[5] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('SubItemName').AsString);
end;

procedure TfrmAutoTestItem.DBEdit7Change(Sender: TObject);
begin
  inherited;
  sA[6] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('CompareRemark').AsString);
end;

procedure TfrmAutoTestItem.DBCheckBox1Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_AutoTestSubItem.FIeldbyname('SendAtComm').AsBoolean;
  if b then
  	sA[7] := '是'
  else
  	sA[7] := '否';
end;

procedure TfrmAutoTestItem.DBEdit8Change(Sender: TObject);
begin
  inherited;
  sA[8] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark1').AsString);
end;

procedure TfrmAutoTestItem.DBEdit2Change(Sender: TObject);
begin
  inherited;
  sA[9] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('AtComm').AsString);
end;

procedure TfrmAutoTestItem.DBEdit9Change(Sender: TObject);
begin
  inherited;
  sA[10] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark2').AsString);
end;

procedure TfrmAutoTestItem.DBEdit3Change(Sender: TObject);
begin
  inherited;
  sA[11] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ReturnText').AsString);
end;

procedure TfrmAutoTestItem.DBEdit10Change(Sender: TObject);
begin
  inherited;
  sA[12] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark3').AsString);
end;

procedure TfrmAutoTestItem.DBEdit4Change(Sender: TObject);
begin
  inherited;
  sA[13] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ReSendNum').AsString);
end;

procedure TfrmAutoTestItem.dbedtRemark4Change(Sender: TObject);
begin
  inherited;
  sA[14] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark4').AsString);
end;

procedure TfrmAutoTestItem.DBEdit5Change(Sender: TObject);
begin
  inherited;
  sA[15] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('TestTimeOut').AsString);
end;

procedure TfrmAutoTestItem.dbedtRemark5Change(Sender: TObject);
begin
  inherited;
  sA[16] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark5').AsString);
end;

procedure TfrmAutoTestItem.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  s1 := UniQuery_AutoTestSubItem.fieldbyname('ItemModel').AsString;
  s0 := UniQuery_AutoTestSubItem.fieldbyname('SubItemName').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := '删除 自动测试设置#[机型:' + s1 + '/子测试项名称:' + s0;
  	InsertOperRecord(User.UserName, sTmp  + ']',DateTimeToStr(Now));
  end;
end;

procedure TfrmAutoTestItem.updateOperRec;
begin
  if (Length(sTestModel) > 0) and (CompareStr(sTestModel,Trim(cbbCom_TestModel.Text))= 0) then
  begin
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

procedure TfrmAutoTestItem.btnModifyClick(Sender: TObject);
begin
  inherited;
  updateOperRec;
end;

procedure TfrmAutoTestItem.TB_PostClick(Sender: TObject);
begin
  inherited;
  saveOperRec;
end;

end.
