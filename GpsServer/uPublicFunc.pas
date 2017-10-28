unit uPublicFunc;

interface
uses
    uModuleForm,uServerMain,QControls,ADODB,uDmMain,SysUtils,Classes,ADOInt,QForms,
    DB,Variants,Windows;
    {uServerMain,QControls,uDmMain,
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls,  cxClasses,  ExtCtrls,
    ToolWin, WinSkinData, WinSkinStore, Menus, ImgList, ActnList,
    dxNavBarCollns, dxNavBarBase, dxNavBar,uModuleForm, StdCtrls, Buttons,
    Mask, ScktComp,WinSock,IniFiles, DB, ADODB,StrUtils,Uni,clipbrd;    }

    //procedure GetFiledValue(strTableName:string;var strFindFiled1:string;var strFindFiled2:string;strCondtion:string);overload;
    //procedure GetFiledValue(strTableName:string;strFindFiled:string;strCondtion:string);overload;
    procedure GetUserInformation(UserName:string;UserPwd:string;var strUserDes:string; var strUserType:string;var strUserTestPlan:string;var iRecordCount:Integer);
    procedure CheckTested(PlanName:string;ChipRid:string;SoftModel:string;Version:string; var iRecordCount:Integer);
    procedure CheckTestedParamCpd(ChipRid:string;IMEI:string;var Version:string;var VersionEx:string;var iRecordCount:Integer);
    procedure CheckTestedBySNAndVersion(PlanName:string;ChipRid:string;Version:string; var iRecordCount:Integer);

   // procedure CheckTestedByImei(PlanName:string;IMEI:string;SoftModel:string;Version:string; var iRecordCount:Integer);
    procedure GetTempRid(IMEI:string; var iRecordCount:Integer;var strRid:string);
    procedure CheckMustTest(PlanName:string;SoftModel:string;var iRecordCount:Integer);
    procedure CheckIMEI(IMEI:string;var iRecordCount:Integer);
    procedure UpdateForm(PlanName:string;ChipRid:string; Version:string;SoftModel:string;Imei:string;iResult:Integer;Tester:string;var UpdateResult:Integer);overload;
    procedure UpdateForm(PlanName:string;ChipRid:string; Version:string;SoftModel:string;Imei:string;iResult:Integer;Tester:string;GpsDBValue:string;var UpdateResult:Integer);overload;
    procedure UpdateForm(PlanName:string;ChipRid:string; Version:string;VersionS:string;SoftModel:string;Imei:string;iResult:Integer;Tester:string;var UpdateResult:Integer);overload;//参数下载

    procedure CheckTestPass(IMEI:string;var iFuncTestPass:Integer; var iGPSPass:Integer;
                                        var iCoupleTestPass:Integer; var iWriteImeiPass:Integer;
                                        var iParamDownloadPass:Integer; var iAutoPass:Integer;
                                        var CheckResult:Integer);
    procedure CheckTestPass_WriteIMEI(ChipRid:string;SoftModel:string;Version:string;
                                        var iFuncTestPass:Integer; var iGPSPass:Integer;
                                        var iCoupleTestPass:Integer; var iParamDownloadPass:Integer;
                                        var iAutoPass:Integer;var CheckResult:Integer);
    procedure DeleteImei(ChipRid:string;IMEI:string;Version:string; var iRecordCount:Integer);

    //以IMEI为索引删除过往测试记录，用于返工位
    procedure DeleteTestResult_ByImei(FormName:string;IMEI:string;Version:string;TesterId:string;var iRecordCount:Integer);
    //以RID为索引删除过往测试记录，用于返工位
    procedure DeleteTestResult_ByRid(FormName:string;Rid:string;Version:string;TesterId:string;var iRecordCount:Integer);
    procedure UpdateGpsTcData(SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11:string);

    //更新SMT_Gps数据透传数据
    procedure UpdateGpsSMT_TcData(SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11:string);

    procedure TwiceByUpdateVersion(Rid:string;IMEI:string;Version:string;TesterId:string;var iRecordCount:Integer);
    //查询记录转化为XML格式
    function RecordsetToXML(const Recordset: _Recordset): string;

    function GetFileVersion(FileName: string): string;
    function CovFileDate(Fd:_FileTime):TDateTime;
    function GetFileTime(const Tf:string):string;

    //插入所有的操作员的操作记录
    procedure InsertOperRecord(sOperName,sOperContent,sOperTime : string;sOperDemo : string = 'Success');
    function  NoteSocketLog(sText:String;bDel:Boolean=False):Boolean;                     //保存日志
    function  NoteSocketLog2(sText:String;bDel:Boolean=False):Boolean;
    Procedure AppendTxt(Str:String;FileName:String);                                //在INI文件中添加内容

    function  GetCRCCode(chid:string):string;
{$WARN  UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

implementation
uses uGlobalVar;
function GetCrc16(chid:pBytes;nleng:Integer):Word;stdcall;External 'CRC.dll';
{procedure GetFiledValue(strTableName:string;strFindFiled:string;strCondtion:string);overload;
var
 query:tadoquery;
 strsql:string;
 strvalue:string;
begin
   query:=tadoquery.Create(nil);
   query.Connection:=DMMain.conConnGpsTest;
   query.Close;
   query.SQL.Clear;

   if strcondtion='' then
   begin
      strsql:='select '+strFindFiled + ' from '+ strTableName ;
   end
   else
   begin
      strsql:='select '+strFindFiled+ ' from '+ strTableName + ' where '+strcondtion;
   end;

   query.SQL.Add(strsql);
   try
   query.Open();
   query.First;
   if query.RecordCount>0 then
   begin
      strFindFiled :=query.fieldbyname(strFindFiled).AsString;
      query.Free;
   end
   else
   begin
      query.Free;
   end;
   except
              on   E: Exception   do     //截获错误
              begin
                   //ErrMessage   :=   E.Message ;
                   //dm.ShowMessage('数据库GetFiledValue连接失败,请重新配置数据库连接'+E.Message,'警告');
                 //  dm.ShowMessage(strTableName +'  ' +strFindFiled +'  '+strCondtion,'警告');
              end ;
     end;

end;
procedure GetFiledValue(strTableName:string;var strFindFiled1:string;var strFindFiled2:string;strCondtion:string);overload;
var
 query:tadoquery;
 strsql:string;
 strvalue:string;
begin
   query:=tadoquery.Create(nil);
   query.Connection:=DMMain.conConnGpsTest;
   query.Close;
   query.SQL.Clear;


   strsql:='select usertype,typename from gps_user,gps_usertype where username=''admin'' and userpwd=''admin'' and gps_user.usertestplan=gps_usertype.typeid';

   query.SQL.Add(strsql);
   try
   query.Open();
   query.First;
   if query.RecordCount>0 then
   begin
      //strFindFiled1 :=query.fieldbyname(strFindFiled1).AsString;
      strFindFiled1:=query.FieldList[1].AsString;
      strFindFiled2:=query.FieldList[2].AsString;
      //strFindFiled2 :=query.fieldbyname(strFindFiled2).AsString;
      query.Free;
   end
   else
   begin
      query.Free;
   end;
   except
              on   E: Exception   do     //截获错误
              begin
                   //ErrMessage   :=   E.Message ;
                   //dm.ShowMessage('数据库GetFiledValue连接失败,请重新配置数据库连接'+E.Message,'警告');
                 //  dm.ShowMessage(strTableName +'  ' +strFindFiled +'  '+strCondtion,'警告');
              end ;
     end;

end; }

procedure GetUserInformation(UserName:string;UserPwd:string;var strUserDes:string;var strUserType:string;var strUserTestPlan:string;var iRecordCount:Integer);
begin
    with frmServerMain.spGetUserInformation do
    begin
        Close;
        Parameters.ParamByName('@cUserName').Value:=UserName;
        Parameters.ParamByName('@cUserPwd').Value:=UserPwd;
        ExecProc;
        strUserDes:=Trim(Parameters.ParamByName('@cUserDes').Value);
        strUserType:=Trim(Parameters.ParamByName('@cUserType').Value);
        strUserTestPlan:=Trim(Parameters.ParamByName('@cUserTestPlan').Value);
        iRecordCount:=Parameters.ParamByName('@cResult').Value;
    end;
end;

procedure CheckTestedBySNAndVersion(PlanName:string;ChipRid:string;Version:string; var iRecordCount:Integer);
begin
    with frmServerMain.spCheckTestedBySNAndVersion do
    begin
        Close;
        if PlanName='FuncTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_FunctionTest_Result';
        end
        else if PlanName='GPSTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_GpsTest_Result';
        end
        else if PlanName='CoupleTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_CoupleTest_Result';
        end
        else if PlanName='WriteImei' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_WriteImei_Result';
        end
        else if PlanName='ParamDownload' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_ParamDownload_Result';
        end
        else if PlanName='CartonBox' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_CartonBox_Result';
        end
        else if PlanName='AutoTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTest_Result';
        end
        else if PlanName='AutoTestSMT' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTestSMT_Result';
        end
        else if PlanName='SMTIQCTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_SMTIQC_Result';
        end;
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cVersion').Value:=Version;

        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
    end;
end;

procedure CheckTested(PlanName:string;ChipRid:string;SoftModel:string;Version:string; var iRecordCount:Integer);
begin
    with frmServerMain.spCheckTested do
    begin
        Close;
        if PlanName='FuncTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_FunctionTest_Result';
        end
        else if PlanName='GPSTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_GpsTest_Result';
        end
        else if PlanName='CoupleTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_CoupleTest_Result';
        end
        else if PlanName='WriteImei' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_WriteImei_Result';
        end
        else if PlanName='ParamDownload' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_ParamDownload_Result';
        end
        else if PlanName='CartonBox' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_CartonBox_Result';
        end
        else if PlanName='AutoTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTest_Result';
        end
        else if PlanName='AutoTestSMT' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTestSMT_Result';
        end
        else if PlanName='SMTIQCTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_SMTIQC_Result';
        end;
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cSoftModel').Value:=SoftModel;
        Parameters.ParamByName('@cVersion').Value:=Version;

        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
    end;
end;

procedure CheckTestedParamCpd(ChipRid:string;IMEI:string;var Version:string;var VersionEx:string;var iRecordCount:Integer);
begin
  with frmServerMain.spCheckTestedParamCpd do
  begin
    Close;
    Parameters.ParamByName('@cChipId').Value:=ChipRid;
    Parameters.ParamByName('@cIMEI').Value:=IMEI;
    Parameters.ParamByName('@cVersion').Value:=Version;
    Parameters.ParamByName('@cVersionEx').Value:=VersionEx;

    ExecProc;
    VersionEx:= VarToStr(Parameters.ParamByName('@cVersionEx').Value);
    iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
  end;
end;

procedure GetTempRid(IMEI:string; var iRecordCount:Integer;var strRid:string);
begin
    with frmServerMain.spGetTempRid do
    begin
        Close;
        Parameters.ParamByName('@cImei').Value:=IMEI;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
        strRid:=Parameters.ParamByName('@cRid').Value;
    end;
end;
procedure CheckMustTest(PlanName:string;SoftModel:string;var iRecordCount:Integer);
begin
  with frmServerMain.spCheckMustTest do
  begin
    Close;
    if PlanName='FuncTest' then
    begin
      Parameters.ParamByName('@cFormName').Value:='Gps_FunctionTest_Result';
    end
    else if PlanName='GPSTest' then
    begin
    	Parameters.ParamByName('@cFormName').Value:='Gps_GpsTest_Result';
    end
    else if PlanName='CoupleTest' then
    begin
    	Parameters.ParamByName('@cFormName').Value:='Gps_CoupleTest_Result';
    end
    else if PlanName='WriteImei' then
    begin
    	Parameters.ParamByName('@cFormName').Value:='Gps_WriteImei_Result';
    end
    else if PlanName='ParamDownload' then
    begin
    	Parameters.ParamByName('@cFormName').Value:='Gps_ParamDownload_Result';
    end
    else if PlanName='CartonBox' then
    begin
      Parameters.ParamByName('@cFormName').Value:='Gps_CartonBox_Result';
    end
    else if PlanName='AutoTest' then
    begin
      Parameters.ParamByName('@cFormName').Value:='Gps_AutoTest_Result';
    end
    else if PlanName='AutoTestSMT' then
    begin
      Parameters.ParamByName('@cFormName').Value:='Gps_AutoTestSMT_Result';
    end
    else if PlanName='SMTIQCTest' then
    begin
      Parameters.ParamByName('@cFormName').Value:='Gps_SMTIQC_Result';
    end;

    Parameters.ParamByName('@cSoftModel').Value:=SoftModel;

    ExecProc;

    iRecordCount:=Parameters.ParamByName('@cResult').Value;
  end;
end;
procedure CheckIMEI(IMEI:string;var iRecordCount:Integer);
begin
    with frmServerMain.spCheckImei do
    begin
        Close;
        Parameters.ParamByName('@cIMEI').Value:=IMEI;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
    end;
end;
procedure UpdateForm(PlanName:string;ChipRid:string; Version:string;SoftModel:string;Imei:string;iResult:Integer;Tester:string;var UpdateResult:Integer);
{var
  stem : string;  }
begin
    with frmServerMain.spUpdateForm do
    begin
        Close;
        if PlanName='FuncTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_FunctionTest_Result';
        end
        else if PlanName='GPSTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_GpsTest_Result';
        end
        else if PlanName='CoupleTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_CoupleTest_Result';
        end
        else if PlanName='WriteImei' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_WriteImei_Result';
        end
        else if PlanName='ParamDownload' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_ParamDownload_Result';
        end
        else if PlanName='CartonBox' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_CartonBox_Result';
        end
        else if PlanName='AutoTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTest_Result';
        end
        else if PlanName='AutoTestSMT' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTestSMT_Result';
        end
        else if PlanName='SMTIQCTest' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_SMTIQC_Result';
        end;
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cSoftModel').Value:=SoftModel;
        Parameters.ParamByName('@cVersion').Value:=Version;
        Parameters.ParamByName('@cIMEI').Value:=Imei;
        Parameters.ParamByName('@iResult').Value:=iResult;
        Parameters.ParamByName('@cTester').Value:=Tester;
        ExecProc;
        UpdateResult:=Parameters.ParamByName('@UpdateResult').Value;
    end;
end;
//Paramdown重载更新函数
procedure UpdateForm(PlanName:string;ChipRid:string; Version:string;VersionS:string;SoftModel:string;Imei:string;iResult:Integer;Tester:string;var UpdateResult:Integer);
{var
  stem : string;  }
begin
    with frmServerMain.spParamDownUpdateForm do
    begin
        Close;
        Parameters.ParamByName('@cFormName').Value:='Gps_ParamDownload_Result';
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cSoftModel').Value:=SoftModel;
        Parameters.ParamByName('@cVersion').Value:=Version;
        Parameters.ParamByName('@cIMEI').Value:=Imei;
        Parameters.ParamByName('@iResult').Value:=iResult;
        Parameters.ParamByName('@cTester').Value:=Tester;
        Parameters.ParamByName('@cVersionS').Value:=VersionS;
        ExecProc;
        UpdateResult:=Parameters.ParamByName('@UpdateResult').Value;
    end;
end;
//SMT重载更新函数
procedure UpdateForm(PlanName:string;ChipRid:string; Version:string;SoftModel:string;Imei:string;iResult:Integer;Tester:string;GpsDBValue:string;var UpdateResult:Integer);
{var
  stem : string;  }
begin
    with frmServerMain.spSMTUpdateForm do
    begin
        Close;
        if PlanName='AutoTestSMT' then
        begin
            Parameters.ParamByName('@cFormName').Value:='Gps_AutoTestSMT_Result';
        end;
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cSoftModel').Value:=SoftModel;
        Parameters.ParamByName('@cVersion').Value:=Version;
        Parameters.ParamByName('@cIMEI').Value:=Imei;
        Parameters.ParamByName('@iResult').Value:=iResult;
        Parameters.ParamByName('@cTester').Value:=Tester;
        Parameters.ParamByName('@GpsDBValue').Value:=GpsDBValue;
        ExecProc;
        UpdateResult:=Parameters.ParamByName('@UpdateResult').Value;
    end;
end;
procedure CheckTestPass(IMEI:string;var iFuncTestPass:Integer; var iGPSPass:Integer;
                                        var iCoupleTestPass:Integer; var iWriteImeiPass:Integer;
                                        var iParamDownloadPass:Integer; var iAutoPass:Integer;
                                        var CheckResult:Integer);
begin
    with frmServerMain.spCheckTestpass do
    begin
        Close;
        Parameters.ParamByName('@cIMEI').Value:=IMEI;
        ExecProc;
        //iAutoTestSMTPass:=Parameters.ParamByName('@iAutoTestSMTPass').Value;
        iFuncTestPass:=Parameters.ParamByName('@iFunctionPass').Value;
        iGPSPass:=Parameters.ParamByName('@iGPSPass').Value;
        iCoupleTestPass:=Parameters.ParamByName('@iCouplePass').Value;
        iWriteImeiPass:=Parameters.ParamByName('@iWriteImeiPass').Value;
        iParamDownloadPass:=Parameters.ParamByName('@iParamDownloadPass').Value;
        iAutoPass:=Parameters.ParamByName('@iAutoPass').Value;
        CheckResult:=Parameters.ParamByName('@cResult').Value;
    end;
end;

procedure CheckTestPass_WriteIMEI(ChipRid:string;SoftModel:string;Version:string;
                                        var iFuncTestPass:Integer; var iGPSPass:Integer;
                                        var iCoupleTestPass:Integer; var iParamDownloadPass:Integer;
                                        var iAutoPass:Integer;var CheckResult:Integer);
begin
    with frmServerMain.spCheckTestPass_WriteIMEI do
    begin
        Close;
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cSoftModel').Value:=SoftModel;
        Parameters.ParamByName('@cVersion').Value:=Version;
        ExecProc;
        iFuncTestPass:=Parameters.ParamByName('@iFunctionPass').Value;
        iGPSPass:=Parameters.ParamByName('@iGPSPass').Value;
        iCoupleTestPass:=Parameters.ParamByName('@iCouplePass').Value;
        //iWriteImeiPass:=Parameters.ParamByName('@iWriteImeiPass').Value;
        iParamDownloadPass:=Parameters.ParamByName('@iParamDownloadPass').Value;
        iAutoPass:=Parameters.ParamByName('@iAutoPass').Value;
        CheckResult:=Parameters.ParamByName('@cResult').Value;
    end;
end;

procedure DeleteImei(ChipRid:string;IMEI:string;Version:string; var iRecordCount:Integer);
begin
    with frmServerMain.spDeleteImei do
    begin
        Close;
        Parameters.ParamByName('@cChipRid').Value:=ChipRid;
        Parameters.ParamByName('@cIMEI').Value:=IMEI;
        Parameters.ParamByName('@cVersion').Value:=Version;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@UpdateResult').Value;
    end;
end;

//以IMEI为索引删除过往测试记录，用于返工位
//FormName要删除记录的表名; IMEI:索引;TesterId：删除人员;iRecordCount:执行结果
procedure DeleteTestResult_ByImei(FormName:string;IMEI:string;Version:string;TesterId:string;var iRecordCount:Integer);
begin
    with frmServerMain.spDeleteTestResult_ByImei do
    begin
        Close;
        Parameters.ParamByName('@cFormName').Value:=FormName;
        Parameters.ParamByName('@cImei').Value:=IMEI;
        Parameters.ParamByName('@cVersion').Value:=Version;
        Parameters.ParamByName('@cTesterId').Value:=TesterId;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
    end;
end;
procedure TwiceByUpdateVersion(Rid:string;IMEI:string;Version:string;TesterId:string;var iRecordCount:Integer);
begin
    with frmServerMain.spTwiceByUpdateVersion do
    begin
        Close;
        Parameters.ParamByName('@cSn').Value:=Rid;
        Parameters.ParamByName('@cImei').Value:=IMEI;
        Parameters.ParamByName('@cVersion').Value:=Version;
        Parameters.ParamByName('@cTesterId').Value:=TesterId;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
    end;
end;
//以RID为索引删除过往测试记录，用于返工位
//FormName要删除记录的表名; RID:索引;TesterId：删除人员;iRecordCount:执行结果
procedure DeleteTestResult_ByRid(FormName:string;Rid:string;Version:string;TesterId:string;var iRecordCount:Integer);
begin
    with frmServerMain.spDeleteTestResult_ByRid do
    begin
        Close;
        Parameters.ParamByName('@cFormName').Value:=FormName;
        Parameters.ParamByName('@cChipRid').Value:=Rid;
        Parameters.ParamByName('@cVersion').Value:=Version;
        Parameters.ParamByName('@cTesterId').Value:=TesterId;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
        {ProcedureName:='DeleteTestResult_ByRid_Twice';
        Close;
        Parameters.Clear;
        Parameters.CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,10,null);
        Parameters.CreateParameter('@cFormName',ftString,pdInput,30,NULL);
        Parameters.CreateParameter('@cChipRid',ftString,pdInput,32,NULL);
        Parameters.CreateParameter('@cVersion',ftString,pdInput,50,NULL);
        Parameters.CreateParameter('@cTesterId',ftString,pdInput,20,NULL);
        Parameters.CreateParameter('@iRecordCount',ftInteger,pdInputOutput,10,NULL);
        Parameters.ParamByName('@cFormName').Value:=FormName;
        Parameters.ParamByName('@cChipRid').Value:=Rid;
        Parameters.ParamByName('@cVersion').Value:='';
        Parameters.ParamByName('@cTesterId').Value:=TesterId;
        Prepared:=True;
        ExecProc;
        iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;}


    end;
end;
procedure UpdateGpsTcData(SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11:string);
begin
    with frmServerMain.spUpdateGpsTcData do
    begin
        Close;
        Parameters.ParamByName('@cChipRid').Value:=SN;
        Parameters.ParamByName('@cFixMode').Value:=FixMode;
        Parameters.ParamByName('@iGpsDb0').Value:=GpsDb_0;
        Parameters.ParamByName('@iGpsDb1').Value:=GpsDb_1;
        Parameters.ParamByName('@iGpsDb2').Value:=GpsDb_2;
        Parameters.ParamByName('@iGpsDb3').Value:=GpsDb_3;
        Parameters.ParamByName('@iGpsDb4').Value:=GpsDb_4;
        Parameters.ParamByName('@iGpsDb5').Value:=GpsDb_5;
        Parameters.ParamByName('@iGpsDb6').Value:=GpsDb_6;
        Parameters.ParamByName('@iGpsDb7').Value:=GpsDb_7;
        Parameters.ParamByName('@iGpsDb8').Value:=GpsDb_8;
        Parameters.ParamByName('@iGpsDb9').Value:=GpsDb_9;
        Parameters.ParamByName('@iGpsDb10').Value:=GpsDb_10;
        Parameters.ParamByName('@iGpsDb11').Value:=GpsDb_11;
        ExecProc;
        //iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
    end;
end;

//更新SMT_Gps数据透传数据 2014.01.23
procedure UpdateGpsSMT_TcData(SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,
															GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11:string);
begin
  with frmServerMain.spUpdateGpsSMT_TcData do
  begin
    Close;
    Parameters.ParamByName('@cChipRid').Value:=SN;
    Parameters.ParamByName('@cFixMode').Value:=FixMode;
    Parameters.ParamByName('@iGpsDb0').Value:=GpsDb_0;
    Parameters.ParamByName('@iGpsDb1').Value:=GpsDb_1;
    Parameters.ParamByName('@iGpsDb2').Value:=GpsDb_2;
    Parameters.ParamByName('@iGpsDb3').Value:=GpsDb_3;
    Parameters.ParamByName('@iGpsDb4').Value:=GpsDb_4;
    Parameters.ParamByName('@iGpsDb5').Value:=GpsDb_5;
    Parameters.ParamByName('@iGpsDb6').Value:=GpsDb_6;
    Parameters.ParamByName('@iGpsDb7').Value:=GpsDb_7;
    Parameters.ParamByName('@iGpsDb8').Value:=GpsDb_8;
    Parameters.ParamByName('@iGpsDb9').Value:=GpsDb_9;
    Parameters.ParamByName('@iGpsDb10').Value:=GpsDb_10;
    Parameters.ParamByName('@iGpsDb11').Value:=GpsDb_11;
    ExecProc;
    //iRecordCount:=Parameters.ParamByName('@iRecordCount').Value;
  end;
end;

//查询记录转化为XML格式
//Recordset：查询记录，结果为XML字符串
function RecordsetToXML(const Recordset: _Recordset): string;
var
    RS: Variant;
    Stream: TStringStream;
begin
    Result := '';
    if Recordset = nil then Exit;

    Stream := TStringStream.Create('');
    try
        RS := Recordset;
        RS.Save(TStreamAdapter.Create(stream) as IUnknown, adPersistXML);
        Stream.Position := 0;
        Result := Stream.DataString;
    finally
        Stream.Free;
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
{ 转换文件的时间格式 }
var
    Tct:_SystemTime;
    Temp:_FileTime;
begin
    FileTimeToLocalFileTime(Fd,Temp);
    FileTimeToSystemTime(Temp,Tct);
    CovFileDate:=SystemTimeToDateTime(Tct);
end;

function GetFileTime(const Tf:string):string;
{ 获取文件时间，Tf表示目标文件路径和名称 }
const Model='yyyy/mm/dd'; { 设定时间格式 }
var
    Tp:TSearchRec; { 申明Tp为一个查找记录 }
    T1,T2,T3:string;
begin
    Result:='';
    FindFirst(Tf,faAnyFile,Tp); { 查找目标文件 }
    T1:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftCreationTime)); { 返回文件的创建时间 }
    T2:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftLastWriteTime)); { 返回文件的修改时间 }
    T3:=FormatDateTime(Model,Now); { 返回文件的当前访问时间 }
    SysUtils.FindClose(Tp);
    Result:= T2;
end;

//插入所有的操作员的操作记录 @2013.01.08
procedure InsertOperRecord(sOperName,sOperContent,sOperTime: string; sOperDemo : string ='Success');
begin
  with frmServerMain.spInsertOperRecord do
  begin
    Close;
    Parameters.ParamByName('@cOperName').Value:=sOperName;
    Parameters.ParamByName('@cOperContent').Value:=sOperContent;
    Parameters.ParamByName('@cOperTime').Value:=sOperTime;
    Parameters.ParamByName('@cOperDemo').Value:=sOperDemo;
    ExecProc;
  end;
end;
Procedure AppendTxt(Str:String;FileName:String);
Var
   F:Text;
Begin
    try
    begin
      AssignFile(F, FileName);
      if  not  FileExists(FileName)   then
        Rewrite(F)
      else
      begin
        Append(F);
      end;
      Writeln(F, Str);
      Reset(F);
      Closefile(F);
    end
    except
      on EInOutError do
      begin
        Closefile(F);
      end;
    end;
End;
//保存SOCKET日志
function  NoteSocketLog(sText:String;bDel:Boolean=False):Boolean;
var
    FileName :string;
    Hour,Min,Sec,MSec:Word;     //时,分,秒,毫秒
Begin
    DecodeTime(now(),Hour,Min,Sec,MSec);    //获得毫秒值
    sText:= '['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9 +sText;
    FileName:=ExtractFilePath(ParamStr(0)) + 'Log\'+FormatdateTime('YYYY-MM-DD',Now)+'.txt';
    //MessageBox(0,pchar(FileName),'123',MB_ICONHAND);
    AppendTxt(sText,FileName);
    Result:=True;
End;

function  NoteSocketLog2(sText:String;bDel:Boolean=False):Boolean;
var
    FileName :string;
    Hour,Min,Sec,MSec:Word;     //时,分,秒,毫秒
Begin
    DecodeTime(now(),Hour,Min,Sec,MSec);    //获得毫秒值
    sText:= '['+DateTimetostr(now())+' ' +IntToStr(MSec)+'ms]'+#9 +#9 +sText;
    FileName:=ExtractFilePath(ParamStr(0)) + 'Log\'+FormatdateTime('YYYY-MM-DD',Now)+'_Second.txt';
    //MessageBox(0,pchar(FileName),'123',MB_ICONHAND);
    AppendTxt(sText,FileName);
    Result:=True;
End;

function GetCRCCode(chid:string):string;
var
  pbytearray:pBytes;//传递给dll的参数,十进制数
  i,j,iTemp,n,iCRC:Integer;
  strTemp:string;
begin
  if bIsLoaclIp then
  begin
     //string和byte起始不一样
    i:=1;
    j:=0;
    //四舍五入double转换int
    n:=Round((Length(chid)/2));
    SetLength(pbytearray,n);
    try
      while(i<Length(chid))do
      begin
        strTemp:='$'+chid[i]+chid[i+1];
        iTemp:=(StrToInt(strTemp));//16转10
        pbytearray[j]:=iTemp;
        //位数不一样
        j:=j+1;
        i:=i+2;
      end;
    except
      Result:='0';
    end;
    iCRC:=GetCrc16(pbytearray,Length(pbytearray));
    Result:=IntToStr(iCRC);
  end
  else
  begin
    Result:='0';
  end;

end;

end.
