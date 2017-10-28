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
    //========================每行都有标题说明的转出EXCEL 20140425==========================
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
  GroupBoxSearRes.Caption := Trim(ComboBoxTestPosition.Text) + ' 共' + IntToStr(UniQryTestResult.RecordCount) + ' 记录';
end;

procedure TFrmTestResult.BtnSearchClick(Sender: TObject);
begin
  SearchTestResult;
  GroupBoxSearRes.Caption := Trim(ComboBoxTestPosition.Text) + ' 共' + IntToStr(UniQryTestResult.RecordCount) + ' 记录';
end;

procedure TFrmTestResult.SearchTestResult(sNowDate : string = '1');
var
  sTemp : string;
begin
  case ComboBoxTestPosition.ItemIndex of
    0: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTestSMT_Result ';     //SMT自动测试位结果
    1: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CoupleTest_Result ';      //耦合测试位结果
    2: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_ParamDownload_Result ';   //参数下载测试位结果
    3: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTest_Result ';        //自动测试位结果
    4: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_WriteImei_Result ';       //IMEI烧写测试结果
    5: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CartonBoxTwenty_Result ';       //卡通测试位结果
    6: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_SMTIQC_Result ';       //SMTOQC测试位结果
    7: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTestSMT_Result_Backup ';       //SMT测试位返工结果
    8: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_SMTIQC_Result_Backup ';       //SMTOQC测试位返工结果
    9: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CoupleTest_Result_Backup ';       //耦合测试位返工结果
    10: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_ParamDownload_Result_Backup ';       //参数下载测试位返工结果
    11: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_WriteImei_Result_Backup ';       //IMEI烧写测试位返工结果
    12: sSQL := 'select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTest_Result_Backup ';       //自动测试位返工结果
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
        //Application.MessageBox('开始时间不能晚于结束时间，请重新设置查询的开始时间和结束时间！','查询提示',MB_OK);
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
  GroupBoxSearRes.Caption := Trim(ComboBoxTestPosition.Text) +' 共' + IntToStr(UniQryTestResult.RecordCount) + ' 记录';
end;

procedure TFrmTestResult.DBGridEh1DblClick(Sender: TObject);
var
  sTp : string;
begin
  if UniQryTestResult.RecordCount > 0 then
  begin
    sTp :=         '      SN编号：' + Trim(UniQryTestResult.fieldbyname('SN').AsString) + #10;
    sTp := sTp +   '    IMEI编号：' + Trim(UniQryTestResult.fieldbyname('IMEI').AsString) + #10;
    sTp := sTp +   '     机   型：' + Trim(UniQryTestResult.fieldbyname('SoftModel').AsString) + #10;
    sTp := sTp +   '  软件版本号：' + Trim(UniQryTestResult.fieldbyname('Version').AsString) + #10;
    if UniQryTestResult.fieldbyname('Result').AsInteger = 1 then
    	sTp := sTp + '    测试结果：' + '1--测试成功' + #10
    else
    	sTp := sTp + '    测试结果：' + '0--测试失败' + #10;
    sTp := sTp +   '    操作用户：' + Trim(UniQryTestResult.fieldbyname('TesterId').AsString) + #10;
    sTp := sTp +   '    测试时间：' + DateTimeToStr(UniQryTestResult.fieldbyname('TestTime').AsDateTime);
    Application.MessageBox(PChar(sTp),PChar(ComboBoxTestPosition.Text),MB_OK);
  end;
end;

procedure TFrmTestResult.BtnLogOutClick(Sender: TObject);
begin
  DBGridExport(DBGridEh1);
end;

procedure TFrmTestResult.SingleDBGridExport(GRID: TDBGridEh);
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

procedure TFrmTestResult.DBGridExport(GRID:TDBGridEh);
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
