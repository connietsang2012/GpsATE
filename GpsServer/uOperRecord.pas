unit uOperRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, MemDS, DBAccess, Uni, GridsEh,
  DBGridEh, Grids, DBGrids, ADODB, AppEvnts;

type
  TFrmOperRecord = class(TForm)
    Panel1: TPanel;
    DataSrcSearchOperRecord: TDataSource;
    DataSrcTest: TDataSource;
    UniQryTest: TUniQuery;
    DataSrcTestResult: TDataSource;
    UniQryTestResult: TUniQuery;
    ADOStoredProcSearchOperRecord: TADOStoredProc;
    ADOStoredProcDeleteOperRecord: TADOStoredProc;
    UniQryDeleteTest: TUniQuery;
    GroupBox2: TGroupBox;
    DBGridEhSearchOperRecord: TDBGridEh;
    DBGridEhTest: TDBGridEh;
    DBGridEhTestResult: TDBGridEh;
    Panel2: TPanel;
    LabelModel: TLabel;
    EditSoftModel: TEdit;
    LabelVersion: TLabel;
    EditSoftVersion: TEdit;
    LabelIMEI: TLabel;
    EditIMEI: TEdit;
    BtnSearchOperRecord: TButton;
    BtnClose: TButton;
    BtnDeleteRecord: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    EdtOperName: TEdit;
    LblTest: TLabel;
    cbbTest: TComboBox;
    CheckBoxOperTime: TCheckBox;
    DateTimePickerFrom: TDateTimePicker;
    Label3: TLabel;
    DateTimePickerTo: TDateTimePicker;
    LabelTestResult: TLabel;
    GroupBox1: TGroupBox;
    RadioBtnFail: TRadioButton;
    RadioBtnSuccess: TRadioButton;
    RadioBtnAll: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure BtnSearchOperRecordClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnDeleteRecordClick(Sender: TObject);
    procedure cbbTestChange(Sender: TObject);
    procedure DBGridEhTestDblClick(Sender: TObject);
    procedure DBGridEhTestResultDblClick(Sender: TObject);
    procedure DBGridEhSearchOperRecordDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //设置查询操作窗口中的几个查询条件是否显示
		procedure SetVisibleComponet(bTag : Boolean);
end;

var
  FrmOperRecord: TFrmOperRecord;
  sSQL,sWhere,sTemp : string;

implementation
uses
  uDmMain,uGlobalVar,UntPromptOperInfo;
{$R *.dfm}

procedure TFrmOperRecord.FormShow(Sender: TObject);
begin
  TPanel(FindComponent('Panel1')).Height := 91;
  cbbTest.ItemIndex := 0;
  GroupBox2.Caption := cbbTest.Text;
  DateTimePickerFrom.Date := Now - 1;
  DateTimePickerTo.Date := Now;

  ADOStoredProcSearchOperRecord.Close;
  ADOStoredProcSearchOperRecord.Parameters.ParamByName('@iOperName').Value := 0;
  ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperName').Value := '';
  ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperTimeStart').Value := DateTimeToStr(DateTimePickerFrom.Date);
  ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperTimeEnd').Value := DateTimeToStr(DateTimePickerTo.Date);
  ADOStoredProcSearchOperRecord.Open;
  GroupBox2.Caption := cbbTest.Text + '  共有' + IntToStr(ADOStoredProcSearchOperRecord.RecordCount) + '条记录';
  SetVisibleComponet(False);
  TDBGrid(FindComponent('DBGridEhTest')).Visible := False;
  TDBGrid(FindComponent('DBGridEhTestResult')).Visible := False;
  TDBGrid(FindComponent('DBGridEhSearchOperRecord')).Visible := True;
  DBGridEhSearchOperRecord.Align := alClient;
end;

//下拉框每个选项对于的不同数据表，如果有时间则可以做成存储过程实现
procedure TFrmOperRecord.BtnSearchOperRecordClick(Sender: TObject);
begin
  case cbbTest.ItemIndex of
    0:
    begin
      if CheckBoxOperTime.Checked then
      begin
        if DateTimePickerTo.DateTime > DateTimePickerFrom.DateTime then
        begin
          ADOStoredProcSearchOperRecord.Close;
          ADOStoredProcSearchOperRecord.Parameters.ParamByName('@iOperName').Value := 0;
          ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperName').Value := Trim(EdtOperName.Text);
          ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperTimeStart').Value := DateTimeToStr(DateTimePickerFrom.DateTime);
          ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperTimeEnd').Value := DateTimeToStr(DateTimePickerTo.DateTime);
          ADOStoredProcSearchOperRecord.Open;
        end
        else
        begin
          Application.MessageBox('开始时间不能晚于结束时间，请重新设置查询的开始时间和结束时间！','查询提示',MB_OK);
          DateTimePickerFrom.SetFocus;
        end;
      end
      else
      begin
        ADOStoredProcSearchOperRecord.Parameters.ParamByName('@iOperName').Value := 0;
        ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperName').Value := Trim(EdtOperName.Text);
        ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperTimeStart').Value := DateTimeToStr(Now -365);
        ADOStoredProcSearchOperRecord.Parameters.ParamByName('@OperTimeEnd').Value := DateTimeToStr(Now);
        ADOStoredProcSearchOperRecord.Open;
      end;
      ADOStoredProcSearchOperRecord.Last;
      GroupBox2.Caption := cbbTest.Text + '  共有' + IntToStr(ADOStoredProcSearchOperRecord.RecordCount) + '条记录' ;
    end;
    1: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTestSMT_Result ';
    2: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CoupleTest_Result ';
    3: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_ParamDownload_Result ';
    4: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_WriteImei_Result ';
    5: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_CartonBox_Result ';
    6: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_GpsTest_Result ';
    7: sSQL := 'Select SN,IMEI,SoftModel,[Version],Result,TesterId,TestTime from Gps_AutoTest_Result ';
    8: sSQL := 'Select SN,IMEI,SoftModel,[Version],FunctionResult,GPSResult,CoupleResult,WriteImeiResult,'
                +'ParamDownloadResult,AutoTestResult,Result,AutoTestSMTResult,SMTIQCResult from Gps_TestResult ';
  end;
  case cbbTest.ItemIndex of
  	1,2,3,4,5,6,7:
    begin
      sWhere := ' where TesterId like ''%' + Trim(EdtOperName.Text)+ '%'' and SN like ''%'
      						+ Trim(EditIMEI.Text) + '%'' and SoftModel like ''%' + Trim(EditSoftModel.Text)
                  + '%'' and Version like ''%' + Trim(EditSoftVersion.Text) + '%'' ';
      if RadioBtnSuccess.Checked then
        sWhere := sWhere + ' and Result=1 ';      //Result=1 Success；0: Fail
      if RadioBtnFail.Checked then
      	sWhere := sWhere + ' and Result=0 ';
      if CheckBoxOperTime.Checked then
        sWhere := sWhere + ' and TestTime between ''' + DateTimeToStr(DateTimePickerFrom.DateTime)
        					+ ''' and ''' + DateTimeToStr(DateTimePickerTo.DateTime) + ''' '
      else
        sWhere := sWhere + ' and TestTime between ''' + DateTimeToStr(Now-3)+ ''' and ''' + DateTimeToStr(Now) + ''' ';
      UniQryTest.Close;
      UniQryTest.SQL.Clear;
      UniQryTest.SQL.Add(sSQL + sWhere);
      UniQryTest.Open;
      UniQryTest.Last;
      GroupBox2.Caption := cbbTest.Text + '  共有' + IntToStr(UniQryTest.RecordCount) + '条记录' ;
    end;
  	8:
    begin
      sWhere := ' where 1=1 ';
      if Length(Trim(EditIMEI.Text))  > 0 then
      	sWhere := sWhere + ' and SN= ''' + Trim(EditIMEI.Text) + ''' ';
      if Length(Trim(EditSoftModel.Text))  > 0 then
      	sWhere := sWhere + ' and SoftModel = ''' + Trim(EditSoftModel.Text) + ''' ';
      if Length(Trim(EditSoftVersion.Text))  > 0 then
      	sWhere := sWhere + ' and Version = ''' + Trim(EditSoftVersion.Text) + ''' ';
      if RadioBtnSuccess.Checked then
      	sWhere := sWhere + ' and Result = 1' ;
      if RadioBtnFail.Checked then
      	sWhere := sWhere + ' and Result = 0' ;
      UniQryTestResult.Close;
      UniQryTestResult.SQL.Clear;
      UniQryTestResult.SQL.Add(sSQL + sWhere);
      UniQryTestResult.Open;
      UniQryTestResult.Last;
      GroupBox2.Caption := cbbTest.Text + '  共有' + IntToStr(UniQryTestResult.RecordCount) + '条记录' ;
    end;
  end;
end;

procedure TFrmOperRecord.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOperRecord.BtnDeleteRecordClick(Sender: TObject);
var
  sPromptContent,sPromptTitle : string;
begin
  if Length(Trim(cbbTest.Text)) > 0 then
  	sPromptContent := cbbTest.Text + #10;
  sPromptTitle := Trim(EdtOperName.Text);
  if not ((cbbTest.ItemIndex = 19) or (cbbTest.ItemIndex = 20)) then
    if Length(Trim(EdtOperName.Text)) > 0 then
      sPromptContent := sPromptContent + '操作用户：' + Trim(EdtOperName.Text) + #10;
  if Length(Trim(EditIMEI.Text)) > 0 then
    sPromptContent := sPromptContent +   '  SN编号：' + Trim(EditIMEI.Text) + #10;
  if Length(Trim(EditSoftModel.Text)) > 0 then
    sPromptContent := sPromptContent +   '  机  型：' + Trim(EditSoftModel.Text) + #10;
  if Length(Trim(EditSoftVersion.Text)) > 0 then
    sPromptContent := sPromptContent + '软件版本号：' + Trim(EditSoftVersion.Text) + #10;
  if not ((cbbTest.ItemIndex = 19) or (cbbTest.ItemIndex = 20)) then
    if CheckBoxOperTime.Checked then
      sPromptContent := sPromptContent+'    时间从：'+DateToStr(DateTimePickerFrom.Date)+'到'
    									+DateToStr(DateTimePickerTo.Date)+ #10;
  if Application.MessageBox(PChar('是否要删除 '+sPromptContent+' 历史记录吗？'),
  										PChar('删除 '+sPromptTitle+' 提示'),MB_OKCANCEL) =idok then
  begin
    case cbbTest.ItemIndex of
      0:
      begin
        if CheckBoxOperTime.Checked then
        begin
          if DateTimePickerTo.DateTime > DateTimePickerFrom.DateTime then
          begin
            ADOStoredProcDeleteOperRecord.Parameters.ParamByName('@iOperName').Value := 0;
            ADOStoredProcDeleteOperRecord.Parameters.ParamByName('@OperName').Value := Trim(EdtOperName.Text);
            ADOStoredProcDeleteOperRecord.Parameters.ParamByName('@OperTimeStart').Value := DateTimeToStr(DateTimePickerFrom.DateTime);
            ADOStoredProcDeleteOperRecord.Parameters.ParamByName('@OperTimeEnd').Value := DateTimeToStr(DateTimePickerTo.DateTime);
            ADOStoredProcDeleteOperRecord.ExecProc;
          end
          else
          begin
            Application.MessageBox('开始时间不能晚于结束时间，请重新设置查询的开始时间和结束时间！','删除提示',MB_OK);
            DateTimePickerFrom.SetFocus;
          end;
        end
        else
        begin
          Application.MessageBox('请选择要删除的历史记录时间段！','删除提示',MB_OK);
          DateTimePickerFrom.SetFocus;
        end;
      end;
      1: sSQL := 'delete from Gps_AutoTestSMT_Result';
      2: sSQL := 'delete from Gps_CoupleTest_Result';
      3: sSQL := 'delete from Gps_ParamDownload_Result';
      4: sSQL := 'delete from Gps_WriteImei_Result';
      5: sSQL := 'delete from Gps_CartonBox_Result';
      6: sSQL := 'delete from Gps_GpsTest_Result';
      7: sSQL := 'delete from Gps_AutoTest_Result';
      8: sSQL := 'delete from Gps_TestResult';
    end;
    case cbbTest.ItemIndex of
      1,2,3,4,5,6,7:
      begin
        sWhere := ' where 1=1 ';
        if Length(Trim(EdtOperName.Text)) > 0 then
        	sWhere := sWhere + ' and TesterId = ''' + Trim(EdtOperName.Text)+ '''';
        if Length(Trim(EditIMEI.Text)) > 0 then
        	sWhere := sWhere + ' and SN=''' + Trim(EditIMEI.Text) + '''';
        if Length(Trim(EditSoftModel.Text)) > 0 then
          sWhere := sWhere + ' and SoftModel like=''' + Trim(EditSoftModel.Text) + '''' ;
        if Length(Trim(EditSoftVersion.Text)) > 0 then
          sWhere := sWhere + ' and Version like ''' + Trim(EditSoftVersion.Text) + ''' ';

        if RadioBtnSuccess.Checked then
          sWhere := sWhere + ' and Result=1 ';      //Result=1 Success；0: Fail
        if RadioBtnFail.Checked then
          sWhere := sWhere + ' and Result=0 ';
        if CheckBoxOperTime.Checked then
          sWhere := sWhere + ' and TestTime between ''' + DateTimeToStr(DateTimePickerFrom.DateTime)
                    + ''' and ''' + DateTimeToStr(DateTimePickerTo.DateTime) + ''' ';
        UniQryDeleteTest.SQL.Clear;
        UniQryDeleteTest.SQL.Add(sSQL + sWhere);
        UniQryDeleteTest.ExecSQL;
      end;
      8:
      begin
        sWhere := ' where 1=1 ';
        if Length(Trim(EditIMEI.Text))  > 0 then
          sWhere := sWhere + ' and SN= ''' + Trim(EditIMEI.Text) + ''' ';
        if Length(Trim(EditSoftModel.Text))  > 0 then
          sWhere := sWhere + ' and SoftModel = ''' + Trim(EditSoftModel.Text) + ''' ';
        if Length(Trim(EditSoftVersion.Text))  > 0 then
          sWhere := sWhere + ' and Version = ''' + Trim(EditSoftVersion.Text) + ''' ';
        if RadioBtnSuccess.Checked then
          sWhere := sWhere + ' and Result = 1' ;
        if RadioBtnFail.Checked then
          sWhere := sWhere + ' and Result = 0' ;
        UniQryDeleteTest.SQL.Clear;
        UniQryDeleteTest.SQL.Add(sSQL + sWhere);
        UniQryDeleteTest.ExecSQL;
      end;
    end;
    EdtOperName.Text := '';
    CheckBoxOperTime.Checked := false;
    EditSoftModel.Text := '';
    EditSoftVersion.Text := '';
    EditIMEI.Text := '';
    RadioBtnAll.Checked := True;
    BtnSearchOperRecord.Click;
  end;
end;

//下拉框每个选项对于的不同数据表，如果有时间则可以做成存储过程实现
procedure TFrmOperRecord.cbbTestChange(Sender: TObject);
begin
  GroupBox2.Caption := cbbTest.Text;
  EdtOperName.Text := '';
  EditIMEI.Text := '';
  EditSoftModel.Text := '';
  EditSoftVersion.Text := '';
  RadioBtnAll.Checked := True;
  CheckBoxOperTime.Checked := false;
  case cbbTest.ItemIndex of
    0:
    begin
      SetVisibleComponet(False);
      TDBGrid(FindComponent('DBGridEhTest')).Visible := False;
      TDBGrid(FindComponent('DBGridEhTestResult')).Visible := False;
      TDBGrid(FindComponent('DBGridEhSearchOperRecord')).Visible := True;
      DBGridEhSearchOperRecord.Align := alClient;
    end;
    1,2,3,4,5,6,7:
    begin
      SetVisibleComponet(True);
      TDBGrid(FindComponent('DBGridEhSearchOperRecord')).Visible := False;
      TDBGrid(FindComponent('DBGridEhTestResult')).Visible := False;
      TDBGrid(FindComponent('DBGridEhTest')).Visible := True;
      DBGridEhTest.Align := alClient;
    end;
    8:
    begin
      SetVisibleComponet(True);
      TDBGrid(FindComponent('DBGridEhSearchOperRecord')).Visible := False;
      TDBGrid(FindComponent('DBGridEhTest')).Visible := False;
      TDBGrid(FindComponent('DBGridEhTestResult')).Visible := True;
      DBGridEhTestResult.Align := alClient;
    end;
  end;
  BtnSearchOperRecord.Click;
end;

//设置查询操作窗口中的几个查询条件是否显示
procedure TFrmOperRecord.SetVisibleComponet(bTag : Boolean);
begin
  TLabel(FindComponent('LabelModel')).Visible := bTag;
  TLabel(FindComponent('LabelVersion')).Visible := bTag;
  TLabel(FindComponent('LabelTestResult')).Visible := bTag;
  TLabel(FindComponent('LabelIMEI')).Visible := bTag;
  TEdit(FindComponent('EditSoftModel')).Visible := bTag;
  TEdit(FindComponent('EditSoftVersion')).Visible := bTag;
  TEdit(FindComponent('EditIMEI')).Visible := bTag;
  TGroupBox(FindComponent('GroupBox1')).Visible := bTag;
  if bTag then
  begin
    TButton(FindComponent('BtnSearchOperRecord')).Left := 611;
    TButton(FindComponent('BtnClose')).Left := 681;
    TButton(FindComponent('BtnDeleteRecord')).Left := 750;
  end
  else
  begin
    TButton(FindComponent('BtnSearchOperRecord')).Left := 408;
    TButton(FindComponent('BtnClose')).Left := 478;
    TButton(FindComponent('BtnDeleteRecord')).Left := 547;
  end;
end;

procedure TFrmOperRecord.DBGridEhTestDblClick(Sender: TObject);
begin
  if UniQryTest.RecordCount > 0 then
  begin
    sTemp :=           '      SN编号：' + Trim(UniQryTest.fieldbyname('SN').AsString) +'        '+ #10;
    sTemp := sTemp +   '    IMEI编号：' + Trim(UniQryTest.fieldbyname('IMEI').AsString) + #10;
    sTemp := sTemp +   '     机   型：' + Trim(UniQryTest.fieldbyname('SoftModel').AsString) + #10;
    sTemp := sTemp +   '  软件版本号：' + Trim(UniQryTest.fieldbyname('Version').AsString) + #10;
    if UniQryTest.fieldbyname('Result').AsInteger = 1 then
    	sTemp := sTemp + '    测试结果：' + '1--测试成功' + #10
    else
    	sTemp := sTemp + '    测试结果：' + '0--测试失败' + #10;
    sTemp := sTemp +   '    操作用户：' + Trim(UniQryTest.fieldbyname('TesterId').AsString) + #10;
    sTemp := sTemp +   '    测试时间：' + DateTimeToStr(UniQryTest.fieldbyname('TestTime').AsDateTime);
    Application.MessageBox(PChar(sTemp),PChar(cbbTest.Text),MB_OK);
  end;
end;
                                      
procedure TFrmOperRecord.DBGridEhTestResultDblClick(Sender: TObject);
begin
  if UniQryTestResult.RecordCount > 0 then
  begin
    sTemp :=         '      SN编号：' + Trim(UniQryTestResult.fieldbyname('SN').AsString) + #10;
    sTemp := sTemp + '    IMEI编号：' + Trim(UniQryTestResult.fieldbyname('IMEI').AsString) + #10;
    sTemp := sTemp + '     机   型：' + Trim(UniQryTestResult.fieldbyname('SoftModel').AsString) + #10;
    sTemp := sTemp + '  软件版本号：' + Trim(UniQryTestResult.fieldbyname('Version').AsString) + #10;
    if UniQryTestResult.fieldbyname('Result').AsInteger = 1 then
    	sTemp := sTemp + '    测试结果：' + '1--测试成功' + #10
    else
    	sTemp := sTemp + '    测试结果：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('ParamDownloadResult').AsInteger = 1 then
    	sTemp := sTemp + '下载参数测试：' + '1--测试成功' + #10
    else
      sTemp := sTemp + '下载参数测试：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('AutoTestSMTResult').AsInteger = 1 then
    	sTemp := sTemp + ' SMT自动测试：' + '1--测试成功' + #10
    else
      sTemp := sTemp + ' SMT自动测试：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('CoupleResult').AsInteger = 1 then
    	sTemp := sTemp + '    耦合测试：' + '1--测试成功' + #10
    else
    	sTemp := sTemp + '    耦合测试：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('WriteImeiResult').AsInteger =1 then
    	sTemp := sTemp + 'IMEI烧写测试：' + '1--测试成功' + #10
    else
    	sTemp := sTemp + 'IMEI烧写测试：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('FunctionResult').AsInteger =1 then
    	sTemp := sTemp + '    功能测试：' + '1--测试成功' + #10
    else
    	sTemp := sTemp + '    功能测试：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('GPSResult').AsInteger =1 then
    	sTemp := sTemp + '     GPS测试：' + '1--测试成功' + #10
  	else
    	sTemp := sTemp + '     GPS测试：' + '0--测试失败' + #10;
    if UniQryTestResult.fieldbyname('AutoTestResult').AsInteger =1 then
    	sTemp := sTemp + '    自动测试：' + '1--测试成功'
    else
    	sTemp := sTemp + '    自动测试：' + '0--测试失败';
    Application.MessageBox(PChar(sTemp),PChar(cbbTest.Text),MB_OK);
  end;
end;

procedure TFrmOperRecord.DBGridEhSearchOperRecordDblClick(Sender: TObject);
var
  i,j,k,m : Integer;
  sPromStringAll : TStringList;
  sSubString,sPromString,sOpName,stTemp1,stTemp2,stTemp3,stTemp4,stTemp5 : string;
begin
  if ADOStoredProcSearchOperRecord.RecordCount > 0 then
  begin
    sOpName := Trim(ADOStoredProcSearchOperRecord.fieldbyname('OperName').AsString);
    sTemp := Trim(ADOStoredProcSearchOperRecord.fieldbyname('OperContent').AsString);
    sPromString := sOpName + ' ' + sTemp + #10 + '操作时间是: ' ;
    sPromString := sPromString + DateTimeToStr(ADOStoredProcSearchOperRecord.fieldbyname('OperTime').AsDateTime);
    i := Pos('#',sTemp);
    if i > 0 then
    begin
      sPromStringAll := TStringList.Create;
      sPromStringAll.Clear;
      sPromStringAll.Delimiter := '/';
      sTemp := Copy(sTemp,6,Length(sTemp)-5);
      i := Pos('#',sTemp);
      if i > 0 then
      begin
      	sSubString := Copy(sTemp,0,i -1);
        sTemp := Copy(sTemp,i+2,Length(sTemp)- i-2)
      end;
      sPromStringAll.DelimitedText := sTemp;
      sPromString := '--------------' + sSubString + '--------------'+ #10#13#10#13;
      if sPromStringAll.Count >= 0 then
      begin
        for j := 0 to sPromStringAll.Count - 1 do    //循环里面是字符串进行操作判断
        begin
          stTemp1 := sPromStringAll.Strings[j];
          k := Pos('#',stTemp1);
          if k > 0 then
          	stTemp1 := Copy(stTemp1,k+1,Length(stTemp1)-k);
          k := Pos('}',stTemp1);
          if k > 0 then
            stTemp1 := Copy(stTemp1,0,k-1);
          k := Pos(':',stTemp1);
          if k > 0 then
          	stTemp2:= Copy(stTemp1,0,k-1)
        	else
          	stTemp2:=stTemp1;
          stTemp3 := Copy(stTemp1,k+1,Length(stTemp1)-k);
          k := Pos(']',stTemp3);
          if k > 0 then
            stTemp3 := Copy(stTemp3,0,k-1);
          if Length(Trim(stTemp3)) <2 then  //判断是否是'1'或'0'的字符串
          begin
            if Trim(stTemp3) = 'Y' then
              stTemp3 :=  ' 是'
            else if Trim(stTemp3) = 'N' then
              stTemp3 :=  ' 否';
          end;  

          if Length(stTemp2) < 20 then
          begin
          	k := 10 - Length(stTemp2);   //长度不足10的字符串应该前面补充K 个空格
            for m := 0 to k do
            begin
              stTemp4 := stTemp4 + ' ';
            end;
            stTemp2 := stTemp4 + stTemp2;
            stTemp5 :=stTemp4;
            stTemp4 := '';
          end;
        	sPromString := sPromString + stTemp2 + ': ' + stTemp3 + #10;
        end;
      end;
      sPromString := sPromString + #10+ stTemp5+'操作时间: ' + DateTimeToStr(ADOStoredProcSearchOperRecord.fieldbyname('OperTime').AsDateTime);
    end;
    Application.MessageBox(PChar(sPromString),PChar('操作记录查询'),MB_OK);
  end;
end;

end.
