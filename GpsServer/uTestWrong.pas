unit uTestWrong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, Db, ExtCtrls, ActnList, ImgList, ComCtrls, ToolWin,
  GridsEh, DBGridEh, StdCtrls, Mask, DBCtrls,DBActns, MemDS, DBAccess, Uni;

type
  TfrmTestWrong = class(TfrmModuleForm)
    lbl1: TLabel;
    Edt_WrongName: TDBEdit;
    lbl2: TLabel;
    Edt_WrongDes: TDBEdit;
    UniQuery_TestWrong: TUniQuery;
    intgrfldUniQuery_TestWrongWrongId: TIntegerField;
    SFUniQuery_TestWrongWrongName: TStringField;
    SFUniQuery_TestWrongWrongDes: TStringField;
    SFUniQuery_TestWrongIndex: TStringField;
    procedure UniQuery_TestWrongCalcFields(DataSet: TDataSet);
    procedure Edt_WrongNameChange(Sender: TObject);
    procedure Edt_WrongDesChange(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OperateRecSave;
    procedure deleteOperRec;override;
  end;

var
  frmTestWrong: TfrmTestWrong;
  oErrCode,oErrDecr : string;  //�����޸�ǰ������
implementation
uses
    uDmMain,uGlobalVar,uPublicFunc;
{$R *.dfm}

procedure TfrmTestWrong.UniQuery_TestWrongCalcFields(DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('Index').AsInteger:=UniQuery_TestWrong.RecNo;
end;

{procedure TfrmTestWrong.FormShow(Sender: TObject);
begin
  inherited;    //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;}
procedure TfrmTestWrong.OperateRecSave;
var
  sTmp : string;
begin
  sTmp := '���� ���Դ�������#[';
  if ansicomparestr(Trim(Edt_WrongName.Text),oErrCode) <> 0 then
  begin
    if Length(Trim(Edt_WrongName.Text)) > 0 then
    begin
      if Length(oErrCode) > 0 then
        sTmp := sTmp + 'ʧ�ܴ���:'+Trim(Edt_WrongName.Text) + '(��)' + oErrCode + '(ǰ)'
      else
        sTmp := sTmp + 'ʧ�ܴ���:'+Trim(Edt_WrongName.Text);
    end
    else
    begin
      if Length(oErrCode) > 0 then
        sTmp := sTmp + 'ʧ�ܴ���:' + oErrCode + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_WrongDes.Text),oErrDecr) <> 0 then
  begin
    if Length(Trim(Edt_WrongDes.Text)) > 0 then
    begin
      if Length(oErrDecr) > 0 then
        sTmp := sTmp + '/ʧ������:'+Trim(Edt_WrongDes.Text) + '(��)' + oErrDecr + '(ǰ)'
      else
        sTmp := sTmp + '/ʧ������:'+Trim(Edt_WrongDes.Text);
    end
    else
    begin
      if Length(oErrDecr) > 0 then
        sTmp := sTmp + '/ʧ������:'+ oErrDecr + '(ǰ)';
    end;
  end;
  oErrCode := '';
  oErrDecr := '';
  InsertOperRecord(User.UserName,sTmp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmTestWrong.Edt_WrongNameChange(Sender: TObject);
begin
  inherited;
  oErrCode := Trim(UniQuery_TestWrong.fieldbyname('WrongName').AsString);
end;

procedure TfrmTestWrong.Edt_WrongDesChange(Sender: TObject);
begin
  inherited;
  oErrDecr := Trim(UniQuery_TestWrong.fieldbyname('WrongDes').AsString);
end;

procedure TfrmTestWrong.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  inherited;
  s0 := UniQuery_TestWrong.fieldbyname('WrongName').AsString;
  s1 := UniQuery_TestWrong.fieldbyname('WrongDes').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := 'ɾ�� ɾ�����Դ�������#[ʧ�ܴ���:' + s0 + '/ʧ������:'+ s1+ ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;
procedure TfrmTestWrong.TB_PostClick(Sender: TObject);
begin
  inherited;
  OperateRecSave;
end;


end.
