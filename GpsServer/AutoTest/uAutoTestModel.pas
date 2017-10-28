unit uAutoTestModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,uDmMain, StdCtrls, Mask,
  DBCtrls, DBActns, MemDS, DBAccess, Uni;

type
  TfrmAutoTestModel = class(TfrmModuleForm)
    lbl7: TLabel;
    Edt_UserDes: TDBEdit;
    UniQuery_TestModel: TUniQuery;
    intgrfldUniQuery_TestModelId: TIntegerField;
    SFUniQuery_TestModelModel: TStringField;
    SFUniQuery_TestModelIndex: TStringField;
    grp_Query: TGroupBox;
    lbl_SN: TLabel;
    Edt_Model: TEdit;
    DBCheckBox1: TDBCheckBox;
    UniQuery_TestModelbReadRID: TBooleanField;
    procedure UniQuery_TestModelCalcFields(DataSet: TDataSet);
    procedure ac_FindExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniQuery_TestModelBeforeInsert(DataSet: TDataSet);
    procedure UniQuery_TestModelAfterPost(DataSet: TDataSet);
    procedure Edt_UserDesChange(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure operateRecSave;
    procedure deleteOperRec;override;
  end;

var
  frmAutoTestModel: TfrmAutoTestModel;
  oModel : string;  //存储修改前的数据 能否读取基带ID
  obReadID : Boolean;
implementation
uses
  uPublicFunc,uGlobalVar;
{$R *.dfm}
procedure TfrmAutoTestModel.UniQuery_TestModelCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('Index').AsInteger:=UniQuery_TestModel.RecNo;
end;

procedure TfrmAutoTestModel.ac_FindExecute(Sender: TObject);
var
  strTemp,qrySql:string;
begin
  inherited;
  strTemp:= '%'+Trim(Edt_Model.Text)+'%';
  qrySql := Format('Model like ''%s''',[strTemp]);
  UniQuery_TestModel.Filter:=qrySql;
  UniQuery_TestModel.Filtered:=True;
end;

procedure TfrmAutoTestModel.FormCreate(Sender: TObject);
begin
  inherited;
  DS_Insert.Visible:=True;
end;

procedure TfrmAutoTestModel.UniQuery_TestModelBeforeInsert(
  DataSet: TDataSet);
var
  i:Integer;
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
        if (Components[i] as TDBEdit).Enabled and ((Components[i] as TDBEdit).Visible) then
          (Components[i] as TDBEdit).SetFocus;
    end;
  end;
end;


procedure TfrmAutoTestModel.UniQuery_TestModelAfterPost(DataSet: TDataSet);
begin
  inherited;
//  DS_Module.AutoEdit:=False;
//  DBGridEh1.ReadOnly:=True;
//  TabSheet2.Enabled:=False;
end;

{procedure TfrmAutoTestModel.FormShow(Sender: TObject);
begin
  inherited;
  if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;}

procedure TfrmAutoTestModel.Edt_UserDesChange(Sender: TObject);
begin
  inherited;
  oModel := Trim(UniQuery_TestModel.fieldbyname('Model').AsString);
end;

procedure TfrmAutoTestModel.operateRecSave;
var
  sTmp : string;
begin
  sTmp := '保存 测试机型#[';
  //当前数据和数据库存储的数据不同，说明数据修改了
  if ansicomparestr(Trim(Edt_UserDes.Text),oModel) <> 0 then
  begin
    if Length(Trim(Edt_UserDes.Text)) > 0 then
    begin
      if Length(oModel) > 0 then
        sTmp := sTmp + '机型:' + Trim(Edt_UserDes.Text) + '(后)' + oModel + '(前)'
      else
        sTmp := sTmp + '机型:' + Trim(Edt_UserDes.Text) + '';
    end
    else
    begin
      //if Length(oModel) > 0 then
        sTmp := sTmp +'机型:' + oModel + '(前)'
    end;    
  end
  else
  	sTmp := sTmp + '机型:' + Trim(Edt_UserDes.Text) + '';
  if obReadID <> DBCheckBox1.Checked then
  begin
    if DBCheckBox1.Checked then
    begin
      if obReadID then
    		sTmp := sTmp + '/读取基带ID:是(后)' +  '是(前)'
      else
        sTmp := sTmp + '/读取基带ID:是(后)' +  '否(前)';
    end
    else
    begin
      if obReadID then
      begin
      	sTmp := sTmp + '/读取基带ID:否(后)' + '是(前)'
      end
      else
      begin
        sTmp := sTmp + '/读取基带ID:否(后)' + '否(前)'
      end;  
    end;
  end;
  oModel := '';
  obReadID := false;
  InsertOperRecord(User.UserName, sTmp +']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmAutoTestModel.DBCheckBox1Click(Sender: TObject);
begin
  inherited;
  obReadID := UniQuery_TestModel.fieldbyname('bReadRID').AsBoolean;
end;

procedure TfrmAutoTestModel.deleteOperRec;
var
  s0,sTmp : string;
  b : Boolean;
begin
  s0 := UniQuery_TestModel.fieldbyname('Model').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := '删除 删除测试机型#[机型:' + s0 + ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;

end.
