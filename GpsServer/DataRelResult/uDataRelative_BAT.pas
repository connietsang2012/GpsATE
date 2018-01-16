unit uDataRelative_BAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, GridsEh, DBGridEh, StdCtrls, ComCtrls,ComObj;


type
  TfrmDataRelative_BAT = class(TForm)
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
    Label2: TLabel;
    Button1: TButton;
    edt_IMEI: TEdit;
    Button2: TButton;
    edt_BAT: TEdit;
    GroupBoxSearRes: TGroupBox;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    UniQry_DataRelResult: TUniQuery;
    SaveDialog1: TSaveDialog;
    UniQry_DataRelResultId: TLargeintField;
    UniQry_DataRelResultIMEI: TWideStringField;
    UniQry_DataRelResultBAT: TWideStringField;
    UniQry_DataRelResultZhiDan: TWideStringField;
    UniQry_DataRelResultTesterId: TWideStringField;
    UniQry_DataRelResultTestTime: TDateTimeField;
    DataSrcTestResult: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchTestResult(sNowDate : string = '1');
    procedure DBGridExport(GRID:TDBGridEh);
  end;

var
  frmDataRelative_BAT: TfrmDataRelative_BAT;
  sSQL,sWhere,sOrder : string;
implementation

{$R *.dfm}

procedure TfrmDataRelative_BAT.Button1Click(Sender: TObject);
begin
SearchTestResult;
  GroupBoxSearRes.Caption := ' ��' + IntToStr(UniQry_DataRelResult.RecordCount) + ' ��¼';
end;
procedure TfrmDataRelative_BAT.SearchTestResult(sNowDate : string = '1');
var
  sTemp : string;
begin
  sSQL := 'SELECT *  FROM DataRelative_BAT';
  
  if sNowDate = '1' then
  begin
    sWhere := ' where (1=1) ';

    if Length(Trim(edt_IMEI.Text)) > 0 then
      sWhere := sWhere + ' and (IMEI like ''%' + Trim(edt_IMEI.Text) + '%'') ';
    if Length(Trim(edt_BAT.Text)) > 0 then
      sWhere := sWhere + ' and (BAT like ''%' + Trim(edt_BAT.Text) + '%'') ';
  end;

  sOrder := ' order by IMEI';
  sTemp := sSQL + sWhere + sOrder;
  UniQry_DataRelResult.SQL.Clear;
  UniQry_DataRelResult.SQL.Add(sTemp);
  UniQry_DataRelResult.Open;
end;
procedure TfrmDataRelative_BAT.FormShow(Sender: TObject);
begin
  edt_IMEI.Text:='';
  edt_BAT.Text:='';

  SearchTestResult('2');
  GroupBoxSearRes.Caption := ' ��' + IntToStr(UniQry_DataRelResult.RecordCount) + ' ��¼';

end;

procedure TfrmDataRelative_BAT.DBGridEh1DblClick(Sender: TObject);
var
  sTp:string;
begin
if UniQry_DataRelResult.RecordCount > 0 then
  begin
    sTp :=         '      IMEI��' + Trim(UniQry_DataRelResult.fieldbyname('IMEI').AsString) + #10;
    sTp := sTp +   '       BAT��' + Trim(UniQry_DataRelResult.fieldbyname('BAT').AsString) + #10;

    Application.MessageBox(PChar(sTp),'������ݲ�ѯ���',MB_OK);
  end;
end;


procedure TfrmDataRelative_BAT.Button2Click(Sender: TObject);
begin
DBGridExport(DBGridEh1);
end;

procedure TfrmDataRelative_BAT.DBGridExport(GRID:TDBGridEh);
var       //DBGRID�ؼ����ݴ洢��EXCEL ֻ�е�һ���б���
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
    showmessage('���Ļ�����δ��װMicrosoft Excel��');
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
          //תEXCELʱ�����������н�ȡ�����Ѹ�Ϊ�á���������������治��Ҫ�ˡ�
          //if (grid.Fields[i].DisplayName='���֤��') or (grid.Fields[i].DisplayName='�����ʺ�') then begin
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
    ShowMessage('��� Excel �ļ������...');
  except
    showmessage('Excelϵͳ��������');
    sh.close;
    eclapp.quit;
    exit;
  end;
end;
end.
