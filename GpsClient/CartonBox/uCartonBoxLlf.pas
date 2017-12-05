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
    ///���stringgrid
    ClearStringGrid(StringGrid1);
    if (mmoMEI.Lines.Count =0) then
    begin
        ShowMessage('��ǰ����Ϊ��,���ܽ��д�ӡ');
        Exit;
    end;
    if (trim(EdtVersion.Text) ='') then
    begin
        ShowMessage('�汾��Ϣ����Ϊ��');
        Exit;
    end;
    {if (Trim(EdtVersion1.Text)<>paramVersion) and (paramVersion<>'') then//���ݲ�������λ�Ļ���
    begin
        ShowMessage('���ذ汾���뵥�����ð汾��һ�£�');
        Exit;
    end;}
    strBar :='';
    strver :='';
    strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\llf\'+IntToStr(mmoMEI.Lines.Count)+'.btw';
    AppendTxt(strFile,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
    if chkAuto.Checked then
    begin
      with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
      begin
          SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
          SetNamedSubStringValue('ZhiDan','�Ƶ�:'+trim(Edtzhidan.Text));
          SetNamedSubStringValue('MachineType',trim(EdtVersion.Text));
          SetNamedSubStringValue('ProductColor','��ɫ:'+trim(EdtColor.Text));
          SetNamedSubStringValue('ProductDate','����:'+trim(EdtDate.Text));
          SetNamedSubStringValue('ProductCount','����:'+trim(EdtQty1.Text));
          SetNamedSubStringValue('ProductWeight','ë��'+(EdtQty.Text));
          SetNamedSubStringValue('ProductNum','��Ʒ����:'+trim(EdtProNo.Text));
          SetNamedSubStringValue('Remark',trim(EdtParamVersion.Text));

          //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
          strver:=SysUtils.Format('���:%s%s'+#13#10+'�Ƶ�:%s'+#13#10+'��ɫ:%s'+#13#10+'����:%s'+#13#10+'����:%s'+#13#10+'ë��%s'+#13#10+'��Ʒ����:%s'+#13#10+'����:%s'+#13#10+'',
                      [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtVersion.Text]);
          AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');

          for i:=0 to (mmoMEI.Lines.Count-1) do
          begin
              strver:=strver+StrList.Strings[i]+''+#13#10+'';
              strBar  :='IMEI' +IntToStr(i);
              SetNamedSubStringValue(strBar,StrList.Strings[i]); //����ֵ
              AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'\PrintLog\log.txt');
              //AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');

              //�õ�����ID
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
          SetNamedSubStringValue('QRCode',strver); //����ֵ
          try
              PrintOut(False, False);
              //InserExcell(StringGrid1);
              Close(btDoNotSaveChanges); //�رղ�����
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
              Close(btDoNotSaveChanges); //�رղ�����
          end;
        end;
    end
    else
    begin
    //strver:=SysUtils.Format('���:%s%s'+#13#10+'�Ƶ�:%s'+#13#10+'��ɫ:%s'+#13#10+'����:%s'+#13#10+'����:%s'+#13#10+'ë��%s'+#13#10+'��Ʒ����:%s'+#13#10+'����:%s'+#13#10+'',
    //                  [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtVersion.Text]);

      with btappBtnPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
      begin
          {SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
          SetNamedSubStringValue('ZhiDan','����:'+trim(Edtzhidan.Text));
          SetNamedSubStringValue('MachineType',trim(EdtVersion.Text));
          SetNamedSubStringValue('ProductColor','��ɫ:'+trim(EdtColor.Text));
          SetNamedSubStringValue('ProductDate','����:'+trim(EdtDate.Text));
          SetNamedSubStringValue('ProductCount','����'+trim(EdtQty1.Text));
          SetNamedSubStringValue('ProductWeight','ë��'+(EdtQty.Text));
          SetNamedSubStringValue('ProductNum','��Ʒ����:'+trim(EdtProNo.Text));
          SetNamedSubStringValue('Remark',trim(EdtParamVersion.Text));

          //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
          strver:=SysUtils.Format('���:%s%s  �Ƶ�:%s  ����:%s  ��ɫ:%s    ����:%s  ����:%s  ë��%sKG  Product Code:%s  Version:%s',
                      [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtVersion.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtParamVersion.Text]);
          AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt'); }

          SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
          SetNamedSubStringValue('ZhiDan','�Ƶ�:'+trim(Edtzhidan.Text));
          SetNamedSubStringValue('MachineType',trim(EdtVersion.Text));
          SetNamedSubStringValue('ProductColor','��ɫ:'+trim(EdtColor.Text));
          SetNamedSubStringValue('ProductDate','����:'+trim(EdtDate.Text));
          SetNamedSubStringValue('ProductCount','����:'+trim(EdtQty1.Text));
          SetNamedSubStringValue('ProductWeight','ë��'+trim(EdtQty.Text));
          SetNamedSubStringValue('ProductNum','��Ʒ����:'+trim(EdtProNo.Text));
          SetNamedSubStringValue('Remark',trim(EdtParamVersion.Text));

          //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
          strver:=SysUtils.Format('���:%s%s'+#13#10+'�Ƶ�:%s'+#13#10+'��ɫ:%s'+#13#10+'����:%s'+#13#10+'����:%s'+#13#10+'ë��%s'+#13#10+'��Ʒ����:%s'+#13#10+'����:%s'+#13#10+'',
                      [EdtBoxNum.Text,EdtBoxNum1.Text,Edtzhidan.Text,EdtColor.Text,EdtDate.Text,EdtQty1.Text,EdtQty.Text,EdtProNo.Text,EdtVersion.Text]);
          AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');


          for i:=0 to (mmoMEI.Lines.Count-1) do
          begin
              strver:=strver+StrList.Strings[i]+''+#13#10+'';
              strBar  :='IMEI' +IntToStr(i);
              SetNamedSubStringValue(strBar,StrList.Strings[i]); //����ֵ
              AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'\PrintLog\log.txt');
              //AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');

              //�õ�����ID
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
          SetNamedSubStringValue('QRCode',strver); //����ֵ
          try

              PrintOut(False, true); //��ӡ
              Close(btDoNotSaveChanges); //�رղ�����
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
              Close(btDoNotSaveChanges); //�رղ�����
          end;
        end;
    end;
end;

procedure TfrmCartonBoxLlf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    WriteIni('llf','Model',trim(EdtVersion.Text));    //����
    WriteIni('llf','Color',trim(EdtColor.Text));      //��ɫ
    WriteIni('llf','BoxNum',trim(EdtBoxNum.Text));    //���
    WriteIni('llf','BoxNum1',trim(EdtBoxNum1.Text));  //��ŷ�֧
    WriteIni('llf','Qty',(EdtQty.Text));          //����
    WriteIni('llf','ZhiDan',trim(Edtzhidan.Text));    //�Ƶ�
    WriteIni('llf','Date',trim(EdtDate.Text));        //����
    WriteIni('llf','ProNo',trim(EdtProNo.Text));      //��Ʒ��
    WriteIni('llf','Version',trim(EdtParamVersion.Text)); //�汾��
    WriteIni('llf','Tac',trim(EdtTac.Text));          //Tac��Ϣ
    WriteIni('llf','Qty1',trim(EdtQty1.Text));        //����
    WriteIni('llf','CpName',trim(EdtCpName.Text));    //��˾����

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


