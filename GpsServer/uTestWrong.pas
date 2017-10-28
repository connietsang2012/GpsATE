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
  oErrCode,oErrDecr : string;  //保存修改前的数据
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
  inherited;    //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;}
procedure TfrmTestWrong.OperateRecSave;
var
  sTmp : string;
begin
  sTmp := '保存 测试错误描述#[';
  if ansicomparestr(Trim(Edt_WrongName.Text),oErrCode) <> 0 then
  begin
    if Length(Trim(Edt_WrongName.Text)) > 0 then
    begin
      if Length(oErrCode) > 0 then
        sTmp := sTmp + '失败代码:'+Trim(Edt_WrongName.Text) + '(后)' + oErrCode + '(前)'
      else
        sTmp := sTmp + '失败代码:'+Trim(Edt_WrongName.Text);
    end
    else
    begin
      if Length(oErrCode) > 0 then
        sTmp := sTmp + '失败代码:' + oErrCode + '(前)';
    end;
  end;
  if ansicomparestr(Trim(Edt_WrongDes.Text),oErrDecr) <> 0 then
  begin
    if Length(Trim(Edt_WrongDes.Text)) > 0 then
    begin
      if Length(oErrDecr) > 0 then
        sTmp := sTmp + '/失败描述:'+Trim(Edt_WrongDes.Text) + '(后)' + oErrDecr + '(前)'
      else
        sTmp := sTmp + '/失败描述:'+Trim(Edt_WrongDes.Text);
    end
    else
    begin
      if Length(oErrDecr) > 0 then
        sTmp := sTmp + '/失败描述:'+ oErrDecr + '(前)';
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
    sTmp := '删除 删除测试错误描述#[失败代码:' + s0 + '/失败描述:'+ s1+ ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;
procedure TfrmTestWrong.TB_PostClick(Sender: TObject);
begin
  inherited;
  OperateRecSave;
end;


end.
