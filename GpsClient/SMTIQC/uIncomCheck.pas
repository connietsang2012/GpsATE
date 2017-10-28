unit uIncomCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ComDrv32, SPComm, ExtCtrls, StdCtrls, ComCtrls,
  Grids, DBGrids;

type
  TfrmIncomCheck = class(TfrmModule)
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
    lbl5: TLabel;
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
    lbl6: TLabel;
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
    pnlBox: TPanel;
    lbl2: TLabel;
    edtBoxNo: TEdit;
    edtPercentage: TEdit;
    lbl3: TLabel;
    edtTCount: TEdit;
    pnlTestResultBox: TPanel;
    lbl8: TLabel;
    lbl9: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetResult(CommIndex:Integer;iResult:Integer);
    procedure SetDisplayResult(CommIndex:Integer;iResult:Integer);
  end;

var
  frmIncomCheck: TfrmIncomCheck;

implementation

{$R *.dfm}
procedure TfrmIncomCheck.SetResult(CommIndex:Integer;iResult:Integer);
begin
   SetDisplayResult(CommIndex,iResult);
end;

procedure TfrmIncomCheck.SetDisplayResult(CommIndex:Integer;iResult:Integer);
begin

end;

end.
