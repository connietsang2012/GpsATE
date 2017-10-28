unit uVersionModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,uDmMain, StdCtrls, Mask,
  DBCtrls, DBCtrlsEh, DBLookupEh, DBActns, MemDS, DBAccess, Uni;

type
  TfrmVersionModel = class(TfrmModuleForm)
    lbl7: TLabel;
    Edt_Model: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    UniQuery_VersionModel: TUniQuery;
    intgrfldUniQuery_VersionModelId: TIntegerField;
    SFUniQuery_VersionModelVersion: TStringField;
    SFUniQuery_VersionModelModel: TStringField;
    SFUniQuery_VersionModelIndex: TStringField;
    grp_Query: TGroupBox;
    lbl_SN: TLabel;
    Edt_VersionModel: TEdit;
    UniQuery_VersionModelbReadRID: TBooleanField;
    DBCheckBoxReadRID: TDBCheckBox;
    UniQuery_VersionModelTotalModel: TStringField;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    procedure UniQuery_VersionModelCalcFields(DataSet: TDataSet);
    procedure ac_FindExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniQuery_VersionModelBeforeInsert(DataSet: TDataSet);
    procedure UniQuery_VersionModelAfterPost(DataSet: TDataSet);
    procedure DBEdit1Change(Sender: TObject);
    procedure Edt_ModelChange(Sender: TObject);
    procedure DBCheckBoxReadRIDClick(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure operateRecSave;
    procedure deleteOperRec;override;
  end;

var
  frmVersionModel: TfrmVersionModel;
  oVers,oModel : string;   //存储修改前的数据
  oReadRID : Boolean;
implementation
uses
  uGlobalVar,uPublicFunc;
{$R *.dfm}
procedure TfrmVersionModel.UniQuery_VersionModelCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('Index').AsInteger:=UniQuery_VersionModel.RecNo;
end;

procedure TfrmVersionModel.ac_FindExecute(Sender: TObject);
var
  strTemp,qrySql:string;
begin
  inherited;
  strTemp:= '%'+Trim(Edt_VersionModel.Text)+'%';
  qrySql := Format('Model like ''%s''',[strTemp]);
  UniQuery_VersionModel.Filter:=qrySql;
  UniQuery_VersionModel.Filtered:=True;
end;

procedure TfrmVersionModel.FormCreate(Sender: TObject);
begin
  inherited;
  DS_Insert.Visible:=True;
end;

procedure TfrmVersionModel.UniQuery_VersionModelBeforeInsert(
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
          if ((Components[i] as TDBEdit).Enabled)and ((Components[i] as TDBEdit).Visible) then
              (Components[i] as TDBEdit).SetFocus;
      end;
  end;
end;

procedure TfrmVersionModel.UniQuery_VersionModelAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  //DS_Module.AutoEdit:=False;
  //DBGridEh1.ReadOnly:=True;
  //TabSheet2.Enabled:=False;
end;

procedure TfrmVersionModel.operateRecSave;
var
  sTmp : string;
begin
  sTmp := '保存 软件版本与机型对应表#[';
  if ansicomparestr(Trim(DBEdit1.Text),oVers) <> 0 then
  begin
    if Length(Trim(DBEdit1.Text)) > 0 then
    begin
      if Length(oVers) > 0 then
        sTmp := sTmp + '软件版本:' + Trim(DBEdit1.Text) + '(后)' + oVers + '(前)'
      else
        sTmp := sTmp + '软件版本:' + Trim(DBEdit1.Text);
    end
    else
    begin
      //if Length(oVers) > 0 then
        sTmp := sTmp + '软件版本:' + oVers + '(前)';
    end;
  end
  else
  	sTmp := sTmp + '软件版本:' + Trim(DBEdit1.Text) + '(没改)';
  if ansicomparestr(Trim(Edt_Model.Text),oModel) <> 0 then
  begin
    if Length(Trim(Edt_Model.Text)) > 0 then
    begin
      if Length(oVers) > 0 then
        sTmp := sTmp + '/机型:' + Trim(Edt_Model.Text) + '(后)' + oModel + '(前)'
      else
        sTmp := sTmp + '/机型:' + Trim(Edt_Model.Text);
    end
    else
    begin
      //if Length(oModel) > 0 then
        sTmp := sTmp + '/机型:' + oModel + '(前)';
    end;
  end
  else
    sTmp := sTmp + '/机型:' + Trim(Edt_Model.Text);
  if oReadRID <> DBCheckBoxReadRID.Checked then
  begin
    if DBCheckBoxReadRID.Checked then
    begin
      if oReadRID then
    		sTmp := sTmp + '/读取基带ID:是(后)' +  '是(前)'
      else
        sTmp := sTmp + '/读取基带ID:是(后)' +  '否(前)';
    end
    else
    begin
      if oReadRID then
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
  oVers := '';
  oReadRID := false;
  InsertOperRecord(User.UserName,sTmp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmVersionModel.DBEdit1Change(Sender: TObject);
begin
  inherited;
  oVers := Trim(UniQuery_VersionModel.fieldbyname('Version').AsString);
end;

procedure TfrmVersionModel.Edt_ModelChange(Sender: TObject);
begin
  inherited;
  oModel := Trim(UniQuery_VersionModel.fieldbyname('Model').AsString);
end;

procedure TfrmVersionModel.DBCheckBoxReadRIDClick(Sender: TObject);
begin
  inherited;
  oReadRID := UniQuery_VersionModel.fieldbyname('bReadRID').AsBoolean;
end;

procedure TfrmVersionModel.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  s0 := UniQuery_VersionModel.fieldbyname('Version').AsString;
  s1 := UniQuery_VersionModel.fieldbyname('Model').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := '删除 删除软件版本与机型对应表#[软件版本:' + s0 + '/机型:'+ s1+ ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;

procedure TfrmVersionModel.TB_PostClick(Sender: TObject);
begin
  inherited;
  operateRecSave;
end;

end.
