unit uUserTypeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, ExtCtrls, ADODB, DataDriverEh,
  MemTableEh, ActnList, ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,
  StdCtrls, Mask, DBCtrls, DBActns, MemDS, DBAccess, Uni;

type
  TfrmUserType = class(TfrmModuleForm)
    lbl1: TLabel;
    Edt_TypeName: TDBEdit;
    lbl2: TLabel;
    Edt_TypeDes: TDBEdit;
    UniQuery_UserType: TUniQuery;
    SFUniQuery_UserTypeIndex: TStringField;
    grp1: TGroupBox;
    dbchkTestFunction: TDBCheckBox;
    dbchkTestFunction3: TDBCheckBox;
    dbchkTestFunction1: TDBCheckBox;
    dbchkTestGPS: TDBCheckBox;
    dbchkTestFunction2: TDBCheckBox;
    dbchkTestCouple: TDBCheckBox;
    dbchkTestAutoTest: TDBCheckBox;
    dbchkTestAutoTest1: TDBCheckBox;
    dbchkTestAutoTestSMT: TDBCheckBox;
    dbchkTestAutoTestSMT1: TDBCheckBox;
    UniQuery_UserTypeTypeId: TIntegerField;
    UniQuery_UserTypeTypeName: TStringField;
    UniQuery_UserTypeTypeDes: TStringField;
    UniQuery_UserTypeTestAutoTestSMT: TBooleanField;
    UniQuery_UserTypeTestSMTOQC: TBooleanField;
    UniQuery_UserTypeTestCouple: TBooleanField;
    UniQuery_UserTypeTestParamDownload: TBooleanField;
    UniQuery_UserTypeTestAutoTest: TBooleanField;
    UniQuery_UserTypeTestWriteImei: TBooleanField;
    UniQuery_UserTypeTestTwice: TBooleanField;
    UniQuery_UserTypeTestIncomCheck: TBooleanField;
    UniQuery_UserTypeTestReadBackRom: TBooleanField;
    UniQuery_UserTypeTestCartonBox: TBooleanField;
    UniQuery_UserType_MASK_FROM_V2: TBytesField;
    procedure UniQuery_UserTypeCalcFields(DataSet: TDataSet);
    procedure Edt_TypeNameChange(Sender: TObject);
    procedure Edt_TypeDesChange(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure operateRecordSave;
    procedure deleteOperRec;override;
  end;

var
  frmUserType: TfrmUserType;
  oTypeID,oTypeName : string; //�޸�ǰ��ԭ����
implementation
uses
    uDmMain,uPublicFunc,uGlobalVar;
{$R *.dfm}

procedure TfrmUserType.UniQuery_UserTypeCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Index').AsInteger:=UniQuery_UserType.RecNo;
  //InsertOperRecord(User.UserName,'�û�����ID'+ Edt_TypeName.Text + ' �û��������ƣ�' + Edt_TypeDes.Text,DateTimeToStr(Now));
end;

{procedure TfrmUserType.FormShow(Sender: TObject);
begin
  inherited;   //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  //if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;  }

procedure TfrmUserType.operateRecordSave;
var
  sTmp : string;
begin
  sTmp := '���� �û�����#[';
  if ansicomparestr(Trim(Edt_TypeName.Text),oTypeID)<>0 then
  begin
    if Length(Trim(Edt_TypeName.Text)) > 0 then
    begin
      if Length(oTypeID) > 0 then
        sTmp := sTmp + '�û�����ID:' + Edt_TypeName.Text + '(��)' + oTypeID + '(ǰ)'
      else
        sTmp := sTmp + '�û�����ID:' + Edt_TypeName.Text;
    end
    else
    begin
      if Length(oTypeID) > 0 then
        sTmp := sTmp + '�û�����ID:' + oTypeID + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(Edt_TypeDes.Text),oTypeName)<>0 then
  begin
    if Length(Trim(Edt_TypeDes.Text)) > 0 then
    begin
      if Length(oTypeName) > 0 then
         sTmp := sTmp + '/�û���������:' + Edt_TypeDes.Text + '(��)' + oTypeName + '(ǰ)'
      else
        sTmp := sTmp + '/�û���������:' + Edt_TypeDes.Text;
    end
    else
    begin
      if Length(oTypeName) > 0 then
        sTmp := sTmp + '/�û���������:' + oTypeName + '(ǰ)';
    end;
  end;
  oTypeID := '';
  oTypeName := '';
  InsertOperRecord(User.UserName,sTmp +']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmUserType.Edt_TypeNameChange(Sender: TObject);
begin
  inherited;
  oTypeID := Trim(UniQuery_UserType.fieldbyname('TypeName').AsString);
end;

procedure TfrmUserType.Edt_TypeDesChange(Sender: TObject);
begin
  inherited;
  oTypeName := Trim(UniQuery_UserType.fieldbyname('TypeDes').AsString);
end;

procedure TfrmUserType.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  s0 := UniQuery_UserType.fieldbyname('TypeName').AsString;
  s1 := UniQuery_UserType.fieldbyname('TypeDes').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := 'ɾ�� ɾ���û�����#[�û�����ID:' + s0 + '/�û���������:'+ s1+ ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;

procedure TfrmUserType.TB_PostClick(Sender: TObject);
begin
  inherited;
  operateRecordSave;
end;



end.
