program GpsServer;



uses
  Forms,
  Controls,
  Windows,
  uDmMain in 'uDmMain.pas' {DMMain: TDataModule},
  uServerMain in 'uServerMain.pas' {frmServerMain},
  uPublicFunc in 'uPublicFunc.pas',
  uModuleForm in 'uModuleForm.pas' {frmModuleForm},
  uUserTypeForm in 'uUserTypeForm.pas' {frmUserType},
  uUserForm in 'uUserForm.pas' {frmUser},
  uTestPlanForm in 'uTestPlanForm.pas' {frmTestPlan},
  uSetForm in 'uSetForm.pas' {frmSet},
  uTestWrong in 'uTestWrong.pas' {frmTestWrong},
  uGlobalVar in 'uGlobalVar.pas',
  uSubTestItem in 'uSubTestItem.pas' {frmSubTestItem},
  uTestPlanSet in 'TestPlan\uTestPlanSet.pas' {frmTestPlanSet},
  uAutoTestModel in 'AutoTest\uAutoTestModel.pas' {frmAutoTestModel},
  uAutoTestItem in 'AutoTest\uAutoTestItem.pas' {frmAutoTestItem},
  uAutoTestItemPlan in 'AutoTest\uAutoTestItemPlan.pas' {frmAutoTestItemPlan},
  uTestParameter in 'uTestParameter.pas' {frmTestParameter},
  uVersionModel in 'uVersionModel.pas' {frmVersionModel},
  uTcDataForm in 'uTcDataForm.pas' {frmTcData},
  uParamDownloadItem in 'ParamDownload\uParamDownloadItem.pas' {frmParamDownloadItem},
  uParamDownloadPlan in 'ParamDownload\uParamDownloadPlan.pas' {frmParamDownloadPlan},
  uClientLogin in 'UserLogin\uClientLogin.pas' {frmClientLogin},
  uAutoTestSMTItem in 'AutoTestSMT\uAutoTestSMTItem.pas' {frmAutoTestSMTItem},
  uAutoTestSMTItemPlan in 'AutoTestSMT\uAutoTestSMTItemPlan.pas' {frmAutoTestSMTItemPlan},
  uOperRecord in 'uOperRecord.pas' {FrmOperRecord},
  uSMTTcDataForm in 'uSMTTcDataForm.pas' {FrmSMTTcDataForm},
  uTestResult in 'uTestResult.pas' {FrmTestResult},
  uOQCItem in 'uOQCItem.pas' {frmOQCItem},
  uOQCItemPlan in 'uOQCItemPlan.pas' {frmOQCItemPlan},
  uWriteImeiPlan in 'uWriteImeiPlan.pas' {frmWriteImeiPlan},
  uWriteImei in 'uWriteImei.pas' {frmWriteImei},
  uGiftParam in 'LabelParam\uGiftParam.pas' {frmGiftParam},
  uCartonParam in 'LabelParam\uCartonParam.pas' {frmCartonParam},
  uManuOrderParam in 'ManuOrder\uManuOrderParam.pas' {frmManuOrderParam},
  uCartonBoxResult in 'CartonBoxResult\uCartonBoxResult.pas' {frmCartonBoxResult},
  uDataRelative_BAT in 'DataRelResult\uDataRelative_BAT.pas' {frmDataRelative_BAT},
  uDataRelResult in 'DataRelResult\uDataRelResult.pas' {frmDataRelResult},
  uDataRelative_VIP in 'DataRelResult\uDataRelative_VIP.pas' {frmDataRelative_VIP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TfrmServerMain, frmServerMain);
  Application.CreateForm(TfrmCartonParam, frmCartonParam);
  Application.CreateForm(TfrmManuOrderParam, frmManuOrderParam);
  Application.CreateForm(TfrmCartonBoxResult, frmCartonBoxResult);
  Application.CreateForm(TfrmDataRelative_BAT, frmDataRelative_BAT);
  Application.CreateForm(TfrmDataRelResult, frmDataRelResult);
  Application.CreateForm(TfrmDataRelative_VIP, frmDataRelative_VIP);
  Application.ShowMainForm:=False;
  //显示登录界面
  Application.CreateForm(TfrmClientLogin, frmClientLogin);
  frmClientLogin.ShowModal;
  if frmClientLogin.ModalResult=mrOK then
  begin
      Application.ShowMainForm:=True;
  end
  else  if frmClientLogin.ModalResult=mrNo then
  begin
      MessageBox(0, '用户名或密码错误,请确认输入是否正确!', '警告,登录失败!', MB_ICONWARNING + mb_OK);
      Application.Terminate;
  end
  else if frmClientLogin.ModalResult=mrCancel then
  begin
      frmServerMain.Close;
      Application.Terminate;
  end;
  Application.Run;
end.
