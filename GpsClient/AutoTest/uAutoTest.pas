unit uAutoTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, SPComm, StdCtrls,uGlobalVar,
  MemTableDataEh, Db, ComCtrls, Grids, DBGrids,DateUtils,StrUtils,
  SUISideChannel, ADODB, DataDriverEh, DBCtrls, MemDS, DBAccess, Uni,
  ComDrv32;

type
  TfrmAutoTestMain = class(TfrmModule)
    Panel1: TPanel;
    grp1: TGroupBox;
    pnl3: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbllbl: TLabel;
    lbllbl1: TLabel;
    Label2: TLabel;
    imgCommGreen: TImage;
    imgCommRed: TImage;
    lblEpoPrompt_1: TLabel;
    EdtModeResult_1: TEdit;
    EdtTypeResult_1: TEdit;
    cbbCom_1: TComboBox;
    btnStart_1: TButton;
    btnReTest1: TButton;
    GPSTC_1: TsuiSideChannel;
    img2: TImage;
    lblCom1SV_9: TLabel;
    lblCom1SV_8: TLabel;
    lblCom1SV_7: TLabel;
    lblCom1SV_6: TLabel;
    lblCom1SV_5: TLabel;
    lblCom1SV_4: TLabel;
    lblCom1SV_3: TLabel;
    lblCom1SV_2: TLabel;
    lblCom1SV_11: TLabel;
    lblCom1SV_10: TLabel;
    lblCom1SV_1: TLabel;
    lblCom1SV_0: TLabel;
    lblCom1No_9: TLabel;
    lblCom1No_8: TLabel;
    lblCom1No_7: TLabel;
    lblCom1No_6: TLabel;
    lblCom1No_5: TLabel;
    lblCom1No_4: TLabel;
    lblCom1No_3: TLabel;
    lblCom1No_2: TLabel;
    lblCom1No_11: TLabel;
    lblCom1No_10: TLabel;
    lblCom1No_1: TLabel;
    lblCom1No_0: TLabel;
    lblCom1EI_9: TLabel;
    lblCom1EI_8: TLabel;
    lblCom1EI_7: TLabel;
    lblCom1EI_6: TLabel;
    lblCom1EI_5: TLabel;
    lblCom1EI_4: TLabel;
    lblCom1EI_3: TLabel;
    lblCom1EI_2: TLabel;
    lblCom1EI_11: TLabel;
    lblCom1EI_10: TLabel;
    lblCom1EI_1: TLabel;
    lblCom1EI_0: TLabel;
    lblCom1Az_9: TLabel;
    lblCom1Az_8: TLabel;
    lblCom1Az_7: TLabel;
    lblCom1Az_6: TLabel;
    lblCom1Az_5: TLabel;
    lblCom1Az_4: TLabel;
    lblCom1Az_3: TLabel;
    lblCom1Az_2: TLabel;
    lblCom1Az_11: TLabel;
    lblCom1Az_10: TLabel;
    lblCom1Az_1: TLabel;
    lblCom1Az_0: TLabel;
    lbllbl5: TLabel;
    lbllbl6: TLabel;
    lbllbl7: TLabel;
    lbllbl9: TLabel;
    lbllbl2: TLabel;
    lbllbl3: TLabel;
    lbllbl4: TLabel;
    lbllbl8: TLabel;
    EdtSpeed_1: TEdit;
    EdtCourse_1: TEdit;
    EdtNumber_1: TEdit;
    EdtLocaltime_1: TEdit;
    EdtLatitude_1: TEdit;
    EdtLongitude_1: TEdit;
    EdtAltitude_1: TEdit;
    EdtGPStime_1: TEdit;
    pnlTestResult_1: TPanel;
    TestResultDetail_1: TDBGrid;
    TestResult1: TPanel;
    SB_TestStatus_1: TStatusBar;
    tmrSleep1: TTimer;
    tmrSleep2: TTimer;
    tmrSleep3: TTimer;
    tmrSleep4: TTimer;
    DS_TestItemParam_1: TDataSource;
    TesItem_Comm1: TListBox;
    TestParameter1: TDBGrid;
    DS_DstSubItem: TDataSource;
    DS_TestResult_1: TDataSource;
    grp3: TGroupBox;
    Panel4: TPanel;
    pnl2: TPanel;
    pnl4: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    img5: TImage;
    img6: TImage;
    lblEpoPrompt_3: TLabel;
    EdtModeResult_3: TEdit;
    EdtTypeResult_3: TEdit;
    cbbCom_3: TComboBox;
    btnStart_3: TButton;
    btnReTest3: TButton;
    GPSTC_3: TsuiSideChannel;
    img7: TImage;
    lblCom3SV_9: TLabel;
    lblCom3SV_8: TLabel;
    lblCom3SV_7: TLabel;
    lblCom3SV_6: TLabel;
    lblCom3SV_5: TLabel;
    lblCom3SV_4: TLabel;
    lblCom3SV_3: TLabel;
    lblCom3SV_2: TLabel;
    lblCom3SV_11: TLabel;
    lblCom3SV_10: TLabel;
    lblCom3SV_1: TLabel;
    lblCom3SV_0: TLabel;
    lblCom3No_9: TLabel;
    lblCom3No_8: TLabel;
    lblCom3No_7: TLabel;
    lblCom3No_6: TLabel;
    lblCom3No_5: TLabel;
    lblCom3No_4: TLabel;
    lblCom3No_3: TLabel;
    lblCom3No_2: TLabel;
    lblCom3No_11: TLabel;
    lblCom3No_10: TLabel;
    lblCom3No_1: TLabel;
    lblCom3No_0: TLabel;
    lblCom3EI_9: TLabel;
    lblCom3EI_8: TLabel;
    lblCom3EI_7: TLabel;
    lblCom3EI_6: TLabel;
    lblCom3EI_5: TLabel;
    lblCom3EI_4: TLabel;
    lblCom3EI_3: TLabel;
    lblCom3EI_2: TLabel;
    lblCom3EI_11: TLabel;
    lblCom3EI_10: TLabel;
    lblCom3EI_1: TLabel;
    lblCom3EI_0: TLabel;
    lblCom3Az_9: TLabel;
    lblCom3Az_8: TLabel;
    lblCom3Az_7: TLabel;
    lblCom3Az_6: TLabel;
    lblCom3Az_5: TLabel;
    lblCom3Az_4: TLabel;
    lblCom3Az_3: TLabel;
    lblCom3Az_2: TLabel;
    lblCom3Az_11: TLabel;
    lblCom3Az_10: TLabel;
    lblCom3Az_1: TLabel;
    lblCom3Az_0: TLabel;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    lbl73: TLabel;
    lbl74: TLabel;
    lbl75: TLabel;
    lbl76: TLabel;
    EdtSpeed_3: TEdit;
    EdtCourse_3: TEdit;
    EdtNumber_3: TEdit;
    EdtLocaltime_3: TEdit;
    EdtLatitude_3: TEdit;
    EdtLongitude_3: TEdit;
    EdtAltitude_3: TEdit;
    EdtGPStime_3: TEdit;
    pnlTestResult_3: TPanel;
    TestResultDetail_3: TDBGrid;
    TestResult3: TPanel;
    SB_TestStatus_3: TStatusBar;
    grp2: TGroupBox;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    img1: TImage;
    img3: TImage;
    lbl7: TLabel;
    EdtModeResult_2: TEdit;
    EdtTypeResult_2: TEdit;
    cbbCom_2: TComboBox;
    btnStart_2: TButton;
    btnReTest2: TButton;
    GPSTC_2: TsuiSideChannel;
    img4: TImage;
    lblCom2SV_9: TLabel;
    lblCom2SV_8: TLabel;
    lblCom2SV_7: TLabel;
    lblCom2SV_6: TLabel;
    lblCom2SV_5: TLabel;
    lblCom2SV_4: TLabel;
    lblCom2SV_3: TLabel;
    lblCom2SV_2: TLabel;
    lblCom2SV_11: TLabel;
    lblCom2SV_10: TLabel;
    lblCom2SV_1: TLabel;
    lblCom2SV_0: TLabel;
    lblCom2No_9: TLabel;
    lblCom2No_8: TLabel;
    lblCom2No_7: TLabel;
    lblCom2No_6: TLabel;
    lblCom2No_5: TLabel;
    lblCom2No_4: TLabel;
    lblCom2No_3: TLabel;
    lblCom2No_2: TLabel;
    lblCom2No_11: TLabel;
    lblCom2No_10: TLabel;
    lblCom2No_1: TLabel;
    lblCom2No_0: TLabel;
    lblCom2EI_9: TLabel;
    lblCom2EI_8: TLabel;
    lblCom2EI_7: TLabel;
    lblCom2EI_6: TLabel;
    lblCom2EI_5: TLabel;
    lblCom2EI_4: TLabel;
    lblCom2EI_3: TLabel;
    lblCom2EI_2: TLabel;
    lblCom2EI_11: TLabel;
    lblCom2EI_10: TLabel;
    lblCom2EI_1: TLabel;
    lblCom2EI_0: TLabel;
    lblCom2Az_9: TLabel;
    lblCom2Az_8: TLabel;
    lblCom2Az_7: TLabel;
    lblCom2Az_6: TLabel;
    lblCom2Az_5: TLabel;
    lblCom2Az_4: TLabel;
    lblCom2Az_3: TLabel;
    lblCom2Az_2: TLabel;
    lblCom2Az_11: TLabel;
    lblCom2Az_10: TLabel;
    lblCom2Az_1: TLabel;
    lblCom2Az_0: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    EdtSpeed_2: TEdit;
    EdtCourse_2: TEdit;
    EdtNumber_2: TEdit;
    EdtLocaltime_2: TEdit;
    EdtLatitude_2: TEdit;
    EdtLongitude_2: TEdit;
    EdtAltitude_2: TEdit;
    EdtGPStime_2: TEdit;
    pnlTestResult_2: TPanel;
    TestResultDetail_2: TDBGrid;
    TestResult2: TPanel;
    SB_TestStatus_2: TStatusBar;
    grp4: TGroupBox;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    lbl78: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    img8: TImage;
    img9: TImage;
    lblEpoPrompt_4: TLabel;
    EdtModeResult_4: TEdit;
    EdtTypeResult_4: TEdit;
    cbbCom_4: TComboBox;
    btnStart_4: TButton;
    btnReTest4: TButton;
    GPSTC_4: TsuiSideChannel;
    img10: TImage;
    lblCom4SV_9: TLabel;
    lblCom4SV_8: TLabel;
    lblCom4SV_7: TLabel;
    lblCom4SV_6: TLabel;
    lblCom4SV_5: TLabel;
    lblCom4SV_4: TLabel;
    lblCom4SV_3: TLabel;
    lblCom4SV_2: TLabel;
    lblCom4SV_11: TLabel;
    lblCom4SV_10: TLabel;
    lblCom4SV_1: TLabel;
    lblCom4SV_0: TLabel;
    lblCom4No_9: TLabel;
    lblCom4No_8: TLabel;
    lblCom4No_7: TLabel;
    lblCom4No_6: TLabel;
    lblCom4No_5: TLabel;
    lblCom4No_4: TLabel;
    lblCom4No_3: TLabel;
    lblCom4No_2: TLabel;
    lblCom4No_11: TLabel;
    lblCom4No_10: TLabel;
    lblCom4No_1: TLabel;
    lblCom4No_0: TLabel;
    lblCom4EI_9: TLabel;
    lblCom4EI_8: TLabel;
    lblCom4EI_7: TLabel;
    lblCom4EI_6: TLabel;
    lblCom4EI_5: TLabel;
    lblCom4EI_4: TLabel;
    lblCom4EI_3: TLabel;
    lblCom4EI_2: TLabel;
    lblCom4EI_11: TLabel;
    lblCom4EI_10: TLabel;
    lblCom4EI_1: TLabel;
    lblCom4EI_0: TLabel;
    lblCom4Az_9: TLabel;
    lblCom4Az_8: TLabel;
    lblCom4Az_7: TLabel;
    lblCom4Az_6: TLabel;
    lblCom4Az_5: TLabel;
    lblCom4Az_4: TLabel;
    lblCom4Az_3: TLabel;
    lblCom4Az_2: TLabel;
    lblCom4Az_11: TLabel;
    lblCom4Az_10: TLabel;
    lblCom4Az_1: TLabel;
    lblCom4Az_0: TLabel;
    lbl130: TLabel;
    lbl131: TLabel;
    lbl132: TLabel;
    lbl133: TLabel;
    lbl134: TLabel;
    lbl135: TLabel;
    lbl136: TLabel;
    lbl137: TLabel;
    EdtSpeed_4: TEdit;
    EdtCourse_4: TEdit;
    EdtNumber_4: TEdit;
    EdtLocaltime_4: TEdit;
    EdtLatitude_4: TEdit;
    EdtLongitude_4: TEdit;
    EdtAltitude_4: TEdit;
    EdtGPStime_4: TEdit;
    pnlTestResult_4: TPanel;
    TestResultDetail_4: TDBGrid;
    TestResult4: TPanel;
    SB_TestStatus_4: TStatusBar;
    DS_TestResult_2: TDataSource;
    DS_TestItemParam_3: TDataSource;
    DS_TestResult_4: TDataSource;
    DS_TestItemParam_2: TDataSource;
    DS_TestResult_3: TDataSource;
    DS_TestItemParam_4: TDataSource;
    TesItem_Comm2: TListBox;
    TesItem_Comm3: TListBox;
    TesItem_Comm4: TListBox;
    TestParameter2: TDBGrid;
    TestParameter3: TDBGrid;
    TestParameter4: TDBGrid;
    TestItem: TListBox;
    Btn_ResultEnable: TButton;
    UniQuery_TestItemParam_ByItemName_1: TUniQuery;
    UniQuery_TestItemParam_ByItemName_2: TUniQuery;
    UniQuery_TestItemParam_ByItemName_3: TUniQuery;
    UniQuery_TestItemParam_ByItemName_4: TUniQuery;
    UniQuery_TestResult_1: TUniQuery;
    UniQuery_TestResult_2: TUniQuery;
    UniQuery_TestResult_3: TUniQuery;
    UniQuery_TestResult_4: TUniQuery;
    UniQuery_DstSubItem: TUniQuery;
    intgrfldUniQuery_TestResult_1Id: TIntegerField;
    SFUniQuery_TestResult_1TestItem: TStringField;
    SFUniQuery_TestResult_1SubTestItem: TStringField;
    SFUniQuery_TestResult_1TestResult: TStringField;
    SFUniQuery_TestResult_1TestValue: TStringField;
    intgrfldUniQuery_TestResult_2Id: TIntegerField;
    SFUniQuery_TestResult_2TestItem: TStringField;
    SFUniQuery_TestResult_2SubTestItem: TStringField;
    SFUniQuery_TestResult_2TestResult: TStringField;
    SFUniQuery_TestResult_2TestValue: TStringField;
    intgrfldUniQuery_TestResult_3Id: TIntegerField;
    SFUniQuery_TestResult_3TestItem: TStringField;
    SFUniQuery_TestResult_3SubTestItem: TStringField;
    SFUniQuery_TestResult_3TestResult: TStringField;
    SFUniQuery_TestResult_3TestValue: TStringField;
    intgrfldUniQuery_TestResult_4Id: TIntegerField;
    SFUniQuery_TestResult_4TestItem: TStringField;
    SFUniQuery_TestResult_4SubTestItem: TStringField;
    SFUniQuery_TestResult_4TestResult: TStringField;
    SFUniQuery_TestResult_4TestValue: TStringField;
    intgrfldUniQuery_DstSubItemId: TIntegerField;
    SFUniQuery_DstSubItemItemModel: TStringField;
    SFUniQuery_DstSubItemItemName: TStringField;
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
    CheckBoxAutoTestCom4: TCheckBox;
    TestItemParam_Comm1: TListBox;
    TestItemParam_Comm2: TListBox;
    TestItemParam_Comm3: TListBox;
    TestItemParam_Comm4: TListBox;
    tmrCheckComm1: TTimer;
    tmrCheckComm2: TTimer;
    tmrCheckComm3: TTimer;
    tmrCheckComm4: TTimer;
    CheckBoxAutoTestCom3: TCheckBox;
    Panel6: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lblGpsDbMin: TLabel;
    lblGpsDbMax: TLabel;
    TimerLimitGPSTC_1: TTimer;
    TimerLimitGPSTC_2: TTimer;
    TimerLimitGPSTC_3: TTimer;
    TimerLimitGPSTC_4: TTimer;
    LabelCalTime1: TLabel;
    lblEpoPrompt_2: TLabel;
    LabelCalTime2: TLabel;
    LabelCalTime3: TLabel;
    LabelCalTime4: TLabel;

    //==================================================================//
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //==================================================================//
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
      
    procedure btnStart_1Click(Sender: TObject);
    procedure btnStart_2Click(Sender: TObject);
    procedure btnStart_3Click(Sender: TObject);
    procedure btnStart_4Click(Sender: TObject);
    procedure btnReTest1Click(Sender: TObject);
    procedure btnReTest2Click(Sender: TObject);
    procedure btnReTest3Click(Sender: TObject);
    procedure btnReTest4Click(Sender: TObject);
    procedure TestResultDetail_1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_3DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_4DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

    procedure tmrSleep1Timer(Sender: TObject);
    procedure tmrSleep2Timer(Sender: TObject);
    procedure tmrSleep3Timer(Sender: TObject);
    procedure tmrSleep4Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Btn_ResultEnableClick(Sender: TObject);
    procedure TimerLimitGPSTC_1Timer(Sender: TObject);
    procedure TimerLimitGPSTC_2Timer(Sender: TObject);
    procedure TimerLimitGPSTC_3Timer(Sender: TObject);
    procedure TimerLimitGPSTC_4Timer(Sender: TObject);
    procedure tmrCheckComm1Timer(Sender: TObject);
    procedure tmrCheckComm2Timer(Sender: TObject);
    procedure tmrCheckComm3Timer(Sender: TObject);
    procedure tmrCheckComm4Timer(Sender: TObject);
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

  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartTest(CommIndex:Integer);override;
    procedure AutoTest(CommIndex:Integer);

    procedure TestDispose(CommIndex:Integer; bRedispose:Boolean=False);       //bRedispose:重新处理当前测试项标志
    procedure GetItemParam(CommIndex:Integer;strTestItem:string);

    function ReadFileByHex(ReadFileName:String;strCompare:LongWord;var strEpoData:array of string):Boolean;
    procedure SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string='';bSendNextCommand:Boolean=True);

    procedure funcGPGSA(CommIndex:Integer;GPGSA_Data:TStringList);
    procedure funcGPGSV(CommIndex:Integer;GPGSV_Data:TStringList);
    procedure funcGPGGA(CommIndex:Integer;GPGGA_Data:TStringList);
    procedure funcGPRMC(CommIndex:Integer;GPRMC_Data:TStringList);
    procedure funcLabelRed(CommIndex:Integer);
    procedure InitAllControl(CommIndex:Integer);
    procedure SetResult(CommIndex:Integer;iResult:Integer);
    procedure SetDisplayResult(CommIndex:Integer;iResult:Integer);
    function ReadFileByHex_1500(ReadFileName:String;CommIndex:Integer):Boolean;
    procedure ResumeTestState(CommIndex:Integer);
    procedure ClearCountArrayList(iCommIndex:Integer);

    procedure FindCommStart(CommIndex:Integer);
    procedure DeComReceieveDataAutoTest(CommIndex:Integer);
  end;

var
  frmAutoTestMain: TfrmAutoTestMain;
  strTotal,strGPGSA,strGPGSV,strGPRMC,strGPGGA,strRMCResult,strGGAResult:array[1..CommCount-1] of TStringList;
  StrListCompare_AutoTest:array[1..CommCount-1] of TStringList;                 //比对（范围）        -1
  StrListCompare_Name_AutoTest:array[1..CommCount-1] of TStringList;            //比对项目(名称)
  StrListCompareChar_AutoTest:array[1..CommCount-1] of TStringList;             //比对（范围）
  StrListCompareChar_Name_AutoTest:array[1..CommCount-1] of TStringList;            //比对项目(名称)
  LR_GPGSV_Data:array[1..CommCount-1] of TStringList;
  StrListMTKBMT:array[1..CommCount-1] of TStringList;             //MTK电池电压通用指令返回值


implementation

uses uDmMain,uPublicFunc, uClientMain;

{$R *.dfm} //每个串口在每次重新测试前清空统计的数据    2014.03.09
procedure TfrmAutoTestMain.ClearCountArrayList(iCommIndex:Integer);
begin
  iPassdNum[iCommIndex] := 0;
  iFaildNum[iCommIndex] := 0;
  TLabel(FindComponent('LabelCalTime'+IntToStr(iCommIndex))).Caption := '';
  TLabel(FindComponent('lblEpoPrompt_'+IntToStr(iCommIndex))).Caption:= '';
end;
function TfrmAutoTestMain.ReadFileByHex(ReadFileName:String;strCompare:LongWord;var strEpoData:array of string):Boolean;
var
  FOrg:TFileStream;             //文件流
  index,Loop:Integer;           //文件循环次数索引,文件循环次数
  Src:Array[0..4096] of Byte;   //存放读取的缓冲
  strEpoDataTemp:string;        //临时EPO数据
  lwCompare:LongWord;           //前三个字节值
  LoopFileCount:Integer;        //用于检测规定天数的有效性
begin
    Result:=False;
    lblEpoPrompt_1.Caption:='';
    FOrg:=TFileStream.Create(ReadFileName,fmOpenRead);
    LoopFileCount:=0;
    //设置指针位置为文件的起始位置(可有可无,因每次指针都在起始位置)

    FOrg.Seek(0,soFromBeginning);
    Loop:=0;
    while forg.Position<forg.Size do
    begin
        FOrg.ReadBuffer(Src,3);
        lwCompare:=0;
        //读前三个字节，比对是否与相比较的时间相同
        for index := 0 to 2  do  lwCompare:= lwCompare*256+Src[index];

        if lwCompare=strCompare then
        begin

            //指针返回至前三，再读取相应的值
            FOrg.Seek(-3,soFromCurrent);
            FOrg.ReadBuffer(Src,Trunc(MTKEPO_RECORD_SIZE));

            //得到当前的MTKEPO_RECORD_SIZE个字符串
            strEpoDataTemp:='';
            for index := 0 to Trunc(MTKEPO_RECORD_SIZE)-1 do  strEpoDataTemp:=strEpoDataTemp+Format('%.2x',[src[index]]);
            strEpoData[Loop]:=strEpoDataTemp;
            Loop:=Loop+1;

            //接着读下一段MTKEPO_RECORD_SIZE个字符串
            FOrg.ReadBuffer(Src,Trunc(MTKEPO_RECORD_SIZE));
            strEpoDataTemp:='';
            for index := 0 to Trunc(MTKEPO_RECORD_SIZE)-1 do strEpoDataTemp:=strEpoDataTemp+Format('%.2x',[src[index]]);
            strEpoData[Loop]:=strEpoDataTemp;
            Loop:=Loop+1;

            if Loop>=(MTKEPO_SV_NUMBER/16*2)-1 then
            begin
                Result:=True;
                FOrg.Destroy();
                Exit;
            end;
        end
        else
        begin
           FOrg.Seek((Trunc(MTKEPO_RECORD_SIZE)*2*2)-3,soFromCurrent);
           LoopFileCount:=LoopFileCount+1;
           if LoopFileCount>=4 then
           begin
                lblEpoPrompt_1.Caption:='为保证缩短测试时间,请下载最新的EPO文件!!';
           end;

        end;
    end;
    //关闭文件流
    FOrg.Destroy();
end;
function TfrmAutoTestMain.ReadFileByHex_1500(ReadFileName:String;CommIndex:Integer):Boolean;
var
    FOrg:TFileStream;             //文件流
    Src:Array[0..74] of Byte;   //存放读取的缓冲
    strCmd,strGpsData:string;                  //要发送的指令，返回值和备注
    index,strCount:Integer;
begin
    Result:=False;
    FOrg:=TFileStream.Create(ReadFileName,fmOpenRead);

    //设置指针位置为文件的起始位置(可有可无,因每次指针都在起始位置)
    FOrg.Seek(0,soFromBeginning);

    while forg.Position<forg.Size do
    begin
        if forg.Size - forg.Position >=75 then
        begin
            FOrg.ReadBuffer(Src,75);
            strCount:=75;
        end
        else
        begin
            strCount:=forg.Size - forg.Position;
            FOrg.ReadBuffer(Src,forg.Size - forg.Position);
        end;

        strGpsData:='';
        for index := Low(Src) to strCount-1 do  strGpsData:=strGpsData+Format('%.2x',[src[index]]);
        strCmd:='';

        strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;
        strCmd:=Format(strCmd,[strGpsData]);
        SendToComm(CommIndex,strCmd,strCmd+#13+#10,
                    True,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('TestTimeOut').AsInteger*1000,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('ReturnText').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('Compare').AsBoolean,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('CompareValue').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('Remark1').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('SendAtComm').AsBoolean,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('ReSendNum').AsInteger,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_'+inttostr(CommIndex))).FieldByName('Remark2').AsString);
    end;
    //关闭文件流
    FOrg.Destroy();
end;
procedure TfrmAutoTestMain.FormCreate(Sender: TObject);
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
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
            end;
        end;
        CommList.free;

        //恢复初始测试状态
        ResumeTestState(iCommindex);

        strTotal[iCommindex] := TStringList.Create;
        strGPGSA[iCommindex] := TStringList.Create;
        strGPGSV[iCommindex] := TStringList.Create;
        strGPRMC[iCommindex] := TStringList.Create;
        strGPGGA[iCommindex] := TStringList.Create;
        strRMCResult[iCommindex] := TStringList.Create;
        strGGAResult[iCommindex] := TStringList.Create;
        //各测试项参数
        StrListCompare_AutoTest[iCommindex]:= TStringList.Create;            //比对（范围）
        StrListCompare_Name_AutoTest[iCommindex]:= TStringList.Create;       //比对项目(名称)
        StrListCompareChar_AutoTest[iCommindex]:= TStringList.Create;        //比对（范围）
        StrListCompareChar_Name_AutoTest[iCommindex]:= TStringList.Create;

        LR_GPGSV_Data[iCommindex] := TStringList.Create;
        StrListMTKBMT[iCommindex]:=TStringList.Create;

        //bGetTestItemed[iCommindex]:=True;
    end;

    if strAutoTestModel='' then
    begin
        Application.MessageBox('请在测试参数设置选项中选择要测试的机型!','警告',MB_OK+MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;

    //将要测试的项放至列表框中
    TestItem.Items.Clear;
    UniQuery_DstSubItem.Params.ParamByName('ItemModel').Value:=strAutoTestModel;
    UniQuery_DstSubItem.Open;
    UniQuery_DstSubItem.First;
    while not UniQuery_DstSubItem.Eof do
    begin
        TestItem.Items.Add(UniQuery_DstSubItem.FieldByName('ItemName').AsString);
        UniQuery_DstSubItem.Next;
    end;
    lblGpsDbMin.Caption:=IntToStr(GPSTestParam.GPSDbMin);
    lblGpsDbMax.Caption:=IntToStr(GPSTestParam.GPSDbMax);
end;
procedure TfrmAutoTestMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    Count:Integer;
begin
  inherited;
  for Count := 1 to CommCount-1 do
  begin
    strTotal[Count].Free;
    strGPGSA[Count].Free;
    strGPGSV[Count].Free;
    strGPRMC[Count].Free;
    strGPGGA[Count].Free;
    strRMCResult[Count].Free;
    strGGAResult[Count].Free;

    StrListCompare_AutoTest[Count].Free;
    StrListCompare_Name_AutoTest[Count].Free;
    StrListCompareChar_AutoTest[Count].Free;
    StrListCompareChar_Name_AutoTest[Count].Free;
    LR_GPGSV_Data[Count].Free;
    StrListMTKBMT[Count].Free;
    Sleep(10);

    TTimer(FindComponent('tmrCheckComm'+inttostr(Count))).Enabled:=False;
  end;
end;


{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}
procedure TfrmAutoTestMain.SetResult(CommIndex:Integer;iResult:Integer);
var
    strTestTime,strSendText:String;
    hWindow:HWND;
begin
    case iResult of
        -3,-2,-4,-5,-6:
            begin
                SetDisplayResult(CommIndex,iResult);
            end;
        1:
            begin
                if (not (strChipRid[CommIndex]='')) and bUpdateForm then
                begin
                  strSendText:=Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#',
                                    [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                    SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);

                  strSendText:=Format('Action=CheckTested_SetResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                    [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                  SendToServer(CommIndex,'CheckTested_SetResult',strSendText,True,CTimeOut*2);
                end
                else
                  SetDisplayResult(CommIndex,iResult);
            end;
        0:
            begin
                if (not (strChipRid[CommIndex]='')) and bUpdateForm then
                begin
                strSendText:=Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#',
                                        [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                    SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);
                end;
                SetDisplayResult(CommIndex,iResult);
            end;
    end;
    Application.ProcessMessages;
end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}
procedure TfrmAutoTestMain.SetDisplayResult(CommIndex:Integer;iResult:Integer);
var
    strTestTime,strSendText:String;
    hWindow:HWND;
begin
    //Application.ProcessMessages;
    if (iResult=0) or (iResult=1) then
    begin
        strChipRid[CommIndex]:='';
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
        bAppendResult[CommIndex]:=False;
        SendCommList[CommIndex].Clear;
        SerialInfo[CommIndex].bAllowTest:=False;
        TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items.Clear;
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[1].Text:='测试完成';
        strTestTime:=Format('总耗测试时间:%f秒',[(GetTickCount-TestStartTickCount[CommIndex])/1000]);
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[2].Text:=strTestTime;
        //bGetTestItemed[CommIndex]:=True;
    end;

    case iResult of
     -6:
    begin
      Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:=VERSIONERROR;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
    -5: //为了不弹出框
    begin
      Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:=NOTNEED;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
  -4: //为了不弹出框
    begin
      Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='此机子已测试过！';
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
        -3:
            begin
                Application.ProcessMessages;
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -2:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
            end;
        {-1:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='请重启机子';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
            end;}
        1:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='PASS';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clGreen;
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
                //BeginTest(CommIndex);
            end;
        0:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='FAIL';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clRed;
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
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
    Application.ProcessMessages;
end;
//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果
procedure TfrmAutoTestMain.SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string;bSendNextCommand:Boolean);
var
    strResult:string;
begin
    Application.ProcessMessages;
    GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
                            bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);
    if (strRemark[CommIndex]<>'EPO_DATA') and  (strCmdCommKey[CommIndex]<>'ATALLOWTEST')then
    begin
        case TestResult of
          0:
                begin
                    strResult:='FAIL';
                    bTestFail[CommIndex]:=True;
                end;
          1:
                begin
                  if strRemark[CommIndex]='DISPLAY' then
                  begin
                      TestValue:=strCmdReturnText[CommIndex];
                  end;
                  strResult:='PASS';
                end;
        end;

        if strRemark[CommIndex]='GPSTC' then
            TsuiSideChannel(FindComponent('GPSTC_'+inttostr(CommIndex))).StayOn:=False;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').Value:=strResult;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestValue').Value:=TestValue;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Post;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Last;
        //TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Close;
        //TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Open;
        TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
        TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
        
    end;
    Application.ProcessMessages;
    //测试失败则终止测试,否则继续测试
    if (TestResult=0) and (not BasicTestParam.FailContinueTest) then
    begin
        SetResult(CommIndex,0);
        NoteCommLog(CommIndex,'[S:]====TestResult=0');
    end
    else
    begin
        if bSendNextCommand then
        begin
            strTestValue[CommIndex]:='';
            SendToComm(CommIndex);
            if TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Count>=0 then
              TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Items.Delete(0);

            //Sleep(100);
            if (TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Count<=0) and
                (SendCommList[CommIndex].Count<=0) then
            begin
              TestDispose(CommIndex,False);
            end
        end;
    end;
    Application.ProcessMessages;
end;
procedure TfrmAutoTestMain.InitAllControl(CommIndex:Integer);
var
    iIndex:Integer;
begin
    TMemo(FindComponent('txtMessage_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtModeResult_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtTypeResult_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtLatitude_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtLongitude_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtAltitude_'+inttostr(CommIndex))).Text:='';
    TMemo(FindComponent('txtSpeed_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtCourse_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtNumber_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtGPStime_'+inttostr(CommIndex))).Text:='';
    TEdit(FindComponent('txtLocaltime_'+inttostr(CommIndex))).Text:='';

    TsuiSideChannel(FindComponent('GPSTC_'+inttostr(CommIndex))).StayOn:=False;

    for iIndex:= 0 to 11 do
    begin
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_'+inttostr(iIndex))).Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_'+inttostr(iIndex))).Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_'+inttostr(iIndex))).Color:=clBlack;
        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_'+inttostr(iIndex))).Color:=clBlack;

        TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';

        TEdit(FindComponent('EdtModeResult_'+inttostr(CommIndex))).Color:=clWindow;
        TEdit(FindComponent('EdtModeResult_'+inttostr(CommIndex))).Text:='';
        TEdit(FindComponent('EdtTypeResult_'+inttostr(CommIndex))).Color:=clWindow;
        TEdit(FindComponent('EdtTypeResult_'+inttostr(CommIndex))).Text:='';
    end;

    for iIndex := 1 to TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels.Count-1 do
    begin
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[iIndex].Text:='';
    end;

end;
//==================================================================//
//==================================================================//
procedure TfrmAutoTestMain.funcGPGSA(CommIndex:Integer;GPGSA_Data:TStringList);
var
    i:Integer;
begin
    try
        if GPGSA_Data[1]='A' then
            strOperatingMode[CommIndex]:=AUTO_STRING
        else if GPGSA_Data[1]='M' then
            strOperatingMode[CommIndex]:=MAU_STRING
        else
            strOperatingMode[CommIndex]:=UNKNOWN_STRING;

        if GPGSA_Data[2]='1' then
            strFixMode[CommIndex]:=FIXNO_STRING
        else if GPGSA_Data[2]='2' then
            strFixMode[CommIndex]:=FIX2D_STRING
        else if GPGSA_Data[2]='3' then
            strFixMode[CommIndex]:=FIX3D_STRING
        else
            strFixMode[CommIndex]:=UNKNOWN_STRING;

        for i := 0 to 11 do
        begin
            strFixNumber[CommIndex,i]:=Format('%s',[GPGSA_Data[3+i]]);
            if strFixNumber[CommIndex,i]='' then strFixNumber[CommIndex,i]:='0';
        end;
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
        on EAccessViolation do Sleep(1);
    end;
end;
procedure TfrmAutoTestMain.funcGPGSV(CommIndex:Integer;GPGSV_Data:TStringList);
label RunSection;
var
    intSentence,intNumber,i:Integer;
    strNo, strSv, strEi, strAz :String;
    bolFix:Boolean;
    colorRed ,colorGreen,colorBlue :Integer;
    iTemp:Integer;
begin
    try
        intSentence:=StrToInt(GPGSV_Data[2]);
        intNumber:=StrToInt(GPGSV_Data[3]);
        if (not IsNumberic(GPGSV_Data[2])) then  intSentence:=0;
        bolFix:=False;

        case intSentence of
            1:
            begin
                if intNumber>0 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][7]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Caption:='0';
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][4]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_0')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][5]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_0')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][6]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_0')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_0')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_0')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_0')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_0')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_0')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_0')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_0')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_0')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_0')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_0')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_0')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_0')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_0')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_0')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_0')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_0')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_0')).Color:=clBlack;
                end;
                if intNumber>1 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][11]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_1')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][8]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_1')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][9]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_1')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][10]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_1')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_1')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_1')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_1')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_1')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_1')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_1')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_1')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_1')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_1')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_1')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_1')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_1')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_1')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_1')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_1')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_1')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_1')).Color:=clBlack;
                end;
                if intNumber>2 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][15]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_2')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][12]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_2')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][13]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_2')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][14]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_2')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_2')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_2')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_2')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_2')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_2')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_2')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_2')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_2')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_2')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_2')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_2')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_2')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_2')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_2')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_2')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_2')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_2')).Color:=clBlack;
                end;
                if intNumber>3 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][19]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_3')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][16]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_3')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][17]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_3')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][18]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_3')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_3')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_3')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_3')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_3')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_3')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_3')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_3')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_3')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_3')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_3')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_3')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_3')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_3')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_3')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_3')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_3')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_3')).Color:=clBlack;
                end;
            end;
            2:
            begin
                if intNumber>4 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][7]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_4')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][4]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_4')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][5]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_4')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][6]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_4')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_4')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_4')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_4')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_4')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_4')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_4')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_4')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_4')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_4')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_4')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_4')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_4')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_4')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_4')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_4')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_4')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_4')).Color:=clBlack;
                end;
                if intNumber>5 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][11]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_5')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][8]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_5')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][9]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_5')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][10]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_5')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_5')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_5')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_5')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_5')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_5')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_5')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_5')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_5')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_5')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_5')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_5')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_5')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_5')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_5')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_5')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_5')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_5')).Color:=clBlack;
                end;
                if intNumber>6 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][15]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_6')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][12]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_6')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][13]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_6')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][14]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_6')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_6')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_6')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_6')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_6')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_6')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_6')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_6')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_6')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_6')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_6')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_6')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_6')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_6')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_6')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_6')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_6')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_6')).Color:=clBlack;
                end;
                if intNumber>7 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][19]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_7')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][16]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_7')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][17]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_7')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][18]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_7')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_7')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_7')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_7')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_7')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_7')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_7')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_7')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_7')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_7')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_7')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_7')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_7')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_7')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_7')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_7')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_7')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_7')).Color:=clBlack;
                end;
            end;
            3:
            begin
                if intNumber>8 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][7]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_8')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][4]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_8')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][5]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_8')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][6]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_8')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_8')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_8')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_8')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_8')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_8')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_8')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_8')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_8')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_8')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_8')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_8')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_8')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_8')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_8')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_8')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_8')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_8')).Color:=clBlack;
                end;
                if intNumber>9 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][11]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_9')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][8]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_9')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][9]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_9')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][10]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_9')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_9')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_9')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_9')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_9')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_9')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_9')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_9')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_9')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_9')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_9')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_9')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_9')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_9')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_9')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_9')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_9')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_9')).Color:=clBlack;
                end;
                if intNumber>10 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][15]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_10')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][12]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_10')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][13]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_10')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][14]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_10')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_10')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_10')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_10')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_10')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_10')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_10')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_10')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_10')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_10')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_10')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_10')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_10')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_10')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_10')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_10')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_10')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_10')).Color:=clBlack;
                end;
                if intNumber>11 then
                begin
                    strNo:=Format('%s',[strGPGSV[CommIndex][19]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Caption:='0';
                        //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_11')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Caption:=strNo;
                        if IsNumberic(strNo) then LR_GPGSV_Data[CommIndex].Add(Format('%.3d', [strtoint(strNo)]));
                    end;
                    strSv:=Format('%s',[strGPGSV[CommIndex][16]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_11')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[CommIndex][17]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_11')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[CommIndex][18]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_11')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[CommIndex,i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_11')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_11')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_11')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_11')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_11')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_11')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_11')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_11')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_11')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    //TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_11')).Visible:=False;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_11')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_11')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_11')).Caption:='';
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_11')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_11')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_11')).Color:=clBlack;
                    TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_11')).Color:=clBlack;
                end;
            end;
        end;
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
        on EAccessViolation do Sleep(1);
    end;
    //strGPGSV.Free;
end;




procedure TfrmAutoTestMain.funcGPGGA(CommIndex:Integer;GPGGA_Data:TStringList);
var
    strNumber:string;
begin
    try
    begin
        If (Trim(GPGGA_Data[2]) <> '') and (IsNumberic(Trim(GPGGA_Data[2])))  then
            strGGAResult[CommIndex].Add(GPGGA_Data[3] +' '+ LeftStr(GPGGA_Data[2], 2) + MidStr(Format('%.6f°',[StrToFloat(StrUtils.RightStr(GPGGA_Data[2], 7)) / 60/60]),2,9) );
        If (Trim(GPGGA_Data[4]) <> '') And (IsNumberic(Trim(GPGGA_Data[4]))) Then
            strGGAResult[CommIndex].Add(GPGGA_Data[5] +' ' + LeftStr(GPGGA_Data[4], 3) + MidStr(Format('%.6f°',[StrToFloat(StrUtils.RightStr(GPGGA_Data[4], 7)) / 60/60]),2,9) ) ;
        If Trim(GPGGA_Data[10]) <> '' Then
            strGGAResult[CommIndex].Add(GPGGA_Data[9] +' ' + LowerCase(GPGGA_Data[10]));
        strNumber:= Format('%s',[GPGGA_Data[7]]);
        if strNumber='' then strNumber:='0';
        strGGAResult[CommIndex].Add(strNumber);
    end
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
        on EAccessViolation do Sleep(1);
    end;
end;
procedure TfrmAutoTestMain.funcGPRMC(CommIndex:Integer;GPRMC_Data:TStringList);
var
    strSpeed,strCourse,strGPStime:string;
    iHour,lngResult,lngTimeZone:Integer;
    Inf:TTimeZoneInformation;
    dtGPStime1,dtGPStime2:TDateTime;
    strGPStimeTemp1,strGPStimeTemp2:string;
begin
    try
        lngResult:=GetTimeZoneInformation(Inf);
        lngTimeZone:=Trunc(Inf.Bias/60);
        strSpeed:=GPRMC_Data[7];
        strCourse:=GPRMC_Data[8];
        strGPStime:=StrUtils.RightStr(GPRMC_Data[9],2)+MidStr(GPRMC_Data[9],3,2)+LeftStr(GPRMC_Data[9],2);
        if Trim(strSpeed)='' then strSpeed:='0.0';
        if Trim(strCourse)='' then strCourse:='0.0';
        strRMCResult[CommIndex].Add(strSpeed+' Km/H');
        strRMCResult[CommIndex].Add(strCourse+'°');

        Insert('-',strGPStime,3);
        Insert('-',strGPStime,6);
        dtGPStime1:=strtodate(strGPStime);
        strGPStimeTemp1:=FormatDateTime('YYYY/MM/DD',dtGPStime1);
        strGPStimeTemp2:=GPRMC_Data[1];
        Insert(':',strGPStimeTemp2,3);
        Insert(':',strGPStimeTemp2,6);
        dtGPStime2:=StrToTime(strGPStimeTemp2);
        strGPStimeTemp2:=FormatDateTime('HH:MM:SS',dtGPStime2);
        strRMCResult[CommIndex].Add(Format('%s %s',[strGPStimeTemp1,strGPStimeTemp2]));

        if (StrToInt(LeftStr(GPRMC_Data[1],2)) - lngTimeZone >= 24) then
            iHour:=StrToInt(LeftStr(GPRMC_Data[1],2)) - lngTimeZone - 24
        else if (StrToInt(LeftStr(GPRMC_Data[1],2)) - lngTimeZone <0) then
            iHour:=StrToInt(LeftStr(GPRMC_Data[1],2)) - lngTimeZone +24
        else
            iHour:=StrToInt(LeftStr(GPRMC_Data[1],2)) - lngTimeZone;
        if iHour<10 then
            strGPStimeTemp2:='0'+IntToStr(iHour)+MidStr(GPRMC_Data[1],3,4)
        else
            strGPStimeTemp2:=IntToStr(iHour)+MidStr(GPRMC_Data[1],3,4);
            
        Insert(':',strGPStimeTemp2,3);
        Insert(':',strGPStimeTemp2,6);
        dtGPStime2:=StrToTime(strGPStimeTemp2);
        strGPStimeTemp2:=FormatDateTime('HH:MM:SS',dtGPStime2);
        strRMCResult[CommIndex].Add(Format('%s %s',[strGPStimeTemp1,strGPStimeTemp2]));
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
        on EAccessViolation do Sleep(1);
    end;
end;
//==================================================================//
//==================================================================//

//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果
//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果
procedure TfrmAutoTestMain.GetItemParam(CommIndex:Integer;strTestItem:string);
var
    strCmd,strReturn,strRemark:string;                  //要发送的指令，返回值和备注
    CurrentSystemTime:TSystemTime;                      //当前系统时间
    iBetweenHours,iBetweenHoursChangePos:LongWord;      //当前与1980-1-6的相隔时间，高低字节转换后的相隔时间
    strEpoData:Array[0..63] of string;                  //分段后的EPO数据

    iIndex:Integer;
    iTemp:Integer;
    strTemp:string;
label NextLoop;

begin
    Application.ProcessMessages;
    //bGetTestItemed[CommIndex]:=False;
    strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',[strAutoTestModel,strTestItem]);
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Active:=False;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Filter:=strTemp;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Filtered:=True;

    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Active:=True;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).First;

    TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Clear;
    while not TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Eof do
    begin
      TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Items.Add(TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);
      TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Next;
    end;

    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).First;
    while not TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Eof do
    begin
        strRemark:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark1').AsString;
        //格式化EPO_TIME的发送指令
        if strRemark='EPO_TIME' then
        begin
            GetSystemTime(CurrentSystemTime);
            strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;
            strCmd:=Format(strCmd,[CurrentSystemTime.wYear,CurrentSystemTime.wMonth,CurrentSystemTime.wDay,
                                    CurrentSystemTime.wHour,CurrentSystemTime.wMinute,CurrentSystemTime.wSecond])
        end
        //格式化EPO_POS的发送指令
        else if strRemark='EPO_POS' then
        begin
            strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;
            strCmd:=Format(strCmd,[strAutoTestLatitude,strAutoTestLongitude,strAutoTestAltitude]);
        end
        //格式化EPO_DATA的发送指令
        else if strRemark='EPO_DATA' then
        begin
            GetSystemTime(CurrentSystemTime);
            iBetweenHours:=daysbetween(StrToDate(Format('%.4D-%.2D-%.2D',[CurrentSystemTime.wYear,CurrentSystemTime.wMonth,CurrentSystemTime.wDay])),
                                        StrToDate('1980-01-06'))*24;
            iBetweenHours:=iBetweenHours +  ((CurrentSystemTime.wHour div 6) * 6);
            //高低字节替换
            iBetweenHoursChangePos:=(iBetweenHours mod 256) * 65536 + ((iBetweenHours mod 65536 ) div 256)*256 + (iBetweenHours div 65536);

            if (ReadFileByHex(ExtractFilePath(Application.ExeName)+'MTK30.EPO',iBetweenHoursChangePos,strEpoData)) then
            begin
                iTemp:=Trunc(MTKEPO_SV_NUMBER/16*2);
                for iIndex := 0 to iTemp-1 do
                begin
                    strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;
                    strCmd:=Format(strCmd,[iIndex+1,strEpoData[iIndex]]);
                    strReturn:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('ReturnText').AsString;
                    strReturn:=Format(strReturn,[iIndex+1]);
                    //bGetTestItemed[CommIndex]:=True;
                    SendToComm(CommIndex,strCmd,strCmd+#13+#10,
                        True,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('TestTimeOut').AsInteger*1000,
                        strReturn,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Compare').AsBoolean,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('CompareValue').AsString,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark1').AsString,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SendAtComm').AsBoolean,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('ReSendNum').AsInteger,
                        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark2').AsString);
                end;
                goto nextloop;
            end
            else
            begin
                lblEpoPrompt_1.Caption:='无EPO数据可下载!!';
                goto nextloop;
            end;
        end
        //格式化EPO_DATA_1500的发送指令
        else if strRemark='EPO_DATA_1500' then
        begin
            if (ReadFileByHex_1500(ExtractFilePath(Application.ExeName)+'MTKGPS.dat',CommIndex)) then
            begin

            end
            else
            begin
                lblEpoPrompt_1.Caption:='无EPO数据可下载!!';
                goto nextloop;
            end;
        end
        else
        begin
            strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;
        end;
        //bGetTestItemed[CommIndex]:=True;
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
NextLoop:
        TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Next;
    end;
    //bGetTestItemed[CommIndex]:=True;
    //SendToComm(CommIndex);
    Application.ProcessMessages;
end;
//进行测试
procedure TfrmAutoTestMain.TestDispose(CommIndex:Integer; bRedispose:Boolean=False);
var
    strTestItem:string;
begin
    //一大测试项完成
    if (not bRedispose) then
        if TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Count>=0 then
            TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items.Delete(0);

    if TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Count<=0 then
    begin
        if bTestFail[CommIndex] then
        begin
            SetResult(CommIndex,0);
           NoteCommLog(CommIndex,'[S:]====bTestFail=0');
        end
        else
            SetResult(CommIndex,1);
        Exit;
    end;

    strTestItem:=TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0];
    GetItemParam(CommIndex,strTestItem);
end;
//开始测试
procedure TfrmAutoTestMain.AutoTest(CommIndex:Integer);
var
    Index: Integer;
    strTemp:string;
begin
    Application.ProcessMessages;
    bTestFail[CommIndex]:=False;
    bAppendResult[CommIndex]:=True;
    TsuiSideChannel(FindComponent('GPSTC_'+inttostr(CommIndex))).StayOn:=False;
    TPanel(FindComponent('pnlTestResult_'+inttostr(CommIndex))).Enabled:=False;
    //恢复串口的测试状态
    ResumeTestState(CommIndex);

    TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Clear;
    for Index := 0 to TestItem.Count - 1 do
        TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items.Add(TestItem.Items[index]);

    //若无测试项则退出
    if TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Count<=0 then
    begin
        Application.MessageBox('请选择测试项？','警告！',MB_ICONWARNING);
        SetResult(CommIndex,0);
    end
    else
    begin
        //TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Selected[0]:=True;
        SerialInfo[CommIndex].bAllowTest:=True;
        //开始测试
        TestDispose(CommIndex,True);
        //获得开始测试时间
        //TestStartTickCount[CommIndex]:=GetTickCount;
    end;
    Application.ProcessMessages;
end;

procedure TfrmAutoTestMain.StartTest(CommIndex:Integer);
begin
  strPlanName:='AutoTest';
  ResumeTestState(CommIndex);
  BeginTest(CommIndex);
  //bGetTestItemed[CommIndex]:=True;
  PositionGpsTime[CommIndex]:=0;
  //inherited;
end;

{procedure TfrmAutoTestMain.Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer);}
procedure TfrmAutoTestMain.Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
    strSendText:String;
    iIndex,count,jIndex:Integer;
    strTemp,strStart,strEnd,strValue,strMaxValue,strMinValue,strName:string;
begin
    CommIndex:=0;
  inherited;
    //if not SerialInfo[CommIndex].bAllowTest then  Exit;
    Application.ProcessMessages;
    try
        if strCmdCommKey[CommIndex]= 'AT' then
        begin
            if (pos('OK',StrCommRecText[CommIndex])>0) then
            begin
                AutoTest(CommIndex);
            end
            else
                Exit;

        end
        else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
        begin
        end
        {else if((pos('SENSOR_OK',StrCommRecText[CommIndex])>0) and (strCmdCommKey[CommIndex]<> 'SENSOR') ) then
        begin
            SendCommList[CommIndex].Clear;
            SendToComm(CommIndex,strSensorAt,strSensorAt+#13+#10,True,iSensorTimeOut*1000,strSensorReturn,'SENSOR静默拉低IO');
            Sleep(500);
            SetTestItemResult(CommIndex,TesItem_Comm1.Items[0],0,'有SENSOR_OK');
        end}
        else if Pos('$',StrCommRecText[CommIndex])>0 then
        begin
            SetTestItemResult(CommIndex,TesItem_Comm1.Items[0],0,'有GPS透传数据!');
        end
        
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
    end;
    Application.ProcessMessages;
end;
{procedure TfrmAutoTestMain.Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmAutoTestMain.Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;

begin
  CommIndex:=1;
  inherited;//调用父类
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;
//恢复测试初始状态
procedure TfrmAutoTestMain.ResumeTestState(CommIndex:Integer);
begin
    //删除测试详细结果
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Close;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Open;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).First;
    while not TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Eof do
    begin
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Delete;
    end;
    //初始化各控件显示
    InitAllControl(CommIndex);
    //测试结果初始化
    SetResult(CommIndex,-2);
end;
procedure TfrmAutoTestMain.btnStart_1Click(Sender: TObject);
begin
  inherited;
    StartComm(1);
end;

procedure TfrmAutoTestMain.btnStart_2Click(Sender: TObject);
var
  CommIndex:Integer;
begin
    StartComm(2);
end;

procedure TfrmAutoTestMain.btnStart_3Click(Sender: TObject);
begin
  inherited;
    StartComm(3);
end;

procedure TfrmAutoTestMain.btnStart_4Click(Sender: TObject);
begin
  inherited;
    StartComm(4);
end;

procedure TfrmAutoTestMain.btnReTest1Click(Sender: TObject);
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

procedure TfrmAutoTestMain.btnReTest2Click(Sender: TObject);
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

procedure TfrmAutoTestMain.btnReTest3Click(Sender: TObject);
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

procedure TfrmAutoTestMain.btnReTest4Click(Sender: TObject);
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


procedure TfrmAutoTestMain.TestResultDetail_1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=1;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;


    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmAutoTestMain.TestResultDetail_2DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=2;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;


    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmAutoTestMain.TestResultDetail_3DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=3;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;


    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmAutoTestMain.TestResultDetail_4DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=4;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;


    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    //先写一个值
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

{procedure TfrmAutoTestMain.Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmAutoTestMain.Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
  CommIndex:=2;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

{procedure TfrmAutoTestMain.Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmAutoTestMain.Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;

begin
  CommIndex:=3;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

{procedure TfrmAutoTestMain.Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmAutoTestMain.Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;

begin
  CommIndex:=4;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

procedure TfrmAutoTestMain.tmrSleep1Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=1;
    TTimer(FindComponent('tmrSleep'+inttostr(CommIndex))).Enabled:=False;
    //tmrSleep.Enabled:=False;
    SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    //SendToComm(CommIndex);
end;

procedure TfrmAutoTestMain.tmrSleep2Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=2;
    TTimer(FindComponent('tmrSleep'+inttostr(CommIndex))).Enabled:=False;
    //tmrSleep.Enabled:=False;
    SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    //SendToComm(CommIndex);
end;

procedure TfrmAutoTestMain.tmrSleep3Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=3;
    TTimer(FindComponent('tmrSleep'+inttostr(CommIndex))).Enabled:=False;
    //tmrSleep.Enabled:=False;
    SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    //SendToComm(CommIndex);
end;

procedure TfrmAutoTestMain.tmrSleep4Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=4;
    TTimer(FindComponent('tmrSleep'+inttostr(CommIndex))).Enabled:=False;
    //tmrSleep.Enabled:=False;
    SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    //SendToComm(CommIndex);
end;
procedure TfrmAutoTestMain.funcLabelRed(CommIndex: Integer);
var
   CompareValue,count,sv_Value,iCount: Integer;
   lblComName,shpComName: string;
begin
   if LR_GPGSV_Data[CommIndex].Count <= 0 then exit;
   LR_GPGSV_Data[CommIndex].Sort;
   CompareValue := StrToInt(LR_GPGSV_Data[CommIndex][LR_GPGSV_Data[CommIndex].Count - 3]);
   iCount:=0;
   for count := 0 to 11 do
   begin
      lblComName := format('lblCom%dNo_%d',[CommIndex,count]);
      shpComName := format('shpCom%d_%d',[CommIndex,count]); 
      if FindComponent(lblComName) <> nil then
      begin
        TLabel(FindComponent(lblComName)).BringToFront;
        if Trim(TLabel(FindComponent(lblComName)).Caption) <> '' then
           sv_Value := StrToInt(Trim(TLabel(FindComponent(lblComName)).Caption))
        else sv_Value := 0;
        if sv_Value >= CompareValue then
        begin
            TLabel(FindComponent(lblComName)).Color:=clGreen;
        end;

      end;
   end;

end;

procedure TfrmAutoTestMain.Button1Click(Sender: TObject);
var
  strtemp,strtemp1:string;
begin
    strtemp:='ATOK1';
    Comm_1ReceiveData(Self,Pointer(strtemp),Length(strtemp)) ;
    Application.ProcessMessages;
end;


procedure TfrmAutoTestMain.FormResize(Sender: TObject);
begin
  inherited;
    Panel1.Left:=0;      //30
    Panel1.Top:=0;
end;

procedure TfrmAutoTestMain.Btn_ResultEnableClick(Sender: TObject);
var
    CommIndex:Integer;
begin
  inherited;
    for CommIndex := 1 to CommCount-1 do
    begin
        TPanel(FindComponent('pnlTestResult_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;
procedure TfrmAutoTestMain.TimerLimitGPSTC_1Timer(Sender: TObject);
var
  iDiv : Double;    //实际
  CommIndex:Integer;
begin
  CommIndex:=1;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=False;
  TLabel(FindComponent('LabelCalTime'+IntToStr(CommIndex))).Caption := IntToStr(iTimerCircleTime[CommIndex]) + ' 秒';
  iTimerCircleTime[CommIndex] := iTimerCircleTime[CommIndex] + 1;
  if iTimerCircleTime[CommIndex] > GPSTestParam.GPSContTime then
  begin
    if (iPassdNum[CommIndex]+iFaildNum[CommIndex]) > 0 then
      iDiv := iFaildNum[CommIndex]/(iPassdNum[CommIndex]+iFaildNum[CommIndex])
    else
      iDiv := 0.0;
    TLabel(FindComponent('lblEpoPrompt_'+IntToStr(CommIndex))).Caption:= '实际误差:' + FormatFloat('0.00',iDiv*100) + ',设定误差:' + FloatToStr(GPSTestParam.GPSSer);
    if iDiv*100 > GPSTestParam.GPSSer then  //实际的误差率超过设置的误差率
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
    end
    else
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    end;
    iTimerCircleTime[CommIndex] := 0;
    Exit;
  end;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=True;
end;

procedure TfrmAutoTestMain.TimerLimitGPSTC_2Timer(Sender: TObject);
var
  iDiv : Double;    //实际
  CommIndex:Integer;
begin
  CommIndex:=2;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=False;
  TLabel(FindComponent('LabelCalTime'+IntToStr(CommIndex))).Caption := IntToStr(iTimerCircleTime[CommIndex]) + ' 秒';
  iTimerCircleTime[CommIndex] := iTimerCircleTime[CommIndex] + 1;
  if iTimerCircleTime[CommIndex] > GPSTestParam.GPSContTime then
  begin
    if (iPassdNum[CommIndex]+iFaildNum[CommIndex]) > 0 then
      iDiv := iFaildNum[CommIndex]/(iPassdNum[CommIndex]+iFaildNum[CommIndex])
    else
      iDiv := 0.0;
    TLabel(FindComponent('lblEpoPrompt_'+IntToStr(CommIndex))).Caption:= '实际误差:' + FormatFloat('0.00',iDiv*100) + ',设定误差:' + FloatToStr(GPSTestParam.GPSSer);
    if iDiv*100 > GPSTestParam.GPSSer then  //实际的误差率超过设置的误差率
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
    end
    else
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    end;
    iTimerCircleTime[CommIndex] := 0;
    Exit;
  end;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=True;
end;

procedure TfrmAutoTestMain.TimerLimitGPSTC_3Timer(Sender: TObject);
var
  iDiv : Double;    //实际
  CommIndex:Integer;
begin
  CommIndex:=3;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=False;
  TLabel(FindComponent('LabelCalTime'+IntToStr(CommIndex))).Caption := IntToStr(iTimerCircleTime[CommIndex]) + ' 秒';
  iTimerCircleTime[CommIndex] := iTimerCircleTime[CommIndex] + 1;
  if iTimerCircleTime[CommIndex] > GPSTestParam.GPSContTime then
  begin
    if (iPassdNum[CommIndex]+iFaildNum[CommIndex]) > 0 then
      iDiv := iFaildNum[CommIndex]/(iPassdNum[CommIndex]+iFaildNum[CommIndex])
    else
      iDiv := 0.0;
    TLabel(FindComponent('lblEpoPrompt_'+IntToStr(CommIndex))).Caption:= '实际误差:' + FormatFloat('0.00',iDiv*100) + ',设定误差:' + FloatToStr(GPSTestParam.GPSSer);
    if iDiv*100 > GPSTestParam.GPSSer then  //实际的误差率超过设置的误差率
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
    end
    else
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    end;
    iTimerCircleTime[CommIndex] := 0;
    Exit;
  end;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=True;
end;

procedure TfrmAutoTestMain.TimerLimitGPSTC_4Timer(Sender: TObject);
var
  iDiv : Double;    //实际
  CommIndex:Integer;
begin
  CommIndex:=4;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=False;
  TLabel(FindComponent('LabelCalTime'+IntToStr(CommIndex))).Caption := IntToStr(iTimerCircleTime[CommIndex]) + ' 秒';
  iTimerCircleTime[CommIndex] := iTimerCircleTime[CommIndex] + 1;
  if iTimerCircleTime[CommIndex] > GPSTestParam.GPSContTime then
  begin
    if (iPassdNum[CommIndex]+iFaildNum[CommIndex]) > 0 then
      iDiv := iFaildNum[CommIndex]/(iPassdNum[CommIndex]+iFaildNum[CommIndex])
    else
      iDiv := 0.0;
    TLabel(FindComponent('lblEpoPrompt_'+IntToStr(CommIndex))).Caption:= '实际误差:' + FormatFloat('0.00',iDiv*100) + ',设定误差:' + FloatToStr(GPSTestParam.GPSSer);
    if iDiv*100 > GPSTestParam.GPSSer then  //实际的误差率超过设置的误差率
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
    end
    else
    begin
      SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
    end;
    iTimerCircleTime[CommIndex] := 0;
    Exit;
  end;
  TTimer(FindComponent('TimerLimitGPSTC_'+IntToStr(CommIndex))).Enabled:=True;
end;
procedure TfrmAutoTestMain.FindCommStart(CommIndex:Integer);
begin
    Application.ProcessMessages;
    iSendAtTestCount[CommIndex]:=0;
    //Sleep(iTestFinishTime[CommIndex]*1000);
    TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Interval:=1*1000;
    TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
    SerialInfo[CommIndex].iCheckCommNo:=0;
    SerialInfo[CommIndex].bAllowCheck:=false;
    Application.ProcessMessages;
end;

procedure TfrmAutoTestMain.tmrCheckComm1Timer(Sender: TObject);
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
          Sleep(2000);
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

procedure TfrmAutoTestMain.tmrCheckComm2Timer(Sender: TObject);
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
          Sleep(2000);
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
                StartTest(CommIndex);  }
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

procedure TfrmAutoTestMain.tmrCheckComm3Timer(Sender: TObject);
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
          Sleep(2000);
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

procedure TfrmAutoTestMain.tmrCheckComm4Timer(Sender: TObject);
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
          Sleep(2000);
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

procedure TfrmAutoTestMain.DeComReceieveDataAutoTest(CommIndex:Integer);
var
    strSendText,strFile:String;
    iIndex,count,jIndex,i,j:Integer;
    strTemp,strStart,strEnd,strValue,strMaxValue,strMinValue,strName:string;
    GpsDb:Integer;
    CompareRfFilename:string;
    TxtFile:TextFile;
    strCompareRf:string;
    bSecondCompare:Boolean;
    label CompareBMT;
begin

  //if not SerialInfo[CommIndex].bAllowTest then  Exit;
  GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
                        bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);

  try
    if strCmdCommKey[CommIndex]= 'AT' then
    begin
      if (pos('OK',StrCommRecText[CommIndex])>0) then
      begin
        SendToComm(CommIndex);
        AutoTest(CommIndex);
      end
      else
        Exit;
    end
    else if (Pos('SENSOR',StrCommRecText[CommIndex])>0) AND (strRemark[CommIndex]<>'SENSOR') then
    begin
      Exit;
    end
    else if strCmdCommKey[CommIndex]= 'AT^GT_CM=GPSTC' then
    begin
      if Pos('$',StrCommRecText[CommIndex])<=0 then  exit;
      TTimer(FindComponent('tmrRecCommTimeOut_'+IntToStr(CommIndex))).Enabled:=False;

      strTotal[CommIndex].Clear;
      strGPGSA[CommIndex].Clear;
      strGPGSV[CommIndex].Clear;
      strGPRMC[CommIndex].Clear;
      strGPGGA[CommIndex].Clear;
      strRMCResult[CommIndex].Clear;
      strGGAResult[CommIndex].Clear;

      strTotal[CommIndex].Delimiter:='$';
      strTotal[CommIndex].DelimitedText:=StrCommRecText[CommIndex];
      LR_GPGSV_Data[CommIndex].Clear;
      for i:=0 to strTotal[CommIndex].Count-1 do
      begin
        try
          if ((Pos('GPGGA',strTotal[CommIndex][i])>0) or (Pos('GNGGA',strTotal[CommIndex][i])>0)) then
          begin
            strGPGGA[CommIndex].Delimiter:=',';
            strGPGGA[CommIndex].DelimitedText:=strTotal[CommIndex][i];
            funcGPGGA(CommIndex,strGPGGA[CommIndex]);
          end;
          if Pos('GPGSA',strTotal[CommIndex][i])>0 then
          begin
            strGPGSA[CommIndex].Delimiter:=',';
            strGPGSA[CommIndex].DelimitedText:=strTotal[CommIndex][i];
            funcGPGSA(CommIndex,strGPGSA[CommIndex]);
            if strFixMode[CommIndex]='3D定位' then
              TEdit(FindComponent('EdtTypeResult_'+inttostr(CommIndex))).Color:=clLime
            else
              TEdit(FindComponent('EdtTypeResult_'+inttostr(CommIndex))).Color:=clRed;
            if strOperatingMode[CommIndex]='自动' then
              TEdit(FindComponent('EdtModeResult_'+inttostr(CommIndex))).Color:=clLime
            else
              TEdit(FindComponent('EdtModeResult_'+inttostr(CommIndex))).Color:=clRed;
            TEdit(FindComponent('EdtModeResult_'+inttostr(CommIndex))).Text:=strOperatingMode[CommIndex];
            TEdit(FindComponent('EdtTypeResult_'+inttostr(CommIndex))).Text:=strFixMode[CommIndex];
          end;
          if Pos('GPGSV',strTotal[CommIndex][i])>0 then
          begin
            strGPGSV[CommIndex].Delimiter:=',';
            strGPGSV[CommIndex].DelimitedText:=strTotal[CommIndex][i];
            funcGPGSV(CommIndex,strGPGSV[CommIndex]);

          end;
          if (Pos('GPRMC',strTotal[CommIndex][i])>0) or (Pos('GNRMC',strTotal[CommIndex][i])>0) then
          begin
            strGPRMC[CommIndex].Delimiter:=',';
            strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
            funcGPRMC(CommIndex,strGPRMC[CommIndex]);
          end;
          Count:=0;
            //if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
            begin
              strSendText:='';
              for j := 0 to 11 do
              begin
                if TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_'+inttostr(j))).Caption<>'' then
                begin
                  GpsDb:=strtoint(TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_'+inttostr(j))).Caption);
                end
                else
                  GpsDb:=0;

                if (GpsDb >=GPSTestParam.GPSDbMin) and (GpsDb <=GPSTestParam.GPSDbMax) then
                //if GpsDb >=GPSTestParam.GPSDb then
                begin
                  Count:=Count+1;
                end;
                strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                NoteCommLog(CommIndex,'===='+strSendText);
              end;
              NoteCommLog(CommIndex,'====Count='+IntToStr(Count)+',GPSTestParam.GPSNumbers='+IntToStr(GPSTestParam.GPSNumbers));
              if Count>=GPSTestParam.GPSNumbers then
              begin
                if bFirstCount[CommIndex] then
                begin
                  strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s#Tester=%s#',[strChipRid[CommIndex],
                										strFixMode[CommIndex],strSendText,User.UserName]);
                  SendToServer(CommIndex,'UpdateGpsTcData',strSendText,true,CTimeOut*2);

                  ClearCountArrayList(CommIndex);             //计算之前先清零 2014.03.12
                  TLabel(FindComponent('LabelCalTime'+inttostr(CommIndex))).Caption := '';
                  iTimerCircleTime[CommIndex] := 0;
                  TTimer(FindComponent('TimerLimitGPSTC_'+inttostr(CommIndex))).Enabled:=True;
                  iPassdNum[CommIndex] :=1;
                  bFirstCount[CommIndex]:=False;
                end
                else
                  iPassdNum[CommIndex] := iPassdNum[CommIndex] +1;      //获得达标的个数累加1  2014.03.12
              end
              else
              begin
                if not bFirstCount[CommIndex] then
                  iFaildNum[CommIndex] := iFaildNum[CommIndex] +1      //获得未达标的数据累加1  2014.03.11
                else
                  iFaildNum[CommIndex] := 1;
              end;
            end;
          //if (strFixMode[CommIndex]='3D定位') then
          begin
            TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
            TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
            TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
            TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
            TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
            TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
            TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
            TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];

          end;
          {else
          begin
            TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
            TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
          end;}
        except
        on EStringListError do Sleep(1);
        end;
      end;
    end
    else if (Pos('$',StrCommRecText[CommIndex])>0) AND (Pos('GPSOFF', strRemark[CommIndex])<=0) then
    begin
         SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0,'有GPS透传数据!');
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

      if strRemark[CommIndex]='RF_READ' then
      begin
        strFile:=ExtractFilePath(Paramstr(0))+'RF_'+IntToStr(CommIndex)+'.txt';
        ClearTxt(strFile);
        AppendTxt(StrCommRecText[CommIndex],strFile);
      end;

      if strRemark[CommIndex]='RFCompare' then
      begin
        //读取RfCompare.txt文件
        CompareRfFilename:=ExtractFilePath(Paramstr(0))+'RF_'+IntToStr(CommIndex)+'.txt';
        AssignFile(TxtFile,CompareRfFilename);
        Reset(TxtFile);
        strCompareRf:='';
        while not Eof(TxtFile) do
        begin
          Readln(TxtFile,strTemp);
          strCompareRf:=strCompareRf+strTemp;
        end;
        strCompareRf:=UpperCase(strCompareRf);
        CloseFile(TxtFile);
        if pos(strCompareRf,StrCommRecText[CommIndex])>0 then
          SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1)
        else
        begin
          SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
        end;
      end
      else if bCompare[CommIndex] then
      begin
        if pos(' ',StrCommRecText[CommIndex])<>0 then
          StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],' ','',[rfReplaceAll]);
        if pos('+EADC:',StrCommRecText[CommIndex])<>0 then
                      StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],'+EADC:','',[rfReplaceAll]);

        //strTestValue[CommIndex]:='';
        //strTemp:=StrCommRecText[CommIndex];

        StrListCompare_AutoTest[CommIndex].Delimiter:=';';
        StrListCompare_AutoTest[CommIndex].DelimitedText:=UpperCase(strCompare[CommIndex]);

        StrListCompareChar_AutoTest[CommIndex].Delimiter:='|';
        StrListCompareChar_AutoTest[CommIndex].DelimitedText:=UpperCase(strRemark[CommIndex]);

        bSecondCompare:=False;
CompareBMT:
        strTestValue[CommIndex]:='';
        strTemp:=StrCommRecText[CommIndex];
        for iIndex := 0 to StrListCompare_AutoTest[CommIndex].Count-2 do
        begin
          StrListCompare_Name_AutoTest[CommIndex].Delimiter:='=';
          StrListCompare_Name_AutoTest[CommIndex].DelimitedText:=UpperCase(StrListCompare_AutoTest[CommIndex][iIndex]);

          if strCmdCommKey[CommIndex]= 'BMT_MTK' then
          begin
            StrListMTKBMT[CommIndex].Delimiter:=',';
            StrListMTKBMT[CommIndex].DelimitedText:=StrCommRecText[CommIndex];
            if iIndex=0 then  strValue:=StrListMTKBMT[CommIndex][0]
            else if iIndex=1 then  strValue:=StrListMTKBMT[CommIndex][3]
            else if iIndex=2 then  strValue:=StrListMTKBMT[CommIndex][4];
          end
          else if Pos('GPSTIME',strRemark[CommIndex])>0 then
          //else if strRemark[CommIndex]='GPSTIME' then
          begin
            strValue:=FloatToStr(PositionGpsTime[CommIndex]);
          end
          else if Pos('IMSI',strRemark[CommIndex])>0 then
          begin
            //strValue:=stringreplace(strTemp,'IMSI:','',[rfReplaceAll]);
            strValue:=MidStr(strTemp,Pos('IMSI:',strTemp)+Length('IMSI:'),15);
            NoteCommLog(CommIndex,'IMSI:'+strValue);

          end
          else
          begin
            StrListCompareChar_Name_AutoTest[CommIndex].Delimiter:=';';
            StrListCompareChar_Name_AutoTest[CommIndex].DelimitedText:=UpperCase(StrListCompareChar_AutoTest[CommIndex][iIndex]);

            strStart:=StrListCompareChar_Name_AutoTest[CommIndex].Values['S'];
            strEnd:=StrListCompareChar_Name_AutoTest[CommIndex].Values['E'];
            strTemp:=MidStr(strTemp,Pos(strStart,strTemp)+Length(strStart),Length(strTemp)-Pos(strStart,strTemp));
            //strValue:=LeftStr(strTemp,Pos(strEnd,strTemp)-Length(strEnd));
            strValue:=LeftStr(strTemp,Pos(strEnd,strTemp)-1);
            strTemp:=MidStr(strTemp,Pos(strEnd,strTemp)+Length(strEnd),Length(strTemp)-Pos(strEnd,strTemp));
          end;

          strMinValue:=LeftStr(StrListCompare_Name_AutoTest[CommIndex][1],Pos('~',StrListCompare_Name_AutoTest[CommIndex][1])-1);
          strMaxValue:=StrUtils.RightStr(StrListCompare_Name_AutoTest[CommIndex][1],Length(StrListCompare_Name_AutoTest[CommIndex][1])-Pos('~',StrListCompare_Name_AutoTest[CommIndex][1]));

          strTestValue[CommIndex]:=Format('%s%s:%s;',[strTestValue[CommIndex],StrListCompare_Name_AutoTest[CommIndex][0],strValue]);
          if (StrToFloat(strValue)<StrToFloat(strMinValue)) or (StrToFloat(strValue)>StrToFloat(strMaxValue)) then
          begin
            if bSecondCompare then Exit;

            StrListCompare_AutoTest[CommIndex].Delimiter:=';';
            StrListCompare_AutoTest[CommIndex].DelimitedText:=UpperCase(strRemark2[CommIndex]);

            bSecondCompare:=True;
            if strRemark2[CommIndex]<>'' then
              goto CompareBMT
            else
              exit;
          end
        end;
        //对备注二进行解析
        SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1,strTestValue[CommIndex]);
      end
      else
        //SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1);
        SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],1,strTestValue[CommIndex]);
    end;
  except
    on EStringListError do
    begin
    	Sleep(1);
    end;
    on EConvertError do
    begin
    	Sleep(1);
    end;
  end;
  Application.ProcessMessages;
end;

procedure TfrmAutoTestMain.Comm_00ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
    strSendText:String;
    iIndex,count,jIndex:Integer;
    strTemp,strStart,strEnd,strValue,strMaxValue,strMinValue,strName:string;
begin
    CommIndex:=0;
  inherited;
    //if not SerialInfo[CommIndex].bAllowTest then  Exit;
    Application.ProcessMessages;
    try
        if strCmdCommKey[CommIndex]= 'AT' then
        begin
            if (pos('OK',StrCommRecText[CommIndex])>0) then
            begin

                AutoTest(CommIndex);
            end
            else
                Exit;

        end
        else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
        begin
        end
        {else if((pos('SENSOR_OK',StrCommRecText[CommIndex])>0) and (strCmdCommKey[CommIndex]<> 'SENSOR') ) then
        begin
            SendCommList[CommIndex].Clear;
            SendToComm(CommIndex,strSensorAt,strSensorAt+#13+#10,True,iSensorTimeOut*1000,strSensorReturn,'SENSOR静默拉低IO');
            Sleep(500);
            SetTestItemResult(CommIndex,TesItem_Comm1.Items[0],0,'有SENSOR_OK');
        end}
        else if Pos('$',StrCommRecText[CommIndex])>0 then
        begin
            SetTestItemResult(CommIndex,TesItem_Comm1.Items[0],0,'有GPS透传数据!');
        end
        
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
    end;
    Application.ProcessMessages;
end;

procedure TfrmAutoTestMain.Comm_01ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;

begin
  CommIndex:=1;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

procedure TfrmAutoTestMain.Comm_02ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;

begin
  CommIndex:=2;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

procedure TfrmAutoTestMain.Comm_03ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;

begin
  CommIndex:=3;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

procedure TfrmAutoTestMain.Comm_04ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;

begin
  CommIndex:=4;
  inherited;
  Application.ProcessMessages;
  DeComReceieveDataAutoTest(CommIndex);
end;

end.
