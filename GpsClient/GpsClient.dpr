program GpsClient;

uses
  Forms,
  Types,
  Windows,
  Controls,
  uDmMain in 'uDmMain.pas' {DMMain: TDataModule},
  uClientMain in 'uClientMain.pas' {frmClientMain},
  uPublicFunc in 'uPublicFunc.pas',
  uClientLogin in 'uClientLogin.pas' {frmClientLogin},
  uClientWelcome in 'uClientWelcome.pas' {frmClientWelcome},
  uClientSendThread in 'uClientSendThread.pas',
  uCartonBox in 'CartonBox\uCartonBox.pas' {frmCartonBox},
  uCartonBoxSet in 'CartonBox\uCartonBoxSet.pas' {frmCartonBoxSet},
  uCartonBoxLlf in 'CartonBox\uCartonBoxLlf.pas' {frmCartonBoxLlf},
  uCartonBox10 in 'CartonBox\uCartonBox10.pas' {frmCartonBox_10},
  uCartonBoxMan in 'CartonBox\uCartonBoxMan.pas' {frmCartonBoxMan},
  uModuleForm in 'uModuleForm.pas' {frmModule},
  uGlobalVar in 'uGlobalVar.pas',
  uCoupleTest in 'CoupleTest\uCoupleTest.pas' {frmCoupleTest},
  uWriteImeiTest in 'WriteImei\uWriteImeiTest.pas' {frmWriteImeiTest},
  uParamDownloadTest in 'ParamDownload\uParamDownloadTest.pas' {frmParamDownloadTest},
  uBasicTestParam in 'uBasicTestParam.pas' {frmBasicTestParam},
  uClientDataModuleForm in 'ClientData\uClientDataModuleForm.pas' {frmClientDataModule},
  uTwiceTest in 'TwiceTest\uTwiceTest.pas' {frmTwiceTest},
  ufrmMessageBox in 'AutoTest\ufrmMessageBox.pas' {frmMessagebox},
  uAutoTestSMT in 'AutoTest(SMT)\uAutoTestSMT.pas' {frmAutoTestSMTMain},
  uSMTIQCTest in 'SMTIQC\uSMTIQCTest.pas' {frmSMTIQCTest},
  uAutoTest in 'AutoTest\uAutoTest.pas' {frmAutoTestMain},
  uIncomCheck in 'uIncomCheck.pas' {frmIncomCheck},
  uLongWaitTrd in 'uLongWaitTrd.pas',
  uReadBack in 'ReadBack\uReadBack.pas' {frmReadBack},
  uPrintProcess in 'uPrintProcess.pas' {frmPrintProcess},
  uParamLoadConfig in 'ParamLoadConfig\uParamLoadConfig.pas' {frmParamDownLoadConfig},
  uGiftBoxMain in 'GiftBox\uGiftBoxMain.pas' {frmGiftBoxMain},
  uDataRelative in 'DataRelative\uDataRelative.pas' {frmDataRelative};

{$R *.res}
var
    dwTime:DWORD;
    mymutex: THandle;
begin
    mymutex:=CreateMutex(nil,True,'我的互斥对象');
    if GetLastError<>ERROR_ALREADY_EXISTS then
    begin

        Application.Initialize;
        Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TfrmClientMain, frmClientMain);
  Application.CreateForm(TfrmMessagebox, frmMessagebox);
  Application.CreateForm(TfrmDataRelative, frmDataRelative);
  Application.ShowMainForm:=False;
          
        //显示登录界面
        Application.CreateForm(TfrmClientLogin, frmClientLogin);
        frmClientLogin.ShowModal;
        if frmClientLogin.ModalResult=mrOK then
        begin
            //显示欢迎图片
            frmClientWelcome := TfrmClientWelcome.Create(nil);
            frmClientWelcome.Show;
            dwTime:=GetTickCount();
            while (GetTickCount() - dwTime) < 1000 do
            begin
              Application.ProcessMessages;
            end;
            frmClientWelcome.Close;

            Application.ShowMainForm:=True;
        end
        else  if frmClientLogin.ModalResult=mrNo then
        begin
            MessageBox(0, LoginError, '警告,登录失败!', MB_ICONWARNING + mb_OK);
            Application.Terminate;
        end
        else if frmClientLogin.ModalResult=mrCancel then
        begin
            frmClientMain.Close;
            Application.Terminate;
        end;
        Application.Run;
    end
    else
        MessageBox(0, '错误', '已经有一个实例在运行!', MB_ICONWARNING + mb_OK);


end.
