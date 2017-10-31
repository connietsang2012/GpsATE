unit uClientLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uGlobalVar,uPublicFunc,uClientSendThread;

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
    procedure Btn_OkClick(Sender: TObject);
    procedure Edt_UserPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
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
    strSendText:string;
begin
    if (Trim(Edt_UserName.Text)='')  then
    begin
        MessageBox(0,'�û�������Ϊ��!','��Ϣ��ʾ',MB_ICONWARNING + mb_OK);
        Exit;
    end;
    if (Trim(Edt_UserPassword.Text)='') then
    begin
        MessageBox(0,'���벻��Ϊ��!','��Ϣ��ʾ',MB_ICONWARNING + mb_OK);
        Exit;
    end;
    User.UserName:=Trim(Edt_UserName.Text);
    User.UserPassword:=Trim(Edt_UserPassword.Text);
    
    //���͵�¼��Ϣ��������
    strSendText:=Format('Action=Login#Username=%s#UserPwd=%s#Tester=%s#',[User.UserName,User.UserPassword,User.UserName]);
    SendToServer(0,'Login',strSendText);
end;

procedure TfrmClientLogin.Edt_UserPasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
    //�����������ʱ���˻س�������Ϊ����ȷ����
    if key = #13 then Btn_OkClick(nil);
end;

procedure TfrmClientLogin.FormCreate(Sender: TObject);
begin
    //�����߳����ڱ�֤�ͻ����������������������
    ConnectSrvThread:=tClientSend.Create(False);
    Sleep(300);
end;

procedure TfrmClientLogin.Edt_UserNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Edt_UserPassword.SetFocus;
end;

end.
