unit uClientDataUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uClientDataModuleForm, DB, ADODB, ImgList, ActnList, ComCtrls,
  GridsEh, DBGridEh, ToolWin, DBCtrlsEh, DBLookupEh, StdCtrls, Mask,
  DBCtrls,uPublicFunc;

type
  TfrmClientUser = class(TfrmClientDataModule)
    lbl1: TLabel;
    Edt_UserName: TDBEdit;
    Edt_UserDes: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    Edt_UserPwd: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    lbl4: TLabel;
    lbl5: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    ADS_UserType: TADODataSet;
    DS_UserType: TDataSource;
    DS_TestPlan: TDataSource;
    ADS_TestPlan: TADODataSet;
    procedure FormCreate(Sender: TObject);
    procedure ac_RefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientUser: TfrmClientUser;

implementation

{$R *.dfm}

procedure TfrmClientUser.FormCreate(Sender: TObject);
begin
  inherited;
    PrimaryKey:='UserId';
    PrimaryKeyType:='String';
    TableName:='Gps_User';
end;

procedure TfrmClientUser.ac_RefreshExecute(Sender: TObject);
var
    CommIndex:Integer;
    strSendSrvText:string;
begin
    CommIndex:=0;
    strSendSrvText:=Format('Action=SelectTable#TABLE=%s_UserType#',[TableName]);
    SendToServer(CommIndex,'SelectTable',strSendSrvText);
    strSendSrvText:=Format('Action=SelectTable#TABLE=%s_TestPlan#',[TableName]);
    SendToServer(CommIndex,'SelectTable',strSendSrvText);
    Application.ProcessMessages;
  inherited;
end;

end.
