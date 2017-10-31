unit uTestParameter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, Db, MemTableEh, ExtCtrls, ActnList, ImgList, ComCtrls,
  ToolWin, GridsEh, uDmMain, StdCtrls, Mask, DBCtrls, DBActns, MemDS, DBAccess, Uni,
  DBGridEh;
type
  TfrmTestParameter = class(TfrmModuleForm)
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    Edt_CoupleTestTestTime: TDBEdit;
    lbl3: TLabel;
    Edt_ParamDownloadTestTime: TDBEdit;
    lbl4: TLabel;
    Edt_AutoTestTestTime: TDBEdit;
    lbl7: TLabel;
    Edt_WriteImeiTestTime: TDBEdit;
    lbl8: TLabel;
    Edt_TwiceTestTime: TDBEdit;
    GroupBox2: TGroupBox;
    lbl11: TLabel;
    Edt_GPSNumbers: TDBEdit;
    Label1: TLabel;
    Edt_GPSDb: TDBEdit;
    Label2: TLabel;
    Edt_EPOLatitude: TDBEdit;
    Label3: TLabel;
    Edt_EPOLongitude: TDBEdit;
    Label4: TLabel;
    Edt_EPOAltitude: TDBEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Edt_CheckTestAtReturn: TDBEdit;
    Label8: TLabel;
    Edt_CheckTestAtTimeOut: TDBEdit;
    Label9: TLabel;
    Edt_CheckTestAllowTestCount: TDBEdit;
    Label5: TLabel;
    Edt_CheckTestTime: TDBEdit;
    Label6: TLabel;
    Edt_CheckTestAtCommand: TDBEdit;
    UniQuery_TestParameter: TUniQuery;
    intgrfldUniQuery_TestParameterId: TIntegerField;
    intgrfldUniQuery_TestParameterCoupleTestTestTime: TIntegerField;
    intgrfldUniQuery_TestParameterParamDownloadTestTime: TIntegerField;
    intgrfldUniQuery_TestParameterAutoTestTestTime: TIntegerField;
    intgrfldUniQuery_TestParameterWriteImeiTestTime: TIntegerField;
    intgrfldUniQuery_TestParameterTwiceTestTime: TIntegerField;
    intgrfldUniQuery_TestParameterGPSNumbers: TIntegerField;
    intgrfldUniQuery_TestParameterGPSDb: TIntegerField;
    SFUniQuery_TestParameterEPOLatitude: TStringField;
    SFUniQuery_TestParameterEPOLongitude: TStringField;
    SFUniQuery_TestParameterEPOAltitude: TStringField;
    intgrfldUniQuery_TestParameterCheckTestTime: TIntegerField;
    SFUniQuery_TestParameterCheckTestAtCommand: TStringField;
    SFUniQuery_TestParameterCheckTestAtReturn: TStringField;
    intgrfldUniQuery_TestParameterCheckTestAtTimeOut: TIntegerField;
    intgrfldUniQuery_TestParameterCheckTestAllowTestCount: TIntegerField;
    SFUniQuery_TestParameterIndex: TStringField;
    UniQuery_TestParameterSMT_AutoTestTestTime: TIntegerField;
    Label10: TLabel;
    Edt_SMT_AutoTestTestTime: TDBEdit;
    lbl2: TLabel;
    dbedtSMT_INPercentage: TDBEdit;
    intgrfldUniQuery_TestParameterPercentage: TIntegerField;
    procedure UniQuery_TestParameterCalcFields(DataSet: TDataSet);
    procedure Edt_CoupleTestTestTimeChange(Sender: TObject);
    procedure Edt_ParamDownloadTestTimeChange(Sender: TObject);
    procedure Edt_AutoTestTestTimeChange(Sender: TObject);
    procedure Edt_WriteImeiTestTimeChange(Sender: TObject);
    procedure Edt_TwiceTestTimeChange(Sender: TObject);
    procedure Edt_GPSNumbersChange(Sender: TObject);
    procedure Edt_GPSDbChange(Sender: TObject);
    procedure Edt_EPOLatitudeChange(Sender: TObject);
    procedure Edt_EPOLongitudeChange(Sender: TObject);
    procedure Edt_EPOAltitudeChange(Sender: TObject);
    procedure Edt_CheckTestTimeChange(Sender: TObject);
    procedure Edt_CheckTestAtCommandChange(Sender: TObject);
    procedure Edt_CheckTestAtReturnChange(Sender: TObject);
    procedure Edt_CheckTestAtTimeOutChange(Sender: TObject);
    procedure Edt_CheckTestAllowTestCountChange(Sender: TObject);
    procedure Edt_SMT_AutoTestTestTimeChange(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure operateRecSave;
    procedure deleteOperRec;override;
  end;

var
  frmTestParameter: TfrmTestParameter;
  sA : array[0..16] of string;
implementation
uses
  uGlobalVar,uPublicFunc;
{$R *.dfm}

procedure TfrmTestParameter.UniQuery_TestParameterCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('Index').AsInteger:=UniQuery_TestParameter.RecNo;
end;

{procedure TfrmTestParameter.FormShow(Sender: TObject);
begin
  inherited;  //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;}
procedure TfrmTestParameter.operateRecSave;
var
  sTmp : string;
  i : Integer;
begin
  sTmp := '���� ���Բ���#[';
  if ansicomparestr(Trim(Edt_CoupleTestTestTime.Text),sA[1]) <> 0 then
  begin
    if Length(Trim(Edt_CoupleTestTestTime.Text)) > 0 then
    begin
      if Length(sA[1]) > 0 then
      	sTmp := sTmp + '��ϳ�ʱ:'+Trim(Edt_CoupleTestTestTime.Text) + '(��)' + sA[1] + '(ǰ)'
      else
        sTmp := sTmp + '��ϳ�ʱ:'+Trim(Edt_CoupleTestTestTime.Text);
    end
    else
    begin
      if Length(sA[1]) > 0 then
        sTmp := sTmp + '��ϳ�ʱ:' + sA[1] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_ParamDownloadTestTime.Text),sA[2]) <> 0 then
  begin
    if Length(Trim(Edt_ParamDownloadTestTime.Text)) > 0 then
    begin
      if Length(sA[2]) > 0 then
      	sTmp := sTmp + '/���س�ʱ:'+Trim(Edt_ParamDownloadTestTime.Text) + '(��)' + sA[2] + '(ǰ)'
      else
        sTmp := sTmp + '/���س�ʱ:'+Trim(Edt_ParamDownloadTestTime.Text);
    end
    else
    begin
      if Length(sA[2]) > 0 then
        sTmp := sTmp + '/���س�ʱ:' + sA[2] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_AutoTestTestTime.Text),sA[3]) <> 0 then
  begin
    if Length(Trim(Edt_AutoTestTestTime.Text)) > 0 then
    begin
      if Length(sA[3]) > 0 then
      	sTmp := sTmp + '/�Զ���ʱ:'+Trim(Edt_AutoTestTestTime.Text) + '(��)' + sA[3] + '(ǰ)'
      else
        sTmp := sTmp + '/�Զ���ʱ:'+Trim(Edt_AutoTestTestTime.Text);
    end
    else
    begin
      if Length(sA[3]) > 0 then
        sTmp := sTmp + '/�Զ���ʱ:' + sA[3] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_WriteImeiTestTime.Text),sA[4]) <> 0 then
  begin
    if Length(Trim(Edt_WriteImeiTestTime.Text)) > 0 then
    begin
      if Length(sA[4]) > 0 then
      	sTmp := sTmp + '/IMEI��д��ʱ:'+Trim(Edt_WriteImeiTestTime.Text) + '(��)' + sA[4] + '(ǰ)'
      else
        sTmp := sTmp + '/IMEI��д��ʱ:'+Trim(Edt_WriteImeiTestTime.Text);
    end
    else
    begin
      if Length(sA[4]) > 0 then
        sTmp := sTmp + '/IMEI��д��ʱ:' + sA[4] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_TwiceTestTime.Text),sA[5]) <> 0 then
  begin
    if Length(Trim(Edt_TwiceTestTime.Text)) > 0 then
    begin
      if Length(sA[5]) > 0 then
      	sTmp := sTmp + '/������ʱ:'+Trim(Edt_TwiceTestTime.Text) + '(��)' + sA[5] + '(ǰ)'
      else
        sTmp := sTmp + '/������ʱ:'+Trim(Edt_TwiceTestTime.Text);
    end
    else
    begin
      if Length(sA[5]) > 0 then
        sTmp := sTmp + '/������ʱ:' + sA[5] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_SMT_AutoTestTestTime.Text),sA[0]) <> 0 then
  begin
    if Length(Trim(Edt_SMT_AutoTestTestTime.Text)) > 0 then
    begin
      if Length(sA[0]) > 0 then
      	sTmp := sTmp + '/SMT�Զ����Գ�ʱ:'+Trim(Edt_SMT_AutoTestTestTime.Text) + '(��)' + sA[0] + '(ǰ)'
      else
        sTmp := sTmp + '/SMT�Զ����Գ�ʱ:'+Trim(Edt_SMT_AutoTestTestTime.Text);
    end
    else
    begin
      if Length(sA[0]) > 0 then
        sTmp := sTmp + '/SMT�Զ����Գ�ʱ:' + sA[0] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_GPSNumbers.Text),sA[6]) <> 0 then
  begin
    if Length(Trim(Edt_GPSNumbers.Text)) > 0 then
    begin
      if Length(sA[6]) > 0 then
      	sTmp := sTmp + '/GPS���ǿ���:'+Trim(Edt_GPSNumbers.Text) + '(��)' + sA[6] + '(ǰ)'
      else
        sTmp := sTmp + '/GPS���ǿ���:'+Trim(Edt_GPSNumbers.Text);
    end
    else
    begin
      if Length(sA[6]) > 0 then
        sTmp := sTmp + '/GPS���ǿ���:' + sA[6] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_GPSDb.Text),sA[7]) <> 0 then
  begin
    if Length(Trim(Edt_GPSDb.Text)) > 0 then
    begin
      if Length(sA[7]) > 0 then
      	sTmp := sTmp + '/GPS����ǿ��:' + Trim(Edt_GPSDb.Text) + '(��)' + sA[7] + '(ǰ)'
      else
        sTmp := sTmp + '/GPS����ǿ��:' + Trim(Edt_GPSDb.Text);
    end
    else
    begin
      if Length(sA[7]) > 0 then
        sTmp := sTmp + '/GPS����ǿ��:' + sA[7] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_EPOLatitude.Text),sA[8]) <> 0 then
  begin
    if Length(Trim(Edt_EPOLatitude.Text)) > 0 then
    begin
      if Length(sA[8]) > 0 then
      	sTmp := sTmp + '/EPO����:' + Trim(Edt_EPOLatitude.Text) + '(��)' + sA[8] + '(ǰ)'
      else
        sTmp := sTmp + '/EPO����:' + Trim(Edt_EPOLatitude.Text);
    end
    else
    begin
      if Length(sA[8]) > 0 then
        sTmp := sTmp + '/EPO����:' + sA[8] + '(ǰ)'
    end;
  end;
  if ansicomparestr(Trim(Edt_EPOLongitude.Text),sA[9]) <> 0 then
  begin
    if Length(Trim(Edt_EPOLongitude.Text)) > 0 then
    begin
      if Length(sA[9]) > 0 then
      	sTmp := sTmp + '/EPOγ��:' + Trim(Edt_EPOLongitude.Text) + '(��)' + sA[9] + '(ǰ)'
      else
        sTmp := sTmp + '/EPOγ��:' + Trim(Edt_EPOLongitude.Text);
    end
    else
    begin
      if Length(sA[9]) > 0 then
        sTmp := sTmp + '/EPOγ��:' + sA[9] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_EPOAltitude.Text),sA[10]) <> 0 then
  begin
    if Length(Trim(Edt_EPOAltitude.Text)) > 0 then
    begin
      if Length(sA[10]) > 0 then
      	sTmp := sTmp + '/EPO�߶�:' + Trim(Edt_EPOAltitude.Text) + '(��)' + sA[10] + '(ǰ)'
      else
        sTmp := sTmp + '/EPO�߶�:' + Trim(Edt_EPOAltitude.Text);
    end
    else
    begin
      if Length(sA[10]) > 0 then
        sTmp := sTmp + '/EPO�߶�:' + sA[10] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_CheckTestTime.Text),sA[11]) <> 0 then
  begin
    if Length(Trim(Edt_CheckTestTime.Text)) > 0 then
    begin
      if Length(sA[11]) > 0 then
      	sTmp := sTmp + '/�����:' + Trim(Edt_CheckTestTime.Text) + '(��)' + sA[11] + '(ǰ)'
      else
        sTmp := sTmp + '/�����:' + Trim(Edt_CheckTestTime.Text);
    end
    else
    begin
      if Length(sA[11]) > 0 then
        sTmp := sTmp + '/�����:' + sA[11] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_CheckTestAtCommand.Text),sA[12]) <> 0 then
  begin
    if Length(Trim(Edt_CheckTestAtCommand.Text)) > 0 then
    begin
      if Length(sA[12]) > 0 then
      	sTmp := sTmp + '/���ATָ��:' + Trim(Edt_CheckTestAtCommand.Text) + '(��)' + sA[12] + '(ǰ)'
      else
        sTmp := sTmp + '/���ATָ��:' + Trim(Edt_CheckTestAtCommand.Text);
    end
    else
    begin
      if Length(sA[12]) > 0 then
        sTmp := sTmp + '/���ATָ��:' + sA[12] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_CheckTestAtReturn.Text),sA[13]) <> 0 then
  begin
    if Length(Trim(Edt_CheckTestAtReturn.Text)) > 0 then
    begin
      if Length(sA[13]) > 0 then
      	sTmp := sTmp + '/AT����ֵ:' + Trim(Edt_CheckTestAtReturn.Text) + '(��)' + sA[13] + '(ǰ)'
      else
        sTmp := sTmp + '/AT����ֵ:' + Trim(Edt_CheckTestAtReturn.Text);
    end
    else
    begin
      if Length(sA[13]) > 0 then
        sTmp := sTmp + '/AT����ֵ:' + sA[13] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_CheckTestAtTimeOut.Text),sA[14]) <> 0 then
  begin
    if Length(Trim(Edt_CheckTestAtTimeOut.Text)) > 0 then
    begin
      if Length(sA[14]) > 0 then
      	sTmp := sTmp + '/AT��ʱ:' + Trim(Edt_CheckTestAtTimeOut.Text) + '(��)' + sA[14] + '(ǰ)'
      else
        sTmp := sTmp + '/AT��ʱ:' + Trim(Edt_CheckTestAtTimeOut.Text);
    end
    else
    begin
      if Length(sA[14]) > 0 then
        sTmp := sTmp + '/AT��ʱ:' + sA[14] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_CheckTestAllowTestCount.Text),sA[15]) <> 0 then
  begin
    if Length(Trim(Edt_CheckTestAllowTestCount.Text)) > 0 then
    begin
      if Length(sA[15]) > 0 then
      	sTmp := sTmp + '/�������:' + Trim(Edt_CheckTestAllowTestCount.Text) + '(��)' + sA[15] + '(ǰ)'
      else
        sTmp := sTmp + '/�������:' + Trim(Edt_CheckTestAllowTestCount.Text);
    end
    else
    begin
      if Length(sA[15]) > 0 then
        sTmp := sTmp + '/�������:' + sA[15] + '(ǰ)';
    end;
  end;
	for i := 0 to 15 do sA[i] := '';
  InsertOperRecord(User.UserName,sTmp + ']' ,DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmTestParameter.Edt_CoupleTestTestTimeChange(Sender: TObject);
begin
  inherited;
  sA[1] := IntToStr(UniQuery_TestParameter.fieldbyname('CoupleTestTestTime').AsInteger);
end;

procedure TfrmTestParameter.Edt_ParamDownloadTestTimeChange(
  Sender: TObject);
begin
  inherited;
  sA[2] := IntToStr(UniQuery_TestParameter.fieldbyname('ParamDownloadTestTime').AsInteger);
end;

procedure TfrmTestParameter.Edt_AutoTestTestTimeChange(Sender: TObject);
begin
  inherited;
  sA[3] := IntToStr(UniQuery_TestParameter.fieldbyname('AutoTestTestTime').AsInteger);
end;

procedure TfrmTestParameter.Edt_WriteImeiTestTimeChange(Sender: TObject);
begin
  inherited;
  sA[4] := IntToStr(UniQuery_TestParameter.fieldbyname('WriteImeiTestTime').AsInteger);
end;

procedure TfrmTestParameter.Edt_TwiceTestTimeChange(Sender: TObject);
begin
  inherited;
  sA[5] := IntToStr(UniQuery_TestParameter.fieldbyname('TwiceTestTime').AsInteger);
end;

procedure TfrmTestParameter.Edt_GPSNumbersChange(Sender: TObject);
begin
  inherited;
  sA[6] := IntToStr(UniQuery_TestParameter.fieldbyname('GPSNumbers').AsInteger);
end;

procedure TfrmTestParameter.Edt_GPSDbChange(Sender: TObject);
begin
  inherited;
  sA[7] := IntToStr(UniQuery_TestParameter.fieldbyname('GPSDb').AsInteger);
end;

procedure TfrmTestParameter.Edt_EPOLatitudeChange(Sender: TObject);
begin
  inherited;
  sA[8] := Trim(UniQuery_TestParameter.fieldbyname('EPOLatitude').AsString);
end;

procedure TfrmTestParameter.Edt_EPOLongitudeChange(Sender: TObject);
begin
  inherited;
  sA[9] := Trim(UniQuery_TestParameter.fieldbyname('EPOLongitude').AsString);
end;

procedure TfrmTestParameter.Edt_EPOAltitudeChange(Sender: TObject);
begin
  inherited;
  sA[10] := Trim(UniQuery_TestParameter.fieldbyname('EPOAltitude').AsString);
end;

procedure TfrmTestParameter.Edt_CheckTestTimeChange(Sender: TObject);
begin
  inherited;
  sA[11] := IntToStr(UniQuery_TestParameter.fieldbyname('CheckTestTime').AsInteger);
end;

procedure TfrmTestParameter.Edt_CheckTestAtCommandChange(Sender: TObject);
begin
  inherited;
  sA[12] := Trim(UniQuery_TestParameter.fieldbyname('CheckTestAtCommand').AsString);
end;

procedure TfrmTestParameter.Edt_CheckTestAtReturnChange(Sender: TObject);
begin
  inherited;
  sA[13] := Trim(UniQuery_TestParameter.fieldbyname('CheckTestAtReturn').AsString);
end;

procedure TfrmTestParameter.Edt_CheckTestAtTimeOutChange(Sender: TObject);
begin
  inherited;
  sA[14] := IntToStr(UniQuery_TestParameter.fieldbyname('CheckTestAtTimeOut').AsInteger);
end;

procedure TfrmTestParameter.Edt_CheckTestAllowTestCountChange(Sender: TObject);
begin
  inherited;
  sA[15] := IntToStr(UniQuery_TestParameter.fieldbyname('CheckTestAllowTestCount').AsInteger);
end;

procedure TfrmTestParameter.Edt_SMT_AutoTestTestTimeChange(
  Sender: TObject);
begin
  inherited;
  sA[0] := IntToStr(UniQuery_TestParameter.fieldbyname('SMT_AutoTestTestTime').AsInteger);
end;

procedure TfrmTestParameter.TB_PostClick(Sender: TObject);
begin
  inherited;
  operateRecSave;
end;

procedure TfrmTestParameter.deleteOperRec;
var
  sTmp : string;
  sDel : array[0..16] of string;
  b : Boolean;
begin
  sDel[0] := UniQuery_TestParameter.fieldbyname('SMT_AutoTestTestTime').AsString;
  sDel[1] := UniQuery_TestParameter.fieldbyname('CoupleTestTestTime').AsString;
  sDel[2] := UniQuery_TestParameter.fieldbyname('ParamDownloadTestTime').AsString;
  sDel[3] := UniQuery_TestParameter.fieldbyname('AutoTestTestTime').AsString;
  sDel[4] := UniQuery_TestParameter.fieldbyname('WriteImeiTestTime').AsString;
  sDel[5] := UniQuery_TestParameter.fieldbyname('TwiceTestTime').AsString;
  sDel[6] := UniQuery_TestParameter.fieldbyname('GPSNumbers').AsString;
  sDel[7] := UniQuery_TestParameter.fieldbyname('GPSDb').AsString;
  sDel[8] := UniQuery_TestParameter.fieldbyname('EPOLatitude').AsString;
  sDel[9] := UniQuery_TestParameter.fieldbyname('EPOLongitude').AsString;
  sDel[10] := UniQuery_TestParameter.fieldbyname('EPOAltitude').AsString;
  sDel[11] := UniQuery_TestParameter.fieldbyname('CheckTestTime').AsString;
  sDel[12] := UniQuery_TestParameter.fieldbyname('CheckTestAtCommand').AsString;
  sDel[13] := UniQuery_TestParameter.fieldbyname('CheckTestAtReturn').AsString;
  sDel[14] := UniQuery_TestParameter.fieldbyname('CheckTestAtTimeOut').AsString;
  sDel[15] := UniQuery_TestParameter.fieldbyname('CheckTestAllowTestCount').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := 'ɾ�� ɾ�����Բ���#[��ϳ�ʱ:' +sDel[1] + '/���س�ʱ:'+sDel[2] + '/�Զ����Գ�ʱ:' + sDel[3];
    sTmp := sTmp + '/IMEI��д��ʱ:' +sDel[4] + '/��Ʒ������ʱ:' +sDel[5] + '/SMT�Զ���λ��ʱ:' + sDel[0];
    sTmp := sTmp + '/GPS���ǿ���:' + sDel[6];
    sTmp := sTmp + '/GPS����ǿ��:' + sDel[7] + '/EPO����:' + sDel[8] + '/EPOγ��:' + sDel[9];
    sTmp := sTmp + '/EPO�߶�:' + sDel[10] + '/���ʱ��:' + sDel[11] + '/ATָ��:' + sDel[12];
    sTmp := sTmp + '/AT����ֵ:'+ sDel[13] + '/AT��ʱʱ��:' + sDel[14] + '/�������:' + sDel[15];
  	InsertOperRecord(User.UserName,sTmp + ']',DateTimeToStr(Now));
  end;
end;

end.
