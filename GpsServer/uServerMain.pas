unit uServerMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,  cxClasses,  ExtCtrls,
   ToolWin, WinSkinData, WinSkinStore, Menus, ImgList, ActnList,
  dxNavBarCollns, dxNavBarBase, dxNavBar,uModuleForm, StdCtrls, Buttons,
  Mask, ScktComp,WinSock,IniFiles, DB, ADODB,StrUtils,uGlobalVar;

type
  TfrmServerMain = class(TForm)
    SkinData_Main: TSkinData;
    SkinStore_Main: TSkinStore;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    TMI_UserType: TMenuItem;
    TMI_User: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    ImageList: TImageList;
    ActionList: TActionList;
    ac_exit: TAction;
    ac_UserType: TAction;
    ac_User: TAction;
    ac_TestWrong: TAction;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn3: TToolButton;
    dxNavBar1: TdxNavBar;
    dxNavBar_Base: TdxNavBarGroup;
    dxNbarLockSetNavBar_UserType: TdxNavBarItem;
    dxNbarLockSetNavBar_User: TdxNavBarItem;
    dxNbarLockSetBar_TestWrong: TdxNavBarItem;
    TcpServer: TServerSocket;
    spGetUserInformation: TADOStoredProc;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    imgTCPRed: TImage;
    imgTCPGreen: TImage;
    edtTCPPort: TMaskEdit;
    btnStartTcp: TBitBtn;
    btnStopTcp: TBitBtn;
    chkTCPAuto: TCheckBox;
    PageControlpgc1: TPageControl;
    TabSheet1: TTabSheet;
    ac_TestPlan: TAction;
    dxNbarLockSetNavBar_TestPlan: TdxNavBarItem;
    ac_Set: TAction;
    dxNbarLockSetNavBar_Set: TdxNavBarItem;
    dxNavBar_TestPlan: TdxNavBarGroup;
    spCheckTested: TADOStoredProc;
    spCheckTestpass: TADOStoredProc;
    spDeleteImei: TADOStoredProc;
    spDeleteTestResult_ByRid: TADOStoredProc;
    dxNbarLockSetNavBar_SubTestItem: TdxNavBarItem;
    ac_SubTestItem: TAction;
    ac_TestPlanSet: TAction;
    dxNbarLockSetNavBar_TestPlanSet: TdxNavBarItem;
    spUpdateForm: TADOStoredProc;
    spDeleteTestResult_ByImei: TADOStoredProc;
    spTwiceByUpdateVersion: TADOStoredProc;
    spCheckMustTest: TADOStoredProc;
    spCheckImei: TADOStoredProc;
    spUpdateGpsTcData: TADOStoredProc;
    spGetTempRid: TADOStoredProc;
    spGetTempImei: TADOStoredProc;
    dxNavBar_AutoTest: TdxNavBarGroup;
    dxnvbrtmAutoTestParam: TdxNavBarItem;
    ac_AutoTestParam: TAction;
    dxnvbrtmAutoTestModel: TdxNavBarItem;
    ac_AutoTestModel: TAction;
    dxnvbrtmAutoTestItemPlan: TdxNavBarItem;
    ac_AutoTestItemPlan: TAction;
    dxnvbrtmTestParameter: TdxNavBarItem;
    ac_TestParameter: TAction;
    dxnvbrtmVersionModel: TdxNavBarItem;
    ac_VersionModel: TAction;
    dxNbarGpsTcData: TdxNavBarItem;
    ac_GpsTcData: TAction;
    spModelTestParamCopy: TADOStoredProc;
    dxNavBarParamDownload: TdxNavBarGroup;
    dxnvbrtmParamDownloadParam: TdxNavBarItem;
    dxnvbrtmParamDownloadPlan: TdxNavBarItem;
    ac_ParamDownloadParam: TAction;
    ac_ParamDownloadPlan: TAction;
    spModelParamDownloadCopy: TADOStoredProc;
    dxNavBar_Exit: TdxNavBarGroup;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    GPS1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    dxNavBar_AutoTestSMT: TdxNavBarGroup;
    dxNbarAutoTestSMTParam: TdxNavBarItem;
    dxNbarAutoTestSMTItemPlan: TdxNavBarItem;
    ac_AutoTestSMTParam: TAction;
    ac_AutoTestSMTItemPlan: TAction;
    spAutoTestSMTParamCopy: TADOStoredProc;
    dxNavBar_TestResult: TdxNavBarGroup;
    spAutoTestSMTParamCopyFormAutoTest: TADOStoredProc;
    N15: TMenuItem;
    N16: TMenuItem;
    spInsertOperRecord: TADOStoredProc;
    dxNbarGpsTcDataSMT: TdxNavBarItem;
    ac_SMT_GpsTcData: TAction;
    spUpdateGpsSMT_TcData: TADOStoredProc;
    actTestResult: TAction;
    dxNavBar1ItemTestResult: TdxNavBarItem;
    spCheckTestPass_WriteIMEI: TADOStoredProc;
    qryGetChipbyBoxNo: TADOQuery;
    dxNavBar_SMTOQC: TdxNavBarGroup;
    dxnvbrtmNavBarOQCParam: TdxNavBarItem;
    dxnvbrtmNavBarOQCItemPlan: TdxNavBarItem;
    ac_OQCItemPlan: TAction;
    ac_OQCTestParam: TAction;
    dxNavBar_WriteImei: TdxNavBarGroup;
    dxnvbrtmNavBarWriteImeiParam: TdxNavBarItem;
    dxnvbrtmNavBarWriteImeiPlan: TdxNavBarItem;
    ac_WriteImeiParam: TAction;
    ac_WriteImeiPlan: TAction;
    spWriteImeiParamCopy: TADOStoredProc;
    spOQCParamCopy: TADOStoredProc;
    spCheckTestedBySNAndVersion: TADOStoredProc;
    spSMTUpdateForm: TADOStoredProc;
    spCheckTestedParamCpd: TADOStoredProc;
    spParamDownUpdateForm: TADOStoredProc;
    spTestParamFormAutoTest: TADOStoredProc;
    dxNavBar_LabelParam: TdxNavBarGroup;
    dxNavBarLabelParam_Gift: TdxNavBarItem;
    dxNavBarLabelParam_Carton: TdxNavBarItem;
    ac_GiftParam: TAction;
    ac_CartonParam: TAction;
    dxnvbrtmManuOrder: TdxNavBarItem;
    ac_ManuOrderParam: TAction;
    dxnvbrtmCartonBoxResult: TdxNavBarItem;
    ac_CartonBoxResult: TAction;
    dxnvbrtmDataRel: TdxNavBarItem;
    ac_DataRel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ac_exitExecute(Sender: TObject);
    procedure ac_UserTypeExecute(Sender: TObject);
    procedure ac_UserExecute(Sender: TObject);
    procedure ac_TestWrongExecute(Sender: TObject);
    procedure btnStartTcpClick(Sender: TObject);
    procedure btnStopTcpClick(Sender: TObject);
    procedure TcpServerClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure TcpServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure TcpServerClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ac_TestPlanExecute(Sender: TObject);
    procedure ac_SetExecute(Sender: TObject);
    procedure TcpServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ac_SubTestItemExecute(Sender: TObject);
    procedure ac_TestPlanSetExecute(Sender: TObject);
    procedure ac_AutoTestParamExecute(Sender: TObject);
    procedure ac_AutoTestModelExecute(Sender: TObject);
    procedure ac_AutoTestItemPlanExecute(Sender: TObject);
    procedure ac_TestParameterExecute(Sender: TObject);
    procedure ac_VersionModelExecute(Sender: TObject);
    procedure ac_GpsTcDataExecute(Sender: TObject);
    procedure ac_ParamDownloadParamExecute(Sender: TObject);
    procedure ac_ParamDownloadPlanExecute(Sender: TObject);
    procedure dxNavBar_ExitClick(Sender: TObject);
    procedure ac_AutoTestSMTParamExecute(Sender: TObject);
    procedure ac_AutoTestSMTItemPlanExecute(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure ac_SMT_GpsTcDataExecute(Sender: TObject);
    procedure edtTCPPortKeyPress(Sender: TObject; var Key: Char);
    procedure actTestResultExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ac_OQCItemPlanExecute(Sender: TObject);
    procedure ac_OQCTestParamExecute(Sender: TObject);
    procedure ac_WriteImeiParamExecute(Sender: TObject);
    procedure ac_WriteImeiPlanExecute(Sender: TObject);
    procedure ac_GiftParamExecute(Sender: TObject);
    procedure ac_CartonParamExecute(Sender: TObject);
    procedure ac_ManuOrderParamExecute(Sender: TObject);
    procedure ac_CartonBoxResultExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_DataRelExecute(Sender: TObject);

  private
    { Private declarations }
    procedure ShowForm(frm:TfrmModuleForm); overload;
    procedure ShowForm(frm:TForm); overload;
    procedure MsgLogin(var msg:TMessage);message WM_Login;
    procedure MsgCheckTested(var msg:TMessage);message WM_CheckTested;
    procedure MsgCheckTested_SetResult(var msg:TMessage);message WM_CheckTested_SetResult;
    procedure MsgGetTempRid(var msg:TMessage);message WM_GetTempRid;
    procedure MsgGetTempImei(var msg:TMessage);message WM_GetTempImei;
    procedure MsgCheckMustTest(var msg:TMessage);message WM_CheckMustTest;
    procedure MsgCheckIMEI(var msg:TMessage);message WM_CheckIMEI;
    procedure MsgUpdateResult(var msg:TMessage);message WM_UpdateResult;
    procedure MsgCheckTestPass(var msg:TMessage);message WM_CheckTestPass;
    procedure MsgCheckTestPass_WriteIMEI(var msg:TMessage);message WM_CheckTestPass_WriteIMEI;
    procedure MsgDeleteImei(var msg:TMessage);message WM_DeleteImei;
    procedure MsgDeleteTestResultByImeiTwice(var msg:TMessage);message WM_DeleteTestResultByImeiTwice;
    procedure MsgDeleteTestResultByRidTwice(var msg:TMessage);message WM_DeleteTestResultByRidTwice;

    procedure MsgTwiceByUpdateVersion(var msg:TMessage);message WM_TwiceByUpdateVersion;
    procedure MsgUpdateGpsTcData(var msg:TMessage);message WM_UpdateGpsTcData;
    procedure MsgUpdateGpsSMT_TcData(var msg:TMessage);message WM_UpdateGpsSMT_TcData;
    procedure MsgTwiceByBoxNo(var msg:TMessage);message WM_TwiceByBoxNo;
    procedure MsgCheckImeiTest(var msg:TMessage);message WM_CheckTestedBySNAndVersion;
    procedure MsgCalculateCRC(var msg:TMessage);message WM_CalculateCRC;
    procedure MsgCheckTestedParamCpd(var msg:TMessage);message WM_CheckTestedParamCpd;
  public
    { Public declarations }
    function CheckLocalIP():Boolean;
  end;

var
    frmServerMain: TfrmServerMain;
    CurrentFrom:TForm;
    TempWSAData: TWSAData;              //WSADATA数据结构指针
    sTempTester : string;             //临时存储操作员登入名称
implementation

uses
	uUserTypeForm, uUserForm,uPublicFunc,uDmMain,uTestPlanForm,
  uSetForm, uTestWrong, uSubTestItem, uTestPlanSet,uSMTTcDataForm,
  uAutoTestModel, uAutoTestItem, uAutoTestItemPlan, uOperRecord,
  uTestParameter, uVersionModel, uTcDataForm, uParamDownloadItem,
  uParamDownloadPlan,uAutoTestSMTItem, uAutoTestSMTItemPlan,uTestResult,
  uOQCItemPlan, uOQCItem, uWriteImeiPlan,uWriteImei, uGiftParam,uCartonParam,
  uManuOrderParam, uCartonBoxResult, uDataRelResult;

{$R *.dfm}
procedure TfrmServerMain.ShowForm(frm:TfrmModuleForm);
begin
  if CurrentFrom<>nil then
  begin
    CurrentFrom.Visible :=false;
  end;
  CurrentFrom:=frm;//保存当前活跃窗口
  frm.Parent := TabSheet1;
  frm.BorderStyle := bsNone;
  frm.Visible := true;
  frm.Align := alClient;
  SkinData_Main.AddNestForm(frmServerMain,frm);
  TabSheet1.Caption :=frm.Caption ;
end;
procedure TfrmServerMain.ShowForm(frm:TForm);
begin
  if CurrentFrom<>nil then
  begin
    CurrentFrom.Visible :=false;
  end;
  CurrentFrom:=frm;//保存当前活跃窗口
  frm.Parent := TabSheet1;
  frm.BorderStyle := bsNone;
  frm.Visible := true;
  frm.Align := alClient;
  SkinData_Main.AddNestForm(frmServerMain,frm);
  TabSheet1.Caption :=frm.Caption ;
end;
//--------------------------Action=Login#Username=%s#UserPwd=%s#--------------------------//
//--------------------------Action=Login#UserType=admin#TestPlan=FunctionTest#--------------------------//
procedure TfrmServerMain.MsgLogin(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    strUserDes,strUserType,strUserTestPlan:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);
    strUserType:='';
    strUserTestPlan:='';
    iRecordCount:=0;
    GetUserInformation(StrListNumberSign.Values['UserName'],StrListNumberSign.Values['UserPwd'],strUserDes,strUserType,strUserTestPlan,iRecordCount);
    strTemp:=Format('Action=Login#UserDes=%s#UserType=%s#TestPlan=%s#Result=%d#',[strUserDes,strUserType,strUserTestPlan,iRecordCount]);
    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //sTempOperName := StrListNumberSign.Values['UserName'];
    //InsertOperRecord(sTempOperName,'[S:]===='+strTemp,DateTimeToStr(Now),'');
    //StrListNumberSign.Free;
end;

procedure TfrmServerMain.MsgCalculateCRC(var msg:TMessage);
var
  StrListNumberSign:TStringList;     //#号分隔内容
  strResult,strTemp:string;
  //iRecordCount:Integer;
  Socket:TCustomWinSocket;

begin
  StrListNumberSign:=TStringList(msg.WParam);
  Socket:=TCustomWinSocket(msg.LParam);
  strResult:=GetCRCCode(StrListNumberSign.Values['ChipRid']);
  strTemp:=Format('Action=CalculateCRC#iRecordResult=%s#',[strResult]);
  NoteSocketLog2('[S:]===='+strTemp+'ChipRid='+StrListNumberSign.Values['ChipRid']);
  Socket.SendText(strTemp);
end;
///2014.12.4检测跑过下载位，得到之前版本
procedure TfrmServerMain.MsgCheckTestedParamCpd(var msg:TMessage);
var
  StrListNumberSign:TStringList;     //#号分隔内容
  strVer,strVerEx,strTemp:string;
  iRecordCount:Integer;
  Socket:TCustomWinSocket;

begin
  StrListNumberSign:=TStringList(msg.WParam);
  Socket:=TCustomWinSocket(msg.LParam);
  strVer:=StrListNumberSign.Values['Version'];
  strVerEx:=StrListNumberSign.Values['VersionEx'];
  CheckTestedParamCpd(StrListNumberSign.Values['ChipRid'],StrListNumberSign.Values['IMEI'],strVer,strVerEx,iRecordCount);
  strTemp:=Format('Action=CheckTestedParamCpd#iRecordCount=%d#Version=%s#VersionEx=%s#',[iRecordCount,strVer,strVerEx]);

  NoteSocketLog('[S:]===='+strTemp);
  Socket.SendText(strTemp);
end;

procedure TfrmServerMain.MsgCheckImeiTest(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);
    CheckTestedBySNAndVersion(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['ChipRid'],
                StrListNumberSign.Values['Version'],
                iRecordCount);
    strTemp:=Format('Action=CheckTestedBySNAndVersion#iRecordCount=%d#',[iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
end;

//--------------------------Action=CheckTested#PlanName=%s#ChipRid=%s#--------------------------//
//--------------------------Action=CheckTested#iRecordCount=%d#--------------------------//
procedure TfrmServerMain.MsgCheckTested(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);


    CheckTested(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['ChipRid'],
                StrListNumberSign.Values['SoftModel'],StrListNumberSign.Values['Version'],
                iRecordCount);
    strTemp:=Format('Action=CheckTested#iRecordCount=%d#',[iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //sTempOperName := StrListNumberSign.Values['UserName'];    //可能不准确
    //InsertOperRecord(sTempOperName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
procedure TfrmServerMain.MsgCheckTested_SetResult(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);
    //NoteSocketLog2('[R:]====TestResultTime2_' + StrListNumberSign.Values['ChipRid']);
    CheckTested(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['ChipRid'],
                StrListNumberSign.Values['SoftModel'],StrListNumberSign.Values['Version'],
                iRecordCount);
    //NoteSocketLog2('[R:]====TestResultTime_SQL' + StrListNumberSign.Values['ChipRid']);
    strTemp:=Format('Action=CheckTested_SetResult#iRecordCount=%d#',[iRecordCount]);
    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
end;
procedure TfrmServerMain.MsgGetTempImei(var msg:TMessage);
var
    strTemp,strTempSn:string;
    Socket:TCustomWinSocket;
begin
    Socket:=TCustomWinSocket(msg.LParam);

    with frmServerMain.spGetTempImei do
    begin
        Close;
        ExecProc;
        strTemp:=Parameters.ParamByName('@cTempImei').Value;
        strTempSn:=Parameters.ParamByName('@cRid').Value;
    end;
    strTemp:=Format('Action=GetTempImei#TempImei=%s#TempSn=%s#',[strTemp,strTempSn]);
    //InsertOperRecord(sTempOperName,'[S:]===='+strTemp,DateTimeToStr(Now));

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
end;
//--------------------------Action=CheckTested#PlanName=%s#ChipRid=%s#--------------------------//
//--------------------------Action=CheckTested#iRecordCount=%d#--------------------------//
procedure TfrmServerMain.MsgGetTempRid(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp,strRid:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    GetTempRid(StrListNumberSign.Values['IMEI'],iRecordCount,strRid);
    strTemp:=Format('Action=GetTempRid#iRecordCount=%d#Rid=%s#',[iRecordCount,strRid]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(sTempOperName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
//--------------------------Action=CheckTested#PlanName=%s#ChipRid=%s#--------------------------//
//--------------------------Action=CheckTested#iRecordCount=%d#--------------------------//
procedure TfrmServerMain.MsgCheckMustTest(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    CheckMustTest(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['SoftModel'],iRecordCount);
    strTemp:=Format('Action=CheckMustTest#iRecordCount=%d#',[iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);

    //InsertOperRecord(sTempOperName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
procedure TfrmServerMain.MsgCheckIMEI(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    CheckIMEI(StrListNumberSign.Values['IMEI'],iRecordCount);
    strTemp:=Format('Action=CheckIMEI#iRecordCount=%d#',[iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
//--------------------------'Action=Tested#PlanName=%s#ChipRid=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#'--------------------------//
//--------------------------Action=Tested#UpdateForm=%d#--------------------------//
procedure TfrmServerMain.MsgUpdateResult(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);
    {if StrListNumberSign.Values['PlanName']='AutoTestSMT' then
    begin
      UpdateForm(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['ChipRid'],
                        StrListNumberSign.Values['Version'],StrListNumberSign.Values['SoftModel'],StrListNumberSign.Values['Imei'],
                        StrToInt(StrListNumberSign.Values['iResult']),StrListNumberSign.Values['Tester'],StrListNumberSign.Values['GpsDBValue'],iRecordCount);
    end
    else }
    if StrListNumberSign.Values['PlanName']='ParamDownload' then
    begin
       UpdateForm(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['ChipRid'],
                        StrListNumberSign.Values['Version'],StrListNumberSign.Values['VersionS'],StrListNumberSign.Values['SoftModel'],StrListNumberSign.Values['Imei'],
                        StrToInt(StrListNumberSign.Values['iResult']),StrListNumberSign.Values['Tester'],iRecordCount);

    end
    else
    begin
       UpdateForm(StrListNumberSign.Values['PlanName'],StrListNumberSign.Values['ChipRid'],
                        StrListNumberSign.Values['Version'],StrListNumberSign.Values['SoftModel'],StrListNumberSign.Values['Imei'],
                        StrToInt(StrListNumberSign.Values['iResult']),StrListNumberSign.Values['Tester'],iRecordCount);

    end;
    strTemp:=Format('Action=UpdateResult#iRecordCount=%d#',[iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
//--------------------------'Action=CheckTestPass#IMEI=%s#'--------------------------//
//--------------------------Action=CheckTestPass#Result=%s#--------------------------//
procedure TfrmServerMain.MsgCheckTestPass(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
    {iAutoTestSMTPass,}iFuncTestPass,iGPSPass,iCoupleTestPass,iWriteImeiPass,iParamDownloadPass,iAutoPass:Integer;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    CheckTestPass(StrListNumberSign.Values['IMEI'],iFuncTestPass,iGPSPass,iCoupleTestPass,iWriteImeiPass,iParamDownloadPass,iAutoPass,iRecordCount);
    //NoteSocketLog('[sql END:]====' + GetTickCount);
    strTemp:=Format('Action=CheckTestPass#FunctionTest=%d#GPS=%d#CoupleTest=%d#WriteImei=%d#ParamDownload=%d#AutoTest=%d#Result=%d#',
            [iFuncTestPass,iGPSPass,iCoupleTestPass,iWriteImeiPass,iParamDownloadPass,iAutoPass,iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //NoteSocketLog('[S:]===='+strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
procedure TfrmServerMain.MsgCheckTestPass_WriteIMEI(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
    iFuncTestPass,iGPSPass,iCoupleTestPass,iParamDownloadPass,iAutoPass:Integer;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    CheckTestPass_WriteIMEI(StrListNumberSign.Values['ChipRid'],StrListNumberSign.Values['SoftModel'],StrListNumberSign.Values['Version'],iFuncTestPass,iGPSPass,iCoupleTestPass,iParamDownloadPass,iAutoPass,iRecordCount);
    strTemp:=Format('Action=CheckTestPass_WriteIMEI#FunctionTest=%d#GPS=%d#CoupleTest=%d#ParamDownload=%d#AutoTest=%d#Result=%d#',
            [iFuncTestPass,iGPSPass,iCoupleTestPass,iParamDownloadPass,iAutoPass,iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
end;
//--------------------------'Action=DeleteImei#ChipRid=%s#Imei=%s',[strChipRid[CommIndex],strIMEI]--------------------------//
//--------------------------Action=DeleteImei#iRecordCount=0#--------------------------//
procedure TfrmServerMain.MsgDeleteImei(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    iRecordCount:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    DeleteImei(StrListNumberSign.Values['ChipRid'],StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],iRecordCount);
    strTemp:=Format('Action=DeleteImei#iRecordCount=%d#',[iRecordCount]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;

//--------------------------'Action=DeleteTestResult_ByImei_Twice#FormName=%s#Imei=%s#Tester=%s#',[strFormName,strImeiOrRid,User.UserName]--------------------------//
//--------------------------Action=DeleteTestResult_ByImei_Twice#iRecordCount=0#--------------------------//
procedure TfrmServerMain.MsgDeleteTestResultByImeiTwice(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    Socket:TCustomWinSocket;
    iFunctionTestReturn,iGpsTestReturn,iCoupleTestReturn,iWriteImeiReturn,iParamDownloadReturn,iCartonBoxReturn,iAutoTestReturn:Integer;        //返工位的删除结果
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    if StrListNumberSign.Values['FunctionTest']='1' then
    begin
        DeleteTestResult_ByImei('Gps_FunctionTest_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iFunctionTestReturn);
    end;
    if StrListNumberSign.Values['GpsTest']='1' then
    begin
        DeleteTestResult_ByImei('Gps_GpsTest_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iGpsTestReturn);
    end;
    if StrListNumberSign.Values['CoupleTest']='1' then
    begin
        DeleteTestResult_ByImei('Gps_CoupleTest_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iCoupleTestReturn);
    end;

    if StrListNumberSign.Values['ParamDownload']='1' then
    begin
        DeleteTestResult_ByImei('Gps_ParamDownload_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iParamDownloadReturn);
    end;
    if StrListNumberSign.Values['CartonBox']='1' then
    begin
        DeleteTestResult_ByImei('Gps_CartonBox_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iCartonBoxReturn);
    end;
    if StrListNumberSign.Values['AutoTest']='1' then
    begin
        DeleteTestResult_ByImei('Gps_AutoTest_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iAutoTestReturn);
    end;
    if StrListNumberSign.Values['SMTIQCTest']='1' then
    begin
        DeleteTestResult_ByImei('Gps_SMTIQC_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iAutoTestReturn);
    end;
    if StrListNumberSign.Values['WriteImei']='1' then
    begin
        DeleteTestResult_ByImei('Gps_WriteImei_Result',StrListNumberSign.Values['Imei'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iWriteImeiReturn);
    end;

    strTemp:=Format('Action=DeleteTestResult_ByImei_Twice#FunctionTestResult=%d#GpsTestResult=%d#CoupleTestResult=%d#WriteImeiResult=%d#ParamDownloadResult=%d#CartonBoxResult=%d#AutoTestResult=%d#',
                    [iFunctionTestReturn,iGpsTestReturn,iCoupleTestReturn,iWriteImeiReturn,iParamDownloadReturn,iCartonBoxReturn,iAutoTestReturn]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
procedure TfrmServerMain.MsgTwiceByUpdateVersion(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    iTwiceResult:Integer;
    Socket:TCustomWinSocket;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    TwiceByUpdateVersion(StrListNumberSign.Values['Rid'],StrListNumberSign.Values['IMEI'],
                            StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iTwiceResult);

    strTemp:=Format('Action=TwiceByUpdateVersion#TwiceResult=%d#',[iTwiceResult]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;
procedure TfrmServerMain.MsgUpdateGpsTcData(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    Socket:TCustomWinSocket;
    strTemp:string;
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    UpdateGpsTcData(StrListNumberSign.Values['Rid'],StrListNumberSign.Values['FixMode'],StrListNumberSign.Values['GpsDb_0'],
                    StrListNumberSign.Values['GpsDb_1'],StrListNumberSign.Values['GpsDb_2'],StrListNumberSign.Values['GpsDb_3'],
                    StrListNumberSign.Values['GpsDb_4'],StrListNumberSign.Values['GpsDb_5'],StrListNumberSign.Values['GpsDb_6'],
                    StrListNumberSign.Values['GpsDb_7'],StrListNumberSign.Values['GpsDb_8'],StrListNumberSign.Values['GpsDb_9'],
                    StrListNumberSign.Values['GpsDb_10'],StrListNumberSign.Values['GpsDb_11']);
    strTemp:=Format('Action=UpdateGpsTcData#Result=%d#',[1]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;

procedure TfrmServerMain.MsgUpdateGpsSMT_TcData(var msg: TMessage);
var
  StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
  Socket:TCustomWinSocket;
  strTemp:string;
begin
  StrListNumberSign:=TStringList(msg.WParam);
  Socket:=TCustomWinSocket(msg.LParam);

  UpdateGpsSMT_TcData(StrListNumberSign.Values['Rid'],StrListNumberSign.Values['FixMode'],StrListNumberSign.Values['GpsDb_0'],
                  StrListNumberSign.Values['GpsDb_1'],StrListNumberSign.Values['GpsDb_2'],StrListNumberSign.Values['GpsDb_3'],
                  StrListNumberSign.Values['GpsDb_4'],StrListNumberSign.Values['GpsDb_5'],StrListNumberSign.Values['GpsDb_6'],
                  StrListNumberSign.Values['GpsDb_7'],StrListNumberSign.Values['GpsDb_8'],StrListNumberSign.Values['GpsDb_9'],
                  StrListNumberSign.Values['GpsDb_10'],StrListNumberSign.Values['GpsDb_11']);
  strTemp:=Format('Action=UpdateGpsSMT_TcData#Result=%d#',[1]);

  NoteSocketLog('[S:]===='+strTemp);
  Socket.SendText(strTemp);
  //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
  //StrListNumberSign.Free;
end;



procedure TfrmServerMain.MsgTwiceByBoxNo(var msg:TMessage);
//var
 { StrListNumberSign:TStringList;
  Socket:TCustomWinSocket;
  strTemp:string;
  iOQCResult,iSMTResult:Integer;}

begin

   {StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

   strTemp:=StrListNumberSign.Values['BoxNo'];
   frmServerMain.qryGetChipbyBoxNo.SQL.Clear;
   frmServerMain.qryGetChipbyBoxNo.SQL.Add('select SN from Gps_AutoTestSMT_BoxCont where BoxNo = ''' + strTemp + '''');
   frmServerMain.qryGetChipbyBoxNo.Open;
  //NoteSocketLog2('[RGetSN:]====ByBoxNo===');
  frmServerMain.qryGetChipbyBoxNo.First;
  while not frmServerMain.qryGetChipbyBoxNo.Eof do
  begin
     //DeleteTestResult_ByRid('Gps_SMTIQC_Result',frmServerMain.qryGetChipbyBoxNo.FieldByName<'SN'>.AsString,'','',iOQCResult);
     //DeleteTestResult_ByRid('Gps_SMTIQC_Result',frmServerMain.qryGetChipbyBoxNo.FieldByName('SN').Value,'',StrListNumberSign.Values['Tester'],iOQCResult);
      DeleteTestResult_ByRid('Gps_AutoTestSMT_Result',frmServerMain.qryGetChipbyBoxNo.FieldByName('SN').Value,'',StrListNumberSign.Values['Tester'],iSMTResult);
      qryGetChipbyBoxNo.Next;
  end;
  //NoteSocketLog2('[RDeleteSMTAndIQC:]====ByBoxNo===');
  {
  frmServerMain.qryGetChipbyBoxNo.SQL.Clear;
  frmServerMain.qryGetChipbyBoxNo.SQL.Add('Delete from Gps_AutoTestSMT_BoxCont where BoxNo = ''' + strTemp + '''');
  frmServerMain.qryGetChipbyBoxNo.ExecSQL;  }
   //strTemp:=Format('Action=DeleteTestResult_ByBoxNo_Twice#iSMTResult=%d#iOQCResult=%d#',
    //                [iSMTResult,iOQCResult]);


    //NoteSocketLog2('[S:]===='+strTemp);
   // Socket.SendText(strTemp);
 // NoteSocketLog2('[RDeleteBoxNo:]====ByBoxNo===');  }
end;

//--------------------------''Action=DeleteTestResult_ByRid_Twice#FormName=%s#Rid=%s#Tester=%s#',[strFormName,strImeiOrRid,User.UserName]--------------------------//
//--------------------------Action=DeleteTestResult_ByRid_Twice#iRecordCount=0#--------------------------//
procedure TfrmServerMain.MsgDeleteTestResultByRidTwice(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容,:号分隔内容
    strTemp:string;
    Socket:TCustomWinSocket;
    iFunctionTestReturn,iGpsTestReturn,iCoupleTestReturn,iWriteImeiReturn,iParamDownloadReturn,iCartonBoxReturn,iAutoTestReturn:Integer;        //返工位的删除结果
begin
    StrListNumberSign:=TStringList(msg.WParam);
    Socket:=TCustomWinSocket(msg.LParam);

    if StrListNumberSign.Values['FunctionTest']='1' then
    begin
        DeleteTestResult_ByRid('Gps_FunctionTest_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iFunctionTestReturn);
    end;
    if StrListNumberSign.Values['GpsTest']='1' then
    begin
        DeleteTestResult_ByRid('Gps_GpsTest_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iGpsTestReturn);
    end;
    if StrListNumberSign.Values['CoupleTest']='1' then
    begin
        DeleteTestResult_ByRid('Gps_CoupleTest_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iCoupleTestReturn);
    end;

    if StrListNumberSign.Values['ParamDownload']='1' then
    begin
        DeleteTestResult_ByRid('Gps_ParamDownload_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iParamDownloadReturn);
    end;
    if StrListNumberSign.Values['CartonBox']='1' then
    begin
        DeleteTestResult_ByRid('Gps_CartonBox_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iCartonBoxReturn);
    end;
    if StrListNumberSign.Values['WriteImei']='1' then
    begin
        DeleteTestResult_ByRid('Gps_WriteImei_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iWriteImeiReturn);

    end;
    if StrListNumberSign.Values['AutoTest']='1' then
    begin
        DeleteTestResult_ByRid('Gps_AutoTest_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iAutoTestReturn);

    end;
    if StrListNumberSign.Values['SMTIQCTest']='1' then
    begin
        DeleteTestResult_ByRid('Gps_SMTIQC_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iAutoTestReturn);

    end;
    if StrListNumberSign.Values['AutoTestSMT']='1' then
    begin
        DeleteTestResult_ByRid('Gps_AutoTestSMT_Result',StrListNumberSign.Values['Rid'],StrListNumberSign.Values['Version'],StrListNumberSign.Values['Tester'],iAutoTestReturn);

    end;
    strTemp:=Format('Action=DeleteTestResult_ByRid_Twice#FunctionTestResult=%d#GpsTestResult=%d#CoupleTestResult=%d#WriteImeiResult=%d#ParamDownloadResult=%d#CartonBoxResult=%d#AutoTestResult=%d#',
                    [iFunctionTestReturn,iGpsTestReturn,iCoupleTestReturn,iWriteImeiReturn,iParamDownloadReturn,iCartonBoxReturn,iAutoTestReturn]);

    NoteSocketLog('[S:]===='+strTemp);
    Socket.SendText(strTemp);
    //InsertOperRecord(User.UserName,'[S:]===='+strTemp,DateTimeToStr(Now));
    //StrListNumberSign.Free;
end;

procedure TfrmServerMain.FormCreate(Sender: TObject);
var
    ParamFilename:string;
    myinifile:Tinifile;   //保存参数所用的INI文件
    strTcpPort:string;
    bTcpAuto:Boolean;
begin
    //加载默认的皮肤控件
    SkinData_Main.LoadFromCollection(SkinStore_Main,0);
    SkinData_Main.Active :=true;

    //设置各按扭的有效性
    btnStartTcp.Enabled:=not TcpServer.Active;
    btnStopTcp.Enabled:=TcpServer.Active;

    //读取设置参数显示
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    myinifile:=Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        strTcpPort:=ReadString('Tcp', 'Port', '');
        bTcpAuto:=ReadBool('Tcp', 'Auto', False);
    end;
    myinifile.Free;
    edtTCPPort.Text:=strTcpPort;
    chkTCPAuto.Checked:=bTcpAuto;
    if chkTCPAuto.Checked then    btnStartTcp.Click;

    bIsLoaclIp:=CheckLocalIP();//程序启动就检测IP地址

    frmServerMain.Caption:=frmServerMain.Caption +'<V' + GetFileVersion(application.ExeName) +'  ' +GetFileTime(application.ExeName)+'>';

    
    end;

procedure TfrmServerMain.ac_exitExecute(Sender: TObject);
begin
    if Application.MessageBox('您确认是否退出本应用系统','退出提示',MB_OKCANCEL+MB_ICONQUESTION)=idok then
        Application.Terminate
end;

procedure TfrmServerMain.ac_UserTypeExecute(Sender: TObject);
begin
    if frmUserType=nil then  frmUserType:=TfrmUserType.Create(Self);
    ShowForm(frmUserType);
end;

procedure TfrmServerMain.ac_UserExecute(Sender: TObject);
begin
    if frmUser=nil then  frmUser:=TfrmUser.Create(Self);
    ShowForm(frmUser);
end;

procedure TfrmServerMain.ac_TestWrongExecute(Sender: TObject);
begin
    if frmTestWrong=nil then  frmTestWrong:=TfrmTestWrong.Create(Self);
    ShowForm(frmTestWrong);
end;

procedure TfrmServerMain.btnStartTcpClick(Sender: TObject);
begin
  if Trim(edtTCPPort.Text)='' then
  begin
    Application.MessageBox('TCP设置中端口号不得为空!','信息警告',MB_ICONHAND);
    Exit;
  end;
  if (StrToInt(edtTCPPort.Text)<1) or (StrToInt(edtTCPPort.Text) >65535) then
  begin
    Application.MessageBox('TCP设置中端口号的范围为[0,65535]!','信息警告',MB_ICONHAND);
    Exit;
  end;

  //TcpServer开启
  TcpServer.Port:=StrToInt(edtTCPPort.Text);
  try
    TcpServer.Active:=True;
    TcpServer.Open;
  except
    Application.MessageBox('监听失败!','信息警告',MB_ICONHAND);
  end;

  btnStartTcp.Enabled:=not TcpServer.Active;
  btnStopTcp.Enabled:=TcpServer.Active;
  imgTCPGreen.Visible:=TcpServer.Active;
  imgTCPRed.Visible:=not TcpServer.Active;
  if Length(User.UserName) > 0 then           //已登入到主界面了才操作监听
  	InsertOperRecord(User.UserName,'开始监听',DateTimeToStr(Now));
end;

procedure TfrmServerMain.btnStopTcpClick(Sender: TObject);
begin
  if (TcpServer.Socket.ActiveConnections>=1) then   TcpServer.Close;
  TcpServer.Active:=False;

  btnStartTcp.Enabled:=not TcpServer.Active;
  btnStopTcp.Enabled:=TcpServer.Active;

  imgTCPGreen.Visible:=TcpServer.Active;
  imgTCPRed.Visible:=not TcpServer.Active;

  if Length(User.UserName) > 0 then
    InsertOperRecord(User.UserName,'停止监听',DateTimeToStr(Now));
end;

procedure TfrmServerMain.TcpServerClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
    Hour,Min,Sec,MSec:Word;
begin
    DecodeTime(now(),Hour,Min,Sec,MSec);
    NoteSocketLog('TCP->['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9+#9+ Socket.RemoteAddress+#9+#9 +'连接'+#9);
end;

procedure TfrmServerMain.TcpServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
    Hour,Min,Sec,MSec:Word;     //时,分,秒,毫秒
begin
    DecodeTime(now(),Hour,Min,Sec,MSec);
    NoteSocketLog('TCP->['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9+ Socket.RemoteAddress+#9+#9 +'断开'+#9);
end;

procedure TfrmServerMain.TcpServerClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var
    Hour,Min,Sec,MSec:Word;     //时,分,秒,毫秒
begin
    DecodeTime(now(),Hour,Min,Sec,MSec);
    //需加上判断，否则容易报错
    if Socket<>nil then
    begin
       NoteSocketLog('TCP->['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9+ Socket.RemoteAddress+#9+#9 +'发生错误！'+inttostr(ErrorCode)+#9);
       ErrorCode := 0;
    end;
end;

procedure TfrmServerMain.TcpServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  StrListNumberSign:TStringList;    //#号分隔内容
  ReceiveText:string;
begin
  ReceiveText:=Socket.ReceiveText;
  NoteSocketLog('[R:]===='+ReceiveText);

  StrListNumberSign :=TStringList.Create;
  StrListNumberSign.Clear;
  StrListNumberSign.Delimiter:='#';
  StrListNumberSign.DelimitedText:=ReceiveText;

  if StrListNumberSign.Count>1 then
  begin
    //用户登录
    if StrListNumberSign.Values['Action']='Login' then
    begin
      sTempTester := StrListNumberSign.Values['Tester'];
      //InsertOperRecord(sTempTester,'客户登入',DateTimeToStr(Now),'');
      SendMessage(Handle,WM_Login,wParam(StrListNumberSign),lParam(Socket));
    end
    //检测是否测试过
    else if StrListNumberSign.Values['Action']='CheckTested' then
    begin
    	SendMessage(Handle,WM_CheckTested,wParam(StrListNumberSign),lParam(Socket));
    end
    //检测是否测试过IMEI,目前只在下载位检测
    else if StrListNumberSign.Values['Action']='CheckTestedBySNAndVersion' then
    begin
    	SendMessage(Handle,WM_CheckTestedBySNAndVersion,wParam(StrListNumberSign),lParam(Socket));
    end
    //检测是否测试过
    else if StrListNumberSign.Values['Action']='CheckTested_SetResult' then
    begin
      //NoteSocketLog2('[R:]====TestResultTime_' + StrListNumberSign.Values['ChipRid']);
    	SendMessage(Handle,WM_CheckTested_SetResult,wParam(StrListNumberSign),lParam(Socket));
    end
    //检测是否测试过
    else if StrListNumberSign.Values['Action']='GetTempRid' then
    begin
    	SendMessage(Handle,WM_GetTempRid,wParam(StrListNumberSign),lParam(Socket));
    end
    //获取临时IMEI
    else if StrListNumberSign.Values['Action']='GetTempImei' then
    begin
    	SendMessage(Handle,WM_GetTempImei,wParam(StrListNumberSign),lParam(Socket));
    end
    //检测是否需要测试
    else if StrListNumberSign.Values['Action']='CheckMustTest' then
    begin
    	SendMessage(Handle,WM_CheckMustTest,wParam(StrListNumberSign),lParam(Socket));
    end
    //检测IMEI是否使用
    else if StrListNumberSign.Values['Action']='CheckIMEI' then
    begin
    	SendMessage(Handle,WM_CheckIMEI,wParam(StrListNumberSign),lParam(Socket));
    end
    //更新测试结果
    else if StrListNumberSign.Values['Action']='UpdateResult' then
    begin
    	SendMessage(Handle,WM_UpdateResult,wParam(StrListNumberSign),lParam(Socket));
    end
    //测试是否通过
    else if StrListNumberSign.Values['Action']='CheckTestPass' then
    begin
    	SendMessage(Handle,WM_CheckTestPass,wParam(StrListNumberSign),lParam(Socket));
    end
    //测试是否通过
    else if StrListNumberSign.Values['Action']='CheckTestPass_WriteIMEI' then
    begin
    	SendMessage(Handle,WM_CheckTestPass_WriteIMEI,wParam(StrListNumberSign),lParam(Socket));
    end
    //删除IMEI(IMEI烧写位)
    else if StrListNumberSign.Values['Action']='DeleteImei' then
    begin
    	SendMessage(Handle,WM_DeleteImei,wParam(StrListNumberSign),lParam(Socket));
    end
    //删除测试结果(以IMEI为索引)
    else if StrListNumberSign.Values['Action']='DeleteTestResult_ByImei_Twice' then
    begin
    	SendMessage(Handle,WM_DeleteTestResultByImeiTwice,wParam(StrListNumberSign),lParam(Socket));
    end
    //删除测试结果(以RID为索引)
    else if StrListNumberSign.Values['Action']='DeleteTestResult_ByRid_Twice' then
    begin
    	SendMessage(Handle,WM_DeleteTestResultByRidTwice,wParam(StrListNumberSign),lParam(Socket));
    end
    //删除测试结果(以RID为索引)
    else if StrListNumberSign.Values['Action']='UpdateGpsTcData' then
    begin
    	SendMessage(Handle,WM_UpdateGpsTcData,wParam(StrListNumberSign),lParam(Socket));
    end
    //更新SMT_GPS数据透传
    else if StrListNumberSign.Values['Action']='UpdateGpsSMT_TcData' then
    begin
    	SendMessage(Handle,WM_UpdateGpsSMT_TcData,wParam(StrListNumberSign),lParam(Socket));
    end
    //入库整箱返工
    else if StrListNumberSign.Values['Action']='DeleteTestResult_ByBoxNo_Twice' then
    begin
       //NoteSocketLog2('[R:]====ByBoxNo==='+ReceiveText);
       SendMessage(Handle,WM_TwiceByBoxNo,wParam(StrListNumberSign),lParam(Socket));

    end
    //软件升级返工
    else if StrListNumberSign.Values['Action']='TwiceByUpdateVersion' then
    begin

    	SendMessage(Handle,WM_TwiceByUpdateVersion,wParam(StrListNumberSign),lParam(Socket));
    end
    //计算CRC码
    else if StrListNumberSign.Values['Action']='CalculateCRC' then
    begin
       SendMessage(Handle,WM_CalculateCRC,wParam(StrListNumberSign),LParam(Socket));
    end
    //检测是否跑过下载位
    else if StrListNumberSign.Values['Action']='CheckTestedParamCpd' then
    begin
       SendMessage(Handle,WM_CheckTestedParamCpd,wParam(StrListNumberSign),LParam(Socket));
    end;

    //sTempTester := StrListNumberSign.Values['Tester'];
    //InsertOperRecord(sTempTester,ReceiveText,DateTimeToStr(Now),'');
  end;
  StrListNumberSign.Free;
  Application.ProcessMessages;
end;

procedure TfrmServerMain.ac_TestPlanExecute(Sender: TObject);
begin
    if frmTestPlan=nil then  frmTestPlan:=TfrmTestPlan.Create(Self);
    ShowForm(frmTestPlan);
end;

procedure TfrmServerMain.ac_SetExecute(Sender: TObject);
begin
    if frmSet=nil then  frmSet:=TfrmSet.Create(Self);
    ShowForm(frmSet);
end;
procedure TfrmServerMain.ac_SubTestItemExecute(Sender: TObject);
begin
    if frmSubTestItem=nil then  frmSubTestItem:=TfrmSubTestItem.Create(Self);
    ShowForm(frmSubTestItem);
end;

procedure TfrmServerMain.ac_TestPlanSetExecute(Sender: TObject);
begin
    if frmTestPlanSet=nil then  frmTestPlanSet:=TfrmTestPlanSet.Create(Self);
    ShowForm(frmTestPlanSet);
end;

procedure TfrmServerMain.ac_AutoTestParamExecute(Sender: TObject);
begin
    if frmAutoTestItem=nil then  frmAutoTestItem:=TfrmAutoTestItem.Create(Self);
    ShowForm(frmAutoTestItem);
end;

procedure TfrmServerMain.ac_AutoTestModelExecute(Sender: TObject);
begin
    if frmAutoTestModel=nil then  frmAutoTestModel:=TfrmAutoTestModel.Create(Self);
    ShowForm(frmAutoTestModel);
end;

procedure TfrmServerMain.ac_OQCItemPlanExecute(Sender: TObject);
begin
  if frmOQCItemPlan=nil then  frmOQCItemPlan:=TfrmOQCItemPlan.Create(Self);
    ShowForm(frmOQCItemPlan);
end;

procedure TfrmServerMain.ac_OQCTestParamExecute(Sender: TObject);
begin
   if frmOQCItem=nil then  frmOQCItem:=TfrmOQCItem.Create(Self);
      ShowForm(frmOQCItem);
end;

procedure TfrmServerMain.ac_AutoTestItemPlanExecute(Sender: TObject);
begin
    if frmAutoTestItemPlan=nil then  frmAutoTestItemPlan:=TfrmAutoTestItemPlan.Create(Self);
    ShowForm(frmAutoTestItemPlan);
end;

procedure TfrmServerMain.ac_WriteImeiParamExecute(Sender: TObject);
begin
    if frmWriteImei =nil then  frmWriteImei:=TfrmWriteImei.Create(Self);
    ShowForm(frmWriteImei);
end;

procedure TfrmServerMain.ac_WriteImeiPlanExecute(Sender: TObject);
begin
    if frmWriteImeiPlan=nil then  frmWriteImeiPlan:=TfrmWriteImeiPlan.Create(Self);
    ShowForm(frmWriteImeiPlan);
end;

procedure TfrmServerMain.ac_TestParameterExecute(Sender: TObject);
begin
    if frmTestParameter=nil then  frmTestParameter:=TfrmTestParameter.Create(Self);
    ShowForm(frmTestParameter);
end;

procedure TfrmServerMain.ac_VersionModelExecute(Sender: TObject);
begin
    if frmVersionModel=nil then  frmVersionModel:=TfrmVersionModel.Create(Self);
    ShowForm(frmVersionModel);
end;

//GPS透传数据结果
procedure TfrmServerMain.ac_GpsTcDataExecute(Sender: TObject);
begin
    if frmTcData=nil then  frmTcData:=TfrmTcData.Create(Self);
    ShowForm(frmTcData);
end;

procedure TfrmServerMain.ac_ParamDownloadParamExecute(Sender: TObject);
begin
    if frmParamDownloadItem=nil then  frmParamDownloadItem:=TfrmParamDownloadItem.Create(Self);
    ShowForm(frmParamDownloadItem);
end;

procedure TfrmServerMain.ac_ParamDownloadPlanExecute(Sender: TObject);
begin
    if frmParamDownloadPlan=nil then  frmParamDownloadPlan:=TfrmParamDownloadPlan.Create(Self);
    ShowForm(frmParamDownloadPlan);
end;

procedure TfrmServerMain.dxNavBar_ExitClick(Sender: TObject);
begin
  ac_exit.Execute;
end;

procedure TfrmServerMain.ac_AutoTestSMTParamExecute(Sender: TObject);
begin
  if frmAutoTestSMTItem=nil then  frmAutoTestSMTItem:=TfrmAutoTestSMTItem.Create(Self);
      ShowForm(frmAutoTestSMTItem);
end;

procedure TfrmServerMain.ac_AutoTestSMTItemPlanExecute(Sender: TObject);
begin
    if frmAutoTestSMTItemPlan=nil then  frmAutoTestSMTItemPlan:=TfrmAutoTestSMTItemPlan.Create(Self);
    ShowForm(frmAutoTestSMTItemPlan);
end;

//操作记录
procedure TfrmServerMain.N16Click(Sender: TObject);
begin
  if FrmOperRecord=nil then  FrmOperRecord:=TFrmOperRecord.Create(Self);
  ShowForm(FrmOperRecord);
end;

//SMT_GPS透传数据结果查询
procedure TfrmServerMain.ac_SMT_GpsTcDataExecute(Sender: TObject);
begin
  if FrmSMTTcDataForm=nil then  FrmSMTTcDataForm:=TFrmSMTTcDataForm.Create(Self);
    ShowForm(FrmSMTTcDataForm);
end;

//限制 服务器端口 文本框只能输入数字和Backspace键
procedure TfrmServerMain.edtTCPPortKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['0'..'9',#8]) then Key := #0;
end;

procedure TfrmServerMain.actTestResultExecute(Sender: TObject);
begin
  if FrmTestResult=nil then  FrmTestResult:=TFrmTestResult.Create(Self);
    ShowForm(FrmTestResult);
end;

procedure TfrmServerMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  ParamFilename:string;
  myinifile:Tinifile;   //保存参数所用的INI文件
  strTcpPort:string;
  bTcpAuto:Boolean;
begin
  if Application.MessageBox('您确认是否退出本应用系统','退出提示',MB_OKCANCEL+MB_ICONQUESTION)=idok then  begin
    //Application.Terminate;
    if Length(User.UserName) > 0 then
      InsertOperRecord(User.UserName,'退出 Server',DateTimeToStr(Now));   //超级管理员退出 记录    //要保存参数的文件
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    myinifile:=Tinifile.Create(ParamFilename);

    strTcpPort:=edtTCPPort.Text;
    bTcpAuto:=chkTCPAuto.Checked;

    with myinifile do
    begin
      writestring('Tcp', 'Port', strTcpPort);
      WriteBool('Tcp', 'Auto', bTcpAuto);
    end;
    myinifile.Free;
    Application.Terminate;
  end
  else
  begin
    canclose := False;
  end;
end;

function TfrmServerMain.CheckLocalIP():Boolean;
var
  ComputerName:array[0..MAX_COMPUTERNAME_LENGTH+1] of char;
  Size:Cardinal;
  wsadata:TWSAData;
  HostEnt:PHostEnt;
  strLocalIp:string;
begin
  Result:=True;
  Size:=MAX_COMPUTERNAME_LENGTH+1;
  GetComputerName(ComputerName,Size);  //获得本机名称

  WSAStartup(2,wsadata);
  HostEnt:=gethostbyname(PChar(StrPas(ComputerName)));
  if HostEnt<>nil then
  begin
    with HostEnt^ do
    begin
      strLocalIp:=Format('%d.%d.%d.%d',[Byte(h_addr^[0]),Byte(h_addr^[1]),Byte(h_addr^[2]),Byte(h_addr^[3])]);  //获得IP
    end;
    WSACleanup;
  end;
  if strLocalIp<>LocalIP then
  begin
    Result:=False;
  end; 
end;


procedure TfrmServerMain.ac_GiftParamExecute(Sender: TObject);
begin
if frmGiftParam=nil then  frmGiftParam:=TfrmGiftParam.Create(Self);
    ShowForm(frmGiftParam);
end;

procedure TfrmServerMain.ac_CartonParamExecute(Sender: TObject);
begin
if frmCartonParam=nil then  frmCartonParam:=TfrmCartonParam.Create(Self);
    ShowForm(frmCartonParam);
end;

procedure TfrmServerMain.ac_ManuOrderParamExecute(Sender: TObject);
begin
if frmManuOrderParam=nil then  frmManuOrderParam:=TfrmManuOrderParam.Create(Self);
    ShowForm(frmManuOrderParam);
end;

procedure TfrmServerMain.ac_CartonBoxResultExecute(Sender: TObject);
begin
if frmCartonBoxResult=nil then  frmCartonBoxResult:=TfrmCartonBoxResult.Create(Self);
    ShowForm(frmCartonBoxResult);
end;

procedure TfrmServerMain.FormShow(Sender: TObject);
begin
if(User.UserType='SuperAdmin') then
    begin
        ac_UserType.Enabled:=True;
        ac_User.Enabled:=True;
        ac_TestWrong.Enabled:=True;
        ac_TestPlan.Enabled:=True;
        ac_Set.Enabled:=True;
        ac_SubTestItem.Enabled:=True;
        ac_TestPlanSet.Enabled:=True;
        ac_AutoTestParam.Enabled:=True;
        ac_AutoTestModel.Enabled:=True;
        ac_AutoTestItemPlan.Enabled:=True;
        ac_TestParameter.Enabled:=True;
        ac_VersionModel.Enabled:=True;
        ac_AutoTestSMTParam.Enabled:=True;
        ac_AutoTestSMTItemPlan.Enabled:=True;
        ac_ParamDownloadParam.Enabled:=True;
        ac_ParamDownloadPlan.Enabled:=True;
        ac_OQCItemPlan.Enabled:=True;
        ac_OQCTestParam.Enabled:=True;
        ac_WriteImeiParam.Enabled:=True;
        ac_WriteImeiPlan.Enabled:=True;
        ac_GiftParam.Enabled:=True;
        ac_CartonParam.Enabled:=True;
        N16.Enabled:=True;
        ac_DataRel.Enabled:=true;
        
        end;
end;

procedure TfrmServerMain.ac_DataRelExecute(Sender: TObject);
begin
if frmDataRelResult=nil then  frmDataRelResult:=TfrmDataRelResult.Create(Self);
    ShowForm(frmDataRelResult);
end;

end.
