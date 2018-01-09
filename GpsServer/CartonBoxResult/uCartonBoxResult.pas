unit uCartonBoxResult;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uModuleForm, DB, MemDS, DBAccess, Uni, GridsEh, DBGridEh, StdCtrls, ComCtrls, ComObj, clipbrd, DBGridEhImpExp;

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
        GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
        DataSrcTestResult: TDataSource;
        UniQry_CartonBoxResult: TUniQuery;
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
        SaveDialog1: TSaveDialog;
        procedure Button1Click(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure DBGridEh1DblClick(Sender: TObject);
        procedure Button2Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        procedure SearchTestResult(sNowDate: string = '1');
        procedure SingleDBGridExport(GRID: TDBGridEh);
        procedure DBGridExport(GRID: TDBGridEh);
    end;

var
    frmCartonBoxResult: TfrmCartonBoxResult;
    sSQL, sWhere, sOrder: string;
implementation
uses
  uDmMain,uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBoxResult.Button1Click(Sender: TObject);
begin
    SearchTestResult;
    GroupBoxSearRes.Caption := ' 共' + IntToStr(UniQry_CartonBoxResult.RecordCount) + ' 记录';

end;

procedure TfrmCartonBoxResult.SearchTestResult(sNowDate: string = '1');
var
    sTemp: string;
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
            sWhere := sWhere + ' and (IMEI like ''%' + Trim(edt_IMEI.Text) + '%'') ';
        if Length(Trim(edt_SoftModel.Text)) > 0 then
            sWhere := sWhere + ' and ([SoftModel] like ''%' + Trim(edt_SoftModel.Text) + '%'') ';
        if Length(Trim(edt_Version.Text)) > 0 then
            sWhere := sWhere + ' and ([Version] like ''%' + Trim(edt_Version.Text) + '%'') ';
        if Length(Trim(edt_Rid.Text)) > 0 then
            sWhere := sWhere + ' and ([Remark2] like ''%' + Trim(edt_Rid.Text) + '%'') ';
    end;

    sOrder := ' order by BoxNo';
    sTemp := sSQL + sWhere + sOrder;
    UniQry_CartonBoxResult.SQL.Clear;
    UniQry_CartonBoxResult.SQL.Add(sTemp);
    UniQry_CartonBoxResult.Open;
end;

procedure TfrmCartonBoxResult.FormShow(Sender: TObject);
begin
    edt_BoxNo.Text := '';
    edt_ZhiDan.Text := '';
    edt_ProductCode.Text := '';
    edt_IMEI.Text := '';
    edt_SoftModel.Text := '';
    edt_Version.Text := '';
    edt_Rid.Text := '';

    SearchTestResult('2');
    GroupBoxSearRes.Caption := ' 共' + IntToStr(UniQry_CartonBoxResult.RecordCount) + ' 记录';

end;

procedure TfrmCartonBoxResult.DBGridEh1DblClick(Sender: TObject);
var
    sTp: string;
begin
    if UniQry_CartonBoxResult.RecordCount > 0 then
    begin
        sTp := '      箱  号：' + Trim(UniQry_CartonBoxResult.fieldbyname('BoxNo').AsString) + #10;
        sTp := sTp + '    IMEI编号：' + Trim(UniQry_CartonBoxResult.fieldbyname('IMEI').AsString) + #10;
        sTp := sTp + '     制   单：' + Trim(UniQry_CartonBoxResult.fieldbyname('ZhiDan').AsString) + #10;
        sTp := sTp + '     机   型：' + Trim(UniQry_CartonBoxResult.fieldbyname('SoftModel').AsString) + #10;

        sTp := sTp + '  软件版本号：' + Trim(UniQry_CartonBoxResult.fieldbyname('Version').AsString) + #10;

        Application.MessageBox(PChar(sTp), '卡通测试结果', MB_OK);
    end;
end;

procedure TfrmCartonBoxResult.SingleDBGridExport(GRID: TDBGridEh);
var //DBGRID控件内容存储到EXCEL
    EclApp: Variant;
    XlsFileName: string;
    sh: olevariant;
    i, j, z: integer;
    s: string;
    savedailog: TSaveDialog;
begin
    savedailog := TSaveDialog.Create(nil);
    savedailog.Filter := 'Excel files (*.xls)|*.XlS';
    if savedailog.Execute then
    begin
        xlsfilename := savedailog.FileName;
        savedailog.Free;
    end
    else
    begin
        savedailog.Free;
        exit;
    end;
    try
        eclapp := createOleObject('Excel.Application');
        sh := CreateOleObject('Excel.Sheet');
    except
        showmessage('您的机器里未安装Microsoft Excel。');
        exit;
    end;
    try
        sh := eclapp.workBooks.add;
        with Grid.DataSource.DataSet do
        begin
            First;
            //z:=GRID.FieldCount-1;
            j := i div 26;
            s := '';
            if j > 0 then s := s + chr(64 + j);
            for i := 1 to RecordCount do
            begin
                for z := 0 to grid.FieldCount - 1 do
                begin
                    if grid.Fields[z].Visible then
                    begin
                        eclapp.cells[i * 2, z + 1] := grid.Fields[z].DisplayName;
                        if GRID.Fields[z].DisplayWidth > 80 then
                            eclapp.columns[z + 1].Columnwidth := 80
                        else
                            eclapp.columns[z + 1].Columnwidth := GRID.Fields[z].DisplayWidth + 0.3;
                        eclapp.cells[i * 2, z + 1].Font.Color := clRed;
                    end;
                end;
                for j := 0 to grid.FieldCount - 1 do
                    if grid.Fields[j].Visible then
                        if GRID.Fields[j].DisplayText > '' then
                        begin
                            eclapp.cells[i * 2 + 1, j + 1] := grid.Fields[j].DisplayText;
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

procedure TfrmCartonBoxResult.DBGridExport(GRID: TDBGridEh);
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

procedure TfrmCartonBoxResult.Button2Click(Sender: TObject);
begin
    DBGridExport(DBGridEh1);
end;

end.

