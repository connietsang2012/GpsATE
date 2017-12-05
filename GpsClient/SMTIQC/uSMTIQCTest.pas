unit uSMTIQCTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, SPComm, StdCtrls,uGlobalVar,
  ComCtrls, Grids, DBGrids, DB, MemDS, DBAccess, Uni,StrUtils, ComDrv32,
  OleServer, BarTender_TLB;

type
  TfrmSMTIQCTest = class(TfrmModule)
    UniQuery_TestResult_1: TUniQuery;
    intgrfldUniQuery_TestResult1Id: TIntegerField;
    SFUniQuery_TestResult1TestItem: TStringField;
    SFUniQuery_TestResult1SubTestItem: TStringField;
    SFUniQuery_TestResult1TestResult: TStringField;
    SFUniQuery_TestResult1TestValue: TStringField;
    DS_TestResult_1: TDataSource;
    UniQuery_TestResult_2: TUniQuery;
    intgrfldUniQuery_1Id: TIntegerField;
    SFUniQuery_1TestItem: TStringField;
    SFUniQuery_1SubTestItem: TStringField;
    SFUniQuery_1TestResult: TStringField;
    SFUniQuery_1TestValue: TStringField;
    DS_TestResult_2: TDataSource;
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
    pnlTestResult_1: TPanel;
    TestResultDetail_1: TDBGrid;
    TestResult1: TPanel;
    SB_TestStatus_1: TStatusBar;
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
    pnlTestResult_2: TPanel;
    TestResultDetail_2: TDBGrid;
    TestResult2: TPanel;
    SB_TestStatus_2: TStatusBar;
    grp3: TGroupBox;
    pnlResult4: TPanel;
    pnlResult5: TPanel;
    pnlTestResult_3: TPanel;
    TestResultDetail_3: TDBGrid;
    TestResult3: TPanel;
    SB_TestStatus_3: TStatusBar;
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
    pnlTestResult_4: TPanel;
    TestResultDetail_4: TDBGrid;
    TestResult4: TPanel;
    SB_TestStatus_4: TStatusBar;
    pnlResult6: TPanel;
    lbl2: TLabel;
    img3: TImage;
    img4: TImage;
    cbbCom_3: TComboBox;
    btnStart_3: TButton;
    btnReTest3: TButton;
    CheckBoxAutoTestCom1: TCheckBox;
    CheckBoxAutoTestCom2: TCheckBox;
    CheckBoxAutoTestCom3: TCheckBox;
    CheckBoxAutoTestCom4: TCheckBox;
    cbbComAgilent_5: TComboBox;
    tmrCheckComm1: TTimer;
    tmrCheckComm2: TTimer;
    tmrCheckComm3: TTimer;
    tmrCheckComm4: TTimer;
    btn2: TButton;
    unqry_TestResult_BoxCount: TUniQuery;
    ds1_InsertOQCBoxCount: TDataSource;
    btplctnSMTOQCPrint: TBTApplication;
    chk1: TCheckBox;
    lblPassCount: TLabel;
    lbl_TestCount: TLabel;
    edt_TestCount: TEdit;
    lbl5: TLabel;
    edt_setAutoTestCount: TEdit;
    DS_DstSubItem: TDataSource;
    UniQuery_DstSubItem: TUniQuery;
    intgrfldUniQuery_DstSubItemId: TIntegerField;
    strngfldSFUniQuery_DstSubItemItemModel: TStringField;
    strngfldSFUniQuery_DstSubItemItemName: TStringField;
    DS_TestItemParam_1: TDataSource;
    UniQuery_TestItemParam_ByItemName_1: TUniQuery;
    DS_TestItemParam_2: TDataSource;
    UniQuery_TestItemParam_ByItemName_2: TUniQuery;
    DS_TestItemParam_3: TDataSource;
    UniQuery_TestItemParam_ByItemName_3: TUniQuery;
    DS_TestItemParam_4: TDataSource;
    UniQuery_TestItemParam_ByItemName_4: TUniQuery;
    DS_TestResult_4: TDataSource;
    UniQuery_TestResult_4: TUniQuery;
    intgrfldUniQuery_TestResult_4Id: TIntegerField;
    strngfldSFUniQuery_TestResult_4TestItem: TStringField;
    strngfldSFUniQuery_TestResult_4SubTestItem: TStringField;
    strngfldSFUniQuery_TestResult_4TestResult: TStringField;
    strngfldSFUniQuery_TestResult_4TestValue: TStringField;
    UniQuery_TestResult_3: TUniQuery;
    intgrfldUniQuery_TestResult_3Id: TIntegerField;
    strngfldSFUniQuery_TestResult_3TestItem: TStringField;
    strngfldSFUniQuery_TestResult_3SubTestItem: TStringField;
    strngfldSFUniQuery_TestResult_3TestResult: TStringField;
    strngfldSFUniQuery_TestResult_3TestValue: TStringField;
    DS_TestResult_3: TDataSource;
    strngfldUniQuery_TestItemParam_ByItemName_4ItemModel: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4ItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4SubItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4AtComm: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4ReturnText: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4CompareValue: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4CompareRemark: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4Remark1: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4Remark2: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4Remark3: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4Remark4: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_4Remark5: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3ItemModel: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3ItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3SubItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3AtComm: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3ReturnText: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3CompareValue: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3CompareRemark: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3Remark1: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3Remark2: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3Remark3: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3Remark4: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_3Remark5: TStringField;
    UniQuery_TestItemParam_ByItemName_1Id: TIntegerField;
    strngfldUniQuery_TestItemParam_ByItemName_1ItemModel: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1ItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1SubItemName: TStringField;
    UniQuery_TestItemParam_ByItemName_1SendAtComm: TBooleanField;
    strngfldUniQuery_TestItemParam_ByItemName_1AtComm: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1ReturnText: TStringField;
    UniQuery_TestItemParam_ByItemName_1ReSendNum: TIntegerField;
    UniQuery_TestItemParam_ByItemName_1TestTimeOut: TIntegerField;
    UniQuery_TestItemParam_ByItemName_1Compare: TBooleanField;
    strngfldUniQuery_TestItemParam_ByItemName_1CompareValue: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1CompareRemark: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1Remark1: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1Remark2: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1Remark3: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1Remark4: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1Remark5: TStringField;
    UniQuery_TestItemParam_ByItemName_1_MASK_FROM_V2: TBytesField;
    UniQuery_TestItemParam_ByItemName_2Id: TIntegerField;
    strngfldUniQuery_TestItemParam_ByItemName_2ItemModel: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2ItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2SubItemName: TStringField;
    UniQuery_TestItemParam_ByItemName_2SendAtComm: TBooleanField;
    strngfldUniQuery_TestItemParam_ByItemName_2AtComm: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2ReturnText: TStringField;
    UniQuery_TestItemParam_ByItemName_2ReSendNum: TIntegerField;
    UniQuery_TestItemParam_ByItemName_2TestTimeOut: TIntegerField;
    UniQuery_TestItemParam_ByItemName_2Compare: TBooleanField;
    strngfldUniQuery_TestItemParam_ByItemName_2CompareValue: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2CompareRemark: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2Remark1: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2Remark2: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2Remark3: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2Remark4: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_2Remark5: TStringField;
    UniQuery_TestItemParam_ByItemName_2_MASK_FROM_V2: TBytesField;
    procedure BtnReTestClick(Sender: TObject);
    procedure btnStart_1Click(Sender: TObject);
    procedure btnStart_2Click(Sender: TObject);
    procedure btnStart_3Click(Sender: TObject);
    procedure btnStart_4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TestResultDetail_1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnBtn_ResultEnableClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure btnReTest1Click(Sender: TObject);
    procedure btnReTest2Click(Sender: TObject);
    procedure btnReTest3Click(Sender: TObject);
    procedure btnReTest4Click(Sender: TObject);
    {procedure Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
    procedure Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure TestResultDetail_2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_3DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_4DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tmrCheckComm1Timer(Sender: TObject);
    procedure tmrCheckComm2Timer(Sender: TObject);
    procedure tmrCheckComm3Timer(Sender: TObject);
    procedure tmrCheckComm4Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure Comm_01ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_02ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_03ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_04ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
  private
    { Private declarations }
    procedure AddToTestCount(CommIndex:Integer);
  public
    { Public declarations }
    procedure StartTest(CommIndex:Integer);override;
    procedure ResumeTestState(CommIndex:Integer);
    procedure InitAllControl(CommIndex:Integer);
    procedure SetResult(CommIndex:Integer;iResult:Integer);
    procedure SetDisplayResult(CommIndex:Integer;iResult:Integer);
    //procedure SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string);
    procedure AutoTest(CommIndex:Integer);
    procedure MsgCheckTested_SMT_1(iResult:Integer;CommIndex:Integer);
    procedure MsgCheckTested_SMT_2(iResult:Integer;CommIndex:Integer);
    procedure MsgCheckTested_SMT_3(iResult:Integer;CommIndex:Integer);
    procedure MsgCheckTested_SMT_4(iResult:Integer;CommIndex:Integer);
    procedure FindCommStart(CommIndex:Integer);
    procedure DeComReceieveDataSMTOQC(CommIndex:Integer);
    procedure PrintBoxCount(CommIndex:Integer);
    procedure MsgJuTestCount(var msg:TMessage);message  WM_TestCount;

    procedure TestDispose(CommIndex:Integer; bRedispose:Boolean);       //bRedispose:TRUE则还是当前测试大项，FALSE则为下一个测试大项
    procedure GetSubItemParam(CommIndex:Integer;strSubTestItem:string);  ///获得子项
    procedure SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string='';bSendNextCommand:Boolean=True);/////子项测试结果

    //procedure MsgCheckTestedSMT(iResult:Integer;Commindex:Integer);
  end;

var
  frmSMTIQCTest: TfrmSMTIQCTest;
  strTempChipRid:array[0..CommCount-1]of string;              //各串
  strOQCList:TStringList;

  StrListCompare_OQC:array[1..CommCount-1] of TStringList;                 //比对（范围）        -1
  StrListCompare_Name_OQC:array[1..CommCount-1] of TStringList;            //比对项目(名称)
  StrListCompareChar_OQC:array[1..CommCount-1] of TStringList;             //比对（范围）
  StrListCompareChar_Name_OQC:array[1..CommCount-1] of TStringList;            //比对项目(名称)

  strTotalOQC,strGPGSAOQC,strGPGSVOQC,strGPRMCOQC,strGPGGAOQC,strRMCResultOQC,strGGAResultOQC:array[1..CommCount-1] of TStringList;

  LR_GPGSV_DataOQC:array[1..CommCount-1] of TStringList;
  StrListMTKBMTOQC:array[1..CommCount-1] of TStringList;             //MTK电池电压通用指令返回值
implementation

uses uClientMain, uPublicFunc, uClientWelcome, uPrintProcess;

{$R *.dfm}

procedure TfrmSMTIQCTest.MsgCheckTested_SMT_1(iResult:Integer;CommIndex:Integer);
begin
  //Application.ProcessMessages;

  if iResult =0 then
  begin
    if strIMEI[CommIndex]<>'' then
    begin
      SetResult(CommIndex,iResult);

      {strOQCList.Add(strChipRid[CommIndex]);
    edt_TestCount.Text:=IntToStr(strOQCList.Count);
    if strOQCList.Count=StrToInt(Trim(edt_setAutoTestCount.Text)) then
    begin
       SendMessage(Self.Handle,WM_TestCount,0,CommIndex);
    end;    }
      Exit;

    end;

    if (Pos('GT02B',strSoftModel[CommIndex])>0) or (Pos('TR02B',strSoftModel[CommIndex])>0) then
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,10',True,CTimeOut);
    end
    else
    begin
         //NoteCommLog(CommIndex,'[S]=====ATLINK');
         //SendToComm(CommIndex,'ATLINK','AT^GT_CM=LINK');
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,7',True,CTimeOut);
    end;

  end
  else
  begin
     //NoteCommLog(CommIndex,'[S]=====ATLINK');
     //SendToComm(CommIndex,'ATLINK','AT^GT_CM=LINK');
     {SetResult(CommIndex,iResult);
     strTempChipRid[CommIndex]:=strChipRid[CommIndex];
     strOQCList.Add(strChipRid[CommIndex]);
     lblPassCount.Caption:=IntToStr(strOQCList.Count);}
     AutoTest(CommIndex);

  end;
  //Application.ProcessMessages;

end;
procedure TfrmSMTIQCTest.MsgCheckTested_SMT_2(iResult:Integer;CommIndex:Integer);
begin
  //Application.ProcessMessages;
  if iResult =0 then
  begin
    if strIMEI[CommIndex]<>'' then
    begin
      SetResult(CommIndex,iResult);
      Exit;
    end;

    strTempChipRid[CommIndex]:=strChipRid[CommIndex];
    if (Pos('GT02B',strSoftModel[CommIndex])>0) or (Pos('TR02B',strSoftModel[CommIndex])>0) then
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,10',True,CTimeOut);
    end
    else
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,7',True,CTimeOut);
    end;
  end
  else
  begin
     AutoTest(CommIndex);
  end;
  //Application.ProcessMessages;
end;
procedure TfrmSMTIQCTest.MsgCheckTested_SMT_3(iResult:Integer;CommIndex:Integer);
begin
  //Application.ProcessMessages;
  if iResult =0 then
  begin
    if strIMEI[CommIndex]<>'' then
    begin
      SetResult(CommIndex,iResult);
      Exit;
    end;

    strTempChipRid[CommIndex]:=strChipRid[CommIndex];
    if (Pos('GT02B',strSoftModel[CommIndex])>0) or (Pos('TR02B',strSoftModel[CommIndex])>0) then
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,10',True,CTimeOut);
    end
    else
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,7',True,CTimeOut);
    end;
  end
  else
  begin
      AutoTest(CommIndex);
  end;
  //Application.ProcessMessages;
end;
procedure TfrmSMTIQCTest.MsgCheckTested_SMT_4(iResult:Integer;CommIndex:Integer);
begin
  //Application.ProcessMessages;
  if iResult =0 then
  begin
    if strIMEI[CommIndex]<>'' then
    begin
      SetResult(CommIndex,iResult);
      Exit;
    end;

    strTempChipRid[CommIndex]:=strChipRid[CommIndex];
    if (Pos('GT02B',strSoftModel[CommIndex])>0) or (Pos('TR02B',strSoftModel[CommIndex])>0) then
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,10',True,CTimeOut);
    end
    else
    begin
        SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,7',True,CTimeOut);
    end;
  end
  else
  begin
     SetResult(CommIndex,iResult);
  end;
  //Application.ProcessMessages;
end;
procedure TfrmSMTIQCTest.StartTest(CommIndex:Integer);
begin
    strPlanName:='SMTIQCTest';
    ResumeTestState(CommIndex);
    //bGetTestItemed[CommIndex]:=True;
    BeginTest(CommIndex);
    strIMEI[CommIndex]:='';
    strChipRid[CommIndex]:='';
    strTempChipRid[CommIndex]:='';
end;
//恢复测试初始状态
procedure TfrmSMTIQCTest.ResumeTestState(CommIndex:Integer);
begin
    //删除测试详细结果
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Open;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).First;
    while not TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Eof do
    begin
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Delete;
    end;
    //初始化各控件显示
    InitAllControl(CommIndex);
    //测试结果初始化
    TfrmModule(CurrentFrom).SetResult(CommIndex,-2);
end;
procedure TfrmSMTIQCTest.InitAllControl(CommIndex:Integer);
var
    iIndex:Integer;
begin
    for iIndex := 1 to TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels.Count-1 do
    begin
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[iIndex].Text:='';
    end;
end;
procedure TfrmSMTIQCTest.BtnReTestClick(Sender: TObject);
begin
    StartTest(0);
end;

procedure TfrmSMTIQCTest.btnStart_1Click(Sender: TObject);
begin
  inherited;
    StartComm(1);
end;

procedure TfrmSMTIQCTest.btnStart_2Click(Sender: TObject);
begin
  inherited;
    StartComm(2);
end;

procedure TfrmSMTIQCTest.btnStart_3Click(Sender: TObject);
begin
  inherited;
    StartComm(3);
end;

procedure TfrmSMTIQCTest.btnStart_4Click(Sender: TObject);
begin
  inherited;
    StartComm(4);
end;

procedure TfrmSMTIQCTest.FormCreate(Sender: TObject);
var
    iCommIndex,Count:Integer;
    CommList: TStrings;
begin

    for iCommindex := 1 to CommCount-1 do
    begin
        CommList:= TStringList.Create;
        if GetSysComm(CommList) then
        begin
            for Count:= 0 to CommList.Count-1 do
            begin
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
            end;
            TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
        end;
        CommList.free;

        StrListCompare_OQC[iCommindex]:= TStringList.Create;            //比对（范围）
        StrListCompare_Name_OQC[iCommindex]:= TStringList.Create;       //比对项目(名称)
        StrListCompareChar_OQC[iCommindex]:= TStringList.Create;        //比对（范围）
        StrListCompareChar_Name_OQC[iCommindex]:= TStringList.Create;

        LR_GPGSV_DataOQC[iCommindex] := TStringList.Create;
        StrListMTKBMTOQC[iCommindex]:=TStringList.Create;

        TestSubItemList[iCommIndex].Clear;
    end;

    if strAutoTestModel='' then
    begin
        //Application.MessageBox('请在测试参数设置选项中选择要测试的机型!','警告',MB_OK+MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;
    strOQCList:=TStringList.Create;

    //将测试大项放入数据列表中
    TestItemList.Clear;
    UniQuery_DstSubItem.Params.ParamByName('ItemModel').Value:=strAutoTestModel;
    UniQuery_DstSubItem.Open;
    UniQuery_DstSubItem.First;
    while not UniQuery_DstSubItem.Eof do
    begin
        TestItemList.Add(UniQuery_DstSubItem.FieldByName('ItemName').AsString);
        UniQuery_DstSubItem.Next;
    end;
end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}
procedure TfrmSMTIQCTest.SetResult(CommIndex:Integer;iResult:Integer);
var
    strTestTime,strSendText:String;
    hWindow:HWND;
begin
    if strTempChipRid[CommIndex]<>'' then
    begin
      strChipRid[CommIndex]:=strTempChipRid[CommIndex];
    end;
    case iResult of
        -6,-5,-4,-3,-2:
            begin
                SetDisplayResult(CommIndex,iResult);
            end;
        1:
            begin
                if (not (strChipRid[CommIndex]='')) and bUpdateForm then
                begin
                  strSendText:=SysUtils.Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s',
                                    [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                    SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);

                  strSendText:=SysUtils.Format('Action=CheckTested_SetResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                  [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                  SendToServer(CommIndex,'CheckTested_SetResult',strSendText,True,CTimeOut*2);
                end
                else
                begin
                   SetDisplayResult(CommIndex,iResult);

                end;


            end;
        0:
            begin
                if (not (strChipRid[CommIndex]='')) and bUpdateForm then
                begin
                        strSendText:=SysUtils.Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s',
                                        [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                    SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);
                end;
                SetDisplayResult(CommIndex,iResult);
            end;

    end;
    //Application.ProcessMessages;
end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}
procedure TfrmSMTIQCTest.SetDisplayResult(CommIndex:Integer;iResult:Integer);
var
    strTestTime,strSendText:String;
    hWindow:HWND;
begin
    //Application.ProcessMessages;
    if (iResult=0) or (iResult=1) or (iResult=-1) then
    begin
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
        SendCommList[CommIndex].Clear;
        SendAgilentCommList[CommIndex].Clear;
        SerialInfo[CommIndex].bAllowTest:=False;
        bAppendResult[CommIndex]:=False;
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[1].Text:='测试完成';
        strTestTime:=SysUtils.Format('总耗测试时间:%f秒',[(GetTickCount-TestStartTickCount[CommIndex])/1000]);
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[2].Text:=strTestTime;
    end;



    case iResult of
    -7:
     begin
      //Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='默认值未修改!';
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clRed;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;

     -6:
    begin
      //Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:=VERSIONERROR;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
    -5: //为了不弹出框
    begin
      //Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:=NOTNEED;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
    
  -4: //为了不弹出框
    begin
      //Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='此机子已测试过！';
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
        -3:
            begin
                //Application.ProcessMessages;
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
                ChectAllowStartTest(CommIndex);
                //Application.ProcessMessages;
            end;
        -2:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
            end;
        1:
            begin
                //AddToTestCount(CommIndex); //添加到已测试上

                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='此机子已通过SMT自动测试';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clGreen;

                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
                //Application.ProcessMessages;
            end;
        -1:
            begin
               TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='Fail';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clRed;
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
            end;
        0:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='此机子未通过SMT自动测试';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clRed;

                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
                //Application.ProcessMessages;
            end;
    end;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      if (iResult=0) or (iResult=1)then
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           FindCommStart(CommIndex);
        end;
      end;
    end;
    //Application.ProcessMessages;
end;

procedure TfrmSMTIQCTest.AddToTestCount(CommIndex:Integer);
begin
   if strOQCList.IndexOf(strChipRid[CommIndex])<0 then
     begin
        strOQCList.Add(strChipRid[CommIndex]);
     end;
      edt_TestCount.Text:=IntToStr(strOQCList.Count);

     if edt_setAutoTestCount.Text=edt_TestCount.Text then
     begin
        PostMessage(Handle,WM_TestCount,CommIndex,CommIndex);
     end;
end;

//开始测试
procedure TfrmSMTIQCTest.AutoTest(CommIndex:Integer);
var
    Index: Integer;
    strTemp:string;
begin
    //Application.ProcessMessages;
    bTestFail[CommIndex]:=False;
    TPanel(FindComponent('pnlTestResult_'+inttostr(CommIndex))).Enabled:=False;
    //恢复串口的测试状态
    bAppendResult[CommIndex]:=True;
    ResumeTestState(CommIndex);
    TestItemLists[CommIndex].Clear;
    for Index := 0 to TestItemList.Count - 1 do
        TestItemLists[CommIndex].Add(TestItemList.Strings[index]);

    if TestItemLists[CommIndex].Count<=0 then
    begin
        //MessageBox(Handle,'请选择测试项？','警告！',MB_ICONWARNING);
        SetResult(CommIndex,1);
    end
    else
    begin

        SerialInfo[CommIndex].bAllowTest:=True;
        //开始测试
        TestDispose(CommIndex,True);

    end;
    //Application.ProcessMessages;
end;
procedure TfrmSMTIQCTest.TestResultDetail_1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=1;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmSMTIQCTest.btnBtn_ResultEnableClick(Sender: TObject);
var
    CommIndex:Integer;
begin
  inherited;
    for CommIndex := 1 to CommCount-1 do
    begin
        TPanel(FindComponent('pnlTestResult_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;

procedure TfrmSMTIQCTest.FormResize(Sender: TObject);
begin
  inherited;
    pnl1.Left:=30;
    pnl1.Top:=0;
end;

{procedure TfrmSMTIQCTest.Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmSMTIQCTest.Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
  inherited;
    CommIndex:=1;
    DeComReceieveDataSMTOQC(CommIndex);
end;

procedure TfrmSMTIQCTest.btnReTest1Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=1;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmSMTIQCTest.btnReTest2Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=2;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmSMTIQCTest.btnReTest3Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=3;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmSMTIQCTest.btnReTest4Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=4;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;
{procedure TfrmSMTIQCTest.Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmSMTIQCTest.Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
    strSendText:string;
begin
  inherited;
    CommIndex:=2;
    DeComReceieveDataSMTOQC(CommIndex);
end;

{procedure TfrmSMTIQCTest.Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmSMTIQCTest.Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
    strSendText:string;
begin
  inherited;
    CommIndex:=3;
    DeComReceieveDataSMTOQC(CommIndex);
end;

{procedure TfrmSMTIQCTest.Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmSMTIQCTest.Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
    strSendText:string;
begin
  inherited;
    CommIndex:=4;
    DeComReceieveDataSMTOQC(CommIndex);
end;

procedure TfrmSMTIQCTest.TestResultDetail_2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=2;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmSMTIQCTest.TestResultDetail_3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=3;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmSMTIQCTest.TestResultDetail_4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=4;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmSMTIQCTest.FindCommStart(CommIndex:Integer);
begin
    //Application.ProcessMessages;
    iSendAtTestCount[CommIndex]:=0;
    TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Interval:=1*1000;
    TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
    SerialInfo[CommIndex].iCheckCommNo:=0;
    SerialInfo[CommIndex].bAllowCheck:=false;
    //Application.ProcessMessages;
end;

procedure TfrmSMTIQCTest.tmrCheckComm1Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=1;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(1000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
               {if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex); }
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmSMTIQCTest.tmrCheckComm2Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=2;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(1000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
               {  if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex);}
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmSMTIQCTest.tmrCheckComm3Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=3;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(1000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
                { if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex); }
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmSMTIQCTest.tmrCheckComm4Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=4;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(1000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
               {  if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex); }
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmSMTIQCTest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  strOQCList.Free;
end;

procedure TfrmSMTIQCTest.btn2Click(Sender: TObject);
begin
  PrintBoxCount(1);
end;

procedure TfrmSMTIQCTest.DeComReceieveDataSMTOQC(CommIndex:Integer);
var
strSendText:string;
bSecondCompare:Boolean;
 iIndex,count,jIndex,i,j:Integer;
strTemp,strStart,strEnd,strValue,strMaxValue,strMinValue,strName:string;
label CompareBMT;
begin
    CommIndex:=1;
    if (strCmdCommKey[CommIndex]= 'AT') then
    begin
        if (pos('OK',StrCommRecText[CommIndex])>0) then
        begin
            SendToComm(CommIndex);
            strSendText:=SysUtils.Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
              	['AutoTestSMT',strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                SendToServer(CommIndex,'CheckTested_SMT',strSendText,True,CTimeOut*2);
        end
        else
            Exit;
    end
    else if (strCmdCommKey[CommIndex]= 'ATID') then
    begin
        if (pos('00000000000000000000000000000000',strChipRid[CommIndex])<>0) or (strChipRid[CommIndex]='') then Exit;

        //strDeleteImei:=strChipRid[CommIndex];
        SendToComm(CommIndex);
        SendToComm(CommIndex,'AT','AT');
    end

    {else if strCmdCommKey[CommIndex]= 'ATLINK' then
    begin
       if (pos('LINK',StrCommRecText[CommIndex])>0) then
       begin
         SendToComm(CommIndex);
         NoteCommLog(CommIndex,'[R]=======LINK回复值===='+StrCommRecText[CommIndex]);
         strCmdCommLink[CommIndex]:=MidStr(StrCommRecText[CommIndex], Pos(':',StrCommRecText[CommIndex])+1,1);

         NoteCommLog(CommIndex,'[R]=======LINK截取===='+strCmdCommLink[CommIndex]);
         if strCmdCommLink[CommIndex]<>'9' then
         begin
           SetDisplayResult(CommIndex,-7);
         end
         else
         begin
           //SendToComm(CommIndex,'ATEGMRR_SMT','AT+EGMR=0,7',True,CTimeOut);
           SetResult(CommIndex,1);
           strTempChipRid[CommIndex]:=strChipRid[CommIndex];
           strOQCList.Add(strChipRid[CommIndex]);
           edt_TestCount.Text:=IntToStr(strOQCList.Count);

           if strOQCList.Count=StrToInt(Trim(edt_setAutoTestCount.Text)) then
           begin
             PrintBoxCount(CommIndex);
           end;
         end;
       end;
    end }
    else if strCmdCommKey[CommIndex]= 'ATEGMRR_SMT' then          //读机子的IMEI
    begin
        if Pos('+EGMR:',StrCommRecText[CommIndex])>0 then
        begin
            SendToComm(CommIndex);

            //取机子的IMEI
            strIMEI[CommIndex]:=MidStr(PChar(StrCommRecText[CommIndex]),
                                                Pos('+EGMR: "',StrCommRecText[CommIndex])+strlen('+EGMR: "'),
                                                Pos('"OK',StrCommRecText[CommIndex])-Pos('+EGMR: "',StrCommRecText[CommIndex])-strlen('+EGMR: "'));
            //若IMEI为358688000000158,则表明从没测试过,要写个临时IMEI进去
            if strIMEI[CommIndex]<>'358688000000158' then
            begin
              strChipRid[CommIndex]:='00000000000000000'+strIMEI[CommIndex];
              strSendText:=SysUtils.Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
              	['AutoTestSMT',strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                SendToServer(CommIndex,'CheckTested_SMT',strSendText,True,CTimeOut*2);
            end
            else
            begin
                SetResult(CommIndex,0);
            end;

        end;
    end
    else if (pos(strCmdReturnText[CommIndex],StrCommRecText[CommIndex])>0) then
    begin
      if strCmdReturnText[CommIndex]='TEST' then
      begin
        //StrCommRecText[CommIndex]:='AT^GT_CM-TEST';
        if pos('AT^GT_CM-TEST',StrCommRecText[CommIndex])>0 then
        begin
          if MidStr(StrCommRecText[CommIndex],pos('AT^GT_CM-TEST',StrCommRecText[CommIndex])+strlen('AT^GT_CM-TEST'),4)<>'TEST'  then
          begin
            //SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
            Exit;
          end;
        end;
      end;
      if bCompare[CommIndex] then
      begin
        if pos(' ',StrCommRecText[CommIndex])<>0 then
            StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],' ','',[rfReplaceAll]);
        if pos('+EADC:',StrCommRecText[CommIndex])<>0 then
                        StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],'+EADC:','',[rfReplaceAll]);

        //strTestValue[CommIndex]:='';
        //strTemp:=StrCommRecText[CommIndex];

        StrListCompare_OQC[CommIndex].Delimiter:=';';
        StrListCompare_OQC[CommIndex].DelimitedText:=UpperCase(strCompare[CommIndex]);

        StrListCompareChar_OQC[CommIndex].Delimiter:='|';
        StrListCompareChar_OQC[CommIndex].DelimitedText:=UpperCase(strRemark[CommIndex]);

        bSecondCompare:=False;
CompareBMT:
        strTestValue[CommIndex]:='';
        strTemp:=StrCommRecText[CommIndex];
        for iIndex := 0 to StrListCompare_OQC[CommIndex].Count-2 do
        begin
          StrListCompare_Name_OQC[CommIndex].Delimiter:='=';
          StrListCompare_Name_OQC[CommIndex].DelimitedText:=UpperCase(StrListCompare_OQC[CommIndex][iIndex]);

          if strCmdCommKey[CommIndex]= 'BMT_MTK' then
          begin
            StrListMTKBMTOQC[CommIndex].Delimiter:=',';
            StrListMTKBMTOQC[CommIndex].DelimitedText:=StrCommRecText[CommIndex];
            if iIndex=0 then
              strValue:=StrListMTKBMTOQC[CommIndex][0]
            else if iIndex=1 then
              strValue:=StrListMTKBMTOQC[CommIndex][3]
            else if iIndex=2 then
              strValue:=StrListMTKBMTOQC[CommIndex][4];
          end
          else
          begin
            StrListCompareChar_Name_OQC[CommIndex].Delimiter:=';';
            StrListCompareChar_Name_OQC[CommIndex].DelimitedText:=UpperCase(StrListCompareChar_OQC[CommIndex][iIndex]);

            strStart:=StrListCompareChar_Name_OQC[CommIndex].Values['S'];
            strEnd:=StrListCompareChar_Name_OQC[CommIndex].Values['E'];
            strTemp:=MidStr(strTemp,Pos(strStart,strTemp)+Length(strStart),Length(strTemp)-Pos(strStart,strTemp));
            //strValue:=LeftStr(strTemp,Pos(strEnd,strTemp)-Length(strEnd));
            //
            strValue:=LeftStr(strTemp,Pos(strEnd,strTemp)-1);
            if strValue='' then
            begin
              Exit;
            end;
            strTemp:=MidStr(strTemp,Pos(strEnd,strTemp)+Length(strEnd),Length(strTemp)-Pos(strEnd,strTemp));
          end;

          strMinValue:=LeftStr(StrListCompare_Name_OQC[CommIndex][1],Pos('~',StrListCompare_Name_OQC[CommIndex][1])-1);
          strMaxValue:=StrUtils.RightStr(StrListCompare_Name_OQC[CommIndex][1],Length(StrListCompare_Name_OQC[CommIndex][1])-Pos('~',StrListCompare_Name_OQC[CommIndex][1]));

          strTestValue[CommIndex]:=SysUtils.Format('%s%s:%s;',[strTestValue[CommIndex],StrListCompare_Name_OQC[CommIndex][0],strValue]);
          if (StrToFloat(strValue)<StrToFloat(strMinValue)) or (StrToFloat(strValue)>StrToFloat(strMaxValue)) then
          begin
            if bSecondCompare then Exit;
            StrListCompare_OQC[CommIndex].Delimiter:=';';
            StrListCompare_OQC[CommIndex].DelimitedText:=UpperCase(strRemark2[CommIndex]);
            bSecondCompare:=True;
            if strRemark2[CommIndex]<>'' then
              goto CompareBMT
            else
              exit;
          end
        end;
        //对备注二进行解析
        SetTestItemResult(CommIndex,TestItemLists[CommIndex].Strings[0],1,strTestValue[CommIndex]);
      end
      else if strCmdReturnText[CommIndex]<>'TEST_OK' then
      begin
        if TestItemLists[CommIndex].Count>0  then
        begin
          SetTestItemResult(CommIndex,TestItemLists[CommIndex].Strings[0],1,strTestValue[CommIndex]);
        end;
      end;
    end
end;


procedure TfrmSMTIQCTest.Comm_01ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=1;
    DeComReceieveDataSMTOQC(CommIndex);
end;



procedure TfrmSMTIQCTest.Comm_02ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=2;
    DeComReceieveDataSMTOQC(CommIndex);
end;

procedure TfrmSMTIQCTest.Comm_03ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=3;
    DeComReceieveDataSMTOQC(CommIndex);
end;

procedure TfrmSMTIQCTest.Comm_04ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=4;
    DeComReceieveDataSMTOQC(CommIndex);
end;

procedure TfrmSMTIQCTest.PrintBoxCount(CommIndex:Integer);
var
   BoxNo:string;
   Year,Month,Day,Hour,Min,Sec,Msc:Word;     //时,分,秒,毫秒
   i:Integer;
   strTemp:string;
   strFile:String;
begin
inherited;
  //BoxNo:=DateTimetostr(now());
  DecodeTime(now(),Hour,Min,Sec,Msc);
  DecodeDate(Now(), Year, Month, Day);
  BoxNo:='XXK'+IntToStr(Year)+IntToStr(Month)+IntToStr(Day)+IntToStr(Hour)+IntToStr(Min);
  strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\llf\SMTOQC.btw';

  //显示打印进度
  frmPrintProcess := TfrmPrintProcess.Create(nil);
  frmPrintProcess.Show;
  frmPrintProcess.pb1.Min:=0;
  frmPrintProcess.pb1.Max:=strOQCList.Count;
  frmPrintProcess.pb1.Position:=0;
  try
  for i:=0 to strOQCList.Count-1 do
  begin
       unqry_TestResult_BoxCount.SQL.Clear;
       strtemp:='Insert into Gps_AutoTestSMT_BoxCont(BoxNo,SN,Version,TestTime) values('''
                          + BoxNo+''','''+ strOQCList.Strings[i]+''','''+strVersion[CommIndex] +''','''+ DateTimetostr(now())+''')';

       unqry_TestResult_BoxCount.SQL.Text:=strTemp;
       unqry_TestResult_BoxCount.Execute;
       frmPrintProcess.pb1.Position:=frmPrintProcess.pb1.Position+1;
  end;
  except
     frmPrintProcess.Close;
      MessageBox(frmSMTIQCTest.Handle,'数据保存出错!', '数据保存', MB_YESNO);
     Exit;
  end;
  try
  with btplctnSMTOQCPrint.Formats.Open(strFile, True, '') do //打开打印标签文件
  begin
      SetNamedSubStringValue('BoxNum',BoxNo);
      SetNamedSubStringValue('ZhiDan','数量:' + IntToStr(strOQCList.Count));
      SetNamedSubStringValue('Text','日期:' + IntToStr(Year)+ '-'+IntToStr(Month)+ '-'+IntToStr(Day));
      try
      PrintOut(False, False);
      Close(btDoNotSaveChanges); //关闭不保存
      except
        frmPrintProcess.Close;
        MessageBox(frmSMTIQCTest.Handle,'打印错误！','错误',MB_OK);
        Close(btDoNotSaveChanges); //关闭不保存
        Exit;
      end;
  end;
  except
      MessageBox(frmSMTIQCTest.Handle,'打开BTW文件出错！','错误',MB_OK);
      frmPrintProcess.Close;
      exit;
  end;

  frmPrintProcess.Close;
  edt_TestCount.Text:='0';
  strOQCList.Clear;
end;

procedure TfrmSMTIQCTest.MsgJuTestCount(var msg:TMessage);
var
  CommIndex:Integer;
begin
  CommIndex:=msg.LParam;
  //BeginThread();
  PrintBoxCount(CommIndex);
end;

procedure TfrmSMTIQCTest.TestDispose(CommIndex:Integer; bRedispose:Boolean);
var
    strTestItem:string;
begin
    //一大测试项完成
    if (not bRedispose) then
    begin
        if TestItemLists[CommIndex].Count>=0 then
        begin
            //NoteErrorCommLog(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0]);
            TestItemLists[CommIndex].Delete(0);
        end;
    end;

    if TestItemLists[CommIndex].Count<=0 then
    begin
        if bTestFail[CommIndex] then
        begin
            SetResult(CommIndex,0);
        end
        else
            SetResult(CommIndex,1);
        Exit;
    end;

    strTestItem:=TestItemLists[CommIndex].Strings[0];
    GetSubItemParam(CommIndex,strTestItem);
end;

procedure TfrmSMTIQCTest.GetSubItemParam(CommIndex:Integer; strSubTestItem:string);
var
  strTemp,strCmd:string;
begin
   strTemp:=SysUtils.Format('ItemModel=''%s'' and ItemName=''%s''',[strAutoTestModel,strSubTestItem]);

    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Active:=False;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Filter:=strTemp;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Filtered:=True;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Active:=True;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).First;
    TestSubItemList[CommIndex].Clear;
    while not TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Eof do
    begin
      strCmd:=(TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);
      NoteCommLog(CommIndex,TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);
      strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;

      TestSubItemList[CommIndex].Add(TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);

      SendToComm(CommIndex,strCmd,strCmd+#13+#10,
                    True,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('TestTimeOut').AsInteger*1000,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('ReturnText').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Compare').AsBoolean,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('CompareValue').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark1').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SendAtComm').AsBoolean,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('ReSendNum').AsInteger,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark2').AsString);
      TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Next;
    end;

end;

procedure TfrmSMTIQCTest.SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string='';bSendNextCommand:Boolean=True);
var
    strResult:string;
begin
    Sleep(10);
    GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
                        bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);
    if (strCmdCommKey[CommIndex]<>'ATALLOWTEST')then
    begin
        case TestResult of
          0:
                begin
                    strResult:='FAIL';
                    bTestFail[CommIndex]:=True;
                end;
          1:
                begin
                  strResult:='PASS';
                end;
        end;
        //TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Append;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').Value:=strResult;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestValue').Value:=TestValue;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Post;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Last;

        TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
        TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
    end;

    //测试失败则终止测试,否则继续测试
    if (TestResult=0) and (not BasicTestParam.FailContinueTest) then
        SetResult(CommIndex,0)
    else
    begin
        if bSendNextCommand then
        begin
            strTestValue[CommIndex]:='';
            SendToComm(CommIndex);
            //NoteErrorCommLog(CommIndex,'SetTestItemResult'+TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0]);

            if TestSubItemList[CommIndex].Count>0 then
              TestSubItemList[CommIndex].Delete(0);

            //NoteErrorCommLog(CommIndex,'SetTestItemResult'+inttostr(TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Count)+
                IntToStr(SendCommList[CommIndex].Count);
            //Sleep(100);
            if ((TestSubItemList[CommIndex].Count<=0) and
                (SendCommList[CommIndex].Count<=0)) then
            begin
              TestDispose(CommIndex,False);
            end
        end;
    end;
   
end;

end.
