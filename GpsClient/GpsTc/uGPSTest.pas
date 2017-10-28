unit uGPSTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, StdCtrls, ExtCtrls, SPComm,uGlobalVar,StrUtils,IniFiles,
  Buttons;

type
  TfrmGPSTestMain = class(TfrmModule)
    pnlClientClient: TPanel;
    pnlGpsTc1: TPanel;
    lbl11: TLabel;
    lbl2: TLabel;
    pnl1: TPanel;
    lblCom1No_1: TLabel;
    lblCom1No_0: TLabel;
    lblCom1No_2: TLabel;
    shpCom1_0: TShape;
    shpCom1_1: TShape;
    shpCom1_11: TShape;
    shpCom1_2: TShape;
    shpCom1_3: TShape;
    shpCom1_4: TShape;
    shpCom1_5: TShape;
    shpCom1_6: TShape;
    shpCom1_7: TShape;
    shpCom1_8: TShape;
    shpCom1_9: TShape;
    shpCom1_10: TShape;
    lblCom1No_5: TLabel;
    lblCom1No_4: TLabel;
    lblCom1No_3: TLabel;
    lblCom1No_11: TLabel;
    lblCom1No_10: TLabel;
    lblCom1No_9: TLabel;
    lblCom1No_8: TLabel;
    lblCom1No_7: TLabel;
    lblCom1No_6: TLabel;
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
    lblCom1Az_0: TLabel;
    lblCom1Az_1: TLabel;
    lblCom1Az_2: TLabel;
    lblCom1Az_3: TLabel;
    lblCom1Az_4: TLabel;
    lblCom1Az_5: TLabel;
    lblCom1Az_6: TLabel;
    lblCom1Az_7: TLabel;
    lblCom1Az_8: TLabel;
    lblCom1Az_9: TLabel;
    lblCom1Az_10: TLabel;
    lblCom1Az_11: TLabel;
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
    cbbCom_1: TComboBox;
    btnStart_1: TButton;
    EdtModeResult_1: TEdit;
    EdtTypeResult_1: TEdit;
    lbl186: TLabel;
    pnlGpsTc2: TPanel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl22: TLabel;
    pnl3: TPanel;
    lblCom2No_1: TLabel;
    lblCom2No_0: TLabel;
    lblCom2No_2: TLabel;
    shpCom2_0: TShape;
    shpCom2_1: TShape;
    shpCom2_11: TShape;
    shpCom2_2: TShape;
    shpCom2_3: TShape;
    shpCom2_4: TShape;
    shpCom2_5: TShape;
    shpCom2_6: TShape;
    shpCom2_7: TShape;
    shpCom2_8: TShape;
    shpCom2_9: TShape;
    shpCom2_10: TShape;
    lblCom2No_5: TLabel;
    lblCom2No_4: TLabel;
    lblCom2No_3: TLabel;
    lblCom2No_11: TLabel;
    lblCom2No_10: TLabel;
    lblCom2No_9: TLabel;
    lblCom2No_8: TLabel;
    lblCom2No_7: TLabel;
    lblCom2No_6: TLabel;
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
    lblCom2Az_0: TLabel;
    lblCom2Az_1: TLabel;
    lblCom2Az_2: TLabel;
    lblCom2Az_3: TLabel;
    lblCom2Az_4: TLabel;
    lblCom2Az_5: TLabel;
    lblCom2Az_6: TLabel;
    lblCom2Az_7: TLabel;
    lblCom2Az_8: TLabel;
    lblCom2Az_9: TLabel;
    lblCom2Az_10: TLabel;
    lblCom2Az_11: TLabel;
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
    cbbCom_2: TComboBox;
    btnStart_2: TButton;
    EdtModeResult_2: TEdit;
    EdtTypeResult_2: TEdit;
    pnlGpsTc3: TPanel;
    lbl71: TLabel;
    lbl72: TLabel;
    lbl81: TLabel;
    pnl5: TPanel;
    lblCom3No_1: TLabel;
    lblCom3No_0: TLabel;
    lblCom3No_2: TLabel;
    shpCom3_0: TShape;
    shpCom3_1: TShape;
    shpCom3_11: TShape;
    shpCom3_2: TShape;
    shpCom3_3: TShape;
    shpCom3_4: TShape;
    shpCom3_5: TShape;
    shpCom3_6: TShape;
    shpCom3_7: TShape;
    shpCom3_8: TShape;
    shpCom3_9: TShape;
    shpCom3_10: TShape;
    lblCom3No_5: TLabel;
    lblCom3No_4: TLabel;
    lblCom3No_3: TLabel;
    lblCom3No_11: TLabel;
    lblCom3No_10: TLabel;
    lblCom3No_9: TLabel;
    lblCom3No_8: TLabel;
    lblCom3No_7: TLabel;
    lblCom3No_6: TLabel;
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
    lblCom3Az_0: TLabel;
    lblCom3Az_1: TLabel;
    lblCom3Az_2: TLabel;
    lblCom3Az_3: TLabel;
    lblCom3Az_4: TLabel;
    lblCom3Az_5: TLabel;
    lblCom3Az_6: TLabel;
    lblCom3Az_7: TLabel;
    lblCom3Az_8: TLabel;
    lblCom3Az_9: TLabel;
    lblCom3Az_10: TLabel;
    lblCom3Az_11: TLabel;
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
    cbbCom_3: TComboBox;
    btnStart_3: TButton;
    EdtModeResult_3: TEdit;
    EdtTypeResult_3: TEdit;
    EdtResult_1: TEdit;
    EdtResult_2: TEdit;
    EdtResult_3: TEdit;
    lbl23: TLabel;
    pnl2: TPanel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    pnl4: TPanel;
    lblCom4No_1: TLabel;
    lblCom4No_0: TLabel;
    lblCom4No_2: TLabel;
    shpCom4_0: TShape;
    shpCom4_1: TShape;
    shpCom4_11: TShape;
    shpCom4_2: TShape;
    shpCom4_3: TShape;
    shpCom4_4: TShape;
    shpCom4_5: TShape;
    shpCom4_6: TShape;
    shpCom4_7: TShape;
    shpCom4_8: TShape;
    shpCom4_9: TShape;
    shpCom4_10: TShape;
    lblCom4No_5: TLabel;
    lblCom4No_4: TLabel;
    lblCom4No_3: TLabel;
    lblCom4No_11: TLabel;
    lblCom4No_10: TLabel;
    lblCom4No_9: TLabel;
    lblCom4No_8: TLabel;
    lblCom4No_7: TLabel;
    lblCom4No_6: TLabel;
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
    lblCom4Az_0: TLabel;
    lblCom4Az_1: TLabel;
    lblCom4Az_2: TLabel;
    lblCom4Az_3: TLabel;
    lblCom4Az_4: TLabel;
    lblCom4Az_5: TLabel;
    lblCom4Az_6: TLabel;
    lblCom4Az_7: TLabel;
    lblCom4Az_8: TLabel;
    lblCom4Az_9: TLabel;
    lblCom4Az_10: TLabel;
    lblCom4Az_11: TLabel;
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
    cbbCom_4: TComboBox;
    btnStart_4: TButton;
    EdtModeResult_4: TEdit;
    EdtTypeResult_4: TEdit;
    EdtResult_4: TEdit;
    pnl6: TPanel;
    lbl95: TLabel;
    lbl96: TLabel;
    lbl105: TLabel;
    pnl7: TPanel;
    lblCom5No_1: TLabel;
    lblCom5No_0: TLabel;
    lblCom5No_2: TLabel;
    shpCom5_0: TShape;
    shpCom5_1: TShape;
    shpCom5_11: TShape;
    shpCom5_2: TShape;
    shpCom5_3: TShape;
    shpCom5_4: TShape;
    shpCom5_5: TShape;
    shpCom5_6: TShape;
    shpCom5_7: TShape;
    shpCom5_8: TShape;
    shpCom5_9: TShape;
    shpCom5_10: TShape;
    lblCom5No_5: TLabel;
    lblCom5No_4: TLabel;
    lblCom5No_3: TLabel;
    lblCom5No_11: TLabel;
    lblCom5No_10: TLabel;
    lblCom5No_9: TLabel;
    lblCom5No_8: TLabel;
    lblCom5No_7: TLabel;
    lblCom5No_6: TLabel;
    lblCom5SV_9: TLabel;
    lblCom5SV_8: TLabel;
    lblCom5SV_7: TLabel;
    lblCom5SV_6: TLabel;
    lblCom5SV_5: TLabel;
    lblCom5SV_4: TLabel;
    lblCom5SV_3: TLabel;
    lblCom5SV_2: TLabel;
    lblCom5SV_11: TLabel;
    lblCom5SV_10: TLabel;
    lblCom5SV_1: TLabel;
    lblCom5SV_0: TLabel;
    lblCom5Az_0: TLabel;
    lblCom5Az_1: TLabel;
    lblCom5Az_2: TLabel;
    lblCom5Az_3: TLabel;
    lblCom5Az_4: TLabel;
    lblCom5Az_5: TLabel;
    lblCom5Az_6: TLabel;
    lblCom5Az_7: TLabel;
    lblCom5Az_8: TLabel;
    lblCom5Az_9: TLabel;
    lblCom5Az_10: TLabel;
    lblCom5Az_11: TLabel;
    lblCom5EI_9: TLabel;
    lblCom5EI_8: TLabel;
    lblCom5EI_7: TLabel;
    lblCom5EI_6: TLabel;
    lblCom5EI_5: TLabel;
    lblCom5EI_4: TLabel;
    lblCom5EI_3: TLabel;
    lblCom5EI_2: TLabel;
    lblCom5EI_11: TLabel;
    lblCom5EI_10: TLabel;
    lblCom5EI_1: TLabel;
    lblCom5EI_0: TLabel;
    cbbCom_5: TComboBox;
    btnStart_5: TButton;
    EdtModeResult_5: TEdit;
    EdtTypeResult_5: TEdit;
    EdtResult_5: TEdit;
    tmrCountdown_5: TTimer;
    tmrCountdown_6: TTimer;
    pnlGpsTc6: TPanel;
    lbl154: TLabel;
    lbl155: TLabel;
    lbl164: TLabel;
    pnl9: TPanel;
    Image6: TImage;
    lblCom6No_1: TLabel;
    lblCom6No_0: TLabel;
    lblCom6No_2: TLabel;
    shpCom6_0: TShape;
    shpCom6_1: TShape;
    shpCom6_11: TShape;
    shpCom6_2: TShape;
    shpCom6_3: TShape;
    shpCom6_4: TShape;
    shpCom6_5: TShape;
    shpCom6_6: TShape;
    shpCom6_7: TShape;
    shpCom6_8: TShape;
    shpCom6_9: TShape;
    shpCom6_10: TShape;
    lblCom6No_5: TLabel;
    lblCom6No_4: TLabel;
    lblCom6No_3: TLabel;
    lblCom6No_11: TLabel;
    lblCom6No_10: TLabel;
    lblCom6No_9: TLabel;
    lblCom6No_8: TLabel;
    lblCom6No_7: TLabel;
    lblCom6No_6: TLabel;
    lblCom6SV_9: TLabel;
    lblCom6SV_8: TLabel;
    lblCom6SV_7: TLabel;
    lblCom6SV_6: TLabel;
    lblCom6SV_5: TLabel;
    lblCom6SV_4: TLabel;
    lblCom6SV_3: TLabel;
    lblCom6SV_2: TLabel;
    lblCom6SV_11: TLabel;
    lblCom6SV_10: TLabel;
    lblCom6SV_1: TLabel;
    lblCom6SV_0: TLabel;
    lblCom6Az_0: TLabel;
    lblCom6Az_1: TLabel;
    lblCom6Az_2: TLabel;
    lblCom6Az_3: TLabel;
    lblCom6Az_4: TLabel;
    lblCom6Az_5: TLabel;
    lblCom6Az_6: TLabel;
    lblCom6Az_7: TLabel;
    lblCom6Az_8: TLabel;
    lblCom6Az_9: TLabel;
    lblCom6Az_10: TLabel;
    lblCom6Az_11: TLabel;
    lblCom6EI_9: TLabel;
    lblCom6EI_8: TLabel;
    lblCom6EI_7: TLabel;
    lblCom6EI_6: TLabel;
    lblCom6EI_5: TLabel;
    lblCom6EI_4: TLabel;
    lblCom6EI_3: TLabel;
    lblCom6EI_2: TLabel;
    lblCom6EI_11: TLabel;
    lblCom6EI_10: TLabel;
    lblCom6EI_1: TLabel;
    lblCom6EI_0: TLabel;
    cbbCom_6: TComboBox;
    btnStart_6: TButton;
    EdtModeResult_6: TEdit;
    EdtTypeResult_6: TEdit;
    EdtResult_6: TEdit;
    lbl156: TLabel;
    EdtLatitude_6: TEdit;
    lbl157: TLabel;
    EdtLongitude_6: TEdit;
    lbl158: TLabel;
    EdtAltitude_6: TEdit;
    lbl159: TLabel;
    EdtSpeed_6: TEdit;
    lbl160: TLabel;
    EdtCourse_6: TEdit;
    lbl161: TLabel;
    EdtNumber_6: TEdit;
    lbl162: TLabel;
    EdtGPStime_6: TEdit;
    lbl163: TLabel;
    EdtLocaltime_6: TEdit;
    Image5: TImage;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtLatitude_1: TEdit;
    EdtLongitude_1: TEdit;
    EdtAltitude_1: TEdit;
    EdtSpeed_1: TEdit;
    EdtCourse_1: TEdit;
    EdtNumber_1: TEdit;
    EdtGPStime_1: TEdit;
    EdtLocaltime_1: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EdtLatitude_2: TEdit;
    EdtLongitude_2: TEdit;
    EdtAltitude_2: TEdit;
    EdtSpeed_2: TEdit;
    EdtCourse_2: TEdit;
    EdtNumber_2: TEdit;
    EdtGPStime_2: TEdit;
    EdtLocaltime_2: TEdit;
    Image3: TImage;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EdtLatitude_3: TEdit;
    EdtLongitude_3: TEdit;
    EdtAltitude_3: TEdit;
    EdtSpeed_3: TEdit;
    EdtCourse_3: TEdit;
    EdtNumber_3: TEdit;
    EdtGPStime_3: TEdit;
    EdtLocaltime_3: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    EdtLatitude_4: TEdit;
    EdtLongitude_4: TEdit;
    EdtAltitude_4: TEdit;
    EdtSpeed_4: TEdit;
    EdtCourse_4: TEdit;
    EdtNumber_4: TEdit;
    EdtGPStime_4: TEdit;
    EdtLocaltime_4: TEdit;
    Image2: TImage;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    EdtLatitude_5: TEdit;
    EdtLongitude_5: TEdit;
    EdtAltitude_5: TEdit;
    EdtSpeed_5: TEdit;
    EdtCourse_5: TEdit;
    EdtNumber_5: TEdit;
    EdtGPStime_5: TEdit;
    EdtLocaltime_5: TEdit;
    Image4: TImage;
    //==================================================================//
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure InitAllControl(CommIndex:Integer);
    procedure btnStart_1Click(Sender: TObject);
    procedure btnStart_2Click(Sender: TObject);
    procedure btnStart_3Click(Sender: TObject);
    procedure btnStart_4Click(Sender: TObject);
    procedure btnStart_5Click(Sender: TObject);
    procedure btnStart_6Click(Sender: TObject);
    procedure StartClick(CommIndex:Integer);
    procedure btnStartTestClick(Sender: TObject);

    //procedure tmrCountdown_1Timer(Sender: TObject);
    procedure tmrCountdown_2Timer(Sender: TObject);
    procedure tmrCountdown_3Timer(Sender: TObject);
    procedure tmrCountdown_4Timer(Sender: TObject);
    procedure tmrCountdown_5Timer(Sender: TObject);
    procedure tmrCountdown_6Timer(Sender: TObject);
    //==================================================================//
    procedure Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_5ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_6ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Button1Click(Sender: TObject);
    {procedure tmrCommTimeOut_1Timer(Sender: TObject);
    procedure tmrCommTimeOut_2Timer(Sender: TObject);
    procedure tmrCommTimeOut_3Timer(Sender: TObject);
    procedure tmrCommTimeOut_4Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_5Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_6Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_0Timer(Sender: TObject);}

    private
      { Private declarations }
      procedure funcGPGSA(CommIndex:Integer;GPGSA_Data:TStringList);
      procedure funcGPGSV(CommIndex:Integer;GPGSV_Data:TStringList);
      procedure funcGPGGA(CommIndex:Integer;GPGGA_Data:TStringList);
      procedure funcGPRMC(CommIndex:Integer;GPRMC_Data:TStringList);
      procedure funcLabelRed(CommIndex:Integer);
    public
      { Public declarations }
      procedure StartTest(CommIndex:Integer);override;

  end;
Type
    SYSTEMTIME = record
        wYear:Integer;
        wMonth:Integer;
        wDayOfWeek:Integer;
        wDay:Integer;
        wHour:Integer;
        wMinute:Integer;
        wSecond:Integer;
        wMilliseconds:Integer;
    end;
{Type
    TIME_ZONE_INFORMATION = record
        Bias:LongInt;
        StandardName:array [0..31] of Integer;
        StandardDate:SYSTEMTIME;
        StandardBias:LongInt;
        DayLightName:array [0..31] of Integer;
        DaylightDate:SYSTEMTIME;
        DaylightBias:LongInt;
    end;}

var
    frmGPSTestmain: TfrmGPSTestmain;
    strFixNumber:array[0..CommCount-1,0..11] of string;
    strTotal:array[0..CommCount-1] of TStringList;
    strGPGSA:array[0..CommCount-1] of TStringList;
    strGPGSV:array[0..CommCount-1] of TStringList;
    strGPRMC:array[0..CommCount-1] of TStringList;
    strGPGGA:array[0..CommCount-1] of TStringList;
    strRMCResult:array[0..CommCount-1] of TStringList;
    strGGAResult:array[0..CommCount-1] of TStringList;
    strOperatingMode:array[0..CommCount-1] of string;
    strFixMode:array[0..CommCount-1] of string;
    LR_GPGSV_Data:array[0..CommCount-1] of TStringList;

implementation
uses
    uPublicFunc, uClientMain;
{$R *.dfm}
//==================================================================//
procedure TfrmGPSTestmain.FormCreate(Sender: TObject);
var
    CommList: TStrings;
    iIndex,Count:Integer;
begin
inherited;
    //GPS透传的串口是从串口1开始
    for iIndex := 1 to CommCount-1 do
    begin
        InitAllControl(iIndex);
        strTotal[iIndex] := TStringList.Create;
        strGPGSA[iIndex] := TStringList.Create;
        strGPGSV[iIndex] := TStringList.Create;
        strGPRMC[iIndex] := TStringList.Create;
        strGPGGA[iIndex] := TStringList.Create;
        strRMCResult[iIndex] := TStringList.Create;
        strGGAResult[iIndex] := TStringList.Create;
        LR_GPGSV_Data[iIndex] := TStringList.Create;
    end;

    
end;
procedure TfrmGPSTestMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    iCount:Integer;
begin
    inherited;
    for iCount:= 1 to (CommCount-1) do
    begin
        if strTotal[iCount]<> nil then FreeAndNil(strTotal[iCount]);
        if strGPGSA[iCount]<> nil then FreeAndNil(strGPGSA[iCount]);
        if strGPGSV[iCount]<> nil then FreeAndNil(strGPGSV[iCount]);
        if strGPRMC[iCount]<> nil then FreeAndNil(strGPRMC[iCount]);
        if strGPGGA[iCount]<> nil then FreeAndNil(strGPGGA[iCount]);
        if strRMCResult[iCount]<> nil then FreeAndNil(strRMCResult[iCount]);
        if strGGAResult[iCount]<> nil then FreeAndNil(strGGAResult[iCount]);
        if LR_GPGSV_Data[iCount]<> nil then FreeAndNil(LR_GPGSV_Data[iCount]);
    end;
end;
procedure TfrmGPSTestmain.FormResize(Sender: TObject);
begin
    //pnlGpsTc.Left:=Trunc((Self.Width - pnlGpsTc.Width)/2);
    //pnlGpsTc.Top:= Trunc((self.Height - pnlGpsTc.Height) / 2);
end;
procedure TfrmGPSTestMain.InitAllControl(CommIndex:Integer);
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

    for iIndex:= 0 to 11 do
    begin
        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_'+inttostr(iIndex))).Visible:=False;
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
end;
procedure TfrmGPSTestmain.btnStart_1Click(Sender: TObject);
var
    iIndex:Integer;
begin
    iIndex:=1;
    StartClick(iIndex);
    StartComm(iIndex);
end;
procedure TfrmGPSTestMain.btnStart_2Click(Sender: TObject);
var
    iIndex:Integer;
begin
    iIndex:=2;
    StartClick(iIndex);
    StartComm(iIndex);
end;
procedure TfrmGPSTestMain.btnStart_3Click(Sender: TObject);
var
    iIndex:Integer;
begin
    iIndex:=3;
    StartClick(iIndex);
    StartComm(iIndex);
end;
procedure TfrmGPSTestMain.btnStart_4Click(Sender: TObject);
var
    iIndex:Integer;
begin
    iIndex:=4;
    StartClick(iIndex);
    StartComm(iIndex);
end;
procedure TfrmGPSTestMain.btnStart_5Click(Sender: TObject);
var
    iIndex:Integer;
begin
    iIndex:=5;
    StartClick(iIndex);
    StartComm(iIndex);
end;
procedure TfrmGPSTestMain.btnStart_6Click(Sender: TObject);
var
    iIndex:Integer;
begin
    iIndex:=6;
    StartClick(iIndex);
    StartComm(iIndex);
end;
procedure TfrmGPSTestMain.StartClick(CommIndex:Integer);
var
    strComPort:string;
    iIndex,j:Integer;
    strNo:array[0..11] of string;
    strSv:array[0..11] of string;
    strAz:array[0..11] of string;
    strEi:array[0..11] of string;
    strMode,strType,strLatitude,strLongitude,strAltitude,strSpeed,strCourse:string;
    strNumber,strGPStime,strLocaltime:string;
    strFolder,strFile:string;
    iHour,iMinute,iSecond,iMSecond:Word;
    strTemp:string;
begin
    iIndex:=CommIndex;
    if TButton(FindComponent('btnStart_'+inttostr(iIndex))).Caption='连接' then
    begin
        InitAllControl(CommIndex);
    end
    else if TButton(FindComponent('btnStart_'+inttostr(iIndex))).Caption='断开'  then
    begin
        strMode:=TEdit(FindComponent('EdtModeResult_'+inttostr(iIndex))).Text;
        strType:=TEdit(FindComponent('EdtTypeResult_'+inttostr(iIndex))).Text;
        strLatitude:=TEdit(FindComponent('EdtLatitude_'+inttostr(iIndex))).Text;
        strLongitude:=TEdit(FindComponent('EdtLongitude_'+inttostr(iIndex))).Text;
        strAltitude:=TEdit(FindComponent('EdtAltitude_'+inttostr(iIndex))).Text;
        strSpeed:=TEdit(FindComponent('EdtSpeed_'+inttostr(iIndex))).Text;
        strCourse:=TEdit(FindComponent('EdtCourse_'+inttostr(iIndex))).Text;
        strNumber:=TEdit(FindComponent('EdtNumber_'+inttostr(iIndex))).Text;
        strGPStime:=TEdit(FindComponent('EdtGPStime_'+inttostr(iIndex))).Text;
        strLocaltime:=TEdit(FindComponent('EdtLocaltime_'+inttostr(iIndex))).Text;

        for j := 0 to 11 do
        begin
            strNo[j]:=TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'No_'+inttostr(j))).Caption;
            strSv[j]:=TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'SV_'+inttostr(j))).Caption;
            strAz[j]:=TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'Az_'+inttostr(j))).Caption;
            strEi[j]:=TLabel(FindComponent('lblCom'+inttostr(CommIndex)+'EI_'+inttostr(j))).Caption;
        end;

        if strType<>'' then
        begin
            strFolder:=FormatDateTime('YYYYMMDD',Now);
            strFolder:=ExtractFilePath(ParamStr(0))+ Format('%s',[strFolder]);
            if not DirectoryExists(strFolder) then forcedirectories (strFolder);
            strFile:=FormatDateTime('HHMMSS',Now);
            //DecodeTime(Now,iHour,iMinute,iSecond,iMSecond);
            strFile:=Format('%s\%s.txt',[strFolder,strFile]);
            WriteToText(strFile,'定位模式:'+strMode);
            WriteToText(strFile,'定位类型:'+strType);
            WriteToText(strFile,'纬度:'+strLatitude);
            WriteToText(strFile,'经度:'+strLongitude);
            WriteToText(strFile,'高度:'+strAltitude);
            WriteToText(strFile,'地面速度:'+strSpeed);
            WriteToText(strFile,'地面方向:'+strCourse);
            WriteToText(strFile,'使用卫星数:'+strNumber);
            WriteToText(strFile,'世界时间日期:'+strGPStime);
            WriteToText(strFile,'本地时间日期:'+strLocaltime);
            for j := 0 to 11 do
            begin
                strTemp:=Format('卫星编号:%s,信噪比:%s,方位角:%s,仰角:%s',[strSv[j],strNo[j],strAz[iIndex],strEi[iIndex]]);
                WriteToText(strFile,'本地时间日期:'+strTemp);
            end;
        end;
    end;
end;
procedure TfrmGPSTestMain.btnStartTestClick(Sender: TObject);
begin
  inherited;
    StartTest(1);
    StartTest(2);
    StartTest(3);
    StartTest(4);
end;

{procedure TfrmGPSTestMain.tmrCountdown_1Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=1;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;}
procedure TfrmGPSTestMain.tmrCountdown_2Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=2;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;
procedure TfrmGPSTestMain.tmrCountdown_3Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=3;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;
procedure TfrmGPSTestMain.tmrCountdown_4Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=4;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;

end;
procedure TfrmGPSTestMain.tmrCountdown_5Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=5;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;
procedure TfrmGPSTestMain.tmrCountdown_6Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=6;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;
//==================================================================//
procedure TfrmGPSTestMain.Comm_1ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    i,j:Integer;
    Count:Integer;
    strSendText:string;
    GpsDb:Integer;
begin
  inherited;
   try
      CommIndex:=1;
      if not SerialInfo[CommIndex].bAllowTest then  Exit;
      if strCmdCommKey[CommIndex]= 'AT' then
      begin
          if (pos('OK',StrCommRecText[CommIndex])>0) then
          begin
              SendToComm(CommIndex);
              SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
          end
          else
              Exit;
      end
      else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
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
          for i:=0 to strTotal[CommIndex].Count-2 do
          begin
              try
                  if Pos('GPGGA',strTotal[CommIndex][i])>0 then
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
                  if Pos('GPRMC',strTotal[CommIndex][i])>0 then
                  begin
                      strGPRMC[CommIndex].Delimiter:=',';
                      strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
                      funcGPRMC(CommIndex,strGPRMC[CommIndex]);
                  end;
                  if (strFixMode[CommIndex]='3D定位') then
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];
                      Count:=0;
                      if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
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


                              if GpsDb >=GPSTestParam.GPSDb then
                              begin
                                  Count:=Count+1;
                              end;
                              strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                          end;
                          if Count>=GPSTestParam.GPSNumbers then
                          begin
                                //TTimer(FindComponent('tmrCommTimeOut_'+inttostr(CommIndex))).Enabled:=False;

                                strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s',[strChipRid[CommIndex],strFixMode[CommIndex],strSendText]);
                                SendToServer(CommIndex,'UpdateGpsTcData',strSendText,true,CTimeOut*2);
                                SetResult(CommIndex,1);
                                funcLabelRed(CommIndex);
                                Exit;
                          end;

                      end;
                  end
                  else
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
                  end;
              except
                      on EStringListError do Sleep(1);
              end;

          end;
      end
      else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
      else
      begin
          //SendToComm(CommIndex);
      end;
   except
        on EConvertError do Sleep(1);
   end;
end;
procedure TfrmGPSTestMain.Comm_2ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    i,j:Integer;
    Count:Integer;
    strSendText:string;
    GpsDb:Integer;
begin
  inherited;
   try
      CommIndex:=2;
      if not SerialInfo[CommIndex].bAllowTest then  Exit;
      if strCmdCommKey[CommIndex]= 'AT' then
      begin
          if (pos('OK',StrCommRecText[CommIndex])>0) then
          begin
              SendToComm(CommIndex);
              SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
          end
          else
              Exit;
      end
      else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
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
          for i:=0 to strTotal[CommIndex].Count-2 do
          begin
              try
                  if Pos('GPGGA',strTotal[CommIndex][i])>0 then
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
                  if Pos('GPRMC',strTotal[CommIndex][i])>0 then
                  begin
                      strGPRMC[CommIndex].Delimiter:=',';
                      strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
                      funcGPRMC(CommIndex,strGPRMC[CommIndex]);
                  end;
                  if (strFixMode[CommIndex]='3D定位') then
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];
                      Count:=0;
                      if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
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


                              if GpsDb >=GPSTestParam.GPSDb then
                              begin
                                  Count:=Count+1;
                              end;
                              strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                          end;
                          if Count>=GPSTestParam.GPSNumbers then
                          begin
                                //TTimer(FindComponent('tmrCommTimeOut_'+inttostr(CommIndex))).Enabled:=False;
                                strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s',[strChipRid[CommIndex],strFixMode[CommIndex],strSendText]);
                                SendToServer(CommIndex,'UpdateGpsTcData',strSendText,True,CTimeOut*2);
                                SetResult(CommIndex,1);
                                funcLabelRed(CommIndex);
                                Exit;
                          end;

                      end;
                  end
                  else
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
                  end;
              except
                      on EStringListError do Sleep(1);
              end;

          end;
      end
      else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
      else
      begin
          //SendToComm(CommIndex);
      end;
   except
        on EConvertError do Sleep(1);
   end;
end;
procedure TfrmGPSTestMain.Comm_3ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    i,j:Integer;
    Count:Integer;
    strSendText:string;
    GpsDb:Integer;
begin
  inherited;
   try
      CommIndex:=3;
      if not SerialInfo[CommIndex].bAllowTest then  Exit;
      if strCmdCommKey[CommIndex]= 'AT' then
      begin
          if (pos('OK',StrCommRecText[CommIndex])>0) then
          begin
              SendToComm(CommIndex);
              SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
          end
          else
              Exit;
      end
      else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
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
          for i:=0 to strTotal[CommIndex].Count-2 do
          begin
              try
                  if Pos('GPGGA',strTotal[CommIndex][i])>0 then
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
                  if Pos('GPRMC',strTotal[CommIndex][i])>0 then
                  begin
                      strGPRMC[CommIndex].Delimiter:=',';
                      strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
                      funcGPRMC(CommIndex,strGPRMC[CommIndex]);
                  end;
                  if (strFixMode[CommIndex]='3D定位') then
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];
                      Count:=0;
                      if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
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


                              if GpsDb >=GPSTestParam.GPSDb then
                              begin
                                  Count:=Count+1;
                              end;
                              strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                          end;
                          if Count>=GPSTestParam.GPSNumbers then
                          begin
                                //TTimer(FindComponent('tmrCommTimeOut_'+inttostr(CommIndex))).Enabled:=False;
                                strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s',[strChipRid[CommIndex],strFixMode[CommIndex],strSendText]);
                                SendToServer(CommIndex,'UpdateGpsTcData',strSendText,True,CTimeOut*2);
                                SetResult(CommIndex,1);
                                funcLabelRed(CommIndex);
                                Exit;
                          end;

                      end;
                  end
                  else
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
                  end;
              except
                      on EStringListError do Sleep(1);
              end;

          end;
      end
      else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
      else
      begin
          //SendToComm(CommIndex);
      end;
   except
        on EConvertError do Sleep(1);
   end;
end;
procedure TfrmGPSTestMain.Comm_4ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    i,j:Integer;
    Count:Integer;
    strSendText:string;
    GpsDb:Integer;
begin
  inherited;
   try
      CommIndex:=4;
      if not SerialInfo[CommIndex].bAllowTest then  Exit;
      if strCmdCommKey[CommIndex]= 'AT' then
      begin
          if (pos('OK',StrCommRecText[CommIndex])>0) then
          begin
              SendToComm(CommIndex);
              SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
          end
          else
              Exit;
      end
      else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
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
          for i:=0 to strTotal[CommIndex].Count-2 do
          begin
              try
                  if Pos('GPGGA',strTotal[CommIndex][i])>0 then
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
                  if Pos('GPRMC',strTotal[CommIndex][i])>0 then
                  begin
                      strGPRMC[CommIndex].Delimiter:=',';
                      strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
                      funcGPRMC(CommIndex,strGPRMC[CommIndex]);
                  end;
                  if (strFixMode[CommIndex]='3D定位') then
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];
                      Count:=0;
                      if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
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


                              if GpsDb >=GPSTestParam.GPSDb then
                              begin
                                  Count:=Count+1;
                              end;
                              strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                          end;
                          if Count>=GPSTestParam.GPSNumbers then
                          begin
                                //TTimer(FindComponent('tmrCommTimeOut_'+inttostr(CommIndex))).Enabled:=False;
                                strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s',[strChipRid[CommIndex],strFixMode[CommIndex],strSendText]);
                                SendToServer(CommIndex,'UpdateGpsTcData',strSendText,True,CTimeOut*2);
                                SetResult(CommIndex,1);
                                funcLabelRed(CommIndex);
                                Exit;
                          end;

                      end;
                  end
                  else
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
                  end;
              except
                      on EStringListError do Sleep(1);
              end;

          end;
      end
      else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
      else
      begin
          //SendToComm(CommIndex);
      end;
   except
        on EConvertError do Sleep(1);
   end;
end;
procedure TfrmGPSTestMain.Comm_5ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    i,j:Integer;
    Count:Integer;
    strSendText:string;
    GpsDb:Integer;
begin
  inherited;
   try
      CommIndex:=5;
      if not SerialInfo[CommIndex].bAllowTest then  Exit;
      if strCmdCommKey[CommIndex]= 'AT' then
      begin
          if (pos('OK',StrCommRecText[CommIndex])>0) then
          begin
              SendToComm(CommIndex);
              SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
          end
          else
              Exit;
      end
      else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
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
          for i:=0 to strTotal[CommIndex].Count-2 do
          begin
              try
                  if Pos('GPGGA',strTotal[CommIndex][i])>0 then
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
                  if Pos('GPRMC',strTotal[CommIndex][i])>0 then
                  begin
                      strGPRMC[CommIndex].Delimiter:=',';
                      strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
                      funcGPRMC(CommIndex,strGPRMC[CommIndex]);
                  end;
                  if (strFixMode[CommIndex]='3D定位') then
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];
                      Count:=0;
                      if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
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


                              if GpsDb >=GPSTestParam.GPSDb then
                              begin
                                  Count:=Count+1;
                              end;
                              strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                          end;
                          if Count>=GPSTestParam.GPSNumbers then
                          begin
                                //TTimer(FindComponent('tmrCommTimeOut_'+inttostr(CommIndex))).Enabled:=False;
                                strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s',[strChipRid[CommIndex],strFixMode[CommIndex],strSendText]);
                                SendToServer(CommIndex,'UpdateGpsTcData',strSendText,True,CTimeOut*2);
                                SetResult(CommIndex,1);
                                funcLabelRed(CommIndex);
                                Exit;
                          end;

                      end;
                  end
                  else
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
                  end;
              except
                      on EStringListError do Sleep(1);
              end;

          end;
      end
      else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
      else
      begin
          //SendToComm(CommIndex);
      end;
   except
        on EConvertError do Sleep(1);
   end;
end;

procedure TfrmGPSTestMain.Comm_6ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    i,j:Integer;
    Count:Integer;
    strSendText:string;
    GpsDb:Integer;
begin
  inherited;
   try
      CommIndex:=6;
      if not SerialInfo[CommIndex].bAllowTest then  Exit;
      if strCmdCommKey[CommIndex]= 'AT' then
      begin
          if (pos('OK',StrCommRecText[CommIndex])>0) then
          begin
              SendToComm(CommIndex);
              SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
          end
          else
              Exit;
      end
      else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
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
          for i:=0 to strTotal[CommIndex].Count-2 do
          begin
              try
                  if Pos('GPGGA',strTotal[CommIndex][i])>0 then
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
                  if Pos('GPRMC',strTotal[CommIndex][i])>0 then
                  begin
                      strGPRMC[CommIndex].Delimiter:=',';
                      strGPRMC[CommIndex].DelimitedText:=strTotal[CommIndex][i];
                      funcGPRMC(CommIndex,strGPRMC[CommIndex]);
                  end;
                  if (strFixMode[CommIndex]='3D定位') then
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][0];
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][1];
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][2];
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:=strGGAResult[CommIndex][3];
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][0];
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][1];
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][2];
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:=strRMCResult[CommIndex][3];
                      Count:=0;
                      if StrToInt(strGGAResult[CommIndex][3])>=GPSTestParam.GPSNumbers then
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


                              if GpsDb >=GPSTestParam.GPSDb then
                              begin
                                  Count:=Count+1;
                              end;
                              strSendText:=Format('%s#GpsDb_%d=%d',[strSendText,j,GpsDb]);
                          end;
                          if Count>=GPSTestParam.GPSNumbers then
                          begin
                                //TTimer(FindComponent('tmrCommTimeOut_'+inttostr(CommIndex))).Enabled:=False;
                                strSendText:=Format('Action=UpdateGpsTcData#Rid=%s#FixMode=%s%s',[strChipRid[CommIndex],strFixMode[CommIndex],strSendText]);
                                SendToServer(CommIndex,'UpdateGpsTcData',strSendText,True,CTimeOut*2);
                                SetResult(CommIndex,1);
                                funcLabelRed(CommIndex);
                                Exit;
                          end;

                      end;
                  end
                  else
                  begin
                      TEdit(FindComponent('EdtLatitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLongitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtAltitude_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtNumber_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtSpeed_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtCourse_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtGPStime_'+inttostr(CommIndex))).Text:='';
                      TEdit(FindComponent('EdtLocaltime_'+inttostr(CommIndex))).Text:='';
                  end;
              except
                      on EStringListError do Sleep(1);
              end;

          end;
      end
      else if (strCmdCommKey[CommIndex]= 'ATID') or (strCmdCommKey[CommIndex]= 'ATVERSION') then
      else
      begin
          //SendToComm(CommIndex);
      end;
   except
        on EConvertError do Sleep(1);
   end;
end;

{procedure TfrmGPSTestMain.tmrCommTimeOut_1Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=1;
    SetResult(CommIndex,0);
end;
procedure TfrmGPSTestMain.tmrCommTimeOut_2Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=2;
    SetResult(CommIndex,0);
end;
procedure TfrmGPSTestMain.tmrCommTimeOut_3Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=3;
    SetResult(CommIndex,0);
end;
procedure TfrmGPSTestMain.tmrCommTimeOut_4Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=4;
    SetResult(CommIndex,0);
end;
procedure TfrmGPSTestMain.tmrRecCommTimeOut_5Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=5;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;

end;

procedure TfrmGPSTestMain.tmrRecCommTimeOut_6Timer(Sender: TObject);
var
    CommIndex:Integer;
begin
    CommIndex:=6;
    TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
    CountDown[CommIndex]:=CountDown[CommIndex]-1;
    if CountDown[CommIndex]<=0 then
    begin
        SetResult(CommIndex,0);
    end
    else
    begin
        SetResult(CommIndex,-1);
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=True;
    end;

end;}

//==================================================================//
procedure TfrmGPSTestmain.funcGPGSA(CommIndex:Integer;GPGSA_Data:TStringList);
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
    end;
end;
procedure TfrmGPSTestmain.funcGPGSV(CommIndex:Integer;GPGSV_Data:TStringList);
label RunSection;
var
    intTotalSentence,intSentence,intNumber,i:Integer;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_0')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_0')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_1')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_1')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_2')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_2')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_3')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_3')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_4')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_4')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_5')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_5')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_6')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_6')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_7')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_7')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_8')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_8')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_9')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_9')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_10')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_10')).Visible:=False;
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
                        TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_11')).Visible:=False;
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

                    TShape(FindComponent('shpCom'+inttostr(CommIndex)+'_11')).Visible:=False;
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

        {case intTotalSentence of
            1:
            begin
                for i := 4 to 11 do
                begin
                    TShape(FindComponent('shpCom1_'+inttostr(i))).Visible:=False;
                    TLabel(FindComponent('lblCom1No_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1Sv_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1Ei_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1Az_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1No_'+inttostr(i))).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Sv_'+inttostr(i))).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Ei_'+inttostr(i))).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_'+inttostr(i))).Color:=clBlack;
                end;
            end;
            2:
            begin
                for i := 8 to 11 do
                begin
                    TShape(FindComponent('shpCom1_'+inttostr(i))).Visible:=False;
                    TLabel(FindComponent('lblCom1No_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1Sv_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1Ei_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1Az_'+inttostr(i))).Caption:='';
                    TLabel(FindComponent('lblCom1No_'+inttostr(i))).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Sv_'+inttostr(i))).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Ei_'+inttostr(i))).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_'+inttostr(i))).Color:=clBlack;
                end;

            end;
        end;}

    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
    end;
    //strGPGSV.Free;
end;




procedure TfrmGPSTestmain.funcGPGGA(CommIndex:Integer;GPGGA_Data:TStringList);
var
    strNumber:string;
begin
    try
    begin
        If (Trim(GPGGA_Data[2]) <> '') and (IsNumberic(Trim(GPGGA_Data[2])))  then
            strGGAResult[CommIndex].Add(GPGGA_Data[3] +' '+ LeftStr(GPGGA_Data[2], 2) + RightStr(Format('%.6f°',[StrToFloat(RightStr(GPGGA_Data[2], 7)) / 60]),9) );
        If (Trim(GPGGA_Data[4]) <> '') And (IsNumberic(Trim(GPGGA_Data[4]))) Then
            strGGAResult[CommIndex].Add(GPGGA_Data[5] +' ' + LeftStr(GPGGA_Data[4], 3) + RightStr(Format('%.6f°',[StrToFloat(RightStr(GPGGA_Data[4], 7)) / 60]),9)) ;
        If Trim(GPGGA_Data[10]) <> '' Then
            strGGAResult[CommIndex].Add(GPGGA_Data[9] +' ' + LowerCase(GPGGA_Data[10]));
        strNumber:= Format('%s',[GPGGA_Data[7]]);
        if strNumber='' then strNumber:='0';
        strGGAResult[CommIndex].Add(strNumber);
    end
    except
        on EStringListError do Sleep(1);
        on EConvertError do Sleep(1);
    end;
end;
procedure TfrmGPSTestmain.funcGPRMC(CommIndex:Integer;GPRMC_Data:TStringList);
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
        strGPStime:=RightStr(GPRMC_Data[9],2)+MidStr(GPRMC_Data[9],3,2)+LeftStr(GPRMC_Data[9],2);
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
    end;
end;
//==================================================================//

procedure TfrmGPSTestMain.StartTest(CommIndex:Integer);
begin
    strPlanName:='GPSTest';

    InitAllControl(CommIndex);
    BeginTest(CommIndex);
end;


procedure TfrmGPSTestMain.Button1Click(Sender: TObject);
var
    CommIndex:Integer;
begin
  inherited;
    for CommIndex:=1 to 6 do
    begin
        //StartComm(CommIndex);
        SerialInfo[CommIndex].bAllowTest:=True;
        SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);

    end;

end;

procedure TfrmGPSTestMain.funcLabelRed(CommIndex: Integer);
var
   CompareValue,count,sv_Value: Integer;
   lblComName,shpComName: string;
begin
   if LR_GPGSV_Data[CommIndex].Count <= 0 then exit;
   LR_GPGSV_Data[CommIndex].Sort;
   CompareValue := StrToInt(LR_GPGSV_Data[CommIndex][LR_GPGSV_Data[CommIndex].Count - 3]);
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
        if sv_Value > CompareValue then
        begin
           TLabel(FindComponent(lblComName)).Transparent := True;
           TShape(FindComponent(shpComName)).Visible := True;
//           TShape(FindComponent(shpComName)).SendToBack;
        end
        else
        begin
           TLabel(FindComponent(lblComName)).Transparent := False;
           TShape(FindComponent(shpComName)).Visible := False;
        end;
      end;
   end;

end;

end.
