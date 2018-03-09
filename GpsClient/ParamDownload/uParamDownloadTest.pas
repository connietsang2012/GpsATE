unit uParamDownloadTest;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uModuleForm, ExtCtrls, SPComm, StdCtrls, uGlobalVar,
    ComCtrls, Grids, DBGrids, uDmMain, MemTableDataEh, Db, ADODB,
    DataDriverEh, StrUtils, MemDS, DBAccess, Uni, ComDrv32;

type
    TfrmParamDownloadTest = class(TfrmModule)
        Panel1: TPanel;
        grp1: TGroupBox;
        pnl3: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        Label2: TLabel;
        imgCommGreen: TImage;
        imgCommRed: TImage;
        cbbCom_1: TComboBox;
        btnStart_1: TButton;
        btnReTest1: TButton;
        Btn_ResultEnable: TButton;
        pnlTestResult_1: TPanel;
        TestResultDetail_1: TDBGrid;
        TestResult1: TPanel;
        SB_TestStatus_1: TStatusBar;
        DS_TestResult_1: TDataSource;
        TestItem: TListBox;
        TestParameter1: TDBGrid;
        DS_TestItemParam_1: TDataSource;
        TesItem_Comm1: TListBox;
        TesItem_Comm2: TListBox;
        TesItem_Comm3: TListBox;
        TesItem_Comm4: TListBox;
        TestParameter2: TDBGrid;
        TestParameter3: TDBGrid;
        TestParameter4: TDBGrid;
        grp2: TGroupBox;
        estResult1: TPanel;
        estResult2: TPanel;
        estResult3: TPanel;
        lbl4: TLabel;
        img1: TImage;
        img2: TImage;
        lbl5: TLabel;
        cbbCom_2: TComboBox;
        btnStart_2: TButton;
        btnReTest2: TButton;
        pnlTestResult_2: TPanel;
        TestResultDetail_2: TDBGrid;
        TestResult2: TPanel;
        SB_TestStatus_2: TStatusBar;
        DS_TestItemParam_2: TDataSource;
        DS_TestResult_2: TDataSource;
        grp3: TGroupBox;
        estResult4: TPanel;
        estResult5: TPanel;
        estResult6: TPanel;
        lbl2: TLabel;
        img3: TImage;
        img4: TImage;
        cbbCom_3: TComboBox;
        btnStart_3: TButton;
        btnReTest3: TButton;
        pnlTestResult_3: TPanel;
        TestResultDetail_3: TDBGrid;
        TestResult3: TPanel;
        SB_TestStatus_3: TStatusBar;
        grp4: TGroupBox;
        estResult9: TPanel;
        estResult10: TPanel;
        estResult11: TPanel;
        lbl3: TLabel;
        img5: TImage;
        img6: TImage;
        lbl6: TLabel;
        cbbCom_4: TComboBox;
        btnStart_4: TButton;
        btnReTest4: TButton;
        pnlTestResult_4: TPanel;
        TestResultDetail_4: TDBGrid;
        TestResult4: TPanel;
        SB_TestStatus_4: TStatusBar;
        DS_TestItemParam_3: TDataSource;
        DS_TestResult_3: TDataSource;
        DS_TestItemParam_4: TDataSource;
        DS_TestResult_4: TDataSource;
        UniQuery_TestItemParam_ByItemName_1: TUniQuery;
        UniQuery_TestItemParam_ByItemName_2: TUniQuery;
        UniQuery_TestItemParam_ByItemName_3: TUniQuery;
        UniQuery_TestItemParam_ByItemName_4: TUniQuery;
        UniQuery_TestResult_1: TUniQuery;
        UniQuery_TestResult_2: TUniQuery;
        intgrfldUniQuery_TestResult1Id: TIntegerField;
        SFUniQuery_TestResult1TestItem: TStringField;
        SFUniQuery_TestResult1SubTestItem: TStringField;
        SFUniQuery_TestResult1TestResult: TStringField;
        SFUniQuery_TestResult1TestValue: TStringField;
        intgrfldUniQuery_1Id: TIntegerField;
        SFUniQuery_1TestItem: TStringField;
        SFUniQuery_1SubTestItem: TStringField;
        SFUniQuery_1TestResult: TStringField;
        SFUniQuery_1TestValue: TStringField;
        UniQuery_TestResult_3: TUniQuery;
        intgrfld5: TIntegerField;
        SF11: TStringField;
        SF12: TStringField;
        SF13: TStringField;
        SF14: TStringField;
        UniQuery_TestResult_4: TUniQuery;
        intgrfld6: TIntegerField;
        SF15: TStringField;
        SF16: TStringField;
        SF17: TStringField;
        SF18: TStringField;
        UniQuery_DstSubItem: TUniQuery;
        intgrfldUniQuery_1Id1: TIntegerField;
        SFUniQuery_1ItemModel: TStringField;
        SFUniQuery_1ItemName: TStringField;
        DS_DstSubItem: TDataSource;
        intgrfldUniQuery_TestItemParam_ByItemName_1Id: TIntegerField;
        SFUniQuery_TestItemParam_ByItemName_1ItemModel: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1ItemName: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1SubItemName: TStringField;
        blnfldUniQuery_TestItemParam_ByItemName_1SendAtComm: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_1AtComm: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1ReturnText: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_1ReSendNum: TIntegerField;
        intgrfldUniQuery_TestItemParam_ByItemName_1TestTimeOut: TIntegerField;
        blnfldUniQuery_TestItemParam_ByItemName_1Compare: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_1CompareValue: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1CompareRemark: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1Remark1: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1Remark2: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1Remark3: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1Remark4: TStringField;
        SFUniQuery_TestItemParam_ByItemName_1Remark5: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_2Id: TIntegerField;
        SFUniQuery_TestItemParam_ByItemName_2ItemModel: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2ItemName: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2SubItemName: TStringField;
        blnfldUniQuery_TestItemParam_ByItemName_2SendAtComm: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_2AtComm: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2ReturnText: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_2ReSendNum: TIntegerField;
        intgrfldUniQuery_TestItemParam_ByItemName_2TestTimeOut: TIntegerField;
        blnfldUniQuery_TestItemParam_ByItemName_2Compare: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_2CompareValue: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2CompareRemark: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2Remark1: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2Remark2: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2Remark3: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2Remark4: TStringField;
        SFUniQuery_TestItemParam_ByItemName_2Remark5: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_3Id: TIntegerField;
        SFUniQuery_TestItemParam_ByItemName_3ItemModel: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3ItemName: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3SubItemName: TStringField;
        blnfldUniQuery_TestItemParam_ByItemName_3SendAtComm: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_3AtComm: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3ReturnText: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_3ReSendNum: TIntegerField;
        intgrfldUniQuery_TestItemParam_ByItemName_3TestTimeOut: TIntegerField;
        blnfldUniQuery_TestItemParam_ByItemName_3Compare: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_3CompareValue: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3CompareRemark: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3Remark1: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3Remark2: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3Remark3: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3Remark4: TStringField;
        SFUniQuery_TestItemParam_ByItemName_3Remark5: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_4Id: TIntegerField;
        SFUniQuery_TestItemParam_ByItemName_4ItemModel: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4ItemName: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4SubItemName: TStringField;
        blnfldUniQuery_TestItemParam_ByItemName_4SendAtComm: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_4AtComm: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4ReturnText: TStringField;
        intgrfldUniQuery_TestItemParam_ByItemName_4ReSendNum: TIntegerField;
        intgrfldUniQuery_TestItemParam_ByItemName_4TestTimeOut: TIntegerField;
        blnfldUniQuery_TestItemParam_ByItemName_4Compare: TBooleanField;
        SFUniQuery_TestItemParam_ByItemName_4CompareValue: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4CompareRemark: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4Remark1: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4Remark2: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4Remark3: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4Remark4: TStringField;
        SFUniQuery_TestItemParam_ByItemName_4Remark5: TStringField;
        CheckBoxAutoTestCom1: TCheckBox;
        CheckBoxAutoTestCom2: TCheckBox;
        CheckBoxAutoTestCom3: TCheckBox;
        CheckBoxAutoTestCom4: TCheckBox;
        tmrCheckComm1: TTimer;
        tmrCheckComm2: TTimer;
        tmrCheckComm3: TTimer;
        tmrCheckComm4: TTimer;
        tmrSleep4: TTimer;
        tmrSleep3: TTimer;
        tmrSleep2: TTimer;
        tmrSleep1: TTimer;
        TestItemParam_Comm4: TListBox;
        TestItemParam_Comm3: TListBox;
        TestItemParam_Comm2: TListBox;
        TestItemParam_Comm1: TListBox;
        edt_PreIMEI: TEdit;
        edt_IMEI: TEdit;
        Label3: TLabel;
        Label4: TLabel;
        {procedure Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
          DataSize: Integer);
        procedure Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
          DataSize: Integer);
        procedure Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
          DataSize: Integer);
        procedure Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
          DataSize: Integer);
        procedure Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
          DataSize: Integer);}

        procedure Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
            BufferLength: Word);
        procedure Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
            BufferLength: Word);
        procedure Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
            BufferLength: Word);
        procedure Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
            BufferLength: Word);
        procedure Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
            BufferLength: Word);

        procedure BtnReTestClick(Sender: TObject);
        procedure btnStart_1Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);

        procedure btnReTest1Click(Sender: TObject);
        procedure TestResultDetail_1DrawColumnCell(Sender: TObject;
            const Rect: TRect; DataCol: Integer; Column: TColumn;
            State: TGridDrawState);
        procedure Btn_ResultEnableClick(Sender: TObject);
        procedure btnReTest2Click(Sender: TObject);
        procedure btnStart_2Click(Sender: TObject);

        procedure btnStart_3Click(Sender: TObject);
        procedure btnStart_4Click(Sender: TObject);
        procedure btnReTest3Click(Sender: TObject);
        procedure btnReTest4Click(Sender: TObject);

        procedure FormResize(Sender: TObject);
        procedure tmrCheckComm1Timer(Sender: TObject);
        procedure tmrCheckComm2Timer(Sender: TObject);
        procedure tmrCheckComm3Timer(Sender: TObject);
        procedure tmrCheckComm4Timer(Sender: TObject);
        procedure tmrSleep1Timer(Sender: TObject);
        procedure tmrSleep2Timer(Sender: TObject);
        procedure tmrSleep3Timer(Sender: TObject);
        procedure tmrSleep4Timer(Sender: TObject);
        procedure Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure Comm_01ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure Comm_02ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure Comm_03ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure Comm_04ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure edt_IMEIKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
        {procedure SetResult(CommIndex:Integer;iResult:Integer);
        procedure ResumeTestState(CommIndex:Integer);
        procedure SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string='';bSendNextCommand:Boolean=True);
        procedure InitAllControl(CommIndex:Integer);
        procedure GetItemParam(CommIndex:Integer;strTestItem:string);
        procedure TestDispose(CommIndex:Integer; bRedispose:Boolean=False);       //bRedispose:重新处理当前测试项标志
        procedure AutoTest(CommIndex:Integer);}
    public
        { Public declarations }
        procedure StartTest(CommIndex: Integer); override;
        procedure SetResult(CommIndex: Integer; iResult: Integer);
        procedure SetDisplayResult(CommIndex: Integer; iResult: Integer);
        procedure ResumeTestState(CommIndex: Integer);
        procedure SetTestItemResult(CommIndex: Integer; TestItem: string; TestResult: Integer; TestValue: string = ''; bSendNextCommand: Boolean = True);
        procedure InitAllControl(CommIndex: Integer);
        procedure GetItemParam(CommIndex: Integer; strTestItem: string);
        procedure TestDispose(CommIndex: Integer; bRedispose: Boolean = False); //bRedispose:重新处理当前测试项标志
        procedure AutoTest(CommIndex: Integer);
        procedure FindCommStart(CommIndex: Integer);
        procedure DeComReceieveDataParamDownLoad(CommIndex: Integer);

        procedure DisposeCRC(var StrListNumberSign: TStringList; var comm: Integer);
    end;

var
    frmParamDownloadTest: TfrmParamDownloadTest;
    strCRC: string;
    strParamDownTestValue: array[1..4] of string;
implementation

uses uClientMain, uPublicFunc;

{$R *.dfm}

procedure TfrmParamDownloadTest.StartTest(CommIndex: Integer);
begin
    //bGetTestItemed[CommIndex]:=True;
    strPlanName := 'ParamDownload';
    ResumeTestState(CommIndex);
    BeginTest(CommIndex);
    //bGetTestItemed[CommIndex]:=True;
    //btnPass.Visible:=False;
end;
{procedure TfrmParamDownloadTest.Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer); }

procedure TfrmParamDownloadTest.Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);

var
    CommIndex: Integer;
    strSendText: string;
    iIndex, count, jIndex: Integer;
    strTemp, strStart, strEnd, strValue, strMaxValue, strMinValue, strName: string;
begin
    CommIndex := 0;
    inherited;
    //if not SerialInfo[CommIndex].bAllowTest then  Exit;
    Application.ProcessMessages;
    try
        if strCmdCommKey[CommIndex] = 'AT' then
        begin
            if (pos('OK', StrCommRecText[CommIndex]) > 0) then
            begin
                AutoTest(CommIndex);
            end
            else
                Exit;

        end
        else
            if (strCmdCommKey[CommIndex] = 'ATID') or (strCmdCommKey[CommIndex] = 'ATVERSION') then
            begin
            end

    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
    end;
    Application.ProcessMessages;
end;

procedure TfrmParamDownloadTest.BtnReTestClick(Sender: TObject);
begin
    Application.ProcessMessages;
    StartTest(0);
end;

procedure TfrmParamDownloadTest.btnStart_1Click(Sender: TObject);
begin
    inherited;
    StartComm(1);
    edt_IMEI.Text := '';
    edt_IMEI.SetFocus;
end;

procedure TfrmParamDownloadTest.FormCreate(Sender: TObject);
var
    iCommIndex, Count: Integer;
    CommList: TStrings;
begin
    for iCommindex := 1 to CommCount - 1 do
    begin
        CommList := TStringList.Create;
        if GetSysComm(CommList) then
        begin
            for Count := 0 to CommList.Count - 1 do
            begin
                TComboBox(FindComponent('cbbCom_' + inttostr(iCommindex))).Items.Add(CommList[Count]);
                TComboBox(FindComponent('cbbCom_' + inttostr(iCommindex))).ItemIndex := 0;
            end;
        end;
        CommList.free;

        //恢复初始测试状态
        ResumeTestState(iCommindex);
    end;

    for iCommindex := 1 to CommCount - 1 do
    begin
        //各测试项参数
        StrListCompare_ParamDownload[iCommindex] := TStringList.Create; //比对（范围）
        StrListCompare_Name_ParamDownload[iCommindex] := TStringList.Create; //比对项目(名称)
        StrListCompareChar_ParamDownload[iCommindex] := TStringList.Create; //比对（范围）
        StrListCompareChar_Name_ParamDownload[iCommindex] := TStringList.Create;

        //bGetTestItemed[iCommindex]:=True;
    end;

    //if strAutoTestModel='' then

    if strAutoTestModel = '' then //2014.10.29
    begin
        Application.MessageBox('请在测试参数设置选项中选择要测试的机型和IMEI号段!', '警告', MB_OK + MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;

    //将要测试的项放至列表框中
    TestItem.Items.Clear;
    UniQuery_DstSubItem.Close;
    UniQuery_DstSubItem.Params.ParamByName('ItemModel').Value := strAutoTestModel;
    UniQuery_DstSubItem.Open;
    UniQuery_DstSubItem.First;
    while not UniQuery_DstSubItem.Eof do
    begin
        TestItem.Items.Add(UniQuery_DstSubItem.FieldByName('ItemName').AsString);
        UniQuery_DstSubItem.Next;
    end;
end;

procedure TfrmParamDownloadTest.FormClose(Sender: TObject;
    var Action: TCloseAction);
var
    Count: Integer;
begin
    inherited;
    for Count := 1 to CommCount - 1 do
    begin
        StrListCompare_ParamDownload[Count].Free;
        StrListCompare_Name_ParamDownload[Count].Free;
        StrListCompareChar_ParamDownload[Count].Free;
        StrListCompareChar_Name_ParamDownload[Count].Free;

        TTimer(FindComponent('tmrCheckComm' + inttostr(Count))).Enabled := False;
    end;
end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}

procedure TfrmParamDownloadTest.SetResult(CommIndex: Integer; iResult: Integer);
var
    strTestTime, strSendText: string;
    hWindow: HWND;
    iRecordCount:Integer;
begin
    Application.ProcessMessages;

    case iResult of
        -3, -2, -4, -5, -6, -7:
            begin
                SetDisplayResult(CommIndex, iResult);
            end;
        1:
            begin
                edt_IMEI.Text := '';
                edt_IMEI.SetFocus;
                if (not (strChipRid[CommIndex] = '')) and bUpdateForm then
                begin
                    {strSendText:=Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#',
                      [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                      SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);}

                    {strSendText := Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#VersionS=%s#Imei=%s#iResult=%d#Tester=%s#',
                        [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], strVersionS[CommIndex], strIMEI[CommIndex], iResult, User.UserName]);
                    SendToServer(CommIndex, 'UpdateResult', strSendText, True, CTimeOut * 2);  }

                    UpdateForm(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], strVersionS[CommIndex], strIMEI[CommIndex], iResult, User.UserName,iRecordCount);
                    if iRecordCount = 0 then
                    begin
                        SetResult(CommIndex, -2);
                        MessageBox(0, UPDATEFORMERROR, '警告', MB_ICONWARNING + MB_OK);
                    end;

                    strSendText := Format('Action=CheckTested_SetResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                        [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], User.UserName]);
                    SendToServer(CommIndex, 'CheckTested_SetResult', strSendText, True, CTimeOut * 2);
                end
                else
                    SetDisplayResult(CommIndex, iResult);
            end;
        0:
            begin
                edt_IMEI.Text := '';
                edt_IMEI.SetFocus;
                if (not (strChipRid[CommIndex] = '')) and bUpdateForm then
                begin
                    {strSendText := Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#VersionS=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#',
                        [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersionS[CommIndex], strVersion[CommIndex], strIMEI[CommIndex], iResult, User.UserName]);
                    SendToServer(CommIndex, 'UpdateResult', strSendText, True, CTimeOut * 2);}

                    UpdateForm(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersionS[CommIndex], strVersion[CommIndex], strIMEI[CommIndex], iResult, User.UserName,iRecordCount);
                    if iRecordCount = 0 then
                    begin
                        SetResult(CommIndex, -2);
                        MessageBox(0, UPDATEFORMERROR, '警告', MB_ICONWARNING + MB_OK);
                    end;
                end;
                SetDisplayResult(CommIndex, iResult);
            end;
    end;
    Application.ProcessMessages;
end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}

procedure TfrmParamDownloadTest.SetDisplayResult(CommIndex: Integer; iResult: Integer);
var
    strTestTime, strSendText: string;
    hWindow: HWND;
begin
    Application.ProcessMessages;
    if (iResult = 0) or (iResult = 1) then
    begin
        strChipRid[CommIndex] := '';
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
        bAppendResult[CommIndex] := False;
        SendCommList[CommIndex].Clear;
        SerialInfo[CommIndex].bAllowTest := False;

        TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items.Clear;

        TStatusBar(FindComponent('SB_TestStatus_' + inttostr(CommIndex))).Panels[1].Text := '测试完成';
        strTestTime := Format('总耗测试时间:%f秒', [(GetTickCount - TestStartTickCount[CommIndex]) / 1000]);
        TStatusBar(FindComponent('SB_TestStatus_' + inttostr(CommIndex))).Panels[2].Text := strTestTime;

        //bGetTestItemed[CommIndex]:=True;
    end;

    case iResult of
        -8:
            begin
                Application.ProcessMessages;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := IMEIRANGERROR;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clYellow;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);
            end;
        -7:
            begin
                Application.ProcessMessages;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := IMEIUNTEST;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clYellow;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);

            end;
        -6:
            begin
                Application.ProcessMessages;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := VERSIONERROR;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clYellow;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);
            end;
        -5: //为了不弹出框
            begin
                Application.ProcessMessages;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := NOTNEED;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clYellow;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);
            end;
        -4: //为了不弹出框
            begin
                Application.ProcessMessages;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := '此机子已测试过！';
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clYellow;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);
            end;
        -3:
            begin
                Application.ProcessMessages;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := '';
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clSilver;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -2:
            begin
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := '';
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clSilver;
            end;
        {-1:
        begin
          TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='请重启机子';
          TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
        end;}
        1:
            begin
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := 'PASS';
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clGreen;
                Application.ProcessMessages;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
                //BeginTest(CommIndex);
            end;
        0:
            begin
                {SendToComm(CommIndex);
                strSendText:=Format('AT^GT_CM=vermode,0,%s',[strCRC]);
                SendToComm(CommIndex,'RESETVERSION',strSendText);

                SendToComm(CommIndex);}
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := 'FAIL';
                TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clRed;

                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
    end;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom' + inttostr(CommIndex))).Checked then
    begin
        if (iResult = 0) or (iResult = 1) then
        begin
            if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '断开' then
            begin
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                FindCommStart(CommIndex);
            end;
        end;
    end;
    Application.ProcessMessages;
end;
//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果

procedure TfrmParamDownloadTest.SetTestItemResult(CommIndex: Integer; TestItem: string; TestResult: Integer; TestValue: string; bSendNextCommand: Boolean);
var
    strResult: string;
begin
    Application.ProcessMessages;
    GetSendedCommCmdkey(CommIndex, strCmdReturnText[CommIndex], strCmdCommKey[CommIndex],
        bCompare[CommIndex], strCompare[CommIndex], strRemark[CommIndex], strSubTestItemName[CommIndex], strRemark2[CommIndex]);

    case TestResult of
        0:
            begin
                strParamDownTestValue[CommIndex] := '';
                strResult := 'FAIL';
                bTestFail[CommIndex] := True;
            end;
        1:
            begin
                if strRemark[CommIndex] = 'DISPLAY' then
                begin
                    TestValue := strCmdReturnText[CommIndex];
                end
                else
                    if strParamDownTestValue[CommIndex] = 'VERSIONS' then
                    begin
                        strParamDownTestValue[CommIndex] := '';
                        TestValue := strVersionS[CommIndex];
                    end;
                strResult := 'PASS';
            end;
    end;
    {TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Append;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestItem').Value:=TestItem;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('SubTestItem').Value:=strSubTestItemName[CommIndex];}
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).FieldByName('TestResult').Value := strResult;
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).FieldByName('TestValue').Value := TestValue;
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).Post;
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).Last;
    //TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Close;
    //TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Open;
    TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Caption := '';
    TPanel(FindComponent('TestResult' + inttostr(CommIndex))).Color := clSilver;

    Application.ProcessMessages;
    //测试失败则终止测试,否则继续测试
    if (TestResult = 0) and (not BasicTestParam.FailContinueTest) then
    begin
        SetResult(CommIndex, 0);
        NoteCommLog(CommIndex, '[S:]====TestResult0');
    end
    else
    begin
        if bSendNextCommand then
        begin
            strTestValue[CommIndex] := '';
            SendToComm(CommIndex);
            if TListBox(FindComponent('TestItemParam_Comm' + inttostr(CommIndex))).Count >= 0 then
                TListBox(FindComponent('TestItemParam_Comm' + inttostr(CommIndex))).Items.Delete(0);
            if (TListBox(FindComponent('TestItemParam_Comm' + inttostr(CommIndex))).Count <= 0) and
                (SendCommList[CommIndex].Count <= 0) then
            begin
                TestDispose(CommIndex, False);
            end
        end;
    end;
    Application.ProcessMessages;
end;

procedure TfrmParamDownloadTest.InitAllControl(CommIndex: Integer);
var
    iIndex: Integer;
begin
    for iIndex := 1 to TStatusBar(FindComponent('SB_TestStatus_' + inttostr(CommIndex))).Panels.Count - 1 do
    begin
        TStatusBar(FindComponent('SB_TestStatus_' + inttostr(CommIndex))).Panels[iIndex].Text := '';
    end;

end;
//==================================================================//
//==================================================================//

//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果
//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果

procedure TfrmParamDownloadTest.GetItemParam(CommIndex: Integer; strTestItem: string);
var
    strCmd, strReturn {,strRemark}: string; //要发送的指令，返回值和备注
    CurrentSystemTime: TSystemTime; //当前系统时间
    iBetweenHours, iBetweenHoursChangePos: LongWord; //当前与1980-1-6的相隔时间，高低字节转换后的相隔时间
    strEpoData: array[0..63] of string; //分段后的EPO数据

    iIndex: Integer;
    iTemp: Integer;
    strTemp: string;
label
    NextLoop;

begin
    Application.ProcessMessages;
    //bGetTestItemed[CommIndex]:=False;
    strTemp := Format('ItemModel=''%s'' and ItemName=''%s''', [strAutoTestModel, strTestItem]);
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Close;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Filter := strTemp;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Filtered := True;

    Application.ProcessMessages;

    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Open;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).First;

    TListBox(FindComponent('TestItemParam_Comm' + inttostr(CommIndex))).Clear;
    while not TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Eof do
    begin
        TListBox(FindComponent('TestItemParam_Comm' + inttostr(CommIndex))).Items.Add(TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('SubItemName').AsString);
        NoteCommLog(CommIndex, TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('SubItemName').AsString);
        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Next;
    end;

    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).First;
    while not TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Eof do
    begin
        //strRemark:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark1').AsString;
        //格式化EPO_TIME的发送指令
        strCmd := TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('AtComm').AsString;
        SendToComm(CommIndex, strCmd, strCmd + #13 + #10,
            True,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('TestTimeOut').AsInteger * 1000,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('ReturnText').AsString,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('SubItemName').AsString,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('Compare').AsBoolean,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('CompareValue').AsString,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('Remark1').AsString,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('SendAtComm').AsBoolean,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('ReSendNum').AsInteger,
            TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).FieldByName('Remark2').AsString);
        NextLoop:
        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_' + inttostr(CommIndex))).Next;
    end;
    //bGetTestItemed[CommIndex]:=True;
    //SendToComm(CommIndex);
    Application.ProcessMessages;
end;

//进行测试

procedure TfrmParamDownloadTest.TestDispose(CommIndex: Integer; bRedispose: Boolean = False);
var
    strTestItem: string;
begin
    //一大测试项完成
    if (not bRedispose) then
        if TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Count >= 0 then
            TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items.Delete(0);

    if TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Count <= 0 then
    begin
        if bTestFail[CommIndex] then
        begin
            NoteCommLog(CommIndex, '[S:]====bTestFail');
            SetResult(CommIndex, 0);
        end
        else
            SetResult(CommIndex, 1);
        Exit;
    end;

    strTestItem := TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0];
    GetItemParam(CommIndex, strTestItem);
end;
//开始测试

procedure TfrmParamDownloadTest.AutoTest(CommIndex: Integer);
var
    Index: Integer;
    strTemp: string;
begin
    Application.ProcessMessages;
    bTestFail[CommIndex] := False;
    bAppendResult[CommIndex] := True;
    TPanel(FindComponent('pnlTestResult_' + inttostr(CommIndex))).Enabled := False;
    //恢复串口的测试状态
    ResumeTestState(CommIndex);

    TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Clear;
    for Index := 0 to TestItem.Count - 1 do
        TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items.Add(TestItem.Items[index]);

    //若无测试项则退出
    if TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Count <= 0 then
    begin
        Application.MessageBox('请选择测试项？', '警告！', MB_ICONWARNING);
        SetResult(CommIndex, 0);
    end
    else
    begin
        //TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Selected[0]:=True;
        SerialInfo[CommIndex].bAllowTest := True;
        //开始测试
        TestDispose(CommIndex, True);
        //获得开始测试时间
        //TestStartTickCount[CommIndex]:=GetTickCount;
    end;
    Application.ProcessMessages;
end;
{procedure TfrmParamDownloadTest.Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}

procedure TfrmParamDownloadTest.Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    inherited;
    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;
//恢复测试初始状态

procedure TfrmParamDownloadTest.ResumeTestState(CommIndex: Integer);
begin
    //删除测试详细结果
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).Close;
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).Open;
    TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).First;
    while not TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).Eof do
    begin
        TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).Delete;
    end;
    //初始化各控件显示
    InitAllControl(CommIndex);
    //测试结果初始化
    SetResult(CommIndex, -2);
end;

procedure TfrmParamDownloadTest.btnReTest1Click(Sender: TObject);
var
    CommIndex: Integer;
begin
    inherited;
    CommIndex := 1;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom' + inttostr(CommIndex))).Checked then
    begin
        begin
            if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '断开' then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
                SerialInfo[CommIndex].bAllowTest := True;
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                Sleep(1000);
                if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '连接' then
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
            end;
        end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmParamDownloadTest.TestResultDetail_1DrawColumnCell(
    Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    if TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).FieldByName('TestResult').AsString = 'FAIL' then
        //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_' + inttostr(CommIndex))).Canvas.Brush.Color := clYellow;
            TDBGrid(FindComponent('TestResultDetail_' + inttostr(CommIndex))).Canvas.Pen.Mode := pmMask;
            TDBGrid(FindComponent('TestResultDetail_' + inttostr(CommIndex))).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;

    end
    else
        if TUniQuery(FindComponent('UniQuery_TestResult_' + inttostr(CommIndex))).FieldByName('TestResult').AsString = 'PASS' then
            //先写一个值
        begin
            if DataCol = 2 then
            begin
                TDBGrid(FindComponent('TestResultDetail_' + inttostr(CommIndex))).Canvas.Brush.Color := clLime;
                TDBGrid(FindComponent('TestResultDetail_' + inttostr(CommIndex))).Canvas.Pen.Mode := pmMask;
                TDBGrid(FindComponent('TestResultDetail_' + inttostr(CommIndex))).DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
        end
end;

procedure TfrmParamDownloadTest.Btn_ResultEnableClick(Sender: TObject);
var
    CommIndex: Integer;
begin
    inherited;
    for CommIndex := 1 to CommCount - 1 do
    begin
        TPanel(FindComponent('pnlTestResult_' + inttostr(CommIndex))).Enabled := True;
    end;
end;

procedure TfrmParamDownloadTest.btnReTest2Click(Sender: TObject);
var
    CommIndex: Integer;
begin
    inherited;
    CommIndex := 2;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom' + inttostr(CommIndex))).Checked then
    begin
        begin
            if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '断开' then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
                SerialInfo[CommIndex].bAllowTest := True;
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                Sleep(1000);
                if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '连接' then
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
            end;
        end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmParamDownloadTest.btnStart_2Click(Sender: TObject);
begin
    inherited;
    StartComm(2);
end;

{procedure TfrmParamDownloadTest.Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer); }

procedure TfrmParamDownloadTest.Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    CommIndex: Integer;
begin
    CommIndex := 2;
    inherited;

    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

procedure TfrmParamDownloadTest.btnStart_3Click(Sender: TObject);
begin
    inherited;
    StartComm(3);
end;

procedure TfrmParamDownloadTest.btnStart_4Click(Sender: TObject);
begin
    inherited;
    StartComm(4);
end;

procedure TfrmParamDownloadTest.btnReTest3Click(Sender: TObject);
var
    CommIndex: Integer;
begin
    inherited;
    CommIndex := 3;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom' + inttostr(CommIndex))).Checked then
    begin
        begin
            if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '断开' then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
                SerialInfo[CommIndex].bAllowTest := True;
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                Sleep(1000);
                if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '连接' then
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
            end;
        end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmParamDownloadTest.btnReTest4Click(Sender: TObject);
var
    CommIndex: Integer;
begin
    inherited;
    CommIndex := 4;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom' + inttostr(CommIndex))).Checked then
    begin
        begin
            if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '断开' then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
                SerialInfo[CommIndex].bAllowTest := True;
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                Sleep(1000);
                if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '连接' then
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
            end;
        end;
    end;
    StartTest(CommIndex);
end;

{procedure TfrmParamDownloadTest.Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}

procedure TfrmParamDownloadTest.Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    CommIndex: Integer;
begin
    CommIndex := 3;
    inherited;

    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

{procedure TfrmParamDownloadTest.Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer); }

procedure TfrmParamDownloadTest.Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    CommIndex: Integer;
    strSendText: string;
    iIndex, count, jIndex, i, j: Integer;
    strTemp, strStart, strEnd, strValue, strMaxValue, strMinValue, strName: string;
    GpsDb: Integer;
begin
    CommIndex := 4;
    inherited;

    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

procedure TfrmParamDownloadTest.FormResize(Sender: TObject);
begin
    inherited;
    Panel1.Left := 0; //30
    Panel1.Top := 0;
end;

procedure TfrmParamDownloadTest.FindCommStart(CommIndex: Integer);
begin
    Application.ProcessMessages;
    iSendAtTestCount[CommIndex] := 0;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Interval := 1 * 1000;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
    SerialInfo[CommIndex].iCheckCommNo := 0;
    SerialInfo[CommIndex].bAllowCheck := false;
    Application.ProcessMessages;
end;

procedure TfrmParamDownloadTest.tmrCheckComm1Timer(Sender: TObject);
var
    CommList: TStrings;
    strcommF: string;
    iCommindex, Count: Integer;
    CommIndex: Integer;
begin
    CommIndex := 1;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
    //清除串口信息
    SerialInfo[CommIndex].bAllowTest := False;
    SerialInfo[CommIndex].strChipRid := '';
    SendCommList[CommIndex].Clear;
    //获取当前存在串口
    CommList := TStringList.Create;
    strcommF := '';
    if GetSysComm(CommList) then
    begin
        for Count := 0 to CommList.Count - 1 do
        begin
            if Count = 0 then strcommF := CommList[Count]
            else strcommF := strcommF + ',' + CommList[Count];
        end;
    end;
    CommList.free;

    if (Pos(strComm[CommIndex], strcommF) > 0) then //第一次检测到COmm
    begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
            SerialInfo[CommIndex].iCheckCommNo := SerialInfo[CommIndex].iCheckCommNo + 1;
            Sleep(2000);
            if SerialInfo[CommIndex].iCheckCommNo <= 1 then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
                Exit;
            end
            else
            begin
                if TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text = '' then
                begin
                    TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := strComm[CommIndex];
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                    {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                      StartTest(CommIndex); }
                      { if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                      StartTest(CommIndex);}
                    if bUsbReceieveData then
                    begin
                        if TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Connected then
                            StartTest(CommIndex);
                    end
                    else
                    begin
                        if TComm(FindComponent('Comm_' + inttostr(CommIndex))).Handle > 0 then
                            StartTest(CommIndex);
                    end;
                end
            end;
        end
        else
        begin
            TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        end;
    end
    else
    begin
        TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := '';
        TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        SerialInfo[CommIndex].bAllowCheck := true;
    end;
end;

procedure TfrmParamDownloadTest.tmrCheckComm2Timer(Sender: TObject);
var
    CommList: TStrings;
    strcommF: string;
    iCommindex, Count: Integer;
    CommIndex: Integer;
begin
    CommIndex := 2;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
    //清除串口信息
    SerialInfo[CommIndex].bAllowTest := False;
    SerialInfo[CommIndex].strChipRid := '';
    SendCommList[CommIndex].Clear;
    //获取当前存在串口
    CommList := TStringList.Create;
    strcommF := '';
    if GetSysComm(CommList) then
    begin
        for Count := 0 to CommList.Count - 1 do
        begin
            if Count = 0 then strcommF := CommList[Count]
            else strcommF := strcommF + ',' + CommList[Count];
        end;
    end;
    CommList.free;

    if (Pos(strComm[CommIndex], strcommF) > 0) then //第一次检测到COmm
    begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
            SerialInfo[CommIndex].iCheckCommNo := SerialInfo[CommIndex].iCheckCommNo + 1;
            Sleep(2000);
            if SerialInfo[CommIndex].iCheckCommNo <= 1 then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
                Exit;
            end
            else
            begin
                if TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text = '' then
                begin
                    TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := strComm[CommIndex];
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                    {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                      StartTest(CommIndex);}
                      { if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                      StartTest(CommIndex);  }
                    if bUsbReceieveData then
                    begin
                        if TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Connected then
                            StartTest(CommIndex);
                    end
                    else
                    begin
                        if TComm(FindComponent('Comm_' + inttostr(CommIndex))).Handle > 0 then
                            StartTest(CommIndex);
                    end;
                end
            end;
        end
        else
        begin
            TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        end;
    end
    else
    begin
        TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := '';
        TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        SerialInfo[CommIndex].bAllowCheck := true;
    end;
end;

procedure TfrmParamDownloadTest.tmrCheckComm3Timer(Sender: TObject);
var
    CommList: TStrings;
    strcommF: string;
    iCommindex, Count: Integer;
    CommIndex: Integer;
begin
    CommIndex := 3;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
    //清除串口信息
    SerialInfo[CommIndex].bAllowTest := False;
    SerialInfo[CommIndex].strChipRid := '';
    SendCommList[CommIndex].Clear;
    //获取当前存在串口
    CommList := TStringList.Create;
    strcommF := '';
    if GetSysComm(CommList) then
    begin
        for Count := 0 to CommList.Count - 1 do
        begin
            if Count = 0 then strcommF := CommList[Count]
            else strcommF := strcommF + ',' + CommList[Count];
        end;
    end;
    CommList.free;

    if (Pos(strComm[CommIndex], strcommF) > 0) then //第一次检测到COmm
    begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
            SerialInfo[CommIndex].iCheckCommNo := SerialInfo[CommIndex].iCheckCommNo + 1;
            Sleep(2000);
            if SerialInfo[CommIndex].iCheckCommNo <= 1 then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
                Exit;
            end
            else
            begin
                if TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text = '' then
                begin
                    TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := strComm[CommIndex];
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                    {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                      StartTest(CommIndex);}
                     {  if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                      StartTest(CommIndex); }
                    if bUsbReceieveData then
                    begin
                        if TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Connected then
                            StartTest(CommIndex);
                    end
                    else
                    begin
                        if TComm(FindComponent('Comm_' + inttostr(CommIndex))).Handle > 0 then
                            StartTest(CommIndex);
                    end;
                end
            end;
        end
        else
        begin
            TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        end;
    end
    else
    begin
        TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := '';
        TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        SerialInfo[CommIndex].bAllowCheck := true;
    end;
end;

procedure TfrmParamDownloadTest.tmrCheckComm4Timer(Sender: TObject);
var
    CommList: TStrings;
    strcommF: string;
    iCommindex, Count: Integer;
    CommIndex: Integer;
begin
    CommIndex := 4;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
    //清除串口信息
    SerialInfo[CommIndex].bAllowTest := False;
    SerialInfo[CommIndex].strChipRid := '';
    SendCommList[CommIndex].Clear;
    //获取当前存在串口
    CommList := TStringList.Create;
    strcommF := '';
    if GetSysComm(CommList) then
    begin
        for Count := 0 to CommList.Count - 1 do
        begin
            if Count = 0 then strcommF := CommList[Count]
            else strcommF := strcommF + ',' + CommList[Count];
        end;
    end;
    CommList.free;

    if (Pos(strComm[CommIndex], strcommF) > 0) then //第一次检测到COmm
    begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
            SerialInfo[CommIndex].iCheckCommNo := SerialInfo[CommIndex].iCheckCommNo + 1;
            Sleep(2000);
            if SerialInfo[CommIndex].iCheckCommNo <= 1 then
            begin
                TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
                Exit;
            end
            else
            begin
                if TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text = '' then
                begin
                    TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := strComm[CommIndex];
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
                    {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                      StartTest(CommIndex);}
                      { if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                      StartTest(CommIndex);  }
                    if bUsbReceieveData then
                    begin
                        if TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Connected then
                            StartTest(CommIndex);
                    end
                    else
                    begin
                        if TComm(FindComponent('Comm_' + inttostr(CommIndex))).Handle > 0 then
                            StartTest(CommIndex);
                    end;
                end
            end;
        end
        else
        begin
            TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        end;
    end
    else
    begin
        TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := '';
        TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
        SerialInfo[CommIndex].bAllowCheck := true;
    end;
end;

procedure TfrmParamDownloadTest.tmrSleep1Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    TTimer(FindComponent('tmrSleep' + inttostr(CommIndex))).Enabled := False;
    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
end;

procedure TfrmParamDownloadTest.tmrSleep2Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 2;
    TTimer(FindComponent('tmrSleep' + inttostr(CommIndex))).Enabled := False;
    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
end;

procedure TfrmParamDownloadTest.tmrSleep3Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 3;
    TTimer(FindComponent('tmrSleep' + inttostr(CommIndex))).Enabled := False;
    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
end;

procedure TfrmParamDownloadTest.tmrSleep4Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 4;
    TTimer(FindComponent('tmrSleep' + inttostr(CommIndex))).Enabled := False;
    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
end;

procedure TfrmParamDownloadTest.DeComReceieveDataParamDownLoad(CommIndex: Integer);
var
    strSendText: string;
    iIndex, count, jIndex, i, j: Integer;
    strParamIMEI, strTemp, strStart, strEnd, strValue, strMaxValue, strMinValue, strName: string;
    GpsDb: Integer;
    readIMEI: string;
begin
    if not SerialInfo[CommIndex].bAllowTest then Exit;
    GetSendedCommCmdkey(CommIndex, strCmdReturnText[CommIndex], strCmdCommKey[CommIndex],
        bCompare[CommIndex], strCompare[CommIndex], strRemark[CommIndex], strSubTestItemName[CommIndex], strRemark2[CommIndex]);
    Application.ProcessMessages;
    try
        if strCmdCommKey[CommIndex] = 'AT' then
        begin
            if (pos('OK', StrCommRecText[CommIndex]) > 0) then
            begin
                SendToComm(CommIndex);
                AutoTest(CommIndex);
            end
            else
                Exit;

        end
        else
            if strCmdCommKey[CommIndex] = 'ATEGMR' then
            begin
                if Pos('+EGMR:', StrCommRecText[CommIndex]) > 0 then
                begin
                    if pos(#$D, StrCommRecText[CommIndex]) <> 0 then
                        StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$D, '', [rfReplaceAll]);
                    if pos(#$A, StrCommRecText[CommIndex]) <> 0 then
                        StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$A, '', [rfReplaceAll]);

                    strParamIMEI := GetIMEI(StrCommRecText[CommIndex]);
                    NoteCommLog(CommIndex, '[IMEI:]====' + strParamIMEI);
                    {if (strParamIMEI <strIMEIStart) or (strParamIMEI>strIMEIEnd) then
                    begin
                      NoteCommLog(CommIndex,'[IMEIRANG:]===='+strIMEIStart+'---'+strIMEIEnd);
                      TfrmModule(CurrentFrom).SetDisplayResult(CommIndex,-8);
                      Exit;
                    end;}
                    //strSoftModel[CommIndex]:=strParamAutoTestModel;
                    //strVersion[CommIndex]:=strParamAutoTestModel;
                    SendToComm(CommIndex);
                    SendToComm(CommIndex, 'ATID', 'AT^GT_CM=ID,1');
                end;
            end
            else
                if (strRemark[CommIndex] = 'VERSIONMODE') then //server端配置修改版本指令
                begin
                    strSendText := Format('Action=CalculateCRC#ChipRid=%s#', [strChipRid[CommIndex]]);
                    SendToServer(CommIndex, 'CalculateCRC', strSendText, True, CTimeOut * 2);
                    exit;
                    //strCRC:= Format('%s,2,%s',[StrCommRecText[CommIndex],]);
                    //strSendText:=Format('%s,2,%s',[StrCommRecText[CommIndex]])
                end
                else
                    if (strCmdCommKey[CommIndex] = 'VERMODE') then
                    begin
                        if (pos(strCmdReturnText[CommIndex], StrCommRecText[CommIndex]) > 0) then
                        begin
                            SendToComm(CommIndex);
                            SendToComm(CommIndex, 'ATPARAMVERSION', 'AT^GT_CM=VERSION'); //这是在修改版本后程序会自动发查看新版本指令
                        end
                        else
                            Exit;
                    end
                    else
                        if strCmdCommKey[CommIndex] = 'ATPARAMVERSION' then //读下载参数后新版本
                        begin
                            if Pos('[VERSION]', StrCommRecText[CommIndex]) > 0 then
                            begin
                                if Pos('[BUILD]', StrCommRecText[CommIndex]) > 0 then
                                begin
                                    if pos(#$D, StrCommRecText[CommIndex]) <> 0 then
                                        StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$D, '', [rfReplaceAll]);
                                    if pos(#$A, StrCommRecText[CommIndex]) <> 0 then
                                        StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$A, '', [rfReplaceAll]);

                                    SendToComm(CommIndex);

                                    //取得当前机子的版本
                                    StrCommRecText[CommIndex] := MidStr(PChar(StrCommRecText[CommIndex]),
                                        Pos('[VERSION]', StrCommRecText[CommIndex]),
                                        StrLen(PChar(StrCommRecText[CommIndex])) - Pos('[VERSION]', StrCommRecText[CommIndex]));
                                    if Pos('[BUILD]', StrCommRecText[CommIndex]) > 0 then
                                    begin
                                        strVersionS[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos('[BUILD]', StrCommRecText[CommIndex]) - 1);
                                    end
                                    else
                                    begin
                                        strVersionS[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos('[BRANCH]', StrCommRecText[CommIndex]) - 1);
                                    end;
                                    strVersionS[CommIndex] := stringreplace(strVersionS[CommIndex], '[VERSION]', '', [rfReplaceAll]);
                                    strParamDownTestValue[CommIndex] := 'VERSIONS'; //让测试成功时显示新版本
                                    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
                                end
                                else
                                begin
                                    if strTempVersion[CommIndex] <> '' then
                                    begin
                                        StrCommRecText[CommIndex] := strTempVersion[CommIndex] + StrCommRecText[CommIndex];
                                    end;
                                    //Version指令
                                    if Pos(#$D, StrCommRecText[CommIndex]) <= 0 then
                                    begin
                                        strTempVersion[CommIndex] := StrCommRecText[CommIndex];
                                        Exit;
                                    end;
                                    strTempVersion[CommIndex] := '';

                                    SendToComm(CommIndex);
                                    //strSoftModel[CommIndex]:=strAutoTestModel;

                                    //取得当前机子的版本
                                    StrCommRecText[CommIndex] := MidStr(PChar(StrCommRecText[CommIndex]),
                                        Pos('[VERSION]', StrCommRecText[CommIndex]),
                                        StrLen(PChar(StrCommRecText[CommIndex])) - Pos('[VERSION]', StrCommRecText[CommIndex]));
                                    if Pos(#$D, StrCommRecText[CommIndex]) > 0 then
                                    begin
                                        strVersionS[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos(#$D, StrCommRecText[CommIndex]) - 1);
                                    end
                                    else
                                    begin
                                        strVersionS[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos('[BRANCH]', StrCommRecText[CommIndex]) - 1);
                                    end;
                                    strVersionS[CommIndex] := stringreplace(strVersionS[CommIndex], '[VERSION]', '', [rfReplaceAll]);

                                    strParamDownTestValue[CommIndex] := 'VERSIONS';
                                    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
                                end;
                            end;
                        end
                        else
                            if (strRemark[CommIndex] = 'CMPIMEI') then //比对IMEI
                            begin
                                if pos(' ', StrCommRecText[CommIndex]) <> 0 then
                                begin
                                    StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], ' ', '', [rfReplaceAll]);
                                end;
                                if pos(#$D, StrCommRecText[CommIndex]) <> 0 then
                                begin

                                    StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$D, '', [rfReplaceAll]);
                                end;
                                if pos(#$A, StrCommRecText[CommIndex]) <> 0 then
                                begin
                                    StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$A, '', [rfReplaceAll]);
                                end;
                                strParamIMEI := MidStr(StrCommRecText[CommIndex], pos(strCmdReturnText[CommIndex], StrCommRecText[CommIndex]) + Length(strCmdReturnText[CommIndex]), 15); //从导航到的位置+1
NoteCommLog(CommIndex, '[IMEI:]====' + strParamIMEI);

if (strParamIMEI = edt_IMEI.Text) then
begin
    SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1, strParamIMEI);

end
else
begin
  SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 0, strParamIMEI);

end;
end
else
    if (pos(strCmdReturnText[CommIndex], StrCommRecText[CommIndex]) > 0) then
    begin
        if bCompare[CommIndex] then
        begin
            if pos(' ', StrCommRecText[CommIndex]) <> 0 then
                StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], ' ', '', [rfReplaceAll]);

            strTestValue[CommIndex] := '';
            strTemp := StrCommRecText[CommIndex];

            StrListCompare_ParamDownload[CommIndex].Delimiter := ';';
            StrListCompare_ParamDownload[CommIndex].DelimitedText := UpperCase(strCompare[CommIndex]);

            StrListCompareChar_ParamDownload[CommIndex].Delimiter := '|';
            StrListCompareChar_ParamDownload[CommIndex].DelimitedText := UpperCase(strRemark[CommIndex]);

            for iIndex := 0 to StrListCompare_ParamDownload[CommIndex].Count - 2 do
            begin
                StrListCompare_Name_ParamDownload[CommIndex].Delimiter := '=';
                StrListCompare_Name_ParamDownload[CommIndex].DelimitedText := UpperCase(StrListCompare_ParamDownload[CommIndex][iIndex]);

                StrListCompareChar_Name_ParamDownload[CommIndex].Delimiter := ';';
                StrListCompareChar_Name_ParamDownload[CommIndex].DelimitedText := UpperCase(StrListCompareChar_ParamDownload[CommIndex][iIndex]);

                strStart := StrListCompareChar_Name_ParamDownload[CommIndex].Values['S'];
                strEnd := StrListCompareChar_Name_ParamDownload[CommIndex].Values['E'];
                strTemp := MidStr(strTemp, Pos(strStart, strTemp) + Length(strStart), Length(strTemp) - Pos(strStart, strTemp));
                strValue := LeftStr(strTemp, Pos(strEnd, strTemp) - Length(strEnd));
                strTemp := MidStr(strTemp, Pos(strEnd, strTemp) + Length(strEnd), Length(strTemp) - Pos(strEnd, strTemp));

                strMinValue := LeftStr(StrListCompare_Name_ParamDownload[CommIndex][1], Pos('~', StrListCompare_Name_ParamDownload[CommIndex][1]) - 1);
                strMaxValue := StrUtils.RightStr(StrListCompare_Name_ParamDownload[CommIndex][1], Length(StrListCompare_Name_ParamDownload[CommIndex][1]) - Pos('~', StrListCompare_Name_ParamDownload[CommIndex][1]));

                strTestValue[CommIndex] := Format('%s%s:%s;', [strTestValue[CommIndex], StrListCompare_Name_ParamDownload[CommIndex][0], strValue]);
                if (StrToFloat(strValue) < StrToFloat(strMinValue)) or (StrToFloat(strValue) > StrToFloat(strMaxValue)) then
                begin
                    Exit;

                end

            end;
            SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1, strTestValue[CommIndex]);
        end
        else
            SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 1);
    end;
    except
    on EStringListError do Sleep(1);
    on EConvertError do Sleep(1);
end;
Application.ProcessMessages;
end;

procedure TfrmParamDownloadTest.Comm_00ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
    strSendText: string;
    iIndex, count, jIndex: Integer;
    strTemp, strStart, strEnd, strValue, strMaxValue, strMinValue, strName: string;
begin
    CommIndex := 0;
    inherited;
    //if not SerialInfo[CommIndex].bAllowTest then  Exit;
    Application.ProcessMessages;
    try
        if strCmdCommKey[CommIndex] = 'AT' then
        begin
            if (pos('OK', StrCommRecText[CommIndex]) > 0) then
            begin
                AutoTest(CommIndex);
            end
            else
                Exit;

        end
        else
            if (strCmdCommKey[CommIndex] = 'ATID') or (strCmdCommKey[CommIndex] = 'ATVERSION') then
            begin
            end

    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
    end;
    Application.ProcessMessages;
end;

procedure TfrmParamDownloadTest.Comm_01ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    inherited;
    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

procedure TfrmParamDownloadTest.Comm_02ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    CommIndex := 2;
    inherited;
    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

procedure TfrmParamDownloadTest.Comm_03ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    CommIndex := 3;
    inherited;
    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

procedure TfrmParamDownloadTest.Comm_04ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    CommIndex := 4;
    inherited;
    Application.ProcessMessages;
    DeComReceieveDataParamDownLoad(CommIndex);
end;

procedure TfrmParamDownloadTest.DisposeCRC(var StrListNumberSign: TStringList; var comm: Integer);
var
    strSendText: string;
begin
    strCRC := StrListNumberSign.Values['iRecordResult'];

    GetSendedCommCmdkey(comm, strCmdReturnText[comm], strCmdCommKey[comm],
        bCompare[comm], strCompare[comm], strRemark[comm], strSubTestItemName[comm], strRemark2[comm]);
    strSendText := Format('%s,%s', [strCmdCommKey[comm], strCRC]);
    SendToComm(comm);
    SendToComm(comm, 'VERMODE', strSendText, True, 2000, strCmdReturnText[comm]); ///strCmdReturnText[comm]server设置的返回值
    //SendToComm(comm,'VERMODE',strSendText);
end;

procedure TfrmParamDownloadTest.edt_IMEIKeyPress(Sender: TObject;
    var Key: Char);
begin
    inherited;
    if key = #13 then
    begin
        edt_PreIMEI.Text := edt_IMEI.Text;
    end;
end;

end.

