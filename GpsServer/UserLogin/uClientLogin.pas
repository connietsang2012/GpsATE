unit uClientLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uGlobalVar,uPublicFunc, DB, MemDS, DBAccess,
  Uni;

type
  TfrmClientLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edt_UserName: TEdit;
    Edt_UserPassword: TEdit;
    Btn_Ok: TButton;
    Btn_Cancle: TButton;
    Label3: TLabel;
    Shape1: TShape;
    DS_Module: TDataSource;
    UniQuery_UserType: TUniQuery;
    SFUniQuery_UserTypeIndex: TStringField;
    intgrfldUniQuery_UserTypeTypeId: TIntegerField;
    SFUniQuery_UserTypeTypeName: TStringField;
    SFUniQuery_UserTypeTypeDes: TStringField;
    UniQuery_User: TUniQuery;
    SFUniQuery_UserIndex: TStringField;
    intgrfldUniQuery_UserUserId: TIntegerField;
    SFUniQuery_UserUserName: TStringField;
    SFUniQuery_UserUserDes: TStringField;
    SFUniQuery_UserUserPwd: TStringField;
    SFUniQuery_UserUserType: TStringField;
    SFUniQuery_UserUserTypeDes: TStringField;
    procedure Btn_OkClick(Sender: TObject);
    procedure Edt_UserPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_UserNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientLogin: TfrmClientLogin;

implementation


{$R *.dfm}
procedure TfrmClientLogin.Btn_OkClick(Sender: TObject);
var
    strTemp:string;
begin
    if (Trim(Edt_UserName.Text)='')  then
    begin
        MessageBox(0,'用户名不得为空!','信息提示',MB_ICONWARNING + mb_OK);
        Exit;
    end;
    if (Trim(Edt_UserPassword.Text)='') then
    begin
        MessageBox(0,'密码不得为空!','信息提示',MB_ICONWARNING + mb_OK);
        Exit;
    end;
    strTemp:=Format('UserName=''%s'' and UserPwd=''%s''',[Edt_UserName.Text,Edt_UserPassword.Text]);
    UniQuery_User.Edit;
    UniQuery_User.Refresh;
    UniQuery_User.Filter:=strTemp;
    UniQuery_User.Filtered:=True;
    User.UserName:=UniQuery_User.FieldByName('UserName').AsString;
    User.UserPassword:=UniQuery_User.FieldByName('UserPwd').AsString;
    User.UserDes:=UniQuery_User.FieldByName('UserDes').AsString;
    User.UserType:=UniQuery_User.FieldByName('UserType').AsString;
    //User.TestPlan:=UniQuery_User.FieldByName('TestPlan').AsString;

    if UniQuery_User.RecordCount>0 then
    begin
      //if (UniQuery_User.FieldByName('UserTypeDes').AsString='超级管理员')  or
       // (UniQuery_User.FieldByName('UserTypeDes').AsString='工厂管理员')then

      if (UniQuery_User.FieldByName('UserType').AsString='SuperAdmin')  or
        (UniQuery_User.FieldByName('UserType').AsString='admin')then
      begin
        InsertOperRecord(User.UserName,'登入 Server',DateTimeToStr(Now));
        Self.ModalResult:=mrOk;
      end
      else
        Self.ModalResult:=mrNo;
    end
    else
      Self.ModalResult:=mrNo;
end;

procedure TfrmClientLogin.Edt_UserPasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
    //在密码框输入时按了回车键以视为按了确定键
    if key = #13 then Btn_OkClick(nil);
end;


procedure TfrmClientLogin.Edt_UserNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Edt_UserPassword.SetFocus;
end;

end.
