unit uUserForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, ExtCtrls, ADODB, DataDriverEh,
  MemTableEh, ActnList, ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,
  DBCtrls, StdCtrls, Mask,
  uDmMain, DBCtrlsEh, DBLookupEh, DBActns, MemDS, DBAccess, Uni;

type
  TfrmUser = class(TfrmModuleForm)
    Edt_UserName: TDBEdit;
    Edt_UserDes: TDBEdit;
    Edt_UserPwd: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    UniQuery_User: TUniQuery;
    intgrfldUniQuery_UserUserId: TIntegerField;
    SFUniQuery_UserUserName: TStringField;
    SFUniQuery_UserUserDes: TStringField;
    SFUniQuery_UserUserPwd: TStringField;
    SFUniQuery_UserUserType: TStringField;
    UniQuery_UserType: TUniQuery;
    SFUniQuery_UserTypeIndex: TStringField;
    intgrfldUniQuery_UserTypeTypeId: TIntegerField;
    SFUniQuery_UserTypeTypeName: TStringField;
    SFUniQuery_UserTypeTypeDes: TStringField;
    SFUniQuery_UserUserTypeDes: TStringField;
    SFUniQuery_UserIndex: TStringField;
    UniQuery_TestPlan: TUniQuery;
    intgrfldUniQuery_TestPlanTestPlanId: TIntegerField;
    SFUniQuery_TestPlanTestPlanName: TStringField;
    SFUniQuery_TestPlanTestPlanDes: TStringField;
    SFUniQuery_UserUserTestPlan: TStringField;
    SFUniQuery_UserUserTestPlanDes: TStringField;
    lbl5: TLabel;
    cbbUserTypeDes: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    lbl6: TLabel;
    dbchkInService: TDBCheckBox;
    UniQuery_UserInService: TBooleanField;
    procedure UniQuery_UserCalcFields(DataSet: TDataSet);
    procedure Edt_UserNameChange(Sender: TObject);
    procedure Edt_UserDesChange(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure cbbUserTypeDesChange(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
    //procedure dbchk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure operateRecSave;
    procedure deleteOperRec;override;
  end;

var
  frmUser: TfrmUser;
  sA : array[0..4] of string;
implementation
uses
  uUserTypeForm,uTestPlanForm,uGlobalVar,uPublicFunc;

{$R *.dfm}
procedure TfrmUser.UniQuery_UserCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Index').AsInteger:=UniQuery_User.RecNo;
end;
{procedure TfrmUser.FormShow(Sender: TObject);
begin
  inherited;
  //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := true;
end;   }

procedure TfrmUser.operateRecSave;
var
  sTmp : string;
  i : Integer;
begin
  sTmp := '保存 用户管理#[';
  if ansicomparestr(Trim(Edt_UserName.Text),sA[1]) <> 0 then
  begin
    if Length(Trim(Edt_UserName.Text)) > 0 then
    begin
      if Length(sA[1]) > 0 then
        sTmp := sTmp + '用户名:' +Trim(Edt_UserName.Text) + '(后)' + sA[1] + '(前)'
      else
        sTmp := sTmp + '用户名:' +Trim(Edt_UserName.Text);
    end
    else
    begin
      if Length(sA[1]) > 0 then
        sTmp := sTmp + '用户名:' + sA[1] + '(前)';
    end;
  end;
  if ansicomparestr(Trim(Edt_UserDes.Text),sA[2]) <> 0 then
  begin
    if Length(Trim(Edt_UserDes.Text)) > 0 then
    begin
      if Length(sA[2]) > 0 then
        sTmp := sTmp +'/用户描述:'+ Trim(Edt_UserDes.Text) + '(后)' + sA[2] + '(前)'
      else
        sTmp := sTmp +'/用户描述:'+ Trim(Edt_UserDes.Text)
    end
    else
    begin
      if Length(sA[2]) > 0 then
        sTmp := sTmp + '/用户描述:' + sA[2] + '(前)';
    end;
  end;
  if Length(Trim(DBLookupComboboxEh1.Text)) < 1 then
  begin
    Application.MessageBox('用户类型不能为空，请选择!','提示信息',MB_ICONERROR);
    DBLookupComboboxEh1.SetFocus;
    Exit;
  end;
  if ansicomparestr(Trim(DBLookupComboboxEh1.Text),sA[3]) <> 0 then
  begin
    if Length(Trim(DBLookupComboboxEh1.Text)) > 0 then
    begin
      if Length(sA[3]) > 0 then
        sTmp := sTmp +'/用户类型:' + Trim(DBLookupComboboxEh1.Text) + '(后)' + sA[3] + '(前)'
      else
        sTmp := sTmp +'/用户类型:' + Trim(DBLookupComboboxEh1.Text)
    end
    else
    begin
      if Length(sA[3]) > 0 then
        sTmp := sTmp +'/用户类型:' + Trim(DBLookupComboboxEh1.Text) + sA[3] + '(前)';
    end;
  end;
  if Length(Trim(cbbUserTypeDes.Text)) < 1 then
  begin
    Application.MessageBox('测试工站不能为空，请选择!','提示信息',MB_ICONERROR);
    cbbUserTypeDes.SetFocus;
    Exit;
  end;
  if ansicomparestr(Trim(cbbUserTypeDes.Text),sA[4]) <> 0 then
  begin
    if Length(Trim(cbbUserTypeDes.Text)) > 0 then
    begin
      if Length(sA[4]) > 0 then
        sTmp := sTmp +'/测试工站:' + Trim(cbbUserTypeDes.Text) + '(后)' + sA[4] + '(前)'
      else
        sTmp := sTmp +'/测试工站:' + Trim(cbbUserTypeDes.Text)
    end
    else
    begin
      if Length(sA[4]) > 0 then
        sTmp := sTmp +'/测试工站:' + Trim(cbbUserTypeDes.Text) + sA[4] + '(前)';
    end;
  end;
  for i := 0 to 4 do
  begin
    sA[i] := '';
  end;
  InsertOperRecord(User.UserName,sTmp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmUser.Edt_UserNameChange(Sender: TObject);
begin
  inherited;
  sA[1] := Trim(UniQuery_User.fieldbyname('UserName').AsString);
end;

procedure TfrmUser.Edt_UserDesChange(Sender: TObject);
begin
  inherited;
  sA[2] := Trim(UniQuery_User.fieldbyname('UserDes').AsString);
end;

procedure TfrmUser.DBLookupComboboxEh1Change(Sender: TObject);
begin
  inherited;
  sA[3] := Trim(UniQuery_User.fieldbyname('UserTypeDes').AsString);
end;

procedure TfrmUser.cbbUserTypeDesChange(Sender: TObject);
begin
  inherited;
  sA[4] := Trim(UniQuery_User.fieldbyname('UserTestPlanDes').AsString);
end;

procedure TfrmUser.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  inherited;
  s0 := UniQuery_User.fieldbyname('UserName').AsString;
  s1 := UniQuery_User.fieldbyname('UserDes').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := '删除 删除用户#[用户名:' + s0 + '/用户描述:'+ s1+ ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;

procedure TfrmUser.TB_PostClick(Sender: TObject);
begin
  inherited;
  operateRecSave;
end;
               {
procedure TfrmUser.dbchk1Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_User.FIeldbyname('InService').AsBoolean;
  if b  then
  	sA[5] := '是'
  else
  	sA[5] := '否';
end;          }

end.
