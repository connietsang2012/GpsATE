unit uPublicFunc;

interface
uses
    Windows,Classes,Messages,Forms,SysUtils,Controls,IniFiles,Registry,
    ADOInt,ComObj,QExtCtrls,Graphics, StdCtrls, SPComm,ADODB,StrUtils,
    uGlobalVar,uModuleForm,uDmMain,uAutoTest,uAutoTestSMT,uWriteImeiTest,
    uSMTIQCTest,ufrmMessageBox,uParamDownloadTest;

    //==============================���ӷ�����=================================//
    function ConnectServer(CommIndex:Integer;IpAddress:string;Port:Integer):boolean;

    //==============================����������������=================================//
    function SendToServer(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=5000;
                        ResendNum:Integer=3;SendNum:Integer=0):Boolean;overload;    //����������������
    function SendToServer(CommIndex:Integer):Boolean;overload;                                       //������һ��������������
    function GetSendedSrvCmdkey(CommIndex:Integer):string;                                           //��÷���������������Ĺؼ���
    {function SendToComm(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000;
                        ResendNum:Integer=3;SendNum:Integer=0):Boolean;overload;    //�������������� }

    function SendToComm(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000*2;
                        ReturnText:string='';SubItemName:string='';
                        bCompare:Boolean=False;strCompare:string='';strRemark:string='';
                        bSendAtCommand:Boolean=True;
                        ResendNum:Integer=5;strRemark2:string='';SendNum:Integer=0):Boolean;overload;    //��������������

    function SendToComm(CommIndex:Integer):Boolean;overload;                                         //������һ������������
    //function GetSendedCommCmdkey(CommIndex:Integer):string;                                          //��÷�������������Ĺؼ���
    procedure GetSendedCommCmdkey(CommIndex:Integer;var strReturnText:string;
                                    var strCmdCommKey:string;var bCompare:Boolean;
                                    var strCompare:string; var strRemark:string;
                                    var strSubTestItemName:string;var strRemark2:string );                                          //��÷�������������Ĺؼ���
    procedure GetSendedAgilentCommCmdkey(CommIndex:Integer;var strReturnText:string;
                                    var strCmdCommKey:string;var bCompare:Boolean;
                                    var strCompare:string; var strRemark:string);                                          //��÷�������������Ĺؼ���

    //==============================�������=================================//
    function GetSysComm(var CommList:TStrings):boolean;                             //��ÿ��õĴ���
    procedure SetMenuEnable();                                                      //���ò˵������Ч��
    procedure ShowForm(frm:TForm);                                                  //��ʾ��Ӧ���Ӵ���
    Procedure ShowCartonBoxForm();                                                  //��ʾ��Ӧ��CartonBox����

    //procedure SetSysCommToBox(iBoxCount : Integer);                                 //�ѻ�ȡ����ע�ᴮ�ڼ�¼���µ������� 2014.01.13
    //==============================�ļ�����=================================//
    function  ReadIni(Skey,key,sFvalue:String):string;                              //��INI�ļ��ж�ȡ����
    function  WriteIni(Skey,key,sFvalue:String):Boolean;                            //������д��INI�ļ�
    Procedure AppendTxt(Str:String;FileName:String);                                //��INI�ļ����������
    Procedure ClearTxt(FileName:String);                                                //����ļ�����
    procedure WriteToText(var FileName:string;Content:string);                                      //�ж�Vaule�ǲ�������
    function  NoteSocketLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;                     //������־
    function  NoteCommLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;
    function  NoteAgilentCommLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;
    function  NoteErrorCommLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;

    function  WriteIni_GPS(Skey,key,sFvalue:String):Boolean;
    function  ReadIni_GPS(Skey,key,sFvalue:String):string;
    //==============================�ַ�������=================================//
    function IsNumberic(Vaule:String):Boolean;
    function BoolToInt(bBool:Boolean):Integer;

    function CheckImei(oldimei1:string):string;

    function XMLToRecordset(const XML: string): _Recordset;         //XMLתΪ��¼

    //function ExecuteSQL(strsql:string):boolean;         //ִ��SQL���

    function GetFileVersion(FileName: string): string;
    function CovFileDate(Fd:_FileTime):TDateTime;
    function GetFileTime(const Tf:string):string;
    function HowManyCommaChar(Const s:String):Integer;
    function SetStatusText(DisplayText:string;PanelIndex:Integer):string;

    function SendToComm_Agilent(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000;
                        ReturnText:string='';SubItemName:string='';
                        bCompare:Boolean=False;strCompare:string='';strRemark:string='';
                        bSendAtCommand:Boolean=True;
                        ResendNum:Integer=20;SendNum:Integer=0):Boolean;overload;    //��������������
    function SendToComm_Agilent(CommIndex:Integer):Boolean;overload;

    function LowerDir(const Dir: string): string;

    //�������еĲ���Ա�Ĳ�����¼
    procedure InsertOperRecord(sOperName,sOperContent,sOperTime : string;sOperDemo : string = 'Success');

    procedure CustomSleep(NumSec:SmallInt);

    function GetIMEI(TargetIMEI:string):string;


implementation

uses
    uClientMain,uCartonBox10,uCartonBoxLlf,uCartonBoxGmb;

//function GetCrc16(chid:pBytes;nleng:Integer):Word;stdcall;External 'CRC.dll';

//============================���ӷ�����============================//
function ConnectServer(CommIndex:Integer;IpAddress:string;Port:Integer):boolean;
begin
    Result:=True;
    try
        case CommIndex of
            0:
            begin
                frmClientMain.ClientSocket_0.Address:=IpAddress;
                frmClientMain.ClientSocket_0.Port:=Port;
                frmClientMain.ClientSocket_0.Open;
            end;
            1:
            begin
                frmClientMain.ClientSocket_1.Address:=IpAddress;
                frmClientMain.ClientSocket_1.Port:=Port;
                frmClientMain.ClientSocket_1.Open;
            end;
            2:
            begin
                frmClientMain.ClientSocket_2.Address:=IpAddress;
                frmClientMain.ClientSocket_2.Port:=Port;
                frmClientMain.ClientSocket_2.Open;
            end;
            3:
            begin
                frmClientMain.ClientSocket_3.Address:=IpAddress;
                frmClientMain.ClientSocket_3.Port:=Port;
                frmClientMain.ClientSocket_3.Open;
            end;
            4:
            begin
                frmClientMain.ClientSocket_4.Address:=IpAddress;
                frmClientMain.ClientSocket_4.Port:=Port;
                frmClientMain.ClientSocket_4.Open;
            end;
        end;
    except
        MessageBox(0,'Ŀ�����������ʧ��!','��Ϣ��ʾ',MB_ICONWARNING + mb_OK);
        Result:=False;
    end;
end;
//============================����������������============================//
function SendToServer(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean;
                        WaitResponseOverTime:Integer;
                        ResendNum:Integer;SendNum:Integer):Boolean;
begin
    Result:=True;
    //��δ���ӷ���������Ϊʧ��
    case CommIndex of
        0:
            if not(frmClientMain.ClientSocket_0.Socket.Connected) then
            begin
                MessageBox(0,SERVERSENDFAIL,PChar('['+IntToStr(CommIndex)+']:'+'����'),MB_ICONWARNING+MB_OK);
                Result:=False;
            end;
        1:
            if not(frmClientMain.ClientSocket_1.Socket.Connected) then
            begin
                MessageBox(0,SERVERSENDFAIL,PChar('['+IntToStr(CommIndex)+']:'+'����'),MB_ICONWARNING+MB_OK);
                Result:=False;
            end;
        2:
            if not(frmClientMain.ClientSocket_2.Socket.Connected) then
            begin
                MessageBox(0,SERVERSENDFAIL,PChar('['+IntToStr(CommIndex)+']:'+'����'),MB_ICONWARNING+MB_OK);
                Result:=False;
            end;
        3:
            if not(frmClientMain.ClientSocket_3.Socket.Connected) then
            begin
                MessageBox(0,SERVERSENDFAIL,PChar('['+IntToStr(CommIndex)+']:'+'����'),MB_ICONWARNING+MB_OK);
                Result:=False;
            end;
        4:
            if not(frmClientMain.ClientSocket_4.Socket.Connected) then
            begin
                MessageBox(0,SERVERSENDFAIL,PChar('['+IntToStr(CommIndex)+']:'+'����'),MB_ICONWARNING+MB_OK);
                Result:=False;
            end;
    end;

    begin
        //�Ƿ�ȴ���Ӧ����������뷢���б��У�����ֱ�ӷ���
        if WaitResponses then
        begin
            try
                New(SendSrvRecord[CommIndex]);
                SendSrvRecord[CommIndex]^.bInvalidation:=False;
                SendSrvRecord[CommIndex]^.sCmdKey:=CmdKey;
                SendSrvRecord[CommIndex]^.sCmd:=Cmd;
                SendSrvRecord[CommIndex]^.bWaitResponses:=WaitResponses;
                SendSrvRecord[CommIndex]^.iWaitResponseOverTime:=WaitResponseOverTime;
                SendSrvRecord[CommIndex]^.iResendNum:=3;
                SendSrvRecord[CommIndex]^.iSendNum:=1;

                SendSrvList[CommIndex].Add(SendSrvRecord[CommIndex]);
            finally
                //Dispose(SendSrvRecord[CommIndex]);
            end;
            if SendSrvList[CommIndex].Count<=1 then
            begin
               SendToServer(CommIndex);
            end;
            Application.ProcessMessages;
        end
        else
        begin
            NoteSocketLog(CommIndex,'[S:]===='+Cmd);
            case CommIndex of
              0: frmClientMain.ClientSocket_0.Socket.SendText(Cmd);
              1: frmClientMain.ClientSocket_1.Socket.SendText(Cmd);
              2: frmClientMain.ClientSocket_2.Socket.SendText(Cmd);
              3: frmClientMain.ClientSocket_3.Socket.SendText(Cmd);
              4: frmClientMain.ClientSocket_4.Socket.SendText(Cmd);
            end;
            Application.ProcessMessages;
        end;
    end;
    Application.ProcessMessages;
end;
//============================������һ��������������============================//
function SendToServer(CommIndex:Integer):Boolean;
label FindHead;
begin
    try
      case CommIndex of
        0: frmClientMain.tmrSocket_0.Enabled:=False;
        1: frmClientMain.tmrSocket_1.Enabled:=False;
        2: frmClientMain.tmrSocket_2.Enabled:=False;
        3: frmClientMain.tmrSocket_3.Enabled:=False;
        4: frmClientMain.tmrSocket_4.Enabled:=False;
      end;

FindHead:
      if SendSrvList[CommIndex].Count>0 then
      begin
        New(SendSrvRecord[CommIndex]);
        SendSrvRecord[CommIndex]:=SendSrvList[CommIndex].Items[0];
        if SendSrvRecord[CommIndex]^.bInvalidation then
        begin
            SendSrvList[CommIndex].Delete(0);
            goto FindHead;
        end;
        SendSrvRecord[CommIndex]^.bInvalidation:=True;
        SendSrvList[CommIndex].Delete(0);
        SendSrvList[CommIndex].Insert(0,SendSrvRecord[CommIndex]);

        NoteSocketLog(CommIndex,'[S:]===='+SendSrvRecord[CommIndex]^.sCmd);
        case CommIndex of
          0: frmClientMain.ClientSocket_0.Socket.SendText(SendSrvRecord[CommIndex]^.sCmd);
          1: frmClientMain.ClientSocket_1.Socket.SendText(SendSrvRecord[CommIndex]^.sCmd);
          2: frmClientMain.ClientSocket_2.Socket.SendText(SendSrvRecord[CommIndex]^.sCmd);
          3: frmClientMain.ClientSocket_3.Socket.SendText(SendSrvRecord[CommIndex]^.sCmd);
          4: frmClientMain.ClientSocket_4.Socket.SendText(SendSrvRecord[CommIndex]^.sCmd);
        end;

        if (SendSrvRecord[CommIndex]^.bWaitResponses) and (SendSrvRecord[CommIndex]^.iWaitResponseOverTime>0) then
        begin
            case CommIndex of
                0:
                begin
                    frmClientMain.tmrSocket_0.Interval:=SendSrvRecord[CommIndex]^.iWaitResponseOverTime;
                    frmClientMain.tmrSocket_0.Enabled:=True;
                end;
                1:
                begin
                    frmClientMain.tmrSocket_1.Interval:=SendSrvRecord[CommIndex]^.iWaitResponseOverTime;
                    frmClientMain.tmrSocket_1.Enabled:=True;
                end;
                2:
                begin
                    frmClientMain.tmrSocket_2.Interval:=SendSrvRecord[CommIndex]^.iWaitResponseOverTime;
                    frmClientMain.tmrSocket_2.Enabled:=True;
                end;
                3:
                begin
                    frmClientMain.tmrSocket_3.Interval:=SendSrvRecord[CommIndex]^.iWaitResponseOverTime;
                    frmClientMain.tmrSocket_3.Enabled:=True;
                end;
                4:
                begin
                    frmClientMain.tmrSocket_4.Interval:=SendSrvRecord[CommIndex]^.iWaitResponseOverTime;
                    frmClientMain.tmrSocket_4.Enabled:=True;
                end;
              end;

        end;
      end;
    finally
        //Dispose(SendSrvRecord[CommIndex]);
    end;
    Result:=True;
    Application.ProcessMessages;
end;
//============================��÷���������������Ĺؼ���============================//
function GetSendedSrvCmdkey(CommIndex:Integer):string;
begin
    Result:='';
    if (SendSrvList[CommIndex].Count>0) then
    begin
        try
            New(SendSrvRecord[CommIndex]);
            SendSrvRecord[CommIndex]:=SendSrvList[CommIndex].Items[0];
            if (SendSrvRecord[CommIndex]^.bWaitResponses) and (SendSrvRecord[CommIndex]^.bInvalidation) then
            begin
                Result:=SendSrvRecord[CommIndex]^.sCmdKey;
            end;
        finally
            //Dispose(SendSrvRecord[CommIndex]);
        end;
    end;
end;


//==========================��������������============================//
function SendToComm(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean;
                        WaitResponseOverTime:Integer;
                        ReturnText:string;SubItemName:string;
                        bCompare:Boolean;strCompare:string;strRemark:string;
                        bSendAtCommand:Boolean;
                        ResendNum:Integer;strRemark2:string;SendNum:Integer):Boolean;    //��������������
var
  SendCommRecord:PSendCommRecord;                         //���������ڵ�����
begin
    Result:=True;
    //��δ���Ӵ�������Ϊʧ��
    //if not SerialInfo[CommIndex].bConnectedComm then
    {case CommIndex of
        0:
        begin
          if (TfrmModule(CurrentFrom).Comm_0.ComHandle=INVALID_HANDLE_VALUE) then
          begin
            Result:=False;
            Application.ProcessMessages;
            Exit;
          end;
        end;
        1:
        begin
          if (TfrmModule(CurrentFrom).Comm_1.ComHandle=INVALID_HANDLE_VALUE)  then
          begin
            Result:=False;
            Application.ProcessMessages;
            Exit;
          end;
        end;
        2:
        begin
          if (TfrmModule(CurrentFrom).Comm_2.ComHandle=INVALID_HANDLE_VALUE) then
          begin
            Result:=False;
            Application.ProcessMessages;
            Exit;
          end;
        end;
        3:
        begin
          if (TfrmModule(CurrentFrom).Comm_3.ComHandle=INVALID_HANDLE_VALUE) then
          begin
            Result:=False;
            Application.ProcessMessages;
            Exit;
          end;
        end;
        4:
        begin
          if (TfrmModule(CurrentFrom).Comm_4.ComHandle=INVALID_HANDLE_VALUE) then
          begin
            Result:=False;
            Application.ProcessMessages;
            Exit;
          end;
        end;
    end;}
        //�Ƿ�ȴ���Ӧ����������뷢���б��У�����ֱ�ӷ���
        if WaitResponses then
        begin
            try
                New(SendCommRecord);
                SendCommRecord^.bInvalidation:=False;
                SendCommRecord^.sCmdKey:=CmdKey;
                SendCommRecord^.sCmd:=Cmd+#13+#10;
                SendCommRecord^.sReturnText:=ReturnText;
                SendCommRecord^.bWaitResponses:=WaitResponses;
                SendCommRecord^.iWaitResponseOverTime:=WaitResponseOverTime;
                SendCommRecord^.iResendNum:=ResendNum;
                SendCommRecord^.iSendNum:=1;
                SendCommRecord^.sSubItemName:=SubItemName;
                SendCommRecord^.bCompare:=bCompare;
                SendCommRecord^.strCompare:=strCompare;
                SendCommRecord^.strRemark:=strRemark;
                SendCommRecord^.bSendAtCommand:=bSendAtCommand;
                SendCommRecord^.strRemark2:=strRemark2;
                SendCommList[CommIndex].Add(SendCommRecord);
            finally
                //Dispose(SendCommRecord);
            end;

            if SendCommList[CommIndex].Count<=1 then
            begin
               SendToComm(CommIndex);
            end;
            Application.ProcessMessages;
        end
        else
        begin

            NoteCommLog(CommIndex,'[S:]===='+Cmd);
            if bSendAtCommand then
            begin
               Application.ProcessMessages;
                Sleep(BasicTestParam.SleepTime);
                if bUsbReceieveData then
                  begin
                      case CommIndex of
                        0: TfrmModule(CurrentFrom).Comm_00.SendString(PChar(SendCommRecord.sCmd));
                        1: TfrmModule(CurrentFrom).Comm_01.SendString(PChar(SendCommRecord.sCmd));
                        2: TfrmModule(CurrentFrom).Comm_02.SendString(PChar(SendCommRecord.sCmd));
                        3: TfrmModule(CurrentFrom).Comm_03.SendString(PChar(SendCommRecord.sCmd));
                        4: TfrmModule(CurrentFrom).Comm_04.SendString(PChar(SendCommRecord.sCmd));
                      end;
                  end
                  else
                  begin
                      case CommIndex of
                        0: TfrmModule(CurrentFrom).Comm_0.WriteCommData(PChar(Cmd),StrLen(PChar(SendCommRecord.sCmd)));
                        1: TfrmModule(CurrentFrom).Comm_1.WriteCommData(PChar(Cmd),StrLen(PChar(SendCommRecord.sCmd)));
                        2: TfrmModule(CurrentFrom).Comm_2.WriteCommData(PChar(Cmd),StrLen(PChar(SendCommRecord.sCmd)));
                        3: TfrmModule(CurrentFrom).Comm_3.WriteCommData(PChar(Cmd),StrLen(PChar(SendCommRecord.sCmd)));
                        4: TfrmModule(CurrentFrom).Comm_4.WriteCommData(PChar(Cmd),StrLen(PChar(SendCommRecord.sCmd)));
                      end;

                  end;
            end;

        end;
    Application.ProcessMessages;
end;
//============================������һ��������������============================//
function SendToComm(CommIndex:Integer):Boolean;
label FindHead;
var
    strTemp:string;
    SendCommRecord:PSendCommRecord;                         //���������ڵ�����
    //strCompar:string;
begin

  try
    case CommIndex of
      0: TfrmModule(CurrentFrom).tmrRecCommTimeOut_0.Enabled:=False;
      1: TfrmModule(CurrentFrom).tmrRecCommTimeOut_1.Enabled:=False;
      2: TfrmModule(CurrentFrom).tmrRecCommTimeOut_2.Enabled:=False;
      3: TfrmModule(CurrentFrom).tmrRecCommTimeOut_3.Enabled:=False;
      4: TfrmModule(CurrentFrom).tmrRecCommTimeOut_4.Enabled:=False;
    end;

FindHead:
    if SendCommList[CommIndex].Count>0 then
    begin
        //if not bGetTestItemed[CommIndex] then  Exit;
        New(SendCommRecord);
        SendCommRecord:=SendCommList[CommIndex].Items[0];
        if SendCommRecord^.bInvalidation then
        begin
            SendCommList[CommIndex].Delete(0);
            goto FindHead;
        end;
        SendCommRecord^.bInvalidation:=True;
        SendCommList[CommIndex].Delete(0);
        SendCommList[CommIndex].Insert(0,SendCommRecord);
        if (strPlanName='AutoTest') and (bAppendResult[CommIndex]) then
        begin
            //��ʾ���ڲ��Ե���
            case CommIndex of
                1:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_1.Last;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_1.Append;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_1.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_1.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestMain(CurrentFrom).SB_TestStatus_1.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult1.Caption:='�밴���������';
                        TfrmAutoTestMain(CurrentFrom).TestResult1.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult1.Caption:='���ٰ����������';
                        TfrmAutoTestMain(CurrentFrom).TestResult1.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult1.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestMain(CurrentFrom).TestResult1.Color:=clYellow;
                        TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestMain(CurrentFrom).TesItem_Comm1.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).GPSTC_1.Pop(True);
                        TfrmAutoTestMain(CurrentFrom).GPSTC_1.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep1.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep1.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
                2:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_2.Last;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_2.Append;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_2.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_2.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestMain(CurrentFrom).SB_TestStatus_2.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult2.Caption:='�밴���������';
                        TfrmAutoTestMain(CurrentFrom).TestResult2.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult2.Caption:='���ٰ����������';
                        TfrmAutoTestMain(CurrentFrom).TestResult2.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult2.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestMain(CurrentFrom).TestResult2.Color:=clYellow;
                        TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestMain(CurrentFrom).TesItem_Comm2.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).GPSTC_2.Pop(True);
                        TfrmAutoTestMain(CurrentFrom).GPSTC_2.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep2.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep2.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
                3:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_3.Last;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_3.Append;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_3.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_3.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestMain(CurrentFrom).SB_TestStatus_3.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult3.Caption:='�밴���������';
                        TfrmAutoTestMain(CurrentFrom).TestResult3.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult3.Caption:='���ٰ����������';
                        TfrmAutoTestMain(CurrentFrom).TestResult3.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult3.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestMain(CurrentFrom).TestResult3.Color:=clYellow;
                        TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestMain(CurrentFrom).TesItem_Comm3.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).GPSTC_3.Pop(True);
                        TfrmAutoTestMain(CurrentFrom).GPSTC_3.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep3.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep3.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
                4:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_4.Last;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_4.Append;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_4.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestMain(CurrentFrom).UniQuery_TestResult_4.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestMain(CurrentFrom).SB_TestStatus_4.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult4.Caption:='�밴���������';
                        TfrmAutoTestMain(CurrentFrom).TestResult4.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult4.Caption:='���ٰ����������';
                        TfrmAutoTestMain(CurrentFrom).TestResult4.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).TestResult4.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestMain(CurrentFrom).TestResult4.Color:=clYellow;
                        TfrmAutoTestMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestMain(CurrentFrom).TesItem_Comm4.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestMain(CurrentFrom).GPSTC_4.Pop(True);
                        TfrmAutoTestMain(CurrentFrom).GPSTC_4.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep4.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestMain(CurrentFrom).tmrSleep4.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
            else ;
            end;
        end;
        if (strPlanName='AutoTestSMT') and (bAppendResult[CommIndex]) then
        begin
            //��ʾ���ڲ��Ե���
            case CommIndex of
                1:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_1.Last;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_1.Append;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_1.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_1.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestSMTMain(CurrentFrom).SB_TestStatus_1.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult1.Caption:='�밴���������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult1.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult1.Caption:='���ٰ����������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult1.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult1.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult1.Color:=clYellow;
                        TfrmAutoTestSMTMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestSMTMain(CurrentFrom).TesItem_Comm1.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_1.Pop(True);
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_1.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep1.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep1.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
                2:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_2.Last;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_2.Append;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_2.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_2.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestSMTMain(CurrentFrom).SB_TestStatus_2.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult2.Caption:='�밴���������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult2.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult2.Caption:='���ٰ����������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult2.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult2.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult2.Color:=clYellow;
                        TfrmAutoTestSMTMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestSMTMain(CurrentFrom).TesItem_Comm2.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_2.Pop(True);
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_2.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep2.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep2.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
                3:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_3.Last;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_3.Append;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_3.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_3.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestSMTMain(CurrentFrom).SB_TestStatus_3.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult3.Caption:='�밴���������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult3.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult3.Caption:='���ٰ����������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult3.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult3.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult3.Color:=clYellow;
                        TfrmAutoTestSMTMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestSMTMain(CurrentFrom).TesItem_Comm3.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_3.Pop(True);
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_3.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep3.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep3.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
                4:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.strRemark<>'EPO_DATA') and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_4.Last;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_4.Append;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_4.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmAutoTestSMTMain(CurrentFrom).UniQuery_TestResult_4.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmAutoTestSMTMain(CurrentFrom).SB_TestStatus_4.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                    //LEDOFF��LEDON�����ʾҪ����
                    if Pos('LEDOFF',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult4.Caption:='�밴���������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult4.Color:=clYellow;
                    end;
                    if Pos('LEDON',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult4.Caption:='���ٰ����������';
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult4.Color:=clYellow;
                    end;
                    if Pos('PROMPT',SendCommRecord^.sCmdKey)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult4.Caption:=SendCommRecord^.strRemark;
                        TfrmAutoTestSMTMain(CurrentFrom).TestResult4.Color:=clYellow;
                        TfrmAutoTestSMTMain(CurrentFrom).SetTestItemResult(CommIndex,TfrmAutoTestSMTMain(CurrentFrom).TesItem_Comm4.Items[0],1);
                    end;
                    if Pos('GPSTC',SendCommRecord^.strRemark)>0 then
                    begin
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_4.Pop(True);
                        TfrmAutoTestSMTMain(CurrentFrom).GPSTC_4.StayOn:=True;
                        bFirstCount[CommIndex] := True;             //�״ο�ʼ�������ץ�������� 2014.03.12
                        TfrmAutoTestMain(CurrentFrom).ClearCountArrayList(CommIndex);
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep4.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmAutoTestSMTMain(CurrentFrom).tmrSleep4.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    if Pos('SELECT',SendCommRecord^.sCmdKey)>0  then
                    begin
                        SendCommRecord^.bWaitResponses:=False;

                        strTemp:=Format('%s?',[SendCommRecord^.sSubItemName]);
                        frmMessagebox.Caption:='ѡ����';
                        frmMessagebox.lbl1.Caption:=strTemp;
                        frmMessagebox.show;
                        Application.ProcessMessages;
                    end;
                end;
            end;
        end;
        if (strPlanName='ParamDownload') and (bAppendResult[CommIndex]) then
        begin
            //��ʾ���ڲ��Ե���
            case CommIndex of
                1:
                begin
                    if (SendCommRecord^.iSendNum=1) and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST') and (SendCommRecord^.sCmdKey<>'VERMODE')and (SendCommRecord^.sCmdKey<>'ATPARAMVERSION') then
                    begin
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_1.Last;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_1.Append;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_1.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_1.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep1.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep1.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmParamDownloadTest(CurrentFrom).SB_TestStatus_1.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                end;
                2:
                begin
                    if (SendCommRecord^.iSendNum=1) and (SendCommRecord^.sCmdKey<>'ATALLOWTEST')and (SendCommRecord^.sCmdKey<>'VERMODE')and (SendCommRecord^.sCmdKey<>'ATPARAMVERSION')   then
                    begin
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_2.Last;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_2.Append;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_2.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_2.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep2.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep2.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmParamDownloadTest(CurrentFrom).SB_TestStatus_2.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                end;
                3:
                begin
                    if (SendCommRecord^.iSendNum=1) and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST') and (SendCommRecord^.sCmdKey<>'VERMODE') and (SendCommRecord^.sCmdKey<>'ATPARAMVERSION') then
                    begin
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_3.Last;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_3.Append;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_3.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_3.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep3.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep3.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmParamDownloadTest(CurrentFrom).SB_TestStatus_3.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                end;
                4:
                begin
                    if (SendCommRecord^.iSendNum=1) and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')and (SendCommRecord^.sCmdKey<>'VERMODE')and (SendCommRecord^.sCmdKey<>'ATPARAMVERSION')  then
                    begin
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_4.Last;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_4.Append;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_4.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmParamDownloadTest(CurrentFrom).UniQuery_TestResult_4.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep4.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmParamDownloadTest(CurrentFrom).tmrSleep4.Enabled:=True;
                        Application.ProcessMessages;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmParamDownloadTest(CurrentFrom).SB_TestStatus_4.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                end;
            end;
        end;
        if (strPlanName='SMTIQCTest') and (bAppendResult[CommIndex]) then
        begin
            //��ʾ���ڲ��Ե���
            case CommIndex of
                1:
                begin
                    if (SendCommRecord^.iSendNum=1) and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST')  then
                    begin
                        TfrmSMTIQCTest(CurrentFrom).UniQuery_TestResult_1.Last;
                        TfrmSMTIQCTest(CurrentFrom).UniQuery_TestResult_1.Append;
                        TfrmSMTIQCTest(CurrentFrom).UniQuery_TestResult_1.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmSMTIQCTest(CurrentFrom).UniQuery_TestResult_1.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //�����SLEEP���ھ�Ĭ״̬������ָ��
                    {if Pos('SLEEP',SendCommRecord^.strRemark)>0 then
                    begin
                        SendCommRecord^.bWaitResponses:=False;
                        TfrmSMTIQCTest(CurrentFrom).tmrSleep1.Interval:=SendCommRecord^.iWaitResponseOverTime;
                        TfrmSMTIQCTest(CurrentFrom).tmrSleep1.Enabled:=True;
                        Application.ProcessMessages;
                    end; }
                    //��ʾ���ڲ��Ե���
                    TfrmSMTIQCTest(CurrentFrom).SB_TestStatus_1.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                end;


            end;
        end;

        if (strPlanName='WriteImei') and (bAppendResult[CommIndex]) then
        begin
            //��ʾ���ڲ��Ե���
            case CommIndex of
                0:
                begin
                    if (SendCommRecord^.iSendNum=1) and  (SendCommRecord^.sCmdKey<>'ATALLOWTEST') and (SendCommRecord^.sCmdKey<>'ATEGMR')  then
                    begin
                        TfrmWriteImeiTest(CurrentFrom).UniQuery_TestResult_0.Last;
                        TfrmWriteImeiTest(CurrentFrom).UniQuery_TestResult_0.Append;
                        TfrmWriteImeiTest(CurrentFrom).UniQuery_TestResult_0.FieldByName('TestItem').Value:=SendCommRecord^.sCmdKey;
                        TfrmWriteImeiTest(CurrentFrom).UniQuery_TestResult_0.FieldByName('SubTestItem').Value:=SendCommRecord^.sSubItemName;
                    end;
                    //��ʾ���ڲ��Ե���
                    TfrmWriteImeiTest(CurrentFrom).SB_TestStatus_0.Panels[1].Text:='���ڲ���'+SendCommRecord^.sSubItemName;

                end;


            end;
        end;

        NoteCommLog(CommIndex,'[S:]===='+SendCommRecord^.sCmd);
        if SendCommRecord^.bSendAtCommand then
        begin
        {strCompar:= 'AT^GT_CM=TEST' + #13+#10;
        if SendCommRecord^.sCmd<> strCompar  then}
        
        if SendCommRecord^.sCmdKey<>'ATALLOWTEST' then
        begin
          Sleep(BasicTestParam.SleepTime);
        end;

        if bUsbReceieveData then
                  begin
                      case CommIndex of
                        0: TfrmModule(CurrentFrom).Comm_00.SendString(PChar(SendCommRecord.sCmd));
                        1: TfrmModule(CurrentFrom).Comm_01.SendString(PChar(SendCommRecord.sCmd));
                        2: TfrmModule(CurrentFrom).Comm_02.SendString(PChar(SendCommRecord.sCmd));
                        3: TfrmModule(CurrentFrom).Comm_03.SendString(PChar(SendCommRecord.sCmd));
                        4: TfrmModule(CurrentFrom).Comm_04.SendString(PChar(SendCommRecord.sCmd));
                      end;
                  end
            else
                  begin
                      case CommIndex of
                        0: TfrmModule(CurrentFrom).Comm_0.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        1: TfrmModule(CurrentFrom).Comm_1.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        2: TfrmModule(CurrentFrom).Comm_2.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        3: TfrmModule(CurrentFrom).Comm_3.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        4: TfrmModule(CurrentFrom).Comm_4.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                      end;

                  end;


            //Sleep(10);
        end;

        if (SendCommRecord^.bWaitResponses) and (SendCommRecord^.iWaitResponseOverTime>0) then
        begin

            case CommIndex of
                0:
                begin
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_0.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_0.Enabled:=True;
                end;
                1:
                begin
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_1.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_1.Enabled:=True;
                end;
                2:
                begin
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_2.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_2.Enabled:=True;
                end;
                3:
                begin
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_3.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_3.Enabled:=True;
                end;
                4:
                begin
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_4.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecCommTimeOut_4.Enabled:=True;
                end;
            end;
        end;

    end;
  finally
    //Dispose(SendCommRecord);
    Result:=False;
  end;
    Result:=True;
end;

//��õ�ǰ��������������������Ϣ
procedure GetSendedCommCmdkey(CommIndex:Integer;var strReturnText:string;
                                                    var strCmdCommKey:string;var bCompare:Boolean;
                                                    var strCompare:string; var strRemark:string;
                                                    var strSubTestItemName:string;var strRemark2:string);
//strReturnText:����ֵ strCmdCommKey:�ؼ���,bCompare:�Ƿ���Ҫ�ȶ�,strCompare:�ȶ�ֵ�ķ�Χ,strRemark:�ַ��ָ��
//strSubTestItemName:�Ӳ���������
var
  SendCommRecord:PSendCommRecord;                         //���������ڵ�����
begin
    strCmdCommKey:='';
    strReturnText:='';
    bCompare:=False;
    strCompare:='';
    strRemark:='';
    strSubTestItemName:='';
    strRemark2:='';
    if (SendCommList[CommIndex].Count>0) then
    begin
        try
          New(SendCommRecord);
          SendCommRecord:=SendCommList[CommIndex].Items[0];

          if {(SendCommRecord^.bWaitResponses) and} (SendCommRecord^.bInvalidation) then
          begin
              strCmdCommKey:=UpperCase(SendCommRecord^.sCmdKey);
              strReturnText:=UpperCase(SendCommRecord^.sReturnText);
              bCompare:=SendCommRecord^.bCompare;
              strCompare:=UpperCase(SendCommRecord^.strCompare);
              strRemark:=UpperCase(SendCommRecord^.strRemark);
              strSubTestItemName:=UpperCase(SendCommRecord^.sSubItemName);
              strRemark2:=UpperCase(SendCommRecord^.strRemark2);
          end;
        finally
          //Dispose(SendCommRecord);
        end;
    end;
end;
//��õ�ǰ��������������������Ϣ
procedure GetSendedAgilentCommCmdkey(CommIndex:Integer;var strReturnText:string;
                                                    var strCmdCommKey:string;var bCompare:Boolean;
                                                    var strCompare:string; var strRemark:string);
//strReturnText:����ֵ strCmdCommKey:�ؼ���,bCompare:�Ƿ���Ҫ�ȶ�,strCompare:�ȶ�ֵ�ķ�Χ,strRemark:�ַ��ָ��
//strSubTestItemName:�Ӳ���������
var
  SendAgilentCommRecord:PSendCommRecord;                         //���������ڵ�����
begin
    strCmdCommKey:='';
    strReturnText:='';
    bCompare:=False;
    strCompare:='';
    strRemark:='';
    if (SendAgilentCommList[CommIndex].Count>0) then
    begin
        try
          New(SendAgilentCommRecord);
          SendAgilentCommRecord:=SendAgilentCommList[CommIndex].Items[0];

          if {(SendCommRecord^.bWaitResponses) and} (SendAgilentCommRecord^.bInvalidation) then
          begin
              strCmdCommKey:=UpperCase(SendAgilentCommRecord^.sCmdKey);
              strReturnText:=UpperCase(SendAgilentCommRecord^.sReturnText);
              bCompare:=SendAgilentCommRecord^.bCompare;
              strCompare:=UpperCase(SendAgilentCommRecord^.strCompare);
              strRemark:=UpperCase(SendAgilentCommRecord^.strRemark);
          end;
        finally
          //Dispose(SendAgilentCommRecord);
        end;
    end;
end;
//============================���ò˵������Ч��============================//
procedure SetMenuEnable();
begin
    frmClientMain.ac_UserType.Enabled:=(User.UserType='admin' );
    frmClientMain.ac_User.Enabled:=(User.UserType='admin' );
    frmClientMain.ac_TestPlan.Enabled:=(User.UserType='admin' );
    frmClientMain.ac_TestWrong.Enabled:=(User.UserType='admin' );
    frmClientMain.ac_ProductSet.Enabled:=(User.UserType='admin' );

    frmClientMain.ac_TestParam.Enabled:=(User.UserType='admin' );
    frmClientMain.ac_AutoTestSetting.Enabled:=((User.UserType='admin') );
    frmClientMain.ac_CartonBoxMan.Enabled:=(User.UserType='admin');

    //frmClientMain.ac_BasicTestParam.Enabled:=(User.UserType='Admin');
    frmClientMain.ac_FunctionTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='FuncTest'));
    frmClientMain.ac_GPSTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='GPSTest'));
    frmClientMain.ac_CoupleTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='CoupleTest'));
    frmClientMain.ac_WriteImeiTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='WriteImei'));
    frmClientMain.ac_ParamDownloadTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='ParamDownload'));
    frmClientMain.ac_CartonBoxSet.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='CartonBox'));
    //frmClientMain.AutoTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='AutoTest'));
    frmClientMain.ac_AutoTest.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='AutoTest'));
    frmClientMain.ac_AutoTestSMT.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='AutoTestSMT'));
    frmClientMain.ac_Twice.Enabled:=((User.TestPlan='ALL') or (User.TestPlan='TwiceTest'));
end;
//============================��ʾ��Ӧ���Ӵ���============================//
procedure ShowForm(frm:TForm);
var
    strTemp:string;
begin
    if CurrentFrom<>nil then
    begin
            CurrentFrom.Close();
    end;
    CurrentFrom:=frm;//���浱ǰ��Ծ����
    frm.Parent := frmClientMain.ts1;
    frm.Width:=frmClientMain.Width;
    frm.BorderStyle := bsNone;
    frm.Visible := true;
    frm.Align := alClient;
    frm.Position:=poScreenCenter;
    frmClientMain.SDClientMain.AddNestForm(frmClientMain,frm);
    frmClientMain.ts1.Caption :=frm.Caption ;
end;
//============================��INI�ļ��ж�ȡ����============================//
//��ȡĬ������ININֵ, SKEYΪ�ؼ��� KEY�ؼ��ڵ���,Svalue Ϊ��ȡ������ֵ  sFvalueĬ��ֵ SFilePahtѡ����ļ�·�� �����ַ���
function  ReadIni(Skey,key,sFvalue:String):string;
var
    Svalue:String;
    Tinif:TIniFile;                 //INI�ļ����
begin
    try
        Svalue :=  ExtractFilePath(ParamStr(0))+'PrintLog\db.ini';
        Tinif := TIniFile.Create(LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\db.ini');
        Svalue := Tinif.ReadString(Skey,key,sFvalue);
        Tinif.Destroy;
    except
        Result :='';
    end;
    Result :=Svalue;
end;
//============================������д��INI�ļ�============================//
function  WriteIni(Skey,key,sFvalue:String):Boolean;
var
  Tinif:TIniFile;                 //INI�ļ����
begin
    try
        Tinif := TIniFile.Create(LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\db.ini');
        Tinif.WriteString(Skey,key,sFvalue);
        Tinif.Destroy;
    Except
        Result :=false;
    end;
    Result :=True;
end;
//============================��INI�ļ��ж�ȡ����============================//
function LowerDir(const Dir: string): string;
var
  i, j: Integer;
begin
  Result := Dir;
  j := -1;
  for i := Length(Dir) downto 1 do
    if (Dir[i] = '\') and (i < Length(Dir)) then
    begin
      j := i;
      Break;
    end;
  if j > -1 then
    Result := Copy(Dir, 1, j);
end; 
//��ȡĬ������ININֵ, SKEYΪ�ؼ��� KEY�ؼ��ڵ���,Svalue Ϊ��ȡ������ֵ  sFvalueĬ��ֵ SFilePahtѡ����ļ�·�� �����ַ���
function  ReadIni_GPS(Skey,key,sFvalue:String):string;
var
    Svalue:String;
    strTemp:string;
    Tinif:TIniFile;                 //INI�ļ����
begin
    try
        strTemp:= LowerDir(ExtractFilePath(ParamStr(0)))+'GPS DB\GpsDB.ini';
        //Application.MessageBox(PChar(strTemp),'123',MB_OK);
        Tinif := TIniFile.Create(LowerDir(ExtractFilePath(ParamStr(0)))+'GPS DB\GpsDB.ini');
        Svalue := Tinif.ReadString(Skey,key,sFvalue);
        Tinif.Destroy;
    except
        Result :='';
    end;
    Result :=Svalue;
end;
//============================������д��INI�ļ�============================//
function  WriteIni_GPS(Skey,key,sFvalue:String):Boolean;
var
    strTemp:string;
    Tinif:TIniFile;                 //INI�ļ����
begin
    try
        strTemp:= LowerDir(ExtractFilePath(ParamStr(0)))+'GPS DB\GpsDB.ini';
        Tinif := TIniFile.Create(LowerDir(ExtractFilePath(ParamStr(0)))+'GPS DB\GpsDB.ini');
        Tinif.WriteString(Skey,key,sFvalue);
        Tinif.Destroy;
    Except
        Result :=false;
    end;
    Result :=True;
end;
//============================��INI�ļ����������============================//
Procedure ClearTxt(FileName:String);
Var
   F:Text;
begin
    AssignFile(F, FileName);
    if  not  FileExists(FileName)   then  Rewrite(F);
    Rewrite(F);
    Closefile(F);
end;
Procedure AppendTxt(Str:String;FileName:String);
Var
   F:Text;
Begin
    AssignFile(F, FileName);
    if  not  FileExists(FileName)   then  Rewrite(F);
    Append(F);
    Writeln(F, Str);
    Closefile(F);
End;
//============================��ʾ��Ӧ��CartonBox����============================//
Procedure ShowCartonBoxForm();
begin
  try
    if ((ReadIni('CartonBoxSet','PrintCount','10')='10') and
        (ReadIni('CartonBoxSet','PrintType','Ĭ��')='Ĭ��')) then
    begin
        frmCartonBox_10:=TfrmCartonBox_10.Create(frmClientMain);
        ShowForm(frmCartonBox_10);
    end
    {else if (ReadIni('CartonBoxSet','PrintType','Ĭ��')='Ĭ��')then
    begin
        frmCartonBox_20:=TfrmCartonBox_20.Create(frmClientMain);
        ShowForm(frmCartonBox_20);
    end}
    else if ReadIni('CartonBoxSet','PrintType','Ĭ��')='����' then
    begin
        frmCartonBoxLlf:=TfrmCartonBoxLlf.Create(frmClientMain);
        ShowForm(frmCartonBoxLlf);
    end
    else if ReadIni('CartonBoxSet','PrintType','Ĭ��')='Ӣ��' then
    begin
        frmCartonBoxGmb:=TfrmCartonBoxGmb.Create(frmClientMain);
        ShowForm(frmCartonBoxGmb);
    end;
    {else if ReadIni('CartonBoxSet','PrintType','Ĭ��')='����˹' then
    begin
        frmCartonBoxEls:=TfrmCartonBoxEls.Create(frmClientMain);
        ShowForm(frmCartonBoxEls);
    end
    else if (ReadIni('CartonBoxSet','PrintType','Ĭ��')='Ӣ��(����)') then
    begin
        frmCartonBoxGmb1:=TfrmCartonBoxGmb1.Create(frmClientMain);
        ShowForm(frmCartonBoxGmb1);
    end; }
	except
  end;
end;
{
  ��������:��ȡϵͳ�п��õĴ���
  ��������:CommList->���洮�ڵ��б�
  ��������ֵ:True->��óɹ�,False->���ʧ��
}
function  GetSysComm(var CommList:TStrings):boolean;
var
    CommReg: TRegistry;
    CommRegKeyValues: TStringList;
    Count: word;
begin
    CommReg := TRegistry.Create;        //����TRegistry����
    CommReg.RootKey := HKEY_LOCAL_MACHINE;     //����
    if CommReg.KeyExists('HARDWARE\DEVICEMAP\SERIALCOMM') and
        CommReg.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM', false) then    //����
    begin
        CommRegKeyValues := TStringList.Create;
        CommReg.GetValueNames(CommRegKeyValues);
        if CommRegKeyValues.Count > 0 then
          for Count:= 0 to CommRegKeyValues.Count - 1 do
            CommList.add(CommReg.ReadString(CommRegKeyValues[Count]));
        CommRegKeyValues.Free;
    end;
    CommReg.Free;
    if   CommList.Count >0 then
        result:=true
    else
        result:=false;
end;

{
	��������:�ѻ�õ�ע�ᴮ�ڼ�¼���µ�������
  ��������: iBoxCount -> �������ж��ٸ�����������
}
{procedure SetSysCommToBox(iBoxCount : Integer);
var
  iCommindex,Count:Integer;
  CommList: TStrings;
begin
  for iCommindex := 0 to iBoxCount do
  begin
    CommList:= TStringList.Create;
    if GetSysComm(CommList) then
    begin
      for Count:= 0 to CommList.Count-1 do
      begin
        //TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
        //TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
      end;
    end;
    CommList.free;
  end;
end; }

//Source���ָ��ַ���  Deli:�ָ����
{function SplitString(Source,Deli:string):TStringList;stdcall;  //�ַ����ָ��
var
    EndOfCurrentString:byte;
    StringList :TStringList;
begin
     StringList :=TStringList.Create;
     while Pos(Deli,Source)>0 do           ////�����ڲ�ַ���ʱ
     begin
        EndOfCurrentString:=Pos(Deli,Source);      //  //ȡ�ָ�����λ��
        StringList.Add(Copy(Source,1,EndOfCurrentString-1));   // //�����Ŀ
        Source :=copy(Source,EndOfCurrentString+length(Deli),length(Source)-EndOfCurrentString);     ////��ȥ�������ͷָ���
     end;
    StringList.Add(Source);   ////��������ڷָ���ʱ��ֱ����Ϊ��Ŀ���
    Result :=StringList;    ////���÷�������
end;}

//����SOCKET��־
function  NoteSocketLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;
var
    FileName:string;
    Hour,Min,Sec,MSec:Word;     //ʱ,��,��,����
Begin
    DecodeTime(now(),Hour,Min,Sec,MSec);    //��ú���ֵ
    sText:= '['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9 +sText;

    FileName:=ExtractFilePath(Paramstr(0))+'SocketLog_'+IntToStr(CommIndex)+'.txt';
    AppendTxt(sText,FileName);
    Result:=True;
End;

//����COMM��־
function  NoteCommLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;
var
    strFile:string;
    Hour,Min,Sec,MSec:Word;     //ʱ,��,��,����
Begin
    DecodeTime(now(),Hour,Min,Sec,MSec);    //��ú���ֵ
    sText:= '['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9 +sText;

    strFile:=ExtractFilePath(Paramstr(0))+'CommLog_'+IntToStr(CommIndex)+'.txt';
    AppendTxt(sText,strFile);
    Result:=True;
End;

//����COMM��־
function  NoteAgilentCommLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;
var
    strFile:string;
    Hour,Min,Sec,MSec:Word;     //ʱ,��,��,����
Begin
    DecodeTime(now(),Hour,Min,Sec,MSec);    //��ú���ֵ
    sText:= '['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9 +sText;

    strFile:=ExtractFilePath(Paramstr(0))+'AgilentCommLog_'+IntToStr(CommIndex)+'.txt';
    AppendTxt(sText,strFile);
    Result:=True;
End;
//����COMM��־
function  NoteErrorCommLog(CommIndex:Integer;sText:String;bDel:Boolean=False):Boolean;
var
    strFile:string;
    Hour,Min,Sec,MSec:Word;     //ʱ,��,��,����
Begin
    DecodeTime(now(),Hour,Min,Sec,MSec);    //��ú���ֵ
    sText:= '['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9 +sText;

    strFile:=ExtractFilePath(Paramstr(0))+'ErrorCommLog_'+IntToStr(CommIndex)+'.txt';
    AppendTxt(sText,strFile);
    Result:=True;
End;
{ ���̹���:������д����־
  ���̲���:Log->.txt�ļ�;
           ReadorWrite->��/д��־
           Content->������txt�ļ�������
}
procedure WriteToText(var FileName:string;Content:string);
var
    FileHandle: Integer;
    Log:TextFile;                   //��־�ļ�
begin
    if not (FileExists(FileName)) then
    begin
        FileHandle:=FileCreate(FileName);
        if FileHandle<=0 then
            MessageBox(0,'��־�ļ�����ʧ��!','��Ϣ��ʾ',MB_ICONWARNING + mb_OK)
        else
        begin
            FileClose(FileHandle);
            AssignFile(Log,FileName);
        end
    end
    else
        AssignFile(Log,FileName);

    Append(Log);
    write(Log,Content+#$D+#$A);
    CloseFile(Log);
end;
{
��������:IMEI����
}
function CheckImei(oldimei1:string):string;
var

    sum:Integer;        //sum����IMEI�е�D1~D14�����ĺ�
    even:Integer;       //even����2��������λ
    even1,even2:integer;//even1����even�ĸ�λ��evev2����even��ʮλ
    reverse_imei:string;//reverse_imei��������IMEI�����ֵ
    cd:string;          //cd����Check Digit
    i:Integer;
    strTemp:string;
begin
    sum:=0;
    strTemp:='';
    reverse_imei:='';
    cd:='';
    //��oldimei1����,������D1��D14����ȽϷ��ϴ�����˴����ҵ�ϰ��
    for i:=14 downto 1 do
    begin
        strTemp:=copy(oldimei1,i,1);
        reverse_imei:=reverse_imei+strTemp;
    end;
    //���
    for i:=1 to 14 do
    begin
        if((i mod 2)<>0) then
        begin
            //sum:=sum+strtoint(copy(reverse_imei,i,1));
            even:=2*(strtoint(copy(reverse_imei,i,1)));
            even1:=even mod 10;
            even2:=even div 10;
            sum:=sum+even1+even2;
        end
        else
        begin
            sum:=sum+strtoint(copy(reverse_imei,i,1));
        end;
    end;

    //����CDλ
    if ((sum mod 10)=0) then
        cd:='0'
    else
        cd:=inttostr(10-(sum mod 10));
    //�����µ�15λIMEI����CDλ��
    reverse_imei:=copy(oldimei1,1,14)+cd;
    result:=reverse_imei;

    //Result:=oldimei1;
end;

function XMLToRecordset(const XML: string): _Recordset;
var
    RS: Variant;
    Stream: TStringStream;
begin
    Result := nil;
    if XML = '' then Exit;

    try
        Stream := TStringStream.Create(XML);
        Stream.Position := 0;
        RS := CreateOleObject('ADODB.Recordset');
        RS.Open(TStreamAdapter.Create(Stream) as IUnknown);
        Result := IUnknown(RS) as _Recordset;
    finally
        Stream.Free;
    end;
end;

function BoolToInt(bBool:Boolean):Integer;
begin
    if not bBool then
        Result:=0
    else
        Result:=1;

end;
//ִ��SQL���
//strsql��Ҫִ�е�SQL��䣬����ֵΪִ�н��
{function ExecuteSQL(strsql:string):boolean;
var
    query:TADOQuery;
begin
    query:=TADOQuery.Create(nil);
    query.Connection:=DMMain.ConMain;
    query.Close;
    query.SQL.Clear;
    query.ParamCheck :=False;
    query.SQL.Add(strsql);
    try
        query.ExecSQL;
    except
        on   E: Exception   do
        begin
            query.Free;
            Result :=False;
        end;
    end;
    query.Free;
    result:=true;
end;}

//�ж�Vaule�ǲ�������
function IsNumberic(Vaule:String):Boolean;
var
    i:Integer;
begin
    result:=true;
    Vaule:=trim(Vaule);
    for i:=1 to length(Vaule) do
    begin
        if not (Vaule[i] in ['0'..'9','.'])then
        begin
            result:=false;
            exit;
        end;
    end;
end;
function GetFileVersion(FileName: string): string;
type
    PVerInfo = ^TVS_FIXEDFILEINFO;
    TVS_FIXEDFILEINFO = record
       dwSignature: longint;
       dwStrucVersion: longint;
       dwFileVersionMS: longint;
       dwFileVersionLS: longint;
       dwFileFlagsMask: longint;
       dwFileFlags: longint;
       dwFileOS: longint;
       dwFileType: longint;
       dwFileSubtype: longint;
       dwFileDateMS: longint;
       dwFileDateLS: longint;
    end;
var
    ExeNames: array[0..255] of char;
    VerInfo: PVerInfo;
    Buf: pointer;
    Sz: word;
    L, Len: Cardinal;
begin
    StrPCopy(ExeNames, FileName);
    Sz := GetFileVersionInfoSize(ExeNames, L);
    if Sz=0 then
    begin
        Result:='';
        Exit;
    end;

    try
        GetMem(Buf, Sz);
        try
            GetFileVersionInfo(ExeNames, 0, Sz, Buf);
            if VerQueryValue(Buf, '\', Pointer(VerInfo), Len) then
            begin
                Result := IntToStr(HIWORD(VerInfo.dwFileVersionMS)) + '.' +
                         IntToStr(LOWORD(VerInfo.dwFileVersionMS)) + '.' +
                         IntToStr(HIWORD(VerInfo.dwFileVersionLS)) + '.' +
                         IntToStr(LOWORD(VerInfo.dwFileVersionLS));

            end;
        finally
            FreeMem(Buf);
        end;
    except
        Result := '-1';
    end;
end;
function CovFileDate(Fd:_FileTime):TDateTime;
{ ת���ļ���ʱ���ʽ }
var
    Tct:_SystemTime;
    Temp:_FileTime;
begin
    FileTimeToLocalFileTime(Fd,Temp);
    FileTimeToSystemTime(Temp,Tct);
    CovFileDate:=SystemTimeToDateTime(Tct);
end;

function GetFileTime(const Tf:string):string;
{ ��ȡ�ļ�ʱ�䣬Tf��ʾĿ���ļ�·�������� }
const Model='yyyy/mm/dd'; { �趨ʱ���ʽ }
var
    Tp:TSearchRec; { ����TpΪһ�����Ҽ�¼ }
    T1,T2,T3:string;
begin
    Result:='';
    FindFirst(Tf,faAnyFile,Tp); { ����Ŀ���ļ� }
    T1:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftCreationTime)); { �����ļ��Ĵ���ʱ�� }
    T2:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftLastWriteTime)); { �����ļ����޸�ʱ�� }
    T3:=FormatDateTime(Model,Now); { �����ļ��ĵ�ǰ����ʱ�� }
    SysUtils.FindClose(Tp);
    Result:= T2;
end;

function SetStatusText(DisplayText:string;PanelIndex:Integer):string;
begin
    case PanelIndex of
    0:  frmClientMain.status_Main.Panels[PanelIndex].Text:='����״̬:'+DisplayText;
    1:  frmClientMain.status_Main.Panels[PanelIndex].Text:='��������ʱ��:'+DisplayText;
    end;
end;
function HowManyCommaChar(Const s:String):Integer;
var
   SW:WideString;
   C:String;
   i, WCount:Integer;
begin
   SW:=s;
   WCount:=0;
   For i:=1 to Length(SW) do
   begin
      c:=SW[i];
      if c=',' then
         WCount:=WCount+1;
   end;
   Result:=WCount;
end;

//============================��������������============================//
function SendToComm_Agilent(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean;
                        WaitResponseOverTime:Integer;
                        ReturnText:string;SubItemName:string;
                        bCompare:Boolean;strCompare:string;strRemark:string;
                        bSendAtCommand:Boolean;
                        ResendNum:Integer;SendNum:Integer):Boolean;    //��������������
var
  SendAgilentCommRecord:PSendCommRecord;                         //���������ڵ�����
begin
    Result:=True;
    //��δ���Ӵ�������Ϊʧ��
    if not AgilentSerialInfo[CommIndex].bConnected then
    begin
        //MessageBox(0,'���ʹ���ʧ��,�鿴�����Ƿ�����!','����',MB_ICONWARNING+MB_OK);
        Result:=False;
    end
    else
    begin
        Cmd:=Cmd+#13;
        //�Ƿ�ȴ���Ӧ����������뷢���б��У�����ֱ�ӷ���
        if WaitResponses then
        begin
            try
              New(SendAgilentCommRecord);
              SendAgilentCommRecord^.bInvalidation:=False;
              SendAgilentCommRecord^.sCmdKey:=CmdKey;
              SendAgilentCommRecord^.sCmd:=Cmd;
              SendAgilentCommRecord^.sReturnText:=ReturnText;
              SendAgilentCommRecord^.bWaitResponses:=WaitResponses;
              SendAgilentCommRecord^.iWaitResponseOverTime:=WaitResponseOverTime;
              SendAgilentCommRecord^.iResendNum:=ResendNum;
              SendAgilentCommRecord^.iSendNum:=1;
              SendAgilentCommRecord^.sSubItemName:=SubItemName;
              SendAgilentCommRecord^.bCompare:=bCompare;
              SendAgilentCommRecord^.strCompare:=strCompare;
              SendAgilentCommRecord^.strRemark:=strRemark;
              SendAgilentCommRecord^.bSendAtCommand:=bSendAtCommand;

              SendAgilentCommList[CommIndex].Add(SendAgilentCommRecord);

              if SendAgilentCommList[CommIndex].Count<=1 then
              begin
                 SendToComm_Agilent(CommIndex);
              end;
            finally
              //Dispose(SendAgilentCommRecord);
            end;
            Application.ProcessMessages;
        end
        else
        begin
            NoteAgilentCommLog(CommIndex,'[S:]===='+Cmd);
            if bSendAtCommand then
            begin
                case CommIndex of
                  1: TfrmModule(CurrentFrom).CommAgilent_1.WriteCommData(PChar(Cmd),StrLen(PChar(Cmd)));
                  2: TfrmModule(CurrentFrom).CommAgilent_2.WriteCommData(PChar(Cmd),StrLen(PChar(Cmd)));
                  3: TfrmModule(CurrentFrom).CommAgilent_3.WriteCommData(PChar(Cmd),StrLen(PChar(Cmd)));
                  4: TfrmModule(CurrentFrom).CommAgilent_4.WriteCommData(PChar(Cmd),StrLen(PChar(Cmd)));
                end;
            end;
            Application.ProcessMessages;
        end;
    end;
    Application.ProcessMessages;
end;
//============================������һ��������������============================//
function SendToComm_Agilent(CommIndex:Integer):Boolean;
label FindHead;
var
    strTemp:string;
    SendAgilentCommRecord:PSendCommRecord;                         //���������ڵ�����
begin
    case CommIndex of
      1: TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_1.Enabled:=False;
      2: TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_2.Enabled:=False;
      3: TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_3.Enabled:=False;
      4: TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_4.Enabled:=False;
    end;

FindHead:
    if SendAgilentCommList[CommIndex].Count>0 then
    begin
        New(SendAgilentCommRecord);
        SendAgilentCommRecord:=SendAgilentCommList[CommIndex].Items[0];
        if SendAgilentCommRecord^.bInvalidation then
        begin
            SendAgilentCommList[CommIndex].Delete(0);
            goto FindHead;
        end;
        SendAgilentCommRecord^.bInvalidation:=True;
        SendAgilentCommList[CommIndex].Delete(0);
        SendAgilentCommList[CommIndex].Insert(0,SendAgilentCommRecord);

        NoteAgilentCommLog(CommIndex,'[S:]===='+SendAgilentCommRecord^.sCmd);

        if SendAgilentCommRecord^.bSendAtCommand then
        begin
            case CommIndex of
                  1: TfrmModule(CurrentFrom).CommAgilent_1.WriteCommData(PChar(SendAgilentCommRecord.sCmd),StrLen(PChar(SendAgilentCommRecord.sCmd)));
                  2: TfrmModule(CurrentFrom).CommAgilent_2.WriteCommData(PChar(SendAgilentCommRecord.sCmd),StrLen(PChar(SendAgilentCommRecord.sCmd)));
                  3: TfrmModule(CurrentFrom).CommAgilent_3.WriteCommData(PChar(SendAgilentCommRecord.sCmd),StrLen(PChar(SendAgilentCommRecord.sCmd)));
                  4: TfrmModule(CurrentFrom).CommAgilent_4.WriteCommData(PChar(SendAgilentCommRecord.sCmd),StrLen(PChar(SendAgilentCommRecord.sCmd)));
            end;
        end;

        if (SendAgilentCommRecord^.bWaitResponses) and (SendAgilentCommRecord^.iWaitResponseOverTime>0) then
        begin
            case CommIndex of
                1:
                begin
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_1.Interval:=SendAgilentCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_1.Enabled:=True;
                end;
                2:
                begin
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_2.Interval:=SendAgilentCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_2.Enabled:=True;
                end;
                3:
                begin
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_3.Interval:=SendAgilentCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_3.Enabled:=True;
                end;
                4:
                begin
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_4.Interval:=SendAgilentCommRecord^.iWaitResponseOverTime;
                    TfrmModule(CurrentFrom).tmrRecAgilentCommTimeOut_4.Enabled:=True;
                end;
            end;
        end;
    end;
    Result:=True;
end;
//�������еĲ���Ա�Ĳ�����¼ @2013.01.08
procedure InsertOperRecord(sOperName,sOperContent,sOperTime: string; sOperDemo : string ='Success');
begin
  with frmClientMain.spInsertOperRecord do
  begin
    Close;
    Parameters.ParamByName('@cOperName').Value:=sOperName;
    Parameters.ParamByName('@cOperContent').Value:=sOperContent;
    Parameters.ParamByName('@cOperTime').Value:=sOperTime;
    Parameters.ParamByName('@cOperDemo').Value:=sOperDemo;
    ExecProc;
  end;
end;

procedure CustomSleep(NumSec:SmallInt);
var
  StartTime: Tdatetime;
begin
    StartTime := now;
    repeat
    Application.ProcessMessages;
    until Now > StartTime + NumSec * (1/24/60/60);
end;

function GetIMEI(TargetIMEI:string):string;
var
  strTemp:string;
begin
   strTemp:= MidStr(TargetIMEI,pos('"', TargetIMEI)+1, 15);//�ӵ�������λ��+1
   Result:=strTemp;
end;


end.
