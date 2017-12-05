unit uCartonBoxLlf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCartonBox, StdCtrls, Buttons, ExtCtrls, DB, ADODB, OleServer, ComObj, OleExcel,
  BarTender_TLB, MemDS, DBAccess, Uni,uDmMain,uGlobalVar, Mask, Grids,
  DBTables, Excel2000;

type
  TfrmCartonBoxLlf = class(TfrmCartonBox)
    lbl11: TLabel;
    EdtVersion: TEdit;
    lbl14: TLabel;
    EdtColor: TEdit;
    EdtQty: TEdit;
    lbl15: TLabel;
    EdtBoxNum1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    Edtzhidan: TEdit;
    lbl3: TLabel;
    EdtDate: TEdit;
    EdtProNo: TEdit;
    lbl4: TLabel;
    EdtQty1: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    EdtCpName: TEdit;
    UniQuery_IMEIId: TIntegerField;
    UniQuery_IMEIBoxNo: TStringField;
    UniQuery_IMEIIMEI: TStringField;
    UniQuery_IMEIZhiDan: TStringField;
    UniQuery_IMEISoftModel: TStringField;
    UniQuery_IMEIVersion: TStringField;
    UniQuery_IMEIProductCode: TStringField;
    UniQuery_IMEIColor: TStringField;
    UniQuery_IMEIQty: TStringField;
    UniQuery_IMEIWeight: TStringField;
    UniQuery_IMEIDate: TStringField;
    UniQuery_IMEITACInfo: TStringField;
    UniQuery_IMEICompanyName: TStringField;
    UniQuery_IMEITesterId: TStringField;
    UniQuery_IMEITestTime: TDateTimeField;
    UniQuery_IMEIRemark1: TStringField;
    UniQuery_IMEIRemark2: TStringField;
    UniQuery_IMEIRemark3: TStringField;
    UniQuery_IMEIRemark4: TStringField;
    UniQuery_IMEIRemark5: TStringField;
    unqry1: TUniQuery;
    StringGrid1: TStringGrid;
    shp1: TShape;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImeiPrint();override;
    procedure InserExcell(dbgrid:TStringGrid);
    procedure ClearStringGrid(dbgrid:TStringGrid);
  end;

var
  frmCartonBoxLlf: TfrmCartonBoxLlf;
  ExcelApp: OleVariant;
  CardBoxExcelApp:TOLEExcel;
implementation
uses
    uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBoxLlf.ImeiPrint();
var
  strFile,strver,strExcel:String;
  i,iGrid:Integer;
  strtemp:string;
  //strGrid:TStringGrid;
  strRid:string;
begin
    ///清空stringgrid
    ClearStringGrid(StringGrid1);
    if (mmoMEI.Lines.Count =0) then
    begin
        ShowMessage('当前数据为空,不能进行打印');
        Exit;
    end;
    if (trim(EdtVersion.Text) ='') then
    begin
        ShowMessage('版本信息不能为空');
        Exit;
    end;
    {if (Trim(EdtVersion1.Text)<>paramVersion) and (paramVersion<>'') then//兼容不跑下载位的机型
    begin
        ShowMessage('下载版本号与单号设置版本不一致！');
        Exit;
    end;}
    strBar :='';
    strver :='';
    strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\llf\'+IntToStr(mmoMEI.Lines.Count)+'.btw';
    AppendTxt(strFile,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
    if chkAuto.Checked then
    begin
      with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
      begin
          SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
          SetNamedSubStringValue('ZhiDan','制单:'+trim(Edtzhidan.Text));
          SetNamedSubStringValue('MachineType',trim(EdtVersion.Text));
          SetNamedSubStringValue('ProductColor','颜色:'+trim(EdtColor.Text));
          SetNamedSubStringValue('ProductDate','日期:'+trim(EdtDate.Text));
          SetNamedSubStringValue('ProductCount','数量:'+trim(EdtQty1.Text));
          SetNamedSubStringValue('ProductWeight','毛重'+(EdtQty.Text));
          SetNamedSubStringValue('ProductNum','产品编码:'+trim(EdtProNo.Text));
          SetNamedSubStringValue('Remark',trim(EdtParamVersion.Text));

          //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
          strver:=SysUtils.Format('箱号:%s%s'+#13#10+'制单:%s'+#13#10+'颜色:%s'+#13#10+'日期:%s'+#13#10+'数量:%s'+#13#10+'毛重%s'+#13#10+'产品编码:%s'+#13#10+'机型:%s'+#13#10+'',
                      [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtVersion.Text]);
          AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');

          for i:=0 to (mmoMEI.Lines.Count-1) do
          begin
              strver:=strver+StrList.Strings[i]+''+#13#10+'';
              strBar  :='IMEI' +IntToStr(i);
              SetNamedSubStringValue(strBar,StrList.Strings[i]); //设置值
              AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'\PrintLog\log.txt');
              //AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');

              //得到基带ID
              strRid:='';
              UniQuery_FindRidByImei.Close;
              UniQuery_FindRidByImei.ParamByName('IMEI').value:=StrList.Strings[i];
              UniQuery_FindRidByImei.Open;
              UniQuery_FindRidByImei.First;
              strRid:=UniQuery_FindRidByImei.FieldByName('Rid').AsString;
              AppendTxt(StrList.Strings[i]+','+strRid,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');


              UniQuery_IMEI.Close;
              UniQuery_IMEI.Sql.Clear;
              //strtemp := Format('Insert into Gps_CartonBoxTwenty_Result (BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId) values(''%s%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')',
              //[EdtBoxNum.Text, EdtBoxNum1.Text, StrList.Strings[i], Edtzhidan.Text, EdtVersion.Text, EdtVersion1.Text, EdtProNo.Text, EdtColor.Text, EdtQty1.Text, EdtQty.Text, EdtDate.Text, EdtTac.Text, EdtCpName.Text, User.UserName]);

              strtemp:='Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2) values('''
                        + EdtBoxNum.Text+EdtBoxNum1.Text+''','''+StrList.Strings[i]+''','''+Edtzhidan.Text
                        + ''','''+EdtVersion.Text+''','''+EdtParamVersion.Text+''','''+EdtProNo.Text+''','''
                        + EdtColor.Text+''','''+EdtQty1.Text+''','''+EdtQty.Text+''','''+EdtDate.Text+''','''
                        + EdtTac.Text+''','''+EdtCpName.Text+''','''+User.UserName + ''','''+strRid+''')';


              UniQuery_IMEI.SQL.Text:=strtemp;
              UniQuery_IMEI.Execute;
          {StringGrid1.RowCount:=StringGrid1.RowCount+1;
          StringGrid1.Cells[i, 0]:=StrList.Strings[i];
          StringGrid1.Cells[i,1]:=SNList.Strings[i];
          StringGrid1.Cells[i,2]:=VersionList.Strings[i];
          StringGrid1.Cells[i,3]:='';
          StringGrid1.Cells[i,4]:= Edtzhidan.Text;
          StringGrid1.Cells[i,5]:=EdtVersion.Text;
          StringGrid1.Cells[i,6]:=EdtColor.Text;
          StringGrid1.Cells[i,7]:=EdtCpName.Text;
          StringGrid1.Cells[i,8]:= EdtBoxNum.Text+EdtBoxNum1.Text;
          StringGrid1.Cells[i,9]:='';
          StringGrid1.Cells[i,10]:=EdtDate.Text; }

          end;
          SetNamedSubStringValue('QRCode',strver); //设置值
          try
              PrintOut(False, False);
              //InserExcell(StringGrid1);
              Close(btDoNotSaveChanges); //关闭不保存
              StrList.Clear;
              SNList.Clear;
              VersionList.Clear;
              mmoMEI.Clear;

              EdtBoxNum1.Text :=IntToStr((StrToInt(EdtBoxNum1.Text)+1));
              lbl10.Caption:='0';

              if (Length(EdtBoxNum1.Text) =1)  then
                  EdtBoxNum1.Text :='0000'+EdtBoxNum1.Text
              else if (Length(EdtBoxNum1.Text) =2) then
                  EdtBoxNum1.Text :='000'+ EdtBoxNum1.Text
              else if (Length(EdtBoxNum1.Text) =3) then
                  EdtBoxNum1.Text :='00'+ EdtBoxNum1.Text
              else if (Length(EdtBoxNum1.Text) =4) then
                  EdtBoxNum1.Text :='0'+ EdtBoxNum1.Text;

              AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
              AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
          except
              Close(btDoNotSaveChanges); //关闭不保存
          end;
        end;
    end
    else
    begin
    //strver:=SysUtils.Format('箱号:%s%s'+#13#10+'制单:%s'+#13#10+'颜色:%s'+#13#10+'日期:%s'+#13#10+'数量:%s'+#13#10+'毛重%s'+#13#10+'产品编码:%s'+#13#10+'机型:%s'+#13#10+'',
    //                  [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtVersion.Text]);

      with btappBtnPrint.Formats.Open(strFile, True, '') do //打开标签文件
      begin
          {SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
          SetNamedSubStringValue('ZhiDan','订单:'+trim(Edtzhidan.Text));
          SetNamedSubStringValue('MachineType',trim(EdtVersion.Text));
          SetNamedSubStringValue('ProductColor','颜色:'+trim(EdtColor.Text));
          SetNamedSubStringValue('ProductDate','日期:'+trim(EdtDate.Text));
          SetNamedSubStringValue('ProductCount','数量'+trim(EdtQty1.Text));
          SetNamedSubStringValue('ProductWeight','毛重'+(EdtQty.Text));
          SetNamedSubStringValue('ProductNum','产品编码:'+trim(EdtProNo.Text));
          SetNamedSubStringValue('Remark',trim(EdtParamVersion.Text));

          //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
          strver:=SysUtils.Format('箱号:%s%s  制单:%s  机型:%s  颜色:%s    日期:%s  数量:%s  毛重%sKG  Product Code:%s  Version:%s',
                      [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtVersion.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtParamVersion.Text]);
          AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt'); }

          SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
          SetNamedSubStringValue('ZhiDan','制单:'+trim(Edtzhidan.Text));
          SetNamedSubStringValue('MachineType',trim(EdtVersion.Text));
          SetNamedSubStringValue('ProductColor','颜色:'+trim(EdtColor.Text));
          SetNamedSubStringValue('ProductDate','日期:'+trim(EdtDate.Text));
          SetNamedSubStringValue('ProductCount','数量:'+trim(EdtQty1.Text));
          SetNamedSubStringValue('ProductWeight','毛重'+trim(EdtQty.Text));
          SetNamedSubStringValue('ProductNum','产品编码:'+trim(EdtProNo.Text));
          SetNamedSubStringValue('Remark',trim(EdtParamVersion.Text));

          //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
          strver:=SysUtils.Format('箱号:%s%s'+#13#10+'制单:%s'+#13#10+'颜色:%s'+#13#10+'日期:%s'+#13#10+'数量:%s'+#13#10+'毛重%s'+#13#10+'产品编码:%s'+#13#10+'机型:%s'+#13#10+'',
                      [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtVersion.Text]);
          AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');


          for i:=0 to (mmoMEI.Lines.Count-1) do
          begin
              strver:=strver+StrList.Strings[i]+''+#13#10+'';
              strBar  :='IMEI' +IntToStr(i);
              SetNamedSubStringValue(strBar,StrList.Strings[i]); //设置值
              AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'\PrintLog\log.txt');
              //AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');

              //得到基带ID
              strRid:='';
              UniQuery_FindRidByImei.Close;
              UniQuery_FindRidByImei.ParamByName('IMEI').value:=StrList.Strings[i];
              UniQuery_FindRidByImei.Open;
              UniQuery_FindRidByImei.First;
              strRid:=UniQuery_FindRidByImei.FieldByName('Rid').AsString;
              AppendTxt(StrList.Strings[i]+','+strRid,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');


          {StringGrid1.RowCount:=StringGrid1.RowCount+1;
          StringGrid1.Cells[i, 0]:=StrList.Strings[i];
          StringGrid1.Cells[i,1]:=SNList.Strings[i];
          StringGrid1.Cells[i,2]:=VersionList.Strings[i];
          StringGrid1.Cells[i,3]:='';
          StringGrid1.Cells[i,4]:= Edtzhidan.Text;
          StringGrid1.Cells[i,5]:=EdtVersion.Text;
          StringGrid1.Cells[i,6]:=EdtColor.Text;
          StringGrid1.Cells[i,7]:=EdtCpName.Text;
          StringGrid1.Cells[i,8]:= EdtBoxNum.Text+EdtBoxNum1.Text;
          StringGrid1.Cells[i,9]:='';
          StringGrid1.Cells[i,10]:=EdtDate.Text;}


              UniQuery_IMEI.Close;
              UniQuery_IMEI.Sql.Clear;
              //strtemp:=Format('Insert into Gps_CartonBoxTwenty_Result (BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId) values (''%s%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'')',
              //[EdtBoxNum.Text,EdtBoxNum1.Text,StrList.Strings[i],Edtzhidan.Text,EdtVersion.Text,EdtVersion1.Text,EdtProNo.Text,EdtColor.Text,EdtQty1.Text,EdtQty.Text,EdtDate.Text,EdtTac.Text,EdtCpName.Text,User.UserName]);
              strtemp:='Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId)values('''
                        + EdtBoxNum.Text+EdtBoxNum1.Text+''','''+StrList.Strings[i]+''','''+Edtzhidan.Text
                        + ''','''+EdtVersion.Text+''','''+EdtParamVersion.Text+''','''+EdtProNo.Text+''','''
                        + EdtColor.Text+''','''+EdtQty1.Text+''','''+EdtQty.Text+''','''+EdtDate.Text+''','''
                        + EdtTac.Text+''','''+EdtCpName.Text+''','''+User.UserName + ''')';
              UniQuery_IMEI.SQL.Text:=strtemp;
              UniQuery_IMEI.Execute;

          end;
          SetNamedSubStringValue('QRCode',strver); //设置值
          try

              PrintOut(False, true); //打印
              Close(btDoNotSaveChanges); //关闭不保存
              //InserExcell(StringGrid1);

              StrList.Clear;
              SNList.Clear;
              VersionList.Clear;
              mmoMEI.Clear;

              EdtBoxNum1.Text :=IntToStr((StrToInt(EdtBoxNum1.Text)+1));

              if (Length(EdtBoxNum1.Text) =1)  then
                  EdtBoxNum1.Text :='0000'+EdtBoxNum1.Text
              else if (Length(EdtBoxNum1.Text) =2) then
                  EdtBoxNum1.Text :='000'+ EdtBoxNum1.Text
              else if (Length(EdtBoxNum1.Text) =3) then
                  EdtBoxNum1.Text :='00'+ EdtBoxNum1.Text
              else if (Length(EdtBoxNum1.Text) =4) then
                  EdtBoxNum1.Text :='0'+ EdtBoxNum1.Text;

              AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
              AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
          except
              Close(btDoNotSaveChanges); //关闭不保存
          end;
        end;
    end;
end;

procedure TfrmCartonBoxLlf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    WriteIni('llf','Model',trim(EdtVersion.Text));    //机型
    WriteIni('llf','Color',trim(EdtColor.Text));      //颜色
    WriteIni('llf','BoxNum',trim(EdtBoxNum.Text));    //箱号
    WriteIni('llf','BoxNum1',trim(EdtBoxNum1.Text));  //箱号分支
    WriteIni('llf','Qty',(EdtQty.Text));          //重量
    WriteIni('llf','ZhiDan',trim(Edtzhidan.Text));    //制单
    WriteIni('llf','Date',trim(EdtDate.Text));        //日期
    WriteIni('llf','ProNo',trim(EdtProNo.Text));      //产品号
    WriteIni('llf','Version',trim(EdtParamVersion.Text)); //版本号
    WriteIni('llf','Tac',trim(EdtTac.Text));          //Tac信息
    WriteIni('llf','Qty1',trim(EdtQty1.Text));        //数量
    WriteIni('llf','CpName',trim(EdtCpName.Text));    //公司名称

end;

procedure TfrmCartonBoxLlf.FormCreate(Sender: TObject);

begin
  inherited;
    EdtVersion.Text :=ReadIni('llf','Model','');
    EdtColor.Text :=ReadIni('llf','Color','');
    EdtBoxNum.Text :=ReadIni('llf','BoxNum','');
    EdtBoxNum1.Text :=ReadIni('llf','BoxNum1','');
    EdtQty.Text :=ReadIni('llf','Qty','');
    Edtzhidan.Text :=ReadIni('llf','ZhiDan','');
    EdtDate.Text :=ReadIni('llf','Date','');
    EdtProNo.Text :=ReadIni('llf','ProNo','');
    EdtParamVersion.Text :=ReadIni('llf','Version','');
    EdtTac.Text :=ReadIni('llf','Tac','');
    EdtQty1.Text :=ReadIni('llf','Qty1','');
    EdtCpName.Text :=ReadIni('llf','CpName','');

    if (Length(EdtBoxNum1.Text) =1)  then
        EdtBoxNum1.Text :='0000'+EdtBoxNum1.Text
    else if (Length(EdtBoxNum1.Text) =2) then
        EdtBoxNum1.Text :='000'+ EdtBoxNum1.Text
    else if (Length(EdtBoxNum1.Text) =3) then
        EdtBoxNum1.Text :='00'+ EdtBoxNum1.Text
    else if (Length(EdtBoxNum1.Text) =4) then
        EdtBoxNum1.Text :='0'+ EdtBoxNum1.Text;

    if ReadIni('Auto','Print','0') ='1' then
        chkAuto.Checked :=True
    else
        chkAuto.Checked :=False;

    if (User.UserType<>'ParamConfig') and (User.UserType<>'admin') and (User.UserType<>'SuperAdmin') then
    begin
        EdtVersion.Enabled:=false;
        EdtBoxNum.Enabled:=false;
        EdtBoxNum1.Enabled:=false;
        EdtColor.Enabled:=false;
        EdtQty.Enabled:=false;
        EdtDate.Enabled:=false;
        Edtzhidan.Enabled:=false;
        EdtProNo.Enabled:=false;
        EdtParamVersion.Enabled:=false;
        EdtTac.Enabled:=false;
        EdtQty1.Enabled:=false;
        Edt_IMEISTART.Enabled:=false;
        Edt_IMEIEND.Enabled:=false;
        EdtCpName.Enabled:=false;
    end;


end;

procedure TfrmCartonBoxLlf.InserExcell(dbgrid:TStringGrid);
var
  Col, Row: LongInt;
  Cell: Variant;
  i:Integer;
  iCol,iRow:Integer;
  strt,filepath:string;
  strngrd1: TStringGrid;
  sheet:Variant;
begin
  {filepath:=LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\IMEI.xls';
  //ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt'

  try

  //strt:=ExcelWorksheet1.Cells.Item[2,1];
  Row:=ExcelWorksheet1.Cells.Rows.Count;
  for i:=2 to Row do
  begin
    strt:=ExcelWorksheet1.Cells.Item[i,1];
    if strt='' then
    begin
      Row:=i;
      Break;
    end;
  end;

  for iRow:=0 to dbgrid.RowCount do
  begin
      for Col:=0 to dbgrid.ColCount do
       begin
         strt:=dbgrid.Cells[iRow,Col];
         ExcelWorksheet1.Cells.Item[Row,Col+1]:=strt;
       end;
       Inc(Row);
  end;
  ExcelApplication1.DisplayAlerts[1] := False;
  ExcelWorkbook1.Save;
  ExcelApplication1.Quit;
  ExcelApplication1.Disconnect;
   except
     
  //ExcelWorkbook1.Close;
  ExcelApplication1.Quit;
  ExcelApplication1.Disconnect;
   end;}
end;

procedure TfrmCartonBoxLlf.ClearStringGrid(dbgrid:TStringGrid);
var
  i,j:Integer;
begin
  {for i:=0 to dbgrid.RowCount-1 do
  begin
    for j:=0 to dbgrid.ColCount-1 do
    begin
       dbgrid.Cells[i,j]:='';
    end;  
  end; } 
end;

end.


