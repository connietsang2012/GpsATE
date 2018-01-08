unit uDataRelResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, GridsEh, DBGridEh, StdCtrls, ComCtrls,ComObj;

type
  TfrmDataRelResult = class(TForm)
    GroupBoxSeacCon: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    BtnSearch: TButton;
    EditSN: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBoxTestTime: TCheckBox;
    EditIMEI: TEdit;
    BtnLogOut: TButton;
    EdtSoftModel: TEdit;
    EdtVersion: TEdit;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Button1: TButton;
    edt_IMEI: TEdit;
    Button2: TButton;
    GroupBoxSearRes: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    DBGridEh2: TDBGridEh;
    DataSrcTestResult: TDataSource;
    UniQry_DataRelResult: TUniQuery;
    SaveDialog1: TSaveDialog;
    UniQry_DataRelResultSN: TStringField;
    UniQry_DataRelResultIMEI1: TStringField;
    UniQry_DataRelResultIMEI2: TStringField;
    UniQry_DataRelResultIMEI3: TStringField;
    UniQry_DataRelResultIMEI4: TStringField;
    UniQry_DataRelResultIMEI5: TStringField;
    UniQry_DataRelResultIMEI6: TStringField;
    UniQry_DataRelResultIMEI7: TStringField;
    UniQry_DataRelResultIMEI8: TStringField;
    UniQry_DataRelResultIMEI9: TStringField;
    UniQry_DataRelResultIMEI10: TStringField;
    UniQry_DataRelResultIMEI11: TStringField;
    UniQry_DataRelResultIMEI12: TStringField;
    UniQry_DataRelResultZhiDan: TStringField;
    UniQry_DataRelResultTestTime: TDateTimeField;
    UniQry_DataRelResult_MASK_FROM_V2: TBytesField;
    Label2: TLabel;
    edt_SIM: TEdit;
    Label8: TLabel;
    edt_ICCID: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchTestResult(sNowDate : string = '1');
    procedure SingleDBGridExport(GRID: TDBGridEh);
    procedure DBGridExport(GRID:TDBGridEh);
  end;

var
  frmDataRelResult: TfrmDataRelResult;
  sSQL,sWhere,sOrder : string;

implementation

{$R *.dfm}

procedure TfrmDataRelResult.Button1Click(Sender: TObject);
begin
SearchTestResult;
  GroupBoxSearRes.Caption := ' 共' + IntToStr(UniQry_DataRelResult.RecordCount) + ' 记录';
end;
procedure TfrmDataRelResult.SearchTestResult(sNowDate : string = '1');
var
  sTemp : string;
begin
  sSQL := 'SELECT *  FROM DataRelativeSheet';
  
  if sNowDate = '1' then
  begin
    sWhere := ' where (1=1) ';

    if Length(Trim(edt_IMEI.Text)) > 0 then
      sWhere := sWhere + ' and (IMEI1 like ''%' + Trim(edt_IMEI.Text) + '%'') ';
    if Length(Trim(edt_SIM.Text)) > 0 then
      sWhere := sWhere + ' and (IMEI3 like ''%' + Trim(edt_SIM.Text) + '%'') ';
    if Length(Trim(edt_ICCID.Text)) > 0 then
      sWhere := sWhere + ' and (IMEI4 like ''%' + Trim(edt_ICCID.Text) + '%'') ';
  end;

  sOrder := ' order by IMEI1';
  sTemp := sSQL + sWhere + sOrder;
  UniQry_DataRelResult.SQL.Clear;
  UniQry_DataRelResult.SQL.Add(sTemp);
  UniQry_DataRelResult.Open;
end;




procedure TfrmDataRelResult.FormShow(Sender: TObject);
begin
edt_IMEI.Text:='';
  edt_Sim.Text:='';
  edt_ICCID.Text:='';

  SearchTestResult('2');
  GroupBoxSearRes.Caption := ' 共' + IntToStr(UniQry_DataRelResult.RecordCount) + ' 记录';
end;

procedure TfrmDataRelResult.DBGridEh2DblClick(Sender: TObject);
var
  sTp:string;
begin
if UniQry_DataRelResult.RecordCount > 0 then
  begin
    sTp :=         '      IMEI：' + Trim(UniQry_DataRelResult.fieldbyname('IMEI1').AsString) + #10;
    sTp := sTp +   '       SIM：' + Trim(UniQry_DataRelResult.fieldbyname('IMEI3').AsString) + #10;
    sTp := sTp +   '     ICCID：' + Trim(UniQry_DataRelResult.fieldbyname('IMEI4').AsString) + #10;
    
    Application.MessageBox(PChar(sTp),'数据关系结果',MB_OK);
  end;
end;

procedure TfrmDataRelResult.Button2Click(Sender: TObject);
begin
DBGridExport(DBGridEh1);
end;
procedure TfrmDataRelResult.SingleDBGridExport(GRID: TDBGridEh);
var       //DBGRID控件内容存储到EXCEL
  EclApp:Variant;
  XlsFileName:String;
  sh:olevariant;
  i,j,z:integer;
  s:string;
  savedailog:TSaveDialog;
begin
  savedailog:=TSaveDialog.Create(nil);
  savedailog.Filter:='Excel files (*.xls)|*.XlS';
  if savedailog.Execute then
  begin
    xlsfilename:=savedailog.FileName;
    savedailog.Free;
  end
  else
  begin
    savedailog.Free;
    exit;
  end;
  try
    eclapp:=createOleObject('Excel.Application');
    sh:=CreateOleObject('Excel.Sheet');
  except
    showmessage('您的机器里未安装Microsoft Excel。');
    exit;
  end;
  try
    sh:=eclapp.workBooks.add;
    With Grid.DataSource.DataSet do
    begin
      First;
      //z:=GRID.FieldCount-1;
      j:=i div 26;
      s:='';
      if j>0 then s:=s+chr(64+j);
      for i:=1 to RecordCount do
      begin
        for z:=0 to grid.FieldCount-1 do
        begin
          if grid.Fields[z].Visible then
          begin
            eclapp.cells[i*2,z+1]:=grid.Fields[z].DisplayName;
            if GRID.Fields[z].DisplayWidth>80 then
              eclapp.columns[z+1].Columnwidth:=80
            else
              eclapp.columns[z+1].Columnwidth:=GRID.Fields[z].DisplayWidth+0.3;
            eclapp.cells[i*2,z+1].Font.Color:=clRed;
          end;
        end;
        for j:=0 to grid.FieldCount-1 do
          if grid.Fields[j].Visible then
            if GRID.Fields[j].DisplayText>'' then
            begin
              eclapp.cells[i*2+1,j+1]:=grid.Fields[j].DisplayText;
            end;
        Next;
      end;
    end;
    sh.saveas(xlsfilename);
    sh.close;
    eclapp.quit;
    ShowMessage('输出 Excel 文件已完成...');
  except
    showmessage('Excel系统出错！！！');
    sh.close;
    eclapp.quit;
    exit;
  end;
end;

procedure TfrmDataRelResult.DBGridExport(GRID:TDBGridEh);
var       //DBGRID控件内容存储到EXCEL 只有第一行有标题
  EclApp:Variant;
  XlsFileName:String;
  sh:olevariant;
  i,j:integer;
  s:string;
  savedailog:TSaveDialog;
begin
  savedailog:=TSaveDialog.Create(Self);
  savedailog.Filter:='Excel files (*.xlsx)|*.xlsx';
  if savedailog.Execute then
  begin
    xlsfilename:=savedailog.FileName;
    savedailog.Free;
  end
  else
  begin
    savedailog.Free;
    exit;
  end;
  try
    eclapp:=createOleObject('Excel.Application');
    sh:=CreateOleObject('Excel.Sheet');
  except
    showmessage('您的机器里未安装Microsoft Excel。');
    exit;
  end;
  try
    sh:=eclapp.workBooks.add;
    With Grid.DataSource.DataSet do
    begin
      Application.ProcessMessages;
      First;
      i:=GRID.FieldCount-1;
      j:=i div 26;
      s:='';
      if j>0 then s:=s+chr(64+j);
      for i:=0 to grid.FieldCount-1 do
      begin
        Application.ProcessMessages;
        if grid.Fields[i].Visible then
        begin
          eclapp.cells[2,i+1]:=grid.Fields[i].DisplayName;

          if GRID.Fields[i].DisplayWidth > 80 then
            eclapp.columns[i+1].Columnwidth := 80
          else
            eclapp.columns[i+1].Columnwidth:=GRID.Fields[i].DisplayWidth+0.3;
          eclapp.cells[2,i+1].Font.Color:=clRed;
          //转EXCEL时过长的数字有截取现象。已改为用‘来解决，所以下面不需要了。
          //if (grid.Fields[i].DisplayName='身份证号') or (grid.Fields[i].DisplayName='银行帐号') then begin
          //eclapp.columns[i+1].NumberFormat:='@';
          //end;
        end;
      end;
      for i:=1 to RecordCount do
      begin
        Application.ProcessMessages;
        for j:=0 to grid.FieldCount-1 do
        begin
          Application.ProcessMessages;
          if grid.Fields[j].Visible then
            if GRID.Fields[j].DisplayText>'' then
            begin
              //if length(grid.Fields[j].DisplayText)>=15 then
              //eclapp.cells[i*2+1,j+1].NumberFormatLocal:='@';
              eclapp.cells[i+2,j+1]:=grid.Fields[j].DisplayText;
            end;
        end;
        Next;
      end;
    end;
    sh.saveas(xlsfilename);
    sh.close;
    eclapp.quit;
    ShowMessage('输出 Excel 文件已完成...');
  except
    showmessage('Excel系统出错！！！');
    sh.close;
    eclapp.quit;
    exit;
  end;
end;

end.
