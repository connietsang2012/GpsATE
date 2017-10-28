unit uClientDataModuleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemTableDataEh, Db, GridsEh, DBGridEh, ComCtrls, ToolWin,
   ImgList, ActnList, ExtCtrls,DBCtrls,DBGridEhImpExp, ADODB,uPublicFunc,uGlobalVar;

type
  TfrmClientDataModule = class(TForm)
    ActionList: TActionList;
    ac_Insert: TAction;
    ac_Edit: TAction;
    ac_Delete: TAction;
    ac_Cancel: TAction;
    ac_Post: TAction;
    ac_First: TAction;
    ac_Prior: TAction;
    ac_Next: TAction;
    ac_Last: TAction;
    ac_Find: TAction;
    ac_Refresh: TAction;
    ac_Commit: TAction;
    ac_Print: TAction;
    ac_Exit: TAction;
    ac_Import: TAction;
    ac_Export: TAction;
    SaveDialog1: TSaveDialog;
    DS_Module: TDataSource;
    ImageList: TImageList;
    tlb1: TToolBar;
    TB_First: TToolButton;
    TB_Prior: TToolButton;
    TB_Next: TToolButton;
    TB_Last: TToolButton;
    TB_btn1: TToolButton;
    TB_Insert: TToolButton;
    TB_Delete: TToolButton;
    TB_Post: TToolButton;
    TB_Refresh: TToolButton;
    TB_Edit: TToolButton;
    TB_Cancel: TToolButton;
    TB_btn4: TToolButton;
    TB_Export: TToolButton;
    TB_btn5: TToolButton;
    TB_Find: TToolButton;
    TB_Exit: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    SB_Module: TStatusBar;
    ADS_Module: TADODataSet;

    procedure FormCreate(Sender: TObject);
    procedure ac_InsertExecute(Sender: TObject);
    procedure ac_DeleteExecute(Sender: TObject);
    procedure ac_CancelExecute(Sender: TObject);
    procedure ac_PostExecute(Sender: TObject);
    procedure ac_FirstExecute(Sender: TObject);
    procedure ac_PriorExecute(Sender: TObject);
    procedure ac_NextExecute(Sender: TObject);
    procedure ac_LastExecute(Sender: TObject);
    procedure ac_RefreshExecute(Sender: TObject);
    procedure ac_ExitExecute(Sender: TObject);
    procedure ac_ExportExecute(Sender: TObject);
    procedure DS_ModuleStateChange(Sender: TObject);
    procedure MTE_ModuleAfterOpen(DataSet: TDataSet);
    procedure MTE_ModuleCalcFields(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ADS_ModuleAfterEdit(DataSet: TDataSet);
    procedure ADS_ModuleBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ac_EditExecute(Sender: TObject);
  private
    { Private declarations }
    procedure DoFirst(CDS :TDataSet);            //第一操作
    procedure DoPrior(CDS :TDataSet);            //前一操作
    procedure DoNext(CDS :TDataSet);             //后一操作
    procedure DoLast(CDS :TDataSet);             //最后操作

    procedure DoInsert();                        //新增操作
    procedure DoDeleteRecord(CDS :TDataSet);     //删除操作
    procedure DoPost(CDS :TDataSet);             //保存操作
    procedure DoRefresh(CDS :TDataSet);overload;  //刷新操作
    procedure DoCancel(CDS :TDataSet);           //取消操作
  public
    { Public declarations }
    procedure SetRecordPointButton(bFirst,bPrior,bNext,bLast:Boolean);              //设置记录按钮有效性
    procedure SetOperateButton(bAdd,bDel,bSave,bReflish,bImport,bExport:Boolean);   //设置操作按钮有效性
    procedure SetOpInfo(sInfo :string);             //设置状态栏显示

    procedure MsgClientModify(var msg:TMessage);message WM_ClientModify;
  end;

var
    frmClientDataModule: TfrmClientDataModule;
    bDataChanged:boolean;           //数据集是否被修改
    bPostSuccess:boolean;           //数据提交是否成功
    nCurrentRecordNo:integer;       //记录当前行的行号
    bIsAddOperation:boolean;        //是否执行了新增操作
    bMoveUpOperation:Boolean;
    bMoveDownOperation:Boolean;

    PrimaryKey : String;
    PrimaryKeyType : String;
    PrimaryCondition : String;
    TableName:string;

implementation

{$R *.dfm}
{
过程功能:设置状态栏显示,表示数据状态
过程参数:sInfo->要显示的内容
}
procedure TfrmClientDataModule.SetOpInfo(sInfo :string);
begin
     SB_Module.Panels[1].Text :=sInfo;
end;
{
过程功能:设置记录按钮有效性
过程参数:bFirst->第一按钮的有效性
         bPrior->前一按钮的有效性
         bNext->后一按钮的有效性
         bLast->最后按钮的有效性
}
PROCEDURE TfrmClientDataModule.SetRecordPointButton(bFirst,bPrior,bNext,bLast:Boolean);
BEGIN
   TB_First.Enabled:=bFirst;
   TB_Prior.Enabled:=bPrior;
   TB_Next.Enabled:=bNext;
   TB_Last.Enabled:=bLast;
END;
{
过程功能:设置操作按钮有效性
过程参数:bAdd->新增按钮的有效性
         bDel->删除按钮的有效性
         bSave->保存按钮的有效性
         bReflish->刷新按钮的有效性
         bImport->导入按钮的有效性
         bExport->导出按钮的有效性
}
procedure TfrmClientDataModule.SetOperateButton(bAdd,bDel,bSave,bReflish,bImport,bExport:Boolean);
BEGIN
   TB_Insert.Enabled:=bAdd;
   TB_Delete.Enabled:=bDel;
   TB_Post.Enabled:=bSave;
   TB_Refresh.Enabled:=bReflish;
   //TB_Import.Enabled:=bImport;
   TB_Export.Enabled:=bExport;
END;
{
过程功能:第一操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoFirst(CDS :TDataSet);
begin
   CDS.First;
   SetRecordPointButton(false,false,true,true);
end;
{
过程功能:前一操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoPrior(CDS :TDataSet);
begin
   if CDS.Bof then
      SetRecordPointButton(false,false,true,true)
   else
   begin
      CDS.Prior;
      SetRecordPointButton(true,true,true,true)
   end;
end;
{
过程功能:后一操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoNext(CDS :TDataSet);
begin
  if CDS.Eof then
    SetRecordPointButton(true,true,false,false)
  else
  begin
     CDS.Next;
     SetRecordPointButton(true,true,true,true);
  end;
end;
{
过程功能:最后操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoLast(CDS :TDataSet);
begin
   CDS.Last;
   SetRecordPointButton(true,true,false,false);
end;
{
过程功能:删除操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoDeleterecord(CDS :TDataSet);
begin
   if Application.MessageBox('是否要删除记录？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
   begin
     CDS.CheckBrowseMode;
     CDS.Edit;
     CDS.delete;
     SetOpInfo('删除记录');
     //CDS.ApplyUpdates(-1);
   end
     else exit;
end;
{
过程功能:保存操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoPost(CDS :TDataSet);
var
    nReNo:integer;
begin
    CDS.CheckBrowseMode;
    //nReNo := CDS.RecNo;
    //CDS.Post;
    {if CDS.ApplyUpdates(-1)=0 then
    begin
        SetOpInfo('保存成功');
    end
    else
    begin
        SetOpInfo('保存失败');
    end;
    CDS.Refresh; }
    //CDS.RecNo := nReNo;

    bIsAddOperation:=false;
end;
procedure TfrmClientDataModule.DoInsert();
var
    CommIndex:Integer;
    strSendSrvText:string;
begin
    {CommIndex:=0;
    strSendSrvText:=Format('Action=InsertTable#TABLE=%s#',[TableName]);
    SendToServer(CommIndex,'InsertTable',strSendSrvText);
    Application.ProcessMessages;}
end;
{
过程功能:刷新操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoRefresh(CDS :TDataSet);
var
    CommIndex:Integer;
    strSendSrvText:string;
begin
    CommIndex:=0;
    strSendSrvText:=Format('Action=SelectTable#TABLE=%s#Tester=%s#',[TableName,User.UserName]);
    SendToServer(CommIndex,'SelectTable',strSendSrvText);
    Application.ProcessMessages;
end;
{
过程功能:取消操作
过程参数:CDS->要操作的表格
}
procedure TfrmClientDataModule.DoCancel(CDS :TDataSet);
begin
  //CDS.CheckBrowseMode;
  if Application.MessageBox('确实要取消当前所有操作吗?','取消提示',MB_OKCANCEL+MB_ICONWARNING)=mrOK then
          DoRefresh(ADS_Module);
end;
procedure TfrmClientDataModule.FormCreate(Sender: TObject);
var
    i:Integer;
begin
    for i:=0 to ComponentCount-1 do
    begin
        if Components[i].ClassName = 'TDBLookupComboBox' then
        begin
            (Components[i] as TDBLookupComboBox).DropDownRows := 10;
        end;
    end;

    Font.Charset :=DEFAULT_CHARSET;
    Font.Name :='Arial';
    Font.Size :=9;

    KeyPreview :=true;
    Position :=poDesktopCenter;

    PageControl1.ActivePage :=TabSheet1 ;
    bDataChanged:=false;
    bPostSuccess:=false;
    nCurrentRecordNo:=0;
    bIsAddOperation:=false;
end;

procedure TfrmClientDataModule.ac_InsertExecute(Sender: TObject);
begin
    ADS_Module.CheckBrowseMode;
    SetOpInfo('插入记录');
    PageControl1.ActivePage := TabSheet2;
    nCurrentRecordNo:=ADS_Module.RecNo; //记录新增前的一行序号
    bIsAddOperation:=true;
    ADS_Module.Append;

    DBGridEh1.Enabled:=false;
    SetRecordPointButton(false,false,false,false);
    SetOperateButton(False,False,true,true,false,False);
end;

procedure TfrmClientDataModule.ac_DeleteExecute(Sender: TObject);
var
    QueryStr ,strSendSrvText:String;
    CommIndex:Integer;
begin
    CommIndex:=0;
    QueryStr:=Format('Delete From %s where %s=%d',[TableName,PrimaryKey,ADS_Module.FieldByName(PrimaryKey).AsInteger]);
    strSendSrvText:=Format('Action=ClientDelete#TABLE=%s#Content=%s#Tester=%s#',[TableName,QueryStr,User.UserName]);
    SendToServer(CommIndex,'ClientDelete',strSendSrvText);
    
    //ADS_Module.RecNo := nCurrentRecordNo;
    bDataChanged:=false;
    bPostSuccess:=true;
end;

procedure TfrmClientDataModule.ac_CancelExecute(Sender: TObject);
begin
    DoCancel(ADS_Module);
    SetOpInfo('放弃保存');
end;

procedure TfrmClientDataModule.ac_PostExecute(Sender: TObject);
var
    nReNo:Integer;
begin
    try
        //nReNo := ADS_Module.RecNo;
        DoPost(ADS_Module);
        Sleep(1);
        DoRefresh(ADS_Module);
        //ADS_Module.RecNo := nCurrentRecordNo;

        //nCurrentRecordNo:=ADS_Module.RecNo;//更新记录序号

        SetOpInfo('保存记录');
        if PageControl1.Pages[0].TabVisible =true then    //第一页是可视时,才激活
            PageControl1.ActivePage := TabSheet1;
        DBGridEh1.Enabled:=true;
        SetOperateButton(true,true,true,true,true,true);
        SetRecordPointButton(true,true,true,true);
        bPostSuccess:=true;
        bDataChanged:=false;
    except
        Application.MessageBox('新增数据存在重复值','警告',MB_ICONWARNING);
        SetOperateButton(true,true,true,true,true,true);
        SetRecordPointButton(true,true,true,true);
        ADS_Module.Cancel;
        ADS_Module.CancelUpdates;
    end;
end;

procedure TfrmClientDataModule.ac_FirstExecute(Sender: TObject);
begin
    DoFirst(ADS_Module);
    SetOpInfo('第一条记录');
end;

procedure TfrmClientDataModule.ac_PriorExecute(Sender: TObject);
begin
    DoPrior(ADS_Module);
    SetOpInfo('上一条记录');
end;

procedure TfrmClientDataModule.ac_NextExecute(Sender: TObject);
begin
    DoNext(ADS_Module);
    SetOpInfo('下一条记录');
end;

procedure TfrmClientDataModule.ac_LastExecute(Sender: TObject);
begin
    DoLast(ADS_Module);
    SetOpInfo('最后一条记录');
end;


procedure TfrmClientDataModule.ac_RefreshExecute(Sender: TObject);
begin
    DoRefresh(DS_Module.DataSet);

    SetOpInfo('刷新记录');

    DBGridEh1.Enabled:=true;
    SetOperateButton(true,true,true,true,true,true);
    SetRecordPointButton(true,true,true,true);

    bDataChanged:=false;
    bPostSuccess:=true; //true表示提交成功,此处默认"取消"也为提交成功
end;

procedure TfrmClientDataModule.ac_ExitExecute(Sender: TObject);
begin
    if bDataChanged then
    begin
        if Application.MessageBox('数据已被修改,是否保存？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
        begin
            //acPostExecute(self.tb_save);
            if not bPostSuccess then
                exit;
        end;
    end;

    bDataChanged:=false;
    bPostSuccess:=true; //true表示提交成功,此处默认"退出"也为提交成功
    //acRefreshExecute();
    Close;
end;

procedure TfrmClientDataModule.ac_ExportExecute(Sender: TObject);
var
    ExpClass:TDBGridEhExportClass;
    Ext:String;
begin
    SaveDialog1.FileName := 'File1';
    if SaveDialog1.Execute then
    begin
        Case SaveDialog1.FilterIndex of
            1:
            begin
                ExpClass := TDBGridEhExportAsText;
                Ext := 'txt';
            end;
            2:
            begin
                ExpClass := TDBGridEhExportAsCSV;
                Ext := 'csv';
            end;
            3:
            begin
                ExpClass := TDBGridEhExportAsHTML;
                Ext := 'htm';
            end;
            4:
            begin
                ExpClass := TDBGridEhExportAsRTF;
                Ext := 'rtf';
            end;
            5:
            begin
                ExpClass := TDBGridEhExportAsXLS;
                Ext := 'xls';
            end;
        else
            begin
                ExpClass := nil;
                Ext := '';
            end;
        end;

        if ExpClass <> nil then
        begin
            if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <> UpperCase(Ext) then//判断文件数型
            begin
                SaveDialog1.FileName := SaveDialog1.FileName + '.' + Ext;
            end;
            SaveDBGridEhToExportFile(ExpClass,DBGridEh1,SaveDialog1.FileName,true);
        end;
      end;
end;

procedure TfrmClientDataModule.DS_ModuleStateChange(Sender: TObject);
begin
    if DS_Module.State in [dsedit,dsinsert] then
    begin
        bDataChanged:=True;
        bPostSuccess:=False;
    end;
end;

procedure TfrmClientDataModule.MTE_ModuleAfterOpen(DataSet: TDataSet);
begin
    //MTE_Module.Last;
    //MTE_Module.First;
end;

procedure TfrmClientDataModule.MTE_ModuleCalcFields(DataSet: TDataSet);
begin
    DataSet.FieldByName('Index').AsInteger := DataSet.RecNo;
end;

procedure TfrmClientDataModule.DBGridEh1DblClick(Sender: TObject);
begin
    TB_Edit.Click;
end;

procedure TfrmClientDataModule.PageControl1Change(Sender: TObject);
var
    i:Integer;
begin
    if PageControl1.ActivePageIndex=1 then
    begin
        for i:=0 to ComponentCount-1 do
        begin
            if (Components[i] is TDBEdit) and ((Components[i] as TDBEdit).TabOrder=0) then
                (Components[i] as TDBEdit).SetFocus;
        end;
    end;
end;
procedure TfrmClientDataModule.ADS_ModuleAfterEdit(DataSet: TDataSet);
begin
    with DataSet do
    begin
        if PrimaryKeyType = 'String' then
            PrimaryCondition := PrimaryKey + ' = '''+FieldByName(PrimaryKey).AsString+''''
        else
            PrimaryCondition := PrimaryKey + ' = '+FieldByName(PrimaryKey).AsString;
    end;


  //FDatasetState := dsEdit;
end;

procedure TfrmClientDataModule.ADS_ModuleBeforePost(DataSet: TDataSet);
var
    I,CommIndex:Integer;
    QueryStr, QueryFields, QueryValue, QueryPrimary : String;
    strSendSrvText:String;
begin
    CommIndex:=0;
    case DataSet.State of
        dsEdit:
        begin
            with DataSet do
            begin
                for I := 0 to FieldCount -1  do
                begin
                    if Trim(PrimaryKey)<>Trim(Fields[i].FieldName) then
                    begin
                        QueryFields:=QueryFields + Fields[i].FieldName + ' = ';

                        if Ord(FieldDefs[i].DataType) in [1,10,11,16,18,24] then
                        begin
                            QueryFields:=QueryFields + '''' + Fields[i].AsString+''',';
                        end
                        else
                        begin
                            if Ord(FieldDefs[i].DataType)=9 then
                            begin
                                if Trim(Fields[i].AsString)<>'' then
                                begin
                                    QueryFields:=QueryFields+''''+FormatDateTime('yyyy-mm-dd',StrToDate(Fields[i].AsString))+''',';
                                end
                                else
                                begin
                                    QueryFields:=QueryFields+'NULL,';
                                end;
                            end
                            else
                            begin
                                QueryFields:=QueryFields+Fields[i].AsString+',';    
                            end;
                        end;
                    end
                    else
                    begin
                        QueryPrimary:=QueryPrimary+Fields[i].FieldName+'=';

                        if Ord(FieldDefs[i].DataType) in [1,9,10,11,16,18,24] then
                        begin
                            QueryPrimary:=QueryPrimary+''''+Fields[i].AsString+''' ';
                        end
                        else
                        begin
                            QueryPrimary:=QueryPrimary+Fields[i].AsString+' ';
                        end;
                    end;
                end;

                System.Delete(QueryFields,Length(QueryFields)-1,2);
                QueryFields:=QueryFields+'''';
                QueryStr := 'Update ' +TableName+' Set '+ QueryFields + 'Where '+ QueryPrimary;

                strSendSrvText:=Format('Action=ClientUpdate#TABLE=%s#Content=%s#Tester=%s#',[TableName,QueryStr,User.UserName]);
                SendToServer(CommIndex,'ClientUpdate',strSendSrvText);

            end;

        end;
        dsInsert:
        begin
            with DataSet do
            begin
                for I := 0 to FieldCount -1  do
                begin
                    if Trim(PrimaryKey) <> Trim(Fields[i].FieldName) then
                    begin
                        QueryFields:=QueryFields + Fields[i].FieldName + ', ';

                        if Ord(FieldDefs[i].DataType) in [1,10,11,16,18,24] then
                        begin
                            QueryValue:=QueryValue+''''+Fields[i].AsString+''',';
                        end
                        else
                        begin
                            if Ord(FieldDefs[i].DataType)=9 then
                            begin
                                if Trim(Fields[i].AsString)<>'' then
                                begin
                                    QueryValue:=QueryValue + '''' +FormatDateTime('yyyy-mm-dd',StrToDate(Fields[i].AsString))+''',';
                                end
                                else
                                begin
                                    QueryValue:=QueryValue+'NULL,';
                                end;
                            end
                            else
                            begin
                                QueryValue:=QueryValue+Fields[i].AsString+', ';
                            end;
                        end;
                    end;
                end;
            end;
            System.Delete(QueryFields,Length(QueryFields)-1,1);
            System.Delete(QueryValue,Length(QueryValue)-1,2);
            QueryValue:=QueryValue+'''';
            QueryStr:='Insert Into ' + TableName + '('+QueryFields+') Values ('+ QueryValue+')';

            strSendSrvText:=Format('Action=ClientInsert#TABLE=%s#Content=%s#Tester=%s#',[TableName,QueryStr,User.UserName]);
            SendToServer(CommIndex,'ClientInsert',strSendSrvText);

        end;
    end;
end;

procedure TfrmClientDataModule.MsgClientModify(var msg:TMessage);
begin
    DoRefresh(ADS_Module);
end;

procedure TfrmClientDataModule.FormShow(Sender: TObject);
begin
    TB_Refresh.Click;
end;

procedure TfrmClientDataModule.ac_EditExecute(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet2;
    PageControl1.OnChange(Sender);
end;

end.
