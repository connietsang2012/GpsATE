unit uTestPlanSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls, DBCtrls, Mask,
  DBActns, MemDS, DBAccess, Uni;

type
  TfrmTestPlanSet = class(TfrmModuleForm)
    lbl1: TLabel;
    Edt_TypeName: TDBEdit;
    grp1: TGroupBox;
    dbchkTestFunction: TDBCheckBox;
    dbchkTestFunction3: TDBCheckBox;
    dbchkTestFunction1: TDBCheckBox;
    dbchkTestGPS: TDBCheckBox;
    dbchkTestFunction2: TDBCheckBox;
    dbchkTestCouple: TDBCheckBox;
    dbchkTestAutoTest: TDBCheckBox;
    UniQuery_TestPlanSet: TUniQuery;
    intgrfldUniQuery_TestPlanSetId: TIntegerField;
    SFUniQuery_TestPlanSetVersion: TStringField;
    blnfldUniQuery_TestPlanSetTestFunction: TBooleanField;
    blnfldUniQuery_TestPlanSetTestGPS: TBooleanField;
    blnfldUniQuery_TestPlanSetTestCouple: TBooleanField;
    blnfldUniQuery_TestPlanSetTestWriteImei: TBooleanField;
    blnfldUniQuery_TestPlanSetTestParamDownload: TBooleanField;
    blnfldUniQuery_TestPlanSetTestCartonBox: TBooleanField;
    blnfldUniQuery_TestPlanSetTestAutoTest: TBooleanField;
    SFUniQuery_TestPlanSetIndex: TStringField;
    blnfldUniQuery_TestPlanSetTestAutoTestSMT: TBooleanField;
    dbchkTestAutoTest1: TDBCheckBox;
    grp_Query: TGroupBox;
    lbl_SN: TLabel;
    Edt_Model: TEdit;
    procedure UniQuery_TestPlanSetCalcFields(DataSet: TDataSet);
    procedure UniQuery_TestPlanSetAfterInsert(DataSet: TDataSet);
    procedure ac_FindExecute(Sender: TObject);
    procedure dbchkTestFunctionClick(Sender: TObject);
    procedure dbchkTestFunction1Click(Sender: TObject);
    procedure dbchkTestFunction2Click(Sender: TObject);
    procedure dbchkTestAutoTestClick(Sender: TObject);
    procedure dbchkTestFunction3Click(Sender: TObject);
    procedure dbchkTestGPSClick(Sender: TObject);
    procedure dbchkTestCoupleClick(Sender: TObject);
    procedure dbchkTestAutoTest1Click(Sender: TObject);
    procedure Edt_TypeNameChange(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure operateRecSave;
    procedure deleteOperRec;override;
  end;

var
  frmTestPlanSet: TfrmTestPlanSet;
  sTemp : string;
  oModel : string;    //存储修改前的机型数据
  sA : array[0..9] of Boolean;
implementation
uses
    uDmMain,uGlobalVar,uPublicFunc;
{$R *.dfm}

procedure TfrmTestPlanSet.UniQuery_TestPlanSetCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('Index').AsInteger:=UniQuery_TestPlanSet.RecNo;
end;

procedure TfrmTestPlanSet.UniQuery_TestPlanSetAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TestFunction').Value:=True;
  DataSet.FieldByName('TestGPS').Value:=True;
  DataSet.FieldByName('TestCouple').Value:=True;
  DataSet.FieldByName('TestWriteImei').Value:=True;
  DataSet.FieldByName('TestParamDownload').Value:=True;
  DataSet.FieldByName('TestCartonBox').Value:=True;
  DataSet.FieldByName('TestAutoTest').Value:=True;
  DataSet.FieldByName('TestAutoTestSMT').Value:=True;
end;

procedure TfrmTestPlanSet.ac_FindExecute(Sender: TObject);
var
  strTemp,qrySql:string;
begin
  inherited;
  strTemp:= '%'+Trim(Edt_Model.Text)+'%';
  qrySql := Format('Version like ''%s''',[strTemp]);
  UniQuery_TestPlanSet.Filter:=qrySql;
  UniQuery_TestPlanSet.Filtered:=True;
end;

{procedure TfrmTestPlanSet.FormShow(Sender: TObject);
begin
  inherited;  //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;}

procedure TfrmTestPlanSet.operateRecSave;
var
  sTmp : string;
  //i : Integer;
begin
  sTmp := '保存 测试工站配制#[';
  if Length(Trim(Edt_TypeName.Text)) > 0 then
  begin
    if Length(oModel) >0 then
      sTmp := sTmp +  '机型:' + Trim(Edt_TypeName.Text) + '(后)' + oModel + '(前)'
    else
      sTmp := sTmp +  '机型:' + Trim(Edt_TypeName.Text)
  end
  else
  begin
    if Length(oModel) >0 then
      sTmp := sTmp +  '机型:' + oModel +'(前)'
    else
      sTmp := sTmp +  '机型:' + '(没输入机型)'
  end;

  if dbchkTestFunction.Checked then
  	sTemp := '功能测试位:Y/';

  if dbchkTestFunction1.Checked then
    sTemp := sTemp + 'GPS测试位:Y/';
  if dbchkTestFunction2.Checked then
    sTemp := sTemp + '耦合测试位:Y/';
  if dbchkTestAutoTest.Checked then
    sTemp := sTemp + '自动测试位:Y/';
  if dbchkTestFunction3.Checked then
    sTemp := sTemp + 'IMEI烧写位:Y/';
  if dbchkTestGPS.Checked then
    sTemp := sTemp + '软件下载参数位:Y/';
  if dbchkTestCouple.Checked then
    sTemp := sTemp + '卡通箱测试位:Y/';
  if dbchkTestAutoTest1.Checked then
    sTemp := sTemp + '自动测试位(SMT):Y';

  //for i := 0 to 8 do sA[i] := false;
  //oModel := '';
  InsertOperRecord(User.UserName,sTmp + '/{需测试工站#' + sTemp + ']}',DateTimeToStr(Now));
  sTemp := '';
  TB_Refresh.Click;
end;

procedure TfrmTestPlanSet.dbchkTestFunctionClick(Sender: TObject);
begin
  inherited;
  sA[1] := UniQuery_TestPlanSet.FieldByName('TestFunction').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestFunction1Click(Sender: TObject);
begin
  inherited;
  sA[2] := UniQuery_TestPlanSet.FieldByName('TestGPS').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestFunction2Click(Sender: TObject);
begin
  inherited;
  sA[3] := UniQuery_TestPlanSet.FieldByName('TestCouple').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestAutoTestClick(Sender: TObject);
begin
  inherited;
  sA[4] := UniQuery_TestPlanSet.FieldByName('TestAutoTest').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestFunction3Click(Sender: TObject);
begin
  inherited;
  sA[5] := UniQuery_TestPlanSet.FieldByName('TestWriteImei').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestGPSClick(Sender: TObject);
begin
  inherited;
  sA[6] := UniQuery_TestPlanSet.FieldByName('TestParamDownload').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestCoupleClick(Sender: TObject);
begin
  inherited;
  sA[7] := UniQuery_TestPlanSet.FieldByName('TestCartonBox').AsBoolean;
end;

procedure TfrmTestPlanSet.dbchkTestAutoTest1Click(Sender: TObject);
begin
  inherited;
  sA[8] := UniQuery_TestPlanSet.FieldByName('TestAutoTestSMT').AsBoolean;
end;

procedure TfrmTestPlanSet.Edt_TypeNameChange(Sender: TObject);
begin
  inherited;
  oModel := UniQuery_TestPlanSet.FieldByName('Version').AsString;
end;

procedure TfrmTestPlanSet.deleteOperRec;
var
  s0,sTmp : string;
  sStd : array[0..9] of Boolean;
  b : Boolean;
begin
  s0 := UniQuery_TestPlanSet.fieldbyname('Version').AsString;
  sStd[1] := UniQuery_TestPlanSet.fieldbyname('TestFunction').AsBoolean;
  sStd[2] := UniQuery_TestPlanSet.fieldbyname('TestGPS').AsBoolean;
  sStd[3] := UniQuery_TestPlanSet.fieldbyname('TestCouple').AsBoolean;
  sStd[4] := UniQuery_TestPlanSet.fieldbyname('TestAutoTest').AsBoolean;
  sStd[5] := UniQuery_TestPlanSet.fieldbyname('TestWriteImei').AsBoolean;
  sStd[6] := UniQuery_TestPlanSet.fieldbyname('TestParamDownload').AsBoolean;
  sStd[7] := UniQuery_TestPlanSet.fieldbyname('TestCartonBox').AsBoolean;
  sStd[8] := UniQuery_TestPlanSet.fieldbyname('TestAutoTestSMT').AsBoolean;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := '删除 删除测试机型#[机型:' + s0  + '/需测试工站:';
    if sStd[1] then
      sTmp := sTmp + '<功能测试位>';
    if sStd[2] then
      sTmp := sTmp + '<功能测试位>';
    if sStd[3] then
      sTmp := sTmp + '<耦合测试位>';
    if sStd[4] then
      sTmp := sTmp + '<自动测试位>';
    if sStd[5] then
      sTmp := sTmp + '<IMEI烧写位>';
    if sStd[6] then
      sTmp := sTmp + '<软件下载参数位>';
    if sStd[7] then
      sTmp := sTmp + '<卡通箱测试位>';
    if sStd[8] then
      sTmp := sTmp + '<自动测试位(SMT)>';
    InsertOperRecord(User.UserName,sTmp+ ']',DateTimeToStr(Now));
  end;
end;

procedure TfrmTestPlanSet.TB_PostClick(Sender: TObject);
begin
  inherited;
  operateRecSave;
end;

end.
