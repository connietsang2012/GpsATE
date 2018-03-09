unit uModuleForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, SPComm, IniFiles, StrUtils, uGlobalVar,
    ComDrv32;

type
    TfrmModule = class(TForm)
        tmrRecCommTimeOut_0: TTimer;
        pnlClient: TPanel;
        tmrRecCommTimeOut_1: TTimer;
        tmrRecCommTimeOut_2: TTimer;
        tmrRecCommTimeOut_3: TTimer;
        tmrRecCommTimeOut_4: TTimer;
        tmrCountdown_0: TTimer;
        btnStart_StartTest: TButton;
        pnlLeft: TPanel;
        pnlClientTop: TPanel;
        imgCommRed_0: TImage;
        imgCommGreen_0: TImage;
        lbl1: TLabel;
        Label1: TLabel;
        btnStart_0: TButton;
        cbbCom_0: TComboBox;
        EdtVersion_0: TEdit;
        pnlClientBottom: TPanel;
        EdtResult_0: TEdit;
        tmrCountdown_1: TTimer;
        Label42: TLabel;
        tmrCountdown_2: TTimer;
        tmrCountdown_3: TTimer;
        tmrCountdown_4: TTimer;
        tmrCheckAllowTest_1: TTimer;
        tmrCheckAllowTest_2: TTimer;
        tmrCheckAllowTest_3: TTimer;
        tmrCheckAllowTest_4: TTimer;
        tmrCheckAllowTest_0: TTimer;
        BtnReTest: TButton;
        CommAgilent_1: TComm;
        CommAgilent_2: TComm;
        CommAgilent_3: TComm;
        CommAgilent_4: TComm;
        tmrRecAgilentCommTimeOut_1: TTimer;
        tmrRecAgilentCommTimeOut_2: TTimer;
        tmrRecAgilentCommTimeOut_3: TTimer;
        tmrRecAgilentCommTimeOut_4: TTimer;
        CommAgilent_0: TComm;
        Comm_00: TCommPortDriver;
        Comm_01: TCommPortDriver;
        Comm_02: TCommPortDriver;
        Comm_03: TCommPortDriver;
        Comm_04: TCommPortDriver;
        CheckBoxAutoTestCom0: TCheckBox;
        tmrCheckComm0: TTimer;
        Comm_0: TComm;
        Comm_1: TComm;
        Comm_2: TComm;
        Comm_3: TComm;
        Comm_4: TComm;
        //==================================================================//
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure tmrCountdown_0Timer(Sender: TObject); //测试倒计时
        procedure pnlClientBottomResize(Sender: TObject);
        procedure pnlLeftResize(Sender: TObject);
        //==================================================================//
        procedure btnStart_0Click(Sender: TObject);
        procedure btnStart_StartTestClick(Sender: TObject);
        //==================================================================//
        procedure tmrRecCommTimeOut_0Timer(Sender: TObject);
        procedure tmrRecCommTimeOut_1Timer(Sender: TObject);
        procedure tmrRecCommTimeOut_2Timer(Sender: TObject);
        procedure tmrRecCommTimeOut_3Timer(Sender: TObject);
        procedure tmrRecCommTimeOut_4Timer(Sender: TObject);
        {procedure tmrRecCommTimeOut_5Timer(Sender: TObject);
        procedure tmrRecCommTimeOut_6Timer(Sender: TObject);}
        procedure pnlClientResize(Sender: TObject);
        procedure tmrCountdown_1Timer(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure tmrCountdown_2Timer(Sender: TObject);
        procedure tmrCountdown_3Timer(Sender: TObject);
        procedure tmrCountdown_4Timer(Sender: TObject);
        procedure tmrCheckAllowTest_1Timer(Sender: TObject);
        procedure tmrCheckAllowTest_2Timer(Sender: TObject);
        procedure tmrCheckAllowTest_3Timer(Sender: TObject);
        procedure tmrCheckAllowTest_4Timer(Sender: TObject);
        procedure tmrCheckAllowTest_0Timer(Sender: TObject);
        procedure BtnReTestClick(Sender: TObject);
        procedure tmrRecAgilentCommTimeOut_1Timer(Sender: TObject);
        procedure tmrRecAgilentCommTimeOut_2Timer(Sender: TObject);
        procedure tmrRecAgilentCommTimeOut_3Timer(Sender: TObject);
        procedure tmrRecAgilentCommTimeOut_4Timer(Sender: TObject);

        procedure tmrCheckComm0Timer(Sender: TObject);
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
        procedure Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure Comm_01ReceiveData(Sender: TObject; DataPtr: Pointer;
            DataSize: Integer);
        procedure Comm_02ReceiveData(Sender: TObject;
            DataPtr: Pointer; DataSize: Integer);
        procedure Comm_03ReceiveData(Sender: TObject;
            DataPtr: Pointer; DataSize: Integer);
        procedure Comm_04ReceiveData(Sender: TObject;
            DataPtr: Pointer; DataSize: Integer);
    private
        { Private declarations }
    protected
    public
        { Public declarations }
        procedure StartTest(CommIndex: Integer); virtual; abstract; //开始测试(抽象过程，让每个工站实现本工站所要做的事情)
        procedure StartComm(CommIndex: Integer); //打开串口
        procedure ResumeTestStatus(CommIndex: Integer); //恢复到准备测试状态
        procedure BeginTest(CommIndex: Integer); //开始每个工站都需做的测试项
        procedure SetResult(CommIndex: Integer; iResult: Integer); //设置测试结果
        procedure SetDisplayResult(CommIndex: Integer; iResult: Integer); //设置测试结果

        procedure ChectAllowStartTest(CommIndex: Integer);

        //获取注册表中的记录的串口信息，并保存到下拉框,iCompIndex表示有多少个下拉控件，iDoub表示2是双下拉控件,1是单下拉控件
        procedure SetSysCommToBox(iCompIndex: Integer; iDoub: Integer = 1);

        procedure FindCommStart(CommIndex: Integer);
        procedure DeComReceieveData(CommIndex: Integer);
    end;

var
    frmModule: TfrmModule;

implementation
uses
    uPublicFunc, uClientMain, uAutoTestSMT, uWriteImeiTest, uAutoTest, uParamDownloadTest, uCoupleTest, uSMTIQCTest;

{$R *.dfm}
{var
    strComName:string;
    bComAuto:Boolean;}

//==================================================================//

procedure TfrmModule.ChectAllowStartTest(CommIndex: Integer);
begin
    Application.ProcessMessages;
    iSendAtTestCount[CommIndex] := 0;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Interval := iTestFinishTime[CommIndex] * 1000;
    //TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Interval:=1000;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := True;
    Application.ProcessMessages;
end;

procedure TfrmModule.FormClose(Sender: TObject; var Action: TCloseAction);
var
    iIndex, Count: Integer;
begin
    //各个串口断开
    for iIndex := 0 to CommCount - 1 do
    begin
        try
            if bUsbReceieveData then
            begin
                if TCommPortDriver(FindComponent('Comm_0' + inttostr(iIndex))).ComHandle > 0 then
                begin
                    TCommPortDriver(FindComponent('Comm_0' + inttostr(iIndex))).Disconnect;
                end;
            end
            else
            begin
                if TComm(FindComponent('Comm_' + inttostr(iIndex))).Handle > 0 then
                begin
                    TComm(FindComponent('Comm_' + inttostr(iIndex))).StopComm;
                end;
            end;

            if TComm(FindComponent('CommAgilent_' + inttostr(iIndex))).Handle > 0 then
            begin
                TComm(FindComponent('CommAgilent_' + inttostr(iIndex))).StopComm;
            end;
        except
            //MessageDlg('端口'+inttostr(iIndex)+'断开失败!',mtInformation,mbOKCancel,0);
        end;

        TTimer(FindComponent('tmrCountdown_' + inttostr(iIndex))).Enabled := False;
    end;
    for iIndex := 0 to CommCount - 1 do
    begin
        TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(iIndex))).Enabled := False;

    end;
    TTimer(FindComponent('tmrCheckComm' + inttostr(0))).Enabled := False;
end;

procedure TfrmModule.tmrCountdown_0Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 0;
    TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
    CountDown[CommIndex] := CountDown[CommIndex] - 1;
    if CountDown[CommIndex] <= 0 then
    begin
        TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
        NoteCommLog(CommIndex, '[S:]====AutoTestCOUNTDOWN' + inttostr(CommIndex) + inttostr(CountDown[CommIndex]));
    end
    else
    begin
        TfrmModule(CurrentFrom).SetResult(CommIndex, -1);
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := True;
    end;
end;

procedure TfrmModule.pnlClientBottomResize(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 0;
    TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Left := 0;
    TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Top := 0;
    TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Width := pnlClientBottom.Width;
    TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Height := pnlClientBottom.Height;
end;

procedure TfrmModule.pnlLeftResize(Sender: TObject);
begin
    //btnStartTest.Height:=pnlLeft.Height;
    //btnStartTest.Width:=pnlLeft.Width;
end;
//==================================================================//

//==================================================================//

procedure TfrmModule.btnStart_0Click(Sender: TObject);
begin
    StartComm(0);
end;

procedure TfrmModule.btnStart_StartTestClick(Sender: TObject);
begin
    {pnlClient.Enabled:=False;
    for Count := 0 to CommCount-1 do
    begin
        StartTest(Count);
    end;}
end;
//==================================================================//

//==================================================================//

//------------------------------------------------------------------------------//

procedure TfrmModule.tmrRecCommTimeOut_0Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 0;
    TTimer(FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendCommRecord);
        SendCommRecord := SendCommList[CommIndex].Items[0];
        if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum > 0) then
        begin
            if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
            begin
                SendCommRecord.bInvalidation := False;
                SendCommRecord.iSendNum := SendCommRecord.iSendNum + 1;
                SendToComm(CommIndex);

                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then iSendAtTestCount[CommIndex] := iSendAtTestCount[CommIndex] + 1;
            end
            else
            begin
                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then
                begin
                    SendToComm(CommIndex);
                    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := True;
                end
                else
                begin
                    if (strPlanName = 'AutoTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                    begin
                        if bAppendResult[CommIndex] then
                        begin
                            TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 0, strTestValue[CommIndex]);
                        end
                        else
                        begin
                            NoteCommLog(CommIndex, '[S:]====AutoTest1');
                            SetResult(CommIndex, 0);
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;

                    end
                    else
                    begin
                        SetResult(CommIndex, 0);
                        NoteCommLog(CommIndex, '[S:]====AutoTest2');
                        SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                    end;
                end;

            end;
        end;
    finally
        //Dispose(SendCommRecord);
    end;
end;

procedure TfrmModule.tmrRecCommTimeOut_1Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 1;
    TTimer(FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendCommRecord);
        SendCommRecord := SendCommList[CommIndex].Items[0];
        if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum > 0) then
        begin
            if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
            begin
                SendCommRecord.bInvalidation := False;
                SendCommRecord.iSendNum := SendCommRecord.iSendNum + 1;
                SendToComm(CommIndex);

                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then iSendAtTestCount[CommIndex] := iSendAtTestCount[CommIndex] + 1;
            end
            else
            begin
                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then
                begin
                    SendToComm(CommIndex);
                    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := True;
                end
                else
                begin
                    if (strPlanName = 'AutoTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                    begin
                        if bAppendResult[CommIndex] then
                        begin
                            TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 0, strTestValue[CommIndex]);
                            NoteCommLog(CommIndex, '[S:]====AutoTest1');
                        end
                        else
                        begin
                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest2');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;

                    end
                    else
                        if (strPlanName = 'SMTIQCTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                        begin
                            SetDisplayResult(CommIndex, -1);
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end
                        else
                        begin

                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest3');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;
                end;

            end;
        end;
    finally
        //Dispose(SendCommRecord);
    end;
end;

procedure TfrmModule.tmrRecCommTimeOut_2Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 2;
    TTimer(FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendCommRecord);
        SendCommRecord := SendCommList[CommIndex].Items[0];
        if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum > 0) then
        begin
            if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
            begin
                SendCommRecord.bInvalidation := False;
                SendCommRecord.iSendNum := SendCommRecord.iSendNum + 1;
                SendToComm(CommIndex);

                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then iSendAtTestCount[CommIndex] := iSendAtTestCount[CommIndex] + 1;
            end
            else
            begin
                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then
                begin
                    SendToComm(CommIndex);
                    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := True;
                end
                else
                begin
                    if (strPlanName = 'AutoTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                    begin
                        if bAppendResult[CommIndex] then
                        begin
                            TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 0, strTestValue[CommIndex]);
                            NoteCommLog(CommIndex, '[S:]====AutoTest1');
                        end
                        else
                        begin
                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest2');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;

                    end
                    else
                        if (strPlanName = 'SMTIQCTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                        begin
                            SetDisplayResult(CommIndex, -1);
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end
                        else
                        begin

                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest3');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;
                end;

            end;

        end;
    finally
        //Dispose(SendCommRecord);
    end;
end;

procedure TfrmModule.tmrRecCommTimeOut_3Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 3;
    TTimer(FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendCommRecord);
        SendCommRecord := SendCommList[CommIndex].Items[0];
        if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum > 0) then
        begin
            if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
            begin
                SendCommRecord.bInvalidation := False;
                SendCommRecord.iSendNum := SendCommRecord.iSendNum + 1;
                SendToComm(CommIndex);

                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then iSendAtTestCount[CommIndex] := iSendAtTestCount[CommIndex] + 1;
            end
            else
            begin
                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then
                begin
                    SendToComm(CommIndex);
                    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := True;
                end
                else
                begin
                    if (strPlanName = 'AutoTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                    begin
                        if bAppendResult[CommIndex] then
                        begin
                            TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 0, strTestValue[CommIndex]);
                            NoteCommLog(CommIndex, '[S:]====AutoTest1');
                        end
                        else
                        begin
                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest2');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;

                    end
                    else
                        if (strPlanName = 'SMTIQCTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                        begin
                            SetDisplayResult(CommIndex, -1);
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end
                        else
                        begin

                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest3');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;
                end;

            end;
        end;
    finally
        //Dispose(SendCommRecord);
    end;
end;

procedure TfrmModule.tmrRecCommTimeOut_4Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 4;
    TTimer(FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendCommRecord);
        SendCommRecord := SendCommList[CommIndex].Items[0];
        if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum > 0) then
        begin
            if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
            begin
                SendCommRecord.bInvalidation := False;
                SendCommRecord.iSendNum := SendCommRecord.iSendNum + 1;
                SendToComm(CommIndex);

                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then iSendAtTestCount[CommIndex] := iSendAtTestCount[CommIndex] + 1;
            end
            else
            begin
                if SendCommRecord.sCmdKey = 'ATALLOWTEST' then
                begin
                    SendToComm(CommIndex);
                    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := True;
                end
                else
                begin
                    if (strPlanName = 'AutoTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                    begin
                        if bAppendResult[CommIndex] then
                        begin
                            TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex, TListBox(FindComponent('TesItem_Comm' + inttostr(CommIndex))).Items[0], 0, strTestValue[CommIndex]);
                            //NoteCommLog(CommIndex,'[S:]====AutoTest1');
                        end
                        else
                        begin
                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest2');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;

                    end
                    else
                        if (strPlanName = 'SMTIQCTest') and (SendCommRecord.sCmdKey <> 'ATALLOWTEST') then
                        begin
                            SetDisplayResult(CommIndex, -1);
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end
                        else
                        begin

                            SetResult(CommIndex, 0);
                            NoteCommLog(CommIndex, '[S:]====AutoTest3');
                            SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendCommRecord.sCmdKey]), 0);
                        end;
                end;

            end;
        end;
    finally
        //Dispose(SendCommRecord);
    end;
end;
//==================================================================//

//==================================================================//

procedure TfrmModule.StartComm(CommIndex: Integer);
var
    strComPort: string;
begin
    Application.ProcessMessages;
    if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '连接' then
    begin
        strComPort := TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text;
        //strComPort:=stringreplace(strComPort,'COM','',[rfReplaceAll]);
        if strComPort = '' then
        begin
            MessageDlg('请选择串口!', mtInformation, mbOKCancel, 0);
            Exit;
        end;

        try
            if (bUsbReceieveData) then
            begin
                strComPort := stringreplace(strComPort, 'COM', '', [rfReplaceAll]);
                TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Disconnect;
                TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).ComPort := TComPortNumber(StrToInt(strComPort));
                TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).ComPortSpeed := TComPortBaudRate(12);
                TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Enabled := False;
                TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Connect;
            end
            else
            begin
                TComm(FindComponent('Comm_' + inttostr(CommIndex))).CommName := strComPort;
                TComm(FindComponent('Comm_' + inttostr(CommIndex))).BaudRate := 115200;
                TComm(FindComponent('Comm_' + inttostr(CommIndex))).StopBits := _1;
                TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Enabled := False;
                TComm(FindComponent('Comm_' + inttostr(CommIndex))).StartComm;
            end;

            {TComm(FindComponent('Comm_'+inttostr(CommIndex))).CommName:= strComPort;
            TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
            TComm(FindComponent('Comm_'+inttostr(CommIndex))).StartComm;

            {TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComPort:= TComPortNumber(StrToInt(strComPort));
            TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComPortSpeed:=TComPortBaudRate(12);
            TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
            TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connect;}
            Sleep(100);
            TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption := '断开';
            TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Enabled := True;
            SerialInfo[CommIndex].bConnectedComm := True;
            strComm[CommIndex] := TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text;
            ChectAllowStartTest(CommIndex);

        except
            //on ECommsError do
            begin
                MessageDlg('端口不存在或已被占用或其它!', mtInformation, mbOKCancel, 0);
                TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Enabled := True;
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption := '连接';
                //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
                SerialInfo[CommIndex].bConnectedComm := False;
            end;
        end;
    end
    else
        if TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption = '断开' then
        begin
            TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Enabled := True;
            try

                if (bUsbReceieveData) then
                begin
                    if TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).ComHandle > 0 then
                        TCommPortDriver(FindComponent('Comm_0' + inttostr(CommIndex))).Disconnect;
                end
                else
                begin
                    TComm(FindComponent('Comm_' + inttostr(CommIndex))).StopComm;
                end;
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption := '连接';
                //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=False;
                SerialInfo[CommIndex].bConnectedComm := False;
            except
                MessageDlg('端口断开失败!', mtInformation, mbOKCancel, 0);
                TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Caption := '断开';
                //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
                SerialInfo[CommIndex].bConnectedComm := True;
            end;
        end;
    Application.ProcessMessages;
end;

procedure TfrmModule.ResumeTestStatus(CommIndex: Integer);
begin
    //清除各串口信息
    SerialInfo[CommIndex].bAllowTest := False;
    //SerialInfo[CommIndex].bConnectedComm:=False;
    SerialInfo[CommIndex].strChipRid := '';
    SendCommList[CommIndex].Clear;

    SerialInfo[CommIndex].bEnterTestState := False;
    bAllowChangeImei := False;

    SendCommList[CommIndex].Clear;
    SendSrvList[CommIndex].Clear;

    case CommIndex of
        0: frmClientMain.tmrSocket_0.Enabled := False;
        1: frmClientMain.tmrSocket_1.Enabled := False;
        2: frmClientMain.tmrSocket_2.Enabled := False;
        3: frmClientMain.tmrSocket_3.Enabled := False;
        4: frmClientMain.tmrSocket_4.Enabled := False;
    end;

    if FindComponent('tmrCountdown_' + inttostr(CommIndex)) <> nil then
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
    if FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex)) <> nil then
        TTimer(FindComponent('tmrRecCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if FindComponent('EdtResult_' + inttostr(CommIndex)) <> nil then
        TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := '';
    if FindComponent('EdtResult_' + inttostr(CommIndex)) <> nil then
        TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clSilver;

    //pnlClient.Enabled:=True;
    //btnStartTest.Enabled:=True;
    strIMEI[CommIndex] := '';
    strChipRid[CommIndex] := '';
    strTestValue[CommIndex] := '';
end;

procedure TfrmModule.BeginTest(CommIndex: Integer);
var
    iCommIndex: Integer;
begin
    //if strPlanName='AutoTest' then
    begin
        //for iCommIndex := 1 to CommCount-1 do
        //if CommIndex>0 then
        begin
            TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := False;
        end;
    end;
    if (strPlanName = 'AutoTest') or (strPlanName = 'ParamDownload') then
    begin
        for iCommIndex := 1 to CommCount - 1 do
        begin
            TPanel(FindComponent('PnlTestResult_' + inttostr(iCommIndex))).Enabled := False;
        end;
    end;

    SetResult(CommIndex, -2);
    SetStatusText('测试中...', 0);
    SetStatusText('', 1);
    strChipRid[CommIndex] := '';
    SerialInfo[CommIndex].bAllowTest := True;
    SendCommList[CommIndex].Clear;
    SendAgilentCommList[CommIndex].Clear;
    EdtVersion_0.Text := '';
    if CurrentFrom.ClassName = 'TfrmTwiceTest' then
    begin
        bUpdateForm := False;
    end
    else
        bUpdateForm := True;

    if strPlanName = 'CoupleTest' then
    begin
        CountDown[CommIndex] := BasicTestParam.CoupleTestTestTime;
    end
    else
        if strPlanName = 'ParamDownload' then
        begin
            CountDown[CommIndex] := BasicTestParam.ParamDownloadTestTime;
        end
        else
            if strPlanName = 'AutoTest' then
            begin
                CountDown[CommIndex] := BasicTestParam.AutoTestTestTime;
            end
            else
                if strPlanName = 'AutoTestSMT' then
                begin
                    CountDown[CommIndex] := BasicTestParam.SMT_AutoTestTestTime;
                end
                else
                    if strPlanName = 'WriteImei' then
                    begin
                        CountDown[CommIndex] := BasicTestParam.WriteImeiTestTime;
                    end
                    else
                        if strPlanName = 'TwiceTest' then
                        begin
                            CountDown[CommIndex] := BasicTestParam.TwiceTestTime;
                        end
                        else
                            if strPlanName = 'SMTIQCTest' then
                            begin
                                CountDown[CommIndex] := BasicTestParam.TwiceTestTime;
                            end;

    TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := True;

    //if not SerialInfo[CommIndex].bConnectedComm then
    //if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComHandle<=0 then
    {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComHandle=INVALID_HANDLE_VALUE then
    begin
        SetResult(CommIndex,0);
        Exit;
    end;}
    Sleep(1000);
    //获得开始测试时间,开始测试
    TestStartTickCount[CommIndex] := GetTickCount;
    SendToComm(CommIndex, 'ATTEST', strTESTAT);
    //SendToComm(CommIndex,'ATVERSION','AT^GT_CM=VERSION');
end;
{
iResult<  -2->初始状态或显示内容? -1->倒计时  1->成功  0->失败 >
}

procedure TfrmModule.SetResult(CommIndex: Integer; iResult: Integer);
var
    strSendText: string;
    iRecordCount: Integer;
begin
    Application.ProcessMessages;
    if CurrentFrom.ClassName = 'TfrmAutoTestSMTMain' then
    begin
        TfrmAutoTestSMTMain(CurrentFrom).SetResult(CommIndex, iResult);
        Exit;
    end
    else
        if CurrentFrom.ClassName = 'TfrmAutoTestMain' then
        begin
            TfrmAutoTestMain(CurrentFrom).SetResult(CommIndex, iResult);
            Exit;
        end
        else
            if CurrentFrom.ClassName = 'TfrmParamDownloadTest' then
            begin
                TfrmParamDownloadTest(CurrentFrom).SetResult(CommIndex, iResult);
                Exit;
            end
            else
                if CurrentFrom.ClassName = 'TfrmCoupleTest' then
                begin
                    TfrmCoupleTest(CurrentFrom).SetResult(CommIndex, iResult);
                    Exit;
                end
                else
                    if CurrentFrom.ClassName = 'TfrmSMTIQCTest' then
                    begin
                        TfrmSMTIQCTest(CurrentFrom).SetResult(CommIndex, iResult);
                        Exit;
                    end;
    {else if CurrenForm.ClassName='TfrmIncomCheck' then
    begin
        TrmIncomCheck(CurrentForm).setResult(CommIndex,iResult);
    end;  }

    SetWindowLong(TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Handle, GWL_STYLE,
        GetWindowLong(TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Handle, GWL_STYLE) or ES_CENTER);

    case iResult of
        -5, -6, -4, -3, -2, -1:
            begin
                //TEdit(FindComponent('EdtResult_'+inttostr(CommIndex))).Text:='';
                SetDisplayResult(CommIndex, iResult);
            end;
        1:
            begin
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                {TEdit(FindComponent('EdtResult_'+inttostr(CommIndex))).Text:='PASS';
                TEdit(FindComponent('EdtResult_'+inttostr(CommIndex))).Color:=clGreen;}
                if (not (strChipRid[CommIndex] = '')) and bUpdateForm then
                begin
                    {strSendText := Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#',
                        [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], strIMEI[CommIndex], iResult, User.UserName]);
                    SendToServer(CommIndex, 'UpdateResult', strSendText, True, CTimeOut * 2);}
                    UpdateForm(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], strIMEI[CommIndex], iResult, User.UserName, iRecordCount);
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
                if (not (strChipRid[CommIndex] = '')) and bUpdateForm then
                begin
                    {strSendText := Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s',
                        [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], '', iResult, User.UserName]);
                    SendToServer(CommIndex, 'UpdateResult', strSendText, True, CTimeOut * 2);}

                    UpdateForm(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], '', iResult, User.UserName, iRecordCount);
                    if iRecordCount = 0 then
                    begin
                        SetResult(CommIndex, -2);
                        MessageBox(0, UPDATEFORMERROR, '警告', MB_ICONWARNING + MB_OK);
                    end;
                end;
                SetDisplayResult(CommIndex, iResult);
            end;
    end;
    if CurrentFrom.ClassName = 'TfrmWriteImeiTest' then
    begin
        TfrmWriteImeiTest(CurrentFrom).SetResult(CommIndex, iResult);
    end;

    Application.ProcessMessages;
end;
{
iResult<  -2->初始状态或显示内容? -1->倒计时  1->成功  0->失败 >
}

procedure TfrmModule.SetDisplayResult(CommIndex: Integer; iResult: Integer);
var
    strSendText: string;
begin
    Application.ProcessMessages;

    if CurrentFrom.ClassName = 'TfrmAutoTestSMTMain' then
    begin
        TfrmAutoTestSMTMain(CurrentFrom).SetDisplayResult(CommIndex, iResult);
        Exit;
    end
    else
        if CurrentFrom.ClassName = 'TfrmAutoTestMain' then
        begin
            TfrmAutoTestMain(CurrentFrom).SetDisplayResult(CommIndex, iResult);
            Exit;
        end
        else
            if CurrentFrom.ClassName = 'TfrmParamDownloadTest' then
            begin
                TfrmParamDownloadTest(CurrentFrom).SetDisplayResult(CommIndex, iResult);
                Exit;
            end
            else
                if CurrentFrom.ClassName = 'TfrmCoupleTest' then
                begin
                    TfrmCoupleTest(CurrentFrom).SetDisplayResult(CommIndex, iResult);
                    Exit;
                end
                else
                    if CurrentFrom.ClassName = 'TfrmSMTIQCTest' then
                    begin
                        TfrmSMTIQCTest(CurrentFrom).SetDisplayResult(CommIndex, iResult);
                        Exit;
                    end;

    if (iResult = 1) or (iResult = 0) then
    begin
        //CountDown[CommIndex]:=0;
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
        NoteCommLog(CommIndex, '[S:]====COUNTDOWN00Module' + inttostr(commindex) + inttostr(CountDown[CommIndex]));
    end;

    SetWindowLong(TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Handle, GWL_STYLE,
        GetWindowLong(TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Handle, GWL_STYLE) or ES_CENTER);

    case iResult of
        -6:
            begin
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := VERSIONERROR;
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clYellow;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -5: //为了不弹出框
            begin
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := NOTNEED;
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clYellow;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -4:
            begin
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := ISTESTED;
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clYellow;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -3:
            begin
                //TEdit(FindComponent('EdtResult_'+inttostr(CommIndex))).Text:='';
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clSilver;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -2:
            begin
                //TEdit(FindComponent('EdtResult_'+inttostr(CommIndex))).Text:='';
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clSilver;
            end;
        -1:
            begin
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := '倒计时:' + inttostr(CountDown[CommIndex]);
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clSilver;
            end;
        1:
            begin
                //CountDown[CommIndex]:=0;
                //NoteCommLog(CommIndex,'[S:]====COUNTDOWN00Module2'+inttostr(commindex)+inttostr(CountDown[CommIndex]));
                iSendAtTestCount[CommIndex] := 0;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := 'PASS';
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clGreen;
                SetStatusText(Format('%f秒', [(GetTickCount - TestStartTickCount[CommIndex]) / 1000]), 1);
                SetStatusText('测试结束', 0);
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        0:
            begin
                CountDown[CommIndex] := 0;
                //NoteCommLog(CommIndex,'[S:]====COUNTDOWN00Module3'+inttostr(commindex)+inttostr(CountDown[CommIndex]));
                iSendAtTestCount[CommIndex] := 0;
                TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Text := 'FAIL';
                TEdit(FindComponent('EdtResult_' + inttostr(CommIndex))).Color := clRed;
                SetStatusText(Format('%f秒', [(GetTickCount - TestStartTickCount[CommIndex]) / 1000]), 1);
                SetStatusText('测试结束', 0);
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
    end;

    //必须放在最后,不然IMEI烧写位等串口0的模板不会更新数据库. 2014-3-18
    if iResult <> -1 then
    begin
        //ResumeTestStatus(CommIndex);
        SerialInfo[CommIndex].bAllowTest := False;
        SendCommList[CommIndex].Clear;
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;

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

procedure TfrmModule.pnlClientResize(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 0;
    pnlLeft.Width := Trunc(pnlClient.Width / 2);

    //TEdit(FindComponent('pnl'+inttostr(CommIndex))).Width:=pnlClientBottom.Width;
    //TEdit(FindComponent('EdtResult_'+inttostr(CommIndex))).Height:=pnlClientBottom.Height;
end;

procedure TfrmModule.tmrCountdown_1Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
    CountDown[CommIndex] := CountDown[CommIndex] - 1;
    if CountDown[CommIndex] <= 0 then
    begin
        SetResult(CommIndex, 0);
        NoteCommLog(CommIndex, '[S:]====AutoTestCOUNTDOWN' + inttostr(CommIndex) + inttostr(CountDown[CommIndex]));
    end
    else
    begin
        SetResult(CommIndex, -1);
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := True;
    end;
end;

procedure TfrmModule.FormCreate(Sender: TObject);
var
    iCommIndex, Count: Integer;
    CommList: TStrings;
begin
    for iCommindex := 0 to 0 do
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
    end;

    if strAutoTestModel = '' then
    begin
        Application.MessageBox('请在测试参数设置选项中选择要测试的机型!', '警告', MB_OK + MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;
end;

procedure TfrmModule.tmrCountdown_2Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 2;
    TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
    CountDown[CommIndex] := CountDown[CommIndex] - 1;
    if CountDown[CommIndex] <= 0 then
    begin
        NoteCommLog(CommIndex, '[S:]====AutoTestCOUNTDOWN' + inttostr(CommIndex) + inttostr(CountDown[CommIndex]));
        SetResult(CommIndex, 0);
    end
    else
    begin
        SetResult(CommIndex, -1);
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := True;
    end;
end;

procedure TfrmModule.tmrCountdown_3Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 3;
    TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
    CountDown[CommIndex] := CountDown[CommIndex] - 1;
    if CountDown[CommIndex] <= 0 then
    begin
        NoteCommLog(CommIndex, '[S:]====AutoTestCOUNTDOWN' + inttostr(CommIndex) + inttostr(CountDown[CommIndex]));
        SetResult(CommIndex, 0);
    end
    else
    begin
        SetResult(CommIndex, -1);
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := True;
    end;
end;

procedure TfrmModule.tmrCountdown_4Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 4;
    TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := False;
    CountDown[CommIndex] := CountDown[CommIndex] - 1;
    if CountDown[CommIndex] <= 0 then
    begin
        NoteCommLog(CommIndex, '[S:]====AutoTestCOUNTDOWN' + inttostr(CommIndex) + inttostr(CountDown[CommIndex]));
        SetResult(CommIndex, 0);
    end
    else
    begin
        SetResult(CommIndex, -1);
        TTimer(FindComponent('tmrCountdown_' + inttostr(CommIndex))).Enabled := True;
    end;
end;

procedure TfrmModule.tmrCheckAllowTest_1Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    Application.ProcessMessages;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := False;
    SendToComm(CommIndex, 'ATALLOWTEST', strCheckTestAtCommand[CommIndex], true, iSendAllowTestAtTimeOut[CommIndex] * 1000, strCheckTestAtCommandReturn[CommIndex], '检测设备');
end;

procedure TfrmModule.tmrCheckAllowTest_2Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 2;
    Application.ProcessMessages;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := False;
    SendToComm(CommIndex, 'ATALLOWTEST', strCheckTestAtCommand[CommIndex], true, iSendAllowTestAtTimeOut[CommIndex] * 1000, strCheckTestAtCommandReturn[CommIndex], '检测设备');
end;

procedure TfrmModule.tmrCheckAllowTest_3Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 3;
    Application.ProcessMessages;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := False;
    SendToComm(CommIndex, 'ATALLOWTEST', strCheckTestAtCommand[CommIndex], true, iSendAllowTestAtTimeOut[CommIndex] * 1000, strCheckTestAtCommandReturn[CommIndex], '检测设备');
end;

procedure TfrmModule.tmrCheckAllowTest_4Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 4;
    Application.ProcessMessages;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := False;
    SendToComm(CommIndex, 'ATALLOWTEST', strCheckTestAtCommand[CommIndex], true, iSendAllowTestAtTimeOut[CommIndex] * 1000, strCheckTestAtCommandReturn[CommIndex], '检测设备');
end;

procedure TfrmModule.tmrCheckAllowTest_0Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 0;
    TTimer(FindComponent('tmrCheckAllowTest_' + inttostr(CommIndex))).Enabled := False;
    SendToComm(CommIndex, 'ATALLOWTEST', strCheckTestAtCommand[CommIndex], true, iSendAllowTestAtTimeOut[CommIndex] * 1000, strCheckTestAtCommandReturn[CommIndex], '检测设备');
end;

procedure TfrmModule.BtnReTestClick(Sender: TObject);
begin
    Application.ProcessMessages;
end;

procedure TfrmModule.tmrRecAgilentCommTimeOut_1Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendAgilentCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 1;
    TTimer(FindComponent('tmrRecAgilentCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendAgilentCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendAgilentCommRecord);
        SendAgilentCommRecord := SendAgilentCommList[CommIndex].Items[0];
        if (SendAgilentCommRecord.bWaitResponses) and (SendAgilentCommRecord.iResendNum > 0) then
        begin
            if SendAgilentCommRecord.iSendNum < SendAgilentCommRecord.iResendNum then
            begin
                SendAgilentCommRecord.bInvalidation := False;
                SendAgilentCommRecord.iSendNum := SendAgilentCommRecord.iSendNum + 1;
                SendToComm_Agilent(CommIndex);
            end
            else
            begin
                NoteCommLog(CommIndex, '[S:]====AutoTestAGILENT');
                SetResult(CommIndex, 0);
                SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendAgilentCommRecord.sCmdKey]), 0);
            end;
        end;
    finally
        //Dispose(SendAgilentCommRecord);
    end;
end;

procedure TfrmModule.tmrRecAgilentCommTimeOut_2Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendAgilentCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 2;
    TTimer(FindComponent('tmrRecAgilentCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendAgilentCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendAgilentCommRecord);
        SendAgilentCommRecord := SendAgilentCommList[CommIndex].Items[0];
        if (SendAgilentCommRecord.bWaitResponses) and (SendAgilentCommRecord.iResendNum > 0) then
        begin
            if SendAgilentCommRecord.iSendNum < SendAgilentCommRecord.iResendNum then
            begin
                SendAgilentCommRecord.bInvalidation := False;
                SendAgilentCommRecord.iSendNum := SendAgilentCommRecord.iSendNum + 1;
                SendToComm_Agilent(CommIndex);
            end
            else
            begin
                NoteCommLog(CommIndex, '[S:]====AutoTestAGILENT');
                SetResult(CommIndex, 0);
                SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendAgilentCommRecord.sCmdKey]), 0);
            end;
        end;
    finally
        //Dispose(SendAgilentCommRecord);
    end;
end;

procedure TfrmModule.tmrRecAgilentCommTimeOut_3Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendAgilentCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 3;
    TTimer(FindComponent('tmrRecAgilentCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendAgilentCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendAgilentCommRecord);
        SendAgilentCommRecord := SendAgilentCommList[CommIndex].Items[0];
        if (SendAgilentCommRecord.bWaitResponses) and (SendAgilentCommRecord.iResendNum > 0) then
        begin
            if SendAgilentCommRecord.iSendNum < SendAgilentCommRecord.iResendNum then
            begin
                SendAgilentCommRecord.bInvalidation := False;
                SendAgilentCommRecord.iSendNum := SendAgilentCommRecord.iSendNum + 1;
                SendToComm_Agilent(CommIndex);
            end
            else
            begin
                NoteCommLog(CommIndex, '[S:]====AutoTestAGILENT');
                SetResult(CommIndex, 0);
                SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendAgilentCommRecord.sCmdKey]), 0);
            end;
        end;
    finally
        //Dispose(SendAgilentCommRecord);
    end;
end;

procedure TfrmModule.tmrRecAgilentCommTimeOut_4Timer(Sender: TObject);
var
    CommIndex: Integer;
    SendAgilentCommRecord: PSendCommRecord; //发送至串口的命令
begin
    CommIndex := 4;
    TTimer(FindComponent('tmrRecAgilentCommTimeOut_' + IntToStr(CommIndex))).Enabled := False;

    if SendAgilentCommList[CommIndex].Count < 1 then Exit;
    try
        New(SendAgilentCommRecord);
        SendAgilentCommRecord := SendAgilentCommList[CommIndex].Items[0];
        if (SendAgilentCommRecord.bWaitResponses) and (SendAgilentCommRecord.iResendNum > 0) then
        begin
            if SendAgilentCommRecord.iSendNum < SendAgilentCommRecord.iResendNum then
            begin
                SendAgilentCommRecord.bInvalidation := False;
                SendAgilentCommRecord.iSendNum := SendAgilentCommRecord.iSendNum + 1;
                SendToComm_Agilent(CommIndex);
            end
            else
            begin
                NoteCommLog(CommIndex, '[S:]====AutoTestAGILENT');
                SetResult(CommIndex, 0);
                SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!', [SendAgilentCommRecord.sCmdKey]), 0);
            end;
        end;
    finally
        //Dispose(SendAgilentCommRecord);
    end;
end;

{//获取注册表中的记录的串口信息，并保存到下拉框,iCompIndex表示有多少个下拉控件，
//iDoub表示2是双下拉控件,1是单下拉控件，j + 1 是因为控件名没有0 结尾的。
//先获取注册表的串口信息，然后逐个保存下拉框当前的index然后清空下拉框的text，然后装填新的串口信息}

procedure TfrmModule.SetSysCommToBox(iCompIndex: Integer; iDoub: Integer);
var
    Count, j: Integer;
    CommList: TStrings;
    iCbbComOldIndex, iCbbComAgilentOldIndex: Integer;
begin
    CommList := TStringList.Create;
    if GetSysComm(CommList) then
    begin
        for j := 0 to iCompIndex do
        begin
            iCbbComOldIndex := TComboBox(FindComponent('cbbCom_' + inttostr(j))).ItemIndex;
            TComboBox(FindComponent('cbbCom_' + inttostr(j))).Clear;
            if iDoub = 2 then
            begin
                iCbbComAgilentOldIndex := TComboBox(FindComponent('cbbComAgilent_' + inttostr(j + 1))).ItemIndex;
                TComboBox(FindComponent('cbbComAgilent_' + inttostr(j + 1))).Clear;
            end;
            for Count := 0 to CommList.Count - 1 do
            begin
                TComboBox(FindComponent('cbbCom_' + inttostr(j))).Items.Add(CommList[Count]);
                if iDoub = 2 then
                begin
                    TComboBox(FindComponent('cbbComAgilent_' + inttostr(j + 1))).Items.Add(CommList[Count]);
                end;
            end;

            if TComboBox(FindComponent('cbbCom_' + inttostr(j))).Items.Count - 1 >= iCbbComOldIndex then
                TComboBox(FindComponent('cbbCom_' + inttostr(j))).ItemIndex := iCbbComOldIndex
            else
                TComboBox(FindComponent('cbbCom_' + inttostr(j))).ItemIndex := 0;
            if iDoub = 2 then
            begin
                if TComboBox(FindComponent('cbbComAgilent_' + inttostr(j + 1))).Items.Count - 1 >= iCbbComAgilentOldIndex then
                    TComboBox(FindComponent('cbbComAgilent_' + inttostr(j + 1))).ItemIndex := iCbbComAgilentOldIndex
                else
                    TComboBox(FindComponent('cbbComAgilent_' + inttostr(j + 1))).ItemIndex := 0;
            end;
        end;
    end;
    CommList.free;
end;

procedure TfrmModule.Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
    DataSize: Integer);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 0;
    SetLength(StrCommRecText[CommIndex], DataSize);
    Move(DataPtr^, PChar(StrCommRecText[CommIndex])^, DataSize);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);

end;

procedure TfrmModule.Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 0;

    {SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);

    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);}
    SetLength(StrCommRecText[CommIndex], BufferLength);
    Move(Buffer^, PChar(StrCommRecText[CommIndex])^, BufferLength);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);

    DeComReceieveData(CommIndex);

end;

procedure TfrmModule.Comm_01ReceiveData(Sender: TObject; DataPtr: Pointer;
    DataSize: Integer);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 1;
    SetLength(StrCommRecText[CommIndex], DataSize);
    Move(DataPtr^, PChar(StrCommRecText[CommIndex])^, DataSize);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 1;

    {SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);

    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);}
    SetLength(StrCommRecText[CommIndex], BufferLength);
    Move(Buffer^, PChar(StrCommRecText[CommIndex])^, BufferLength);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    strSendText: string;
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 2;

    {SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);

    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);}
    SetLength(StrCommRecText[CommIndex], BufferLength);
    Move(Buffer^, PChar(StrCommRecText[CommIndex])^, BufferLength);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    strSendText: string;
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 3;
    SetLength(StrCommRecText[CommIndex], BufferLength);
    Move(Buffer^, PChar(StrCommRecText[CommIndex])^, BufferLength);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
    BufferLength: Word);
var
    strSendText: string;
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 4;

    SetLength(StrCommRecText[CommIndex], BufferLength);
    Move(Buffer^, PChar(StrCommRecText[CommIndex])^, BufferLength);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.FindCommStart(CommIndex: Integer);
begin
    Application.ProcessMessages;
    iSendAtTestCount[CommIndex] := 0;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Interval := 1 * 1000;
    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := True;
    SerialInfo[CommIndex].iCheckCommNo := 0;
    SerialInfo[CommIndex].bAllowCheck := false;
    Application.ProcessMessages;
end;

procedure TfrmModule.tmrCheckComm0Timer(Sender: TObject);
var
    CommList: TStrings;
    strcommF: string;
    iCommindex, Count: Integer;
    CommIndex: Integer;
begin
    CommIndex := 0;
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
                    TTimer(FindComponent('tmrCheckComm' + inttostr(CommIndex))).Enabled := False;
                    TComboBox(FindComponent('cbbCom_' + inttostr(CommIndex))).Text := strComm[CommIndex];
                    TButton(FindComponent('btnStart_' + inttostr(CommIndex))).Click;
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

procedure TfrmModule.DeComReceieveData(CommIndex: Integer);
var
    strSendText: string;
    strParamIMEI: string;
    strVerEx: string;
    iRecordCount: Integer;
begin

    if pos('=', StrCommRecText[CommIndex]) <> 0 then
        StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], '=', '-', [rfReplaceAll]);

    if ((Pos('$', StrCommRecText[CommIndex]) > 0) and (bGPSTestPass[CommIndex])) then
    begin
        //Sleep(10);
        exit;
    end;

    if (Pos('POWER ON', StrCommRecText[CommIndex]) > 0) or (Pos('POWERON', StrCommRecText[CommIndex]) > 0) then
    begin
        ResumeTestStatus(CommIndex);
        Sleep(BasicTestParam.POSleepTime);
        StartTest(CommIndex);
        Exit;
    end;

    GetSendedCommCmdkey(CommIndex, strCmdReturnText[CommIndex], strCmdCommKey[CommIndex],
        bCompare[CommIndex], strCompare[CommIndex], strRemark[CommIndex], strSubTestItemName[CommIndex], strRemark2[CommIndex]);
    strCmdReturnText[CommIndex] := UpperCase(strCmdReturnText[CommIndex]);
    strCmdCommKey[CommIndex] := UpperCase(strCmdCommKey[CommIndex]);

    if (strCmdCommKey[CommIndex] <> 'ATVERSION') and (strCmdCommKey[CommIndex] <> 'ATPARAMVERSION') then
    begin
        if pos(#$D, StrCommRecText[CommIndex]) <> 0 then
            StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$D, '', [rfReplaceAll]);
        if pos(#$A, StrCommRecText[CommIndex]) <> 0 then
            StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], #$A, '', [rfReplaceAll]);

    end;

    if strCmdCommKey[CommIndex] = 'ATALLOWTEST' then
    begin
        if Pos(strCmdReturnText[CommIndex], StrCommRecText[CommIndex]) > 0 then
        begin
            SendToComm(CommIndex);
            if iSendAtTestCount[CommIndex] >= iAllowTestCount[CommIndex] then
            begin
                StartTest(CommIndex);
            end
            else
            begin
                ChectAllowStartTest(CommIndex);
            end;
            Exit;
        end
        else
            Exit;
    end;
    //是否允许测试，如果否串口上的数据不做任何判断
    if not SerialInfo[CommIndex].bAllowTest then Exit;

    if (Pos('SENSOR_OK', StrCommRecText[CommIndex]) > 0) and (strRemark[CommIndex] <> 'SENSOR') then
    begin
        //Sleep(1);
        //Exit;
        StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], 'SENSOR_OK', '', [rfReplaceAll]);
    end;

    if strCmdCommKey[CommIndex] = 'ATTEST' then
    begin
        if Pos('OK', StrCommRecText[CommIndex]) > 0 then
        begin
            SendToComm(CommIndex);
            SendToComm(CommIndex, 'ATVERSION', 'AT^GT_CM=VERSION');
            {if strPlanName='ParamDownload' then
            begin
              SendToComm(CommIndex,'ATEGMR','AT+EGMR=0,7'); //参数下载位不检测版本，检测IMEI号段
            end
            else
            begin
              SendToComm(CommIndex,'ATVERSION','AT^GT_CM=VERSION');
            end; }

        end
        else
            Exit;
    end
    else
        if strCmdCommKey[CommIndex] = 'ATVERSION' then
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
                    strSoftModel[CommIndex] := strAutoTestModel;

                    //取得当前机子的版本
                    StrCommRecText[CommIndex] := MidStr(PChar(StrCommRecText[CommIndex]),
                        Pos('[VERSION]', StrCommRecText[CommIndex]),
                        StrLen(PChar(StrCommRecText[CommIndex])) - Pos('[VERSION]', StrCommRecText[CommIndex]));
                    if Pos('[BUILD]', StrCommRecText[CommIndex]) > 0 then
                    begin
                        strVersion[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos('[BUILD]', StrCommRecText[CommIndex]) - 1);
                    end
                    else
                    begin
                        strVersion[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos('[BRANCH]', StrCommRecText[CommIndex]) - 1);
                    end;
                    strVersion[CommIndex] := stringreplace(strVersion[CommIndex], '[VERSION]', '', [rfReplaceAll]);
                    EdtVersion_0.Text := strVersion[CommIndex];

                    //比对版本
                    if strPlanName <> 'ParamDownload' then
                    begin
                        if (Length(BasicTestParam.CompareVersion) <> Length(strVersion[CommIndex])) or
                            (Pos(BasicTestParam.CompareVersion, strVersion[CommIndex]) <= 0) then
                        begin
                            TfrmModule(CurrentFrom).SetResult(CommIndex, -6);
                            Exit;
                        end;
                    end;

                    //GT06B才能读基带ID,其它机型都写个临时IMEI
                    //if (strSoftModel[CommIndex]<>'GT06B') and (strSoftModel[CommIndex]<>'ET100') then
                    //if (Pos('GT06B',strSoftModel[CommIndex])<=0) and (Pos('ET100',strSoftModel[CommIndex])<=0) then
                    //if strSoftModel[CommIndex]='GT06B' then
                    if not bReadRID then //如果是能读取基带ID 2014.2.17
                    begin
                        if (Pos('GT02B', strSoftModel[CommIndex]) > 0) or (Pos('TR02B', strSoftModel[CommIndex]) > 0) then
                        begin
                            SendToComm(CommIndex, 'ATEGMRR', 'AT+EGMR=0,10', True, CTimeOut);
                        end
                        else
                        begin
                            SendToComm(CommIndex, 'ATEGMRR', 'AT+EGMR=0,7', True, CTimeOut);
                        end;
                    end
                    else
                    begin
                        if strPlanName = 'ParamDownload' then
                        begin
                            SendToComm(CommIndex, 'ATEGMR', 'AT+EGMR=0,7'); //参数下载位追加获得IMEI,再发ATID指令
                        end
                        else
                        begin
                            SendToComm(CommIndex, 'ATID', 'AT^GT_CM=ID,1');
                        end;
                    end;
                end
                else
                begin
                    if strTempVersion[CommIndex] <> '' then
                    begin
                        StrCommRecText[CommIndex] := strTempVersion[CommIndex] + StrCommRecText[CommIndex];
                    end;

                    if Pos(#$D, StrCommRecText[CommIndex]) <= 0 then
                    begin
                        strTempVersion[CommIndex] := StrCommRecText[CommIndex];
                        Exit;
                    end;
                    strTempVersion[CommIndex] := '';

                    SendToComm(CommIndex);
                    strSoftModel[CommIndex] := strAutoTestModel;

                    //取得当前机子的版本
                    StrCommRecText[CommIndex] := MidStr(PChar(StrCommRecText[CommIndex]),
                        Pos('[VERSION]', StrCommRecText[CommIndex]),
                        StrLen(PChar(StrCommRecText[CommIndex])) - Pos('[VERSION]', StrCommRecText[CommIndex]));
                    if Pos(#$D, StrCommRecText[CommIndex]) > 0 then
                    begin
                        strVersion[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos(#$D, StrCommRecText[CommIndex]) - 1);
                    end
                    else
                    begin
                        strVersion[CommIndex] := LeftStr(StrCommRecText[CommIndex], Pos('[BRANCH]', StrCommRecText[CommIndex]) - 1);
                    end;
                    strVersion[CommIndex] := stringreplace(strVersion[CommIndex], '[VERSION]', '', [rfReplaceAll]);
                    EdtVersion_0.Text := strVersion[CommIndex];

                    //比对版本
                    if strPlanName <> 'ParamDownload' then
                    begin
                        if (Length(BasicTestParam.CompareVersion) <> Length(strVersion[CommIndex])) or
                            (Pos(BasicTestParam.CompareVersion, strVersion[CommIndex]) <= 0) then
                        begin
                            TfrmModule(CurrentFrom).SetResult(CommIndex, -6);
                            Exit;
                        end;
                    end;

                    //GT06B才能读基带ID,其它机型都写个临时IMEI
                    //if (strSoftModel[CommIndex]<>'GT06B') and (strSoftModel[CommIndex]<>'ET100') then
                    //if (Pos('GT06B',strSoftModel[CommIndex])<=0) and (Pos('ET100',strSoftModel[CommIndex])<=0) then
                    //if strSoftModel[CommIndex]='GT06B' then
                    if not bReadRID then //如果是能读取基带ID 2014.2.17
                    begin
                        if (Pos('GT02B', strSoftModel[CommIndex]) > 0) or (Pos('TR02B', strSoftModel[CommIndex]) > 0) then
                        begin
                            SendToComm(CommIndex, 'ATEGMRR', 'AT+EGMR=0,10', True, CTimeOut);
                        end
                        else
                        begin
                            SendToComm(CommIndex, 'ATEGMRR', 'AT+EGMR=0,7', True, CTimeOut);
                        end;
                    end
                    else
                    begin
                        if strPlanName = 'ParamDownload' then
                        begin
                            SendToComm(CommIndex, 'ATEGMR', 'AT+EGMR=0,7'); //参数下载位追加获得IMEI，再发ATID指令
                        end
                        else
                        begin
                            SendToComm(CommIndex, 'ATID', 'AT^GT_CM=ID,1');
                        end;
                        //SendToComm(CommIndex,'ATID','AT^GT_CM=ID,1');
                    end;
                end
            end;
        end
        else
            if strCmdCommKey[CommIndex] = 'ATID' then
            begin
                if pos(' ', StrCommRecText[CommIndex]) <> 0 then
                    StrCommRecText[CommIndex] := stringreplace(StrCommRecText[CommIndex], ' ', '', [rfReplaceAll]);
                if (pos('CHIPRID:', StrCommRecText[CommIndex]) > 0) then
                begin
                    SendToComm(CommIndex);

                    strChipRid[CommIndex] := MidStr(StrCommRecText[CommIndex], pos('CHIPRID:', StrCommRecText[CommIndex]) + Length('CHIPRID:'), 32);
                    if pos('00000000000000000000000000000000', strChipRid[CommIndex]) <> 0 then Exit;

                    //除返工位，其它位都要测试看这个机子是否测试过

                    {if ((strPlanName<>'TwiceTest') and (strPlanName<>'SMTIQCTest')) then
                    begin
                     strSendText:=Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                        [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                      SendToServer(CommIndex,'CheckTested',strSendText,True,CTimeOut*2);

                    end;}

                    if strPlanName <> 'SMTIQCTest' then
                    begin
                        {strSendText:=Format('Action=CheckTestedParamCpd#ChipRid=%s#IMEI=%s#Version=%s#Tester=%s#',
                        [strChipRid[CommIndex],'',strVersion[CommIndex],User.UserName]);
                        SendToServer(CommIndex,'CheckTestedParamCpd',strSendText,True,CTimeOut*2); }

                        CheckTestedParamCpd(strChipRid[CommIndex], '', strVersion[CommIndex], strVerEx, iRecordCount);

                        if iRecordCount <> 0 then
                        begin
                            //strVersion[CommIndex] := StrListNumberSign[CommIndex].Values['VersionEx']; //跑过则把检测是否测试过版本替换为基础版本
                            if strPlanName = 'TwiceTest' then
                            begin
                                SendToComm(CommIndex);
                                SendToComm(CommIndex, 'AT', 'AT');
                            end
                            else
                            begin
                                {strSendText := Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                                    [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], User.UserName]);
                                SendToServer(CommIndex, 'CheckTested', strSendText, True, CTimeOut * 2); }
                                CheckTested(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], iRecordCount);
                                if iRecordCount <> 0 then
                                begin
                                    TfrmModule(CurrentFrom).SetResult(CommIndex, -4);
                                end
                                else
                                begin
                                    {strSendText := Format('Action=CheckMustTest#PlanName=%s#SoftModel=%s#Tester=%s#', [strPlanName, strSoftModel[CommIndex], User.UserName]);
                                    SendToServer(CommIndex, 'CheckMustTest', strSendText, True, CTimeOut * 2);  }

                                    CheckMustTest(strPlanName, strSoftModel[CommIndex], iRecordCount);
                                    if iRecordCount = 0 then
                                    begin
                                        TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, -5);
                                    end
                                    else
                                    begin
                                        SendToComm(CommIndex, 'AT', 'AT');

                                    end;

                                end;
                            end;
                        end
                        else
                        begin
                            if strPlanName = 'TwiceTest' then
                            begin
                                SendToComm(CommIndex);
                                SendToComm(CommIndex, 'AT', 'AT');
                            end
                            else
                            begin
                                {strSendText := Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                                    [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], User.UserName]);
                                SendToServer(CommIndex, 'CheckTested', strSendText, True, CTimeOut * 2); }

                                CheckTested(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], iRecordCount);
                                NoteSocketLog(CommIndex, 'iRecordCount=' + IntToStr(iRecordCount));
                                if iRecordCount <> 0 then
                                begin
                                    TfrmModule(CurrentFrom).SetResult(CommIndex, -4);
                                end
                                else
                                begin
                                    {strSendText := Format('Action=CheckMustTest#PlanName=%s#SoftModel=%s#Tester=%s#', [strPlanName, strSoftModel[CommIndex], User.UserName]);
                                    SendToServer(CommIndex, 'CheckMustTest', strSendText, True, CTimeOut * 2);  }

                                    CheckMustTest(strPlanName, strSoftModel[CommIndex], iRecordCount);
                                    if iRecordCount = 0 then
                                    begin
                                        TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, -5);
                                    end
                                    else
                                    begin
                                        SendToComm(CommIndex, 'AT', 'AT');

                                    end;

                                end;
                            end;
                        end;
                    end;
                end
                else
                    Exit;
            end
                //读机子的IMEI
            else
                if strCmdCommKey[CommIndex] = 'ATEGMRR' then
                begin
                    if Pos('+EGMR:', StrCommRecText[CommIndex]) > 0 then
                    begin
                        SendToComm(CommIndex);

                        //取机子的IMEI
                        strIMEI[CommIndex] := MidStr(PChar(StrCommRecText[CommIndex]),
                            Pos('+EGMR: "', StrCommRecText[CommIndex]) + strlen('+EGMR: "'),
                            Pos('"OK', StrCommRecText[CommIndex]) - Pos('+EGMR: "', StrCommRecText[CommIndex]) - strlen('+EGMR: "'));
                        //若IMEI为358688000000158,则表明从没测试过,要写个临时IMEI进去
                        if strIMEI[CommIndex] <> '358688000000158' then
                        begin
                            strSendText := Format('Action=GetTempRid#IMEI=%s#Tester=%s#', [strIMEI[CommIndex], User.UserName]);
                            SendToServer(CommIndex, 'GetTempRid', strSendText, True, CTimeOut * 2);
                        end
                        else
                        begin
                            SendToServer(CommIndex, 'GetTempImei', format('Action=GetTempImei#Tester=%s#', [User.UserName]), True, CTimeOut * 2);
                        end;
                    end;
                end
                else
                    if strCmdCommKey[CommIndex] = 'ATEGMRT' then
                    begin
                        if Pos('OK', StrCommRecText[CommIndex]) > 0 then
                        begin
                            SendToComm(CommIndex);
                            //SendToComm(CommIndex,'ATEGMRR','AT+EGMR=0,7',True,CTimeOut);
                            if (Pos('GT02B', strSoftModel[CommIndex]) > 0) or (Pos('TR02B', strSoftModel[CommIndex]) > 0) then
                            begin
                                SendToComm(CommIndex, 'ATEGMRR', 'AT+EGMR=0,10', True, CTimeOut);
                            end
                            else
                            begin
                                SendToComm(CommIndex, 'ATEGMRR', 'AT+EGMR=0,7', True, CTimeOut);
                            end;
                        end;
                    end;
    Application.ProcessMessages;
end;

procedure TfrmModule.Comm_02ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 2;
    SetLength(StrCommRecText[CommIndex], DataSize);
    Move(DataPtr^, PChar(StrCommRecText[CommIndex])^, DataSize);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.Comm_03ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 3;
    SetLength(StrCommRecText[CommIndex], DataSize);
    Move(DataPtr^, PChar(StrCommRecText[CommIndex])^, DataSize);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

procedure TfrmModule.Comm_04ReceiveData(Sender: TObject;
    DataPtr: Pointer; DataSize: Integer);
var
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 4;
    SetLength(StrCommRecText[CommIndex], DataSize);
    Move(DataPtr^, PChar(StrCommRecText[CommIndex])^, DataSize);
    StrCommRecText[CommIndex] := UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex, StrCommRecText[CommIndex]);
    DeComReceieveData(CommIndex);
end;

end.

