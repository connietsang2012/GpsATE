unit uReadBack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ComDrv32, SPComm, ExtCtrls, StdCtrls, ComCtrls,
  Grids, DBGrids,IniFiles,ShellAPI,TlHelp32, uGlobalVar;

type
  TfrmReadBack = class(TfrmModule)
    pnl1: TPanel;
    grp1: TGroupBox;
    pnl3: TPanel;
    pnl2: TPanel;
    pnl4: TPanel;
    lbl7: TLabel;
    imgCommGreen: TImage;
    imgCommRed: TImage;
    cbbCom_1: TComboBox;
    btnStart_1: TButton;
    btnReTest1: TButton;
    btnBtn_ResultEnable: TButton;
    chkAutoTestCom: TCheckBox;
    pnlTestResult_1: TPanel;
    dbgrdTestResultDetail_1: TDBGrid;
    pnlTestResult1: TPanel;
    statSB_TestStatus_1: TStatusBar;
    grp2: TGroupBox;
    pnlResult1: TPanel;
    pnlResult2: TPanel;
    pnlResult3: TPanel;
    lbl4: TLabel;
    img1: TImage;
    img2: TImage;
    cbbCom_2: TComboBox;
    btnStart_2: TButton;
    btnReTest2: TButton;
    chkAutoTestCom1: TCheckBox;
    pnlTestResult_2: TPanel;
    dbgrdTestResultDetail_2: TDBGrid;
    pnlTestResult2: TPanel;
    statSB_TestStatus_2: TStatusBar;
    grp3: TGroupBox;
    pnlResult4: TPanel;
    pnlResult5: TPanel;
    pnlTestResult_3: TPanel;
    dbgrdTestResultDetail_3: TDBGrid;
    pnlResult6: TPanel;
    lbl2: TLabel;
    img3: TImage;
    img4: TImage;
    cbbCom_3: TComboBox;
    btnStart_3: TButton;
    btnReTest3: TButton;
    chkAutoTestCom2: TCheckBox;
    pnlTestResult3: TPanel;
    statSB_TestStatus_3: TStatusBar;
    grp4: TGroupBox;
    pnlResult9: TPanel;
    pnlResult10: TPanel;
    pnlResult11: TPanel;
    lbl3: TLabel;
    img5: TImage;
    img6: TImage;
    cbbCom_4: TComboBox;
    btnStart_4: TButton;
    btnReTest4: TButton;
    chkAutoTestCom3: TCheckBox;
    cbbComAgilent_5: TComboBox;
    pnlTestResult_4: TPanel;
    dbgrdTestResultDetail_4: TDBGrid;
    pnlTestResult4: TPanel;
    statSB_TestStatus_4: TStatusBar;
    pnl5: TPanel;
    btn_changeloadfile: TButton;
    dlgOpen1: TOpenDialog;
    edt_ChangeRomFile: TEdit;
    dlgOpen2: TOpenDialog;
    dlgOpen3: TOpenDialog;
    dlgOpen4: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btn_changeloadfileClick(Sender: TObject);
    procedure btnStart_1Click(Sender: TObject);
    procedure MsgLoadFlashTool(var msg:TMessage);message WM_LoadFlashTool;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartLoad(CommIndex:Integer);
    procedure SetResult(CommIndex:Integer);
    procedure AutoTest(CommIndex:Integer);
     function GetHWndByPID(const hPID: THandle): THandle;

   end;

var
  frmReadBack: TfrmReadBack;

  ParamFilename:string;
  MyIniFile:Tinifile;
  hThrd:Cardinal;
  function openFlash_tool():Boolean;

implementation

uses uDmMain,uPublicFunc, uClientMain;

{$R *.dfm}


function TfrmReadBack.GetHWndByPID(const hPID: THandle): THandle;
type  
    PEnumInfo = ^TEnumInfo;  
    TEnumInfo = record  
    ProcessID: DWORD;  
    HWND: THandle;  
    end;  
  
    function EnumWindowsProc(Wnd: DWORD; var EI: TEnumInfo): Bool; stdcall;  
    var  
    PID: DWORD;  
    begin  
    GetWindowThreadProcessID(Wnd, @PID);  
    Result := (PID <> EI.ProcessID) or  
        (not IsWindowVisible(WND)) or  
        (not IsWindowEnabled(WND));  
  
    if not Result then EI.HWND := WND;   
    end;  
  
    function FindMainWindow(PID: DWORD): DWORD;  
    var  
    EI: TEnumInfo;  
    begin  
    EI.ProcessID := PID;  
    EI.HWND := 0;  
    EnumWindows(@EnumWindowsProc, Integer(@EI));  
    Result := EI.HWND;  
    end;
begin  
    if hPID<>0 then  
    Result:=FindMainWindow(hPID)  
    else  
    Result:=0;  
end;


procedure TfrmReadBack.SetResult(CommIndex:Integer);
begin

end;

function openFlash_tool():Boolean;
var
fileName,strERROR:string;
PreHinstance:Cardinal;
begin
    Result:=True;
    PreHinstance:=HInstance;
    Filename:=ExtractFilePath(Paramstr(0))+'FlashTool_v5\Flash_tool.exe';
    HInstance:=ShellExecute(Application.Handle,'Open',PChar(Filename),nil,nil,SW_SHOWNORMAL);
    strERROR:=IntToStr(HInstance);

    if HInstance < 32 then
    begin
      HInstance:=PreHinstance;
      Result:=False;
      MessageBox(frmReadBack.Handle,PChar(strERROR),'错误序号',MB_OKCANCEL);
    end;
    HInstance:=PreHinstance;

end;


procedure TfrmReadBack.AutoTest(CommIndex:Integer);
var
  ProcessName : string; //进程名  
  FSnapshotHandle:THandle; //进程快照句柄
  FProcessEntry32:TProcessEntry32; //进程入口的结构体信息
  ContinueLoop:BOOL;
  MyHwnd:THandle;
begin
  //hThrd:=BeginThread(nil, 0, @openFlash_tool, nil, 0,Tid);
  //WaitForSingleObject(hThrd, INFINITE);
  //CloseHandle(thread1);
  openFlash_tool;
  sleep(1000);
  FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0); //创建一个进程快照
  FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
  ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32); //得到系统中第一个进程  
  //循环例举
  while ContinueLoop  do
  begin
    ProcessName := FProcessEntry32.szExeFile;

    if(ProcessName = 'Flash_tool.exe') then begin
      MyHwnd := GetHWndByPID(FProcessEntry32.th32ProcessID);
    end;
    ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);   //   释放快照句柄

  PostMessage(MyHwnd, WM_KEYFIRST,VK_F10 , 0);
end;

procedure TfrmReadBack.StartLoad(CommIndex:Integer);
var
    strComPort:string;
begin
    Application.ProcessMessages;
    if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接' then
    begin
        strComPort:=TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text;
        if strComPort='' then
        begin
            MessageDlg('请选择串口!',mtInformation,mbOKCancel,0);
            Exit;
        end;
        strComPort:=stringreplace(strComPort,'COM','',[rfReplaceAll]);
         //要保存参数的文件
        ParamFilename:=ExtractFilePath(Paramstr(0))+'FlashTool_v5\Flash_tool.INI';
        MyIniFile:=Tinifile.Create(ParamFilename);

        with MyIniFile do
        begin
            writestring('FORM', 'com', strComPort);
        end;
        MyIniFile.Free;
        TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
        TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='断开';
        AutoTest(CommIndex);
    end
    else if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
    begin
        TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=True;
        TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='连接';
    end;
end;

procedure TfrmReadBack.FormCreate(Sender: TObject);
var
    iCommIndex,Count:Integer;
    CommList: TStrings;
    strTemp:string;
begin
    for iCommindex := 1 to CommCount-1 do
    begin
        CommList:= TStringList.Create;
        if GetSysComm(CommList) then
        begin
            for Count:= 0 to CommList.Count-1 do
            begin
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
            end;
        end;
        CommList.free;
    end;

end;

procedure TfrmReadBack.btn_changeloadfileClick(Sender: TObject);
var
  LoadFile:string;
begin
  inherited;
   //从文件读取参数 (TCP/基本设置/GPS设置),并将其显示各控件上。
    ParamFilename:=ExtractFilePath(Paramstr(0))+'FlashTool_v5\Flash_tool.INI';
    MyIniFile:=Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        LoadFile:=ReadString('DL_HISTORY_0', 'scatter_file','');
    end;
    MyIniFile.Free;

    if LoadFile='' then
    begin
        MessageDlg('请选择下载文件!',mtInformation,mbOKCancel,0);
        Exit;
    end;
    openFlash_tool;
end;

procedure TfrmReadBack.btnStart_1Click(Sender: TObject);
begin
  inherited;
  StartLoad(1);
end;

procedure TfrmReadBack.MsgLoadFlashTool(var msg:TMessage);
begin
   if msg.Msg= WM_LoadFlashTool then
  begin
    openFlash_tool();
  end;
end;

end.
