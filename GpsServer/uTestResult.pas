unit uTestResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uModuleForm, StdCtrls, ComCtrls, GridsEh, DBGridEh, DB, MemDS,clipbrd,ComObj,
  DBAccess, Uni;

type
  TFrmTestResult = class(TForm)
    GroupBoxSearRes: TGroupBox;
    GroupBoxSeacCon: TGroupBox;
    BtnSearch: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditTester: TEdit;
    ComboBoxTestPosition: TComboBox;
    Label3: TLabel;
    EditSN: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    CheckBoxTestTime: TCheckBox;
    DBGridEh1: TDBGridEh;
    DataSrcTestResult: TDataSource;
    UniQryTestResult: TUniQuery;
    Label5: TLabel;
    EditIMEI: TEdit;
    BtnLogOut: TButton;
    SaveDialog1: TSaveDialog;
    Label6: TLabel;
    EdtSoftModel: TEdit;
    Label7: TLabel;
    EdtVersion: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure ComboBoxTestPositionChange(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BtnLogOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchTestResult(sNowDate : string = '1');
    //========================ÿ�ж��б���˵����ת��EXCEL 20140425==========================
    procedure SingleDBGridExport(GRID: TDBGridEh);
    procedure DBGridExport(GRID:TDBGridEh);
  end;

var
  FrmTestResult: TFrmTestResult;
  sSQL,sWhere,sOrder : string;
implementation
uses
  uDmMain,uPublicFunc;
{$R *.dfm}

procedure TFrmTestResult.FormShow(Sender: TObject);
begin
  ComboBoxTestPosition.ItemIndex := 0;
  EditTester.Text := '';
  EditSN.Text := '';
  DateTimePicker1.Date := Now-1;
  DateTimePicker2.Date := Now;
  CheckBoxTestTime.Checked := false;
  SearchTestResult('2');
  GroupBoxSearRes.Caption := Trim(ComboBoxTestPosition.Text) + ' ��' + IntToStr(UniQryTestResult.RecordCount) + ' ��¼';
end;

procedure TFrmTestResult.BtnSearchClick(Sender: TObject);
begin
  SearchTestResult;
  GroupBoxSearRes.Caption := Trim(ComboBoxTestPosition.Text) + ' ��' + IntToStr(UniQryTestResult.RecordCount) + ' ��¼';
end;

procedure TFrmTestResult.SearchTestResult(sNowDate : string = '1');
var
  sTemp : string;
begin
  case ComboBoxTestPosition.ItemIndex of
    0: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTestSMT_Result ';     //SMT�Զ�����λ���
    1: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CoupleTest_Result ';      //��ϲ���λ���
    2: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_ParamDownload_Result ';   //�������ز���λ���
    3: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTest_Result ';        //�Զ�����λ���
    4: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_WriteImei_Result ';       //IMEI��д���Խ��
    5: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CartonBoxTwenty_Result ';       //��ͨ����λ���
    6: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_SMTIQC_Result ';       //SMTOQC����λ���
    7: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTestSMT_Result_Backup ';       //SMT����λ�������
    8: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_SMTIQC_Result_Backup ';       //SMTOQC����λ�������
    9: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CoupleTest_Result_Backup ';       //��ϲ���λ�������
    10: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_ParamDownload_Result_Backup ';       //�������ز���λ�������
    11: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_WriteImei_Result_Backup ';       //IMEI��д����λ�������
    12: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTest_Result_Backup ';       //�Զ�����λ�������
  end;
  if sNowDate = '1' then
  begin
    sWhere := ' where (1=1) ';

    if Length(Trim(EditTester.Text)) > 0 then
      sWhere := sWhere + ' and (TesterId like ''%' + Trim(EditTester.Text) + '%'') ';
    if Length(Trim(EditSN.Text)) > 0 then
      sWhere := sWhere + ' and (SN like ''%' + Trim(EditSN.Text) + '%'') ';
    if Length(Trim(EditIMEI.Text)) > 0 then
      sWhere := sWhere + ' and (IMEI like ''%' + Trim(EditIMEI.Text) + '%'') ';
    if Length(Trim(EdtSoftModel.Text)) > 0 then
      sWhere := sWhere + ' and (SoftModel like ''%'+ Trim(EdtSoftModel.Text) + '%'') ';
    if Length(Trim(EdtVersion.Text)) > 0 then
      sWhere := sWhere + ' and ([Version] like ''%'+ Trim(EdtVersion.Text) + '%'') ';
    if CheckBoxTestTime.Checked then
    begin
      if DateTimePicker1.DateTime < DateTimePicker2.DateTime then
        sWhere := sWhere + ' and (TestTime between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                                + ''' and ''' +DateTimeToStr(DateTimePicker2.DateTime) + ''')'
      else
      begin
        //Application.MessageBox('��ʼʱ�䲻�����ڽ���ʱ�䣬���������ò�ѯ�Ŀ�ʼʱ��ͽ���ʱ�䣡','��ѯ��ʾ',MB_OK);
        //DateTimePicker1.SetFocus;
        sWhere := sWhere + '  and (TestTime between ''' + DateTimeToStr(DateTimePicker2.DateTime)
                                + ''' and ''' +DateTimeToStr(DateTimePicker1.DateTime) + ''')';
      end;
    end
    else
    begin
      if (Trim(EditTester.Text) = '') and (Trim(EditSN.Text)='') and (Trim(EditIMEI.Text)='')
                and (Trim(EdtSoftModel.Text)='') and (Trim(EdtVersion.Text)='') then
      sWhere := ' where (1=1) and (TestTime between ''' + DateTimeToStr(Now-1) + ''' and ''' +DateTimeToStr(Now) + ''')'
    end;
  end
  else
  begin
    if DateTimePicker1.DateTime < DateTimePicker2.DateTime then
      sWhere := ' where (1=1)  and (TestTime between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                                + ''' and ''' +DateTimeToStr(DateTimePicker2.DateTime) + ''')'
    else
      sWhere := ' where (1=1)  and (TestTime between ''' + DateTimeToStr(DateTimePicker2.DateTime)
                                + ''' and ''' +DateTimeToStr(DateTimePicker1.DateTime) + ''')';
  end;
  sOrder := ' order by TestTime';
  sTemp := sSQL + sWhere + sOrder;
  UniQryTestResult.SQL.Clear;
  UniQryTestResult.SQL.Add(sTemp);
  UniQryTestResult.Open;
end;

procedure TFrmTestResult.ComboBoxTestPositionChange(Sender: TObject);
begin
  EditTester.Text := '';
  EditSN.Text := '';
  EditIMEI.Text := '';
  EdtSoftModel.Text := '';
  EdtVersion.Text := '';
  CheckBoxTestTime.Checked := false;
  SearchTestResult('2');
  GroupBoxSearRes.Caption := Trim(ComboBoxTestPosition.Text) +' ��' + IntToStr(UniQryTestResult.RecordCount) + ' ��¼';
end;

procedure TFrmTestResult.DBGridEh1DblClick(Sender: TObject);
var
  sTp : string;
begin
  if UniQryTestResult.RecordCount > 0 then
  begin
    sTp :=         '      SN��ţ�' + Trim(UniQryTestResult.fieldbyname('SN').AsString) + #10;
    sTp := sTp +   '    IMEI��ţ�' + Trim(UniQryTestResult.fieldbyname('IMEI').AsString) + #10;
    sTp := sTp +   '     ��   �ͣ�' + Trim(UniQryTestResult.fieldbyname('SoftModel').AsString) + #10;
    sTp := sTp +   '  ����汾�ţ�' + Trim(UniQryTestResult.fieldbyname('Version').AsString) + #10;
    if UniQryTestResult.fieldbyname('Result').AsInteger = 1 then
    	sTp := sTp + '    ���Խ����' + '1--���Գɹ�' + #10
    else
    	sTp := sTp + '    ���Խ����' + '0--����ʧ��' + #10;
    sTp := sTp +   '    �����û���' + Trim(UniQryTestResult.fieldbyname('TesterId').AsString) + #10;
    sTp := sTp +   '    ����ʱ�䣺' + DateTimeToStr(UniQryTestResult.fieldbyname('TestTime').AsDateTime);
    Application.MessageBox(PChar(sTp),PChar(ComboBoxTestPosition.Text),MB_OK);
  end;
end;

procedure TFrmTestResult.BtnLogOutClick(Sender: TObject);
begin
  DBGridExport(DBGridEh1);
end;

procedure TFrmTestResult.SingleDBGridExport(GRID: TDBGridEh);
var       //DBGRID�ؼ����ݴ洢��EXCEL
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
    showmessage('���Ļ�����δ��װMicrosoft Excel��');
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
    ShowMessage('��� Excel �ļ������...');
  except
    showmessage('Excelϵͳ��������');
    sh.close;
    eclapp.quit;
    exit;
  end;
end;

procedure TFrmTestResult.DBGridExport(GRID:TDBGridEh);
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
