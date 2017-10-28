unit uModuleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, ComCtrls, ToolWin, ExtCtrls, ADODB, ActnList, ImgList, GridsEh,
  DBGridEh,DBCtrls,DBGridEhImpExp,ComObj, DBActns,Uni,uGlobalVar;

type
  TfrmModuleForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    ImageList: TImageList;
    ActionList: TActionList;
    ac_Find: TAction;
    ac_Print: TAction;
    ac_Exit: TAction;
    ac_Import: TAction;
    ac_Export: TAction;
    SaveDialog1: TSaveDialog;
    DS_Module: TDataSource;
    tmr1: TTimer;
    tlb1: TToolBar;
    TB_First: TToolButton;
    TB_Prior: TToolButton;
    TB_Next: TToolButton;
    TB_Last: TToolButton;
    btn1: TToolButton;
    TB_Insert: TToolButton;
    TB_Delete: TToolButton;
    btnac_Exit: TToolButton;
    TB_Refresh: TToolButton;
    TB_Edit: TToolButton;
    btn4: TToolButton;
    TB_Export: TToolButton;
    btn5: TToolButton;
    TB_Exit: TToolButton;
    SB_Module: TStatusBar;
    DS_First: TDataSetFirst;
    DS_Prior: TDataSetPrior;
    DS_Next: TDataSetNext;
    DS_Last: TDataSetLast;
    DS_Insert: TDataSetInsert;
    DS_Delete: TDataSetDelete;
    DS_Edit: TDataSetEdit;
    DS_Post: TDataSetPost;
    DS_Cancel: TDataSetCancel;
    DS_Refresh: TDataSetRefresh;
    TB_Cancel: TToolButton;
    TB_Find: TToolButton;
    procedure FormCreate(Sender: TObject);

    procedure ac_FirstExecute(Sender: TObject);
    procedure ac_PriorExecute(Sender: TObject);
    procedure ac_NextExecute(Sender: TObject);
    procedure ac_LastExecute(Sender: TObject);

    procedure ac_InsertExecute(Sender: TObject);
    procedure ac_DeleteExecute(Sender: TObject);
    procedure ac_PostExecute(Sender: TObject);
    procedure ac_RefreshExecute(Sender: TObject);
    procedure ac_EditExecute(Sender: TObject);
    procedure ac_CancelExecute(Sender: TObject);

    procedure ac_ExportExecute(Sender: TObject);
    procedure ac_ExitExecute(Sender: TObject);

    procedure DBGridEh1DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TB_DeleteClick(Sender: TObject);


  public
    { Private declarations }
    procedure deleteOperRec;Virtual;
  public
    { Public declarations }
    procedure SetOpInfo(sInfo :string);             //设置状态栏显示
  end;

var
    frmModuleForm: TfrmModuleForm;
    
implementation
uses
    uDmMain;
{$R *.dfm}
procedure TfrmModuleForm.deleteOperRec;
begin

end;
procedure TfrmModuleForm.FormCreate(Sender: TObject);
begin
    Font.Charset :=DEFAULT_CHARSET;
    Font.Name :='Arial';
    Font.Size :=9;

    KeyPreview :=true;
    Position :=poDesktopCenter;

    PageControl1.ActivePage :=TabSheet1;
    DS_Module.DataSet.Open;

    {if (User.UserType='FacSuperAdmin') then               //or(User.UserType='SuperAdmin')
    begin
      DS_Delete.Visible:=False;
      //DS_Insert.Visible:=False;
      DS_Edit.Visible:=False;
      DS_Module.AutoEdit:=False;
      DBGridEh1.ReadOnly:=True;
      TabSheet2.Enabled:=False;
    end; }
    TB_Delete.Visible:=True;
    TB_Delete.Enabled:=True;
    DS_Delete.Enabled:=True;
end;

procedure TfrmModuleForm.ac_FirstExecute(Sender: TObject);
begin
    SetOpInfo('第一条记录');
    DS_First.Execute;
end;

procedure TfrmModuleForm.ac_PriorExecute(Sender: TObject);
begin
    SetOpInfo('上一条记录');
    DS_Prior.Execute;
end;

procedure TfrmModuleForm.ac_NextExecute(Sender: TObject);
begin
    SetOpInfo('下一条记录');
    DS_Next.Execute;
end;

procedure TfrmModuleForm.ac_LastExecute(Sender: TObject);
begin
    SetOpInfo('最后一条记录');
    DS_Last.Execute;
end;

procedure TfrmModuleForm.ac_InsertExecute(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  PageControl1.OnChange(Sender);
  SetOpInfo('新增记录');
  DS_Insert.Execute;
end;

procedure TfrmModuleForm.ac_DeleteExecute(Sender: TObject);
begin
  SetOpInfo('删除记录');
  DS_Delete.Execute;
end;

procedure TfrmModuleForm.ac_PostExecute(Sender: TObject);
begin
  SetOpInfo('保存记录');
  DS_Post.Execute;
end;

procedure TfrmModuleForm.ac_RefreshExecute(Sender: TObject);
begin
  SetOpInfo('刷新记录');
  DS_Refresh.Execute;
end;

procedure TfrmModuleForm.ac_EditExecute(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  PageControl1.OnChange(Sender);
  SetOpInfo('编辑记录');
  DS_Edit.Execute;
end;

procedure TfrmModuleForm.ac_CancelExecute(Sender: TObject);
begin
  SetOpInfo('取消编辑');
  DS_Cancel.Execute;
end;

procedure TfrmModuleForm.ac_ExportExecute(Sender: TObject);
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

procedure TfrmModuleForm.ac_ExitExecute(Sender: TObject);
begin
  if DS_Module.DataSet.Modified then
  begin
    if Application.MessageBox('数据已被修改,是否保存？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
    	DS_Module.DataSet.Post;
    end
    else
    DS_Module.DataSet.Cancel;
  end;
  Close;
end;

procedure TfrmModuleForm.DBGridEh1DblClick(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet2;
    PageControl1.OnChange(Sender);
end;

procedure TfrmModuleForm.PageControl1Change(Sender: TObject);
//var
//	i:Integer;
//  bEnable,bVisible : boolean;
begin
    {if ( User.UserType<>'FacSuperAdmin')  then       //or(User.UserType='SuperAdmin')
    begin
      if PageControl1.ActivePageIndex=1 then
      begin
          for i:=0 to ComponentCount-1 do
          begin
              if (Components[i] is TDBEdit) and ((Components[i] as TDBEdit).TabOrder=0) then
              begin
                bEnable := (Components[i] as TDBEdit).Enabled;
                bVisible := (Components[i] as TDBEdit).Visible;
                if bEnable and bVisible then 
                  //(Components[i] as TDBEdit).SetFocus; ;
              end;
          end;
      end;
    end; }
end;
{
过程功能:设置状态栏显示,表示数据状态
过程参数:sInfo->要显示的内容
}
procedure TfrmModuleForm.SetOpInfo(sInfo :string);
begin
     SB_Module.Panels[1].Text :=sInfo;
end;

procedure TfrmModuleForm.FormShow(Sender: TObject);
var
  i:Integer;
begin
    for i:=0 to ComponentCount-1 do
    begin
        if Components[i].ClassName = 'TUniQuery' then
        begin
            (Components[i] as TUniQuery).Close;
            (Components[i] as TUniQuery).Open;
        end;
    end;
end;

procedure TfrmModuleForm.TB_DeleteClick(Sender: TObject);
begin
if MessageBox(Handle,'你确定要删除吗?' ,'确认信息框',MB_OKCANCEL) = ID_OK then
 begin
   deleteOperRec;
 end
 else
 begin
   Exit;
 end;

end;


end.
