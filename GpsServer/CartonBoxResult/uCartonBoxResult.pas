unit uCartonBoxResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, GridsEh, DBGridEh, StdCtrls, ComCtrls;

type
  TfrmCartonBoxResult = class(TForm)
    GroupBoxSeacCon: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtnSearch: TButton;
    EditSN: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBoxTestTime: TCheckBox;
    EditIMEI: TEdit;
    BtnLogOut: TButton;
    EdtSoftModel: TEdit;
    EdtVersion: TEdit;
    GroupBoxSearRes: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    DBGridEh2: TDBGridEh;
    DataSrcTestResult: TDataSource;
    UniQry_CartonBoxResult: TUniQuery;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button1: TButton;
    edt_Rid: TEdit;
    edt_IMEI: TEdit;
    Button2: TButton;
    edt_SoftModel: TEdit;
    edt_Version: TEdit;
    edt_BoxNo: TEdit;
    Label13: TLabel;
    edt_ZhiDan: TEdit;
    Label8: TLabel;
    edt_ProductCode: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchTestResult(sNowDate : string = '1');
  end;

var
  frmCartonBoxResult: TfrmCartonBoxResult;
  sSQL,sWhere,sOrder : string;
implementation

{$R *.dfm}

procedure TfrmCartonBoxResult.Button1Click(Sender: TObject);
begin
  SearchTestResult;
  GroupBoxSearRes.Caption := ' 共' + IntToStr(UniQry_CartonBoxResult.RecordCount) + ' 记录';

end;
procedure TfrmCartonBoxResult.SearchTestResult(sNowDate : string = '1');
var
  sTemp : string;
begin
  sSQL := 'SELECT *  FROM Gps_CartonBoxTwenty_Result';
  
  if sNowDate = '1' then
  begin
    sWhere := ' where (1=1) ';

    if Length(Trim(edt_BoxNo.Text)) > 0 then
      sWhere := sWhere + ' and (Boxno like ''%' + Trim(edt_BoxNo.Text) + '%'') ';
    if Length(Trim(edt_ZhiDan.Text)) > 0 then
      sWhere := sWhere + ' and (ZhiDan like ''%' + Trim(edt_ZhiDan.Text) + '%'') ';
    if Length(Trim(edt_ProductCode.Text)) > 0 then
      sWhere := sWhere + ' and (ProductCode like ''%' + Trim(edt_ProductCode.Text) + '%'') ';
    if Length(Trim(edt_IMEI.Text)) > 0 then
      sWhere := sWhere + ' and (IMEI like ''%'+ Trim(edt_IMEI.Text) + '%'') ';
    if Length(Trim(edt_SoftModel.Text)) > 0 then
      sWhere := sWhere + ' and ([SoftModel] like ''%'+ Trim(edt_SoftModel.Text) + '%'') ';
    if Length(Trim(edt_Version.Text)) > 0 then
      sWhere := sWhere + ' and ([Version] like ''%'+ Trim(edt_Version.Text) + '%'') ';
    if Length(Trim(edt_Rid.Text)) > 0 then
      sWhere := sWhere + ' and ([Remark2] like ''%'+ Trim(edt_Rid.Text) + '%'') ';
  end;

  sOrder := ' order by BoxNo';
  sTemp := sSQL + sWhere + sOrder;
  UniQry_CartonBoxResult.SQL.Clear;
  UniQry_CartonBoxResult.SQL.Add(sTemp);
  UniQry_CartonBoxResult.Open;
end;
procedure TfrmCartonBoxResult.FormShow(Sender: TObject);
begin
  edt_BoxNo.Text:='';
  edt_ZhiDan.Text:='';
  edt_ProductCode.Text:='';
  edt_IMEI.Text:='';
  edt_SoftModel.Text:='';
  edt_Version.Text:='';
  edt_Rid.Text:='';

  SearchTestResult('2');
  GroupBoxSearRes.Caption := ' 共' + IntToStr(UniQry_CartonBoxResult.RecordCount) + ' 记录';

end;

procedure TfrmCartonBoxResult.DBGridEh2DblClick(Sender: TObject);
var
  sTp:string;
begin
if UniQry_CartonBoxResult.RecordCount > 0 then
  begin
    sTp :=         '      箱  号：' + Trim(UniQry_CartonBoxResult.fieldbyname('BoxNo').AsString) + #10;
    sTp := sTp +   '    IMEI编号：' + Trim(UniQry_CartonBoxResult.fieldbyname('IMEI').AsString) + #10;
    sTp := sTp +   '     制   单：' + Trim(UniQry_CartonBoxResult.fieldbyname('ZhiDan').AsString) + #10;
    sTp := sTp +   '     机   型：' + Trim(UniQry_CartonBoxResult.fieldbyname('SoftModel').AsString) + #10;
    
    sTp := sTp +   '  软件版本号：' + Trim(UniQry_CartonBoxResult.fieldbyname('Version').AsString) + #10;

    Application.MessageBox(PChar(sTp),'卡通测试结果',MB_OK);
  end;
end;

end.
