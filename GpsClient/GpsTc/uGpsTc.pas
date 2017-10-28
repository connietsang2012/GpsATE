unit uGpsTc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SPComm, WinSkinStore, WinSkinData, StdCtrls, ExtCtrls,StrUtils,uGlobalVar;

type
  TfrmGpsTcMain = class(TForm)
    pnlGpsTc: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    pnl1: TPanel;
    img1: TImage;
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
    cbbCom: TComboBox;
    btnStart_0: TButton;
    mmoMessage_0: TMemo;
    EdtModeResult_0: TEdit;
    EdtTypeResult_0: TEdit;
    EdtLatitude_0: TEdit;
    EdtLongitude_0: TEdit;
    EdtAltitude_0: TEdit;
    EdtSpeed_0: TEdit;
    EdtCourse_0: TEdit;
    EdtNumber_0: TEdit;
    EdtGPStime_0: TEdit;
    EdtLocaltime_0: TEdit;
    Comm_1: TComm;
    tmrrectimeout: TTimer;
    //==================================================================//
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    //==================================================================//
    procedure btnStart_0Click(Sender: TObject);
    procedure Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);

  private
    { Private declarations }
    //==================================================================//
    procedure funcGPGSA(GPGSA_Data:TStringList);
    procedure funcGPGSV(GPGSV_Data:TStringList);
    procedure funcGPGGA(GPGGA_Data:TStringList);
    procedure funcGPRMC(GPRMC_Data:TStringList);

  public
    { Public declarations }
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
    frmGpsTcMain: TfrmGpsTcMain;
    strFixNumber:array[0..11] of string;
    strTotal,strGPGSA,strGPGSV,strGPRMC,strGPGGA,strRMCResult,strGGAResult: TStringList;
    strOperatingMode,strFixMode:string;


implementation
uses
    uPublicFunc;
{$R *.dfm}
//==================================================================//
//==================================================================//
procedure TfrmGpsTcMain.funcGPGSA(GPGSA_Data:TStringList);
var
    i:Integer;
begin
    try
        if GPGSA_Data[1]='A' then
            strOperatingMode:=AUTO_STRING
        else if GPGSA_Data[1]='M' then
            strOperatingMode:=MAU_STRING
        else
            strOperatingMode:=UNKNOWN_STRING;

        if GPGSA_Data[2]='1' then
            strFixMode:=FIXNO_STRING
        else if GPGSA_Data[2]='2' then
            strFixMode:=FIX2D_STRING
        else if GPGSA_Data[2]='3' then
            strFixMode:=FIX3D_STRING
        else
            strFixMode:=UNKNOWN_STRING;

        for i := 0 to 11 do
        begin
            strFixNumber[i]:=Format('%s',[GPGSA_Data[3+i]]);
            if strFixNumber[i]='' then strFixNumber[i]:='0';
        end;
    except
        on EStringListError do Sleep(1);
    end;
end;
procedure TfrmGpsTcMain.funcGPGSV(GPGSV_Data:TStringList);
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
                    strNo:=Format('%s',[strGPGSV[7]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_0')).Caption:='0';
                        TShape(FindComponent('shpCom1_0')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_0')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_0')).Visible:=True;
                        TShape(FindComponent('shpCom1_0')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_0')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[4]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_0')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[5]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_0')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[6]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_0')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_0')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_0')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_0')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_0')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_0')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_0')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_0')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_0')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_0')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_0')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_0')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_0')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_0')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_0')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_0')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_0')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_0')).Caption:='';
                    TLabel(FindComponent('lblCom1No_0')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_0')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_0')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_0')).Color:=clBlack;
                end;
                if intNumber>1 then
                begin
                    strNo:=Format('%s',[strGPGSV[11]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_1')).Caption:='0';
                        TShape(FindComponent('shpCom1_1')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_1')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_1')).Visible:=True;
                        TShape(FindComponent('shpCom1_1')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_1')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[8]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_1')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[9]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_1')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[10]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_1')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_1')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_1')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_1')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_1')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_1')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_1')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_1')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_1')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_1')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_1')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_1')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_1')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_1')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_1')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_1')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_1')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_1')).Caption:='';
                    TLabel(FindComponent('lblCom1No_1')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_1')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_1')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_1')).Color:=clBlack;
                end;
                if intNumber>2 then
                begin
                    strNo:=Format('%s',[strGPGSV[15]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_2')).Caption:='0';
                        TShape(FindComponent('shpCom1_2')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_2')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_2')).Visible:=True;
                        TShape(FindComponent('shpCom1_2')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_2')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[12]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_2')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[13]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_2')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[14]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_2')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_2')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_2')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_2')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_2')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_2')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_2')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_2')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_2')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_2')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_2')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_2')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_2')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_2')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_2')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_2')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_2')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_2')).Caption:='';
                    TLabel(FindComponent('lblCom1No_2')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_2')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_2')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_2')).Color:=clBlack;
                end;
                if intNumber>3 then
                begin
                    strNo:=Format('%s',[strGPGSV[19]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_3')).Caption:='0';
                        TShape(FindComponent('shpCom1_3')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_3')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_3')).Visible:=True;
                        TShape(FindComponent('shpCom1_3')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_3')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[16]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_3')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[17]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_3')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[18]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_3')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_3')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_3')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_3')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_3')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_3')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_3')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_3')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_3')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_3')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_3')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_3')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_3')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_3')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_3')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_3')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_3')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_3')).Caption:='';
                    TLabel(FindComponent('lblCom1No_3')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_3')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_3')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_3')).Color:=clBlack;
                end;
            end;
            2:
            begin
                if intNumber>4 then
                begin
                    strNo:=Format('%s',[strGPGSV[7]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_4')).Caption:='0';
                        TShape(FindComponent('shpCom1_4')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_4')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_4')).Visible:=True;
                        TShape(FindComponent('shpCom1_4')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_4')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[4]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_4')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[5]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_4')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[6]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_4')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_4')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_4')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_4')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_4')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_4')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_4')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_4')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_4')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_4')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_4')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_4')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_4')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_4')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_4')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_4')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_4')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_4')).Caption:='';
                    TLabel(FindComponent('lblCom1No_4')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_4')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_4')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_4')).Color:=clBlack;
                end;
                if intNumber>5 then
                begin
                    strNo:=Format('%s',[strGPGSV[11]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_5')).Caption:='0';
                        TShape(FindComponent('shpCom1_5')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_5')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_5')).Visible:=True;
                        TShape(FindComponent('shpCom1_5')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_5')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[8]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_5')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[9]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_5')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[10]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_5')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_5')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_5')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_5')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_5')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_5')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_5')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_5')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_5')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_5')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_5')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_5')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_5')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_5')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_5')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_5')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_5')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_5')).Caption:='';
                    TLabel(FindComponent('lblCom1No_5')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_5')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_5')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_5')).Color:=clBlack;
                end;
                if intNumber>6 then
                begin
                    strNo:=Format('%s',[strGPGSV[15]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_6')).Caption:='0';
                        TShape(FindComponent('shpCom1_6')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_6')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_6')).Visible:=True;
                        TShape(FindComponent('shpCom1_6')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_6')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[12]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_6')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[13]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_6')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[14]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_6')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_6')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_6')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_6')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_6')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_6')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_6')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_6')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_6')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_6')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_6')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_6')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_6')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_6')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_6')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_6')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_6')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_6')).Caption:='';
                    TLabel(FindComponent('lblCom1No_6')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_6')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_6')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_6')).Color:=clBlack;
                end;
                if intNumber>7 then
                begin
                    strNo:=Format('%s',[strGPGSV[19]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_7')).Caption:='0';
                        TShape(FindComponent('shpCom1_7')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_7')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_7')).Visible:=True;
                        TShape(FindComponent('shpCom1_7')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_7')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[16]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_7')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[17]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_7')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[18]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_7')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_7')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_7')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_7')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_7')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_7')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_7')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_7')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_7')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_7')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_7')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_7')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_7')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_7')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_7')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_7')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_7')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_7')).Caption:='';
                    TLabel(FindComponent('lblCom1No_7')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_7')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_7')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_7')).Color:=clBlack;
                end;
            end;
            3:
            begin
                if intNumber>8 then
                begin
                    strNo:=Format('%s',[strGPGSV[7]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_8')).Caption:='0';
                        TShape(FindComponent('shpCom1_8')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_8')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_8')).Visible:=True;
                        TShape(FindComponent('shpCom1_8')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_8')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[4]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_8')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[5]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_8')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[6]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_8')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_8')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_8')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_8')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_8')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_8')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_8')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_8')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_8')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_8')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_8')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_8')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_8')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_8')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_8')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_8')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_8')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_8')).Caption:='';
                    TLabel(FindComponent('lblCom1No_8')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_8')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_8')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_8')).Color:=clBlack;
                end;
                if intNumber>9 then
                begin
                    strNo:=Format('%s',[strGPGSV[11]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_9')).Caption:='0';
                        TShape(FindComponent('shpCom1_9')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_9')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_9')).Visible:=True;
                        TShape(FindComponent('shpCom1_9')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_9')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[8]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_9')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[9]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_9')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[10]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_9')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_9')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_9')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_9')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_9')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_9')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_9')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_9')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_9')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_9')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_9')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_9')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_9')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_9')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_9')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_9')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_9')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_9')).Caption:='';
                    TLabel(FindComponent('lblCom1No_9')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_9')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_9')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_9')).Color:=clBlack;
                end;
                if intNumber>10 then
                begin
                    strNo:=Format('%s',[strGPGSV[15]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_10')).Caption:='0';
                        TShape(FindComponent('shpCom1_10')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_10')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_10')).Visible:=True;
                        TShape(FindComponent('shpCom1_10')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_10')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[12]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_10')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[13]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_10')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[14]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_10')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_10')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_10')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_10')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_10')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_10')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_10')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_10')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_10')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_10')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_10')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_10')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_10')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_10')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_10')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_10')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_10')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_10')).Caption:='';
                    TLabel(FindComponent('lblCom1No_10')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_10')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_10')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_10')).Color:=clBlack;
                end;
                if intNumber>11 then
                begin
                    strNo:=Format('%s',[strGPGSV[19]]);
                    if (LeftStr(strNo,1)='*') or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_11')).Caption:='0';
                        TShape(FindComponent('shpCom1_11')).Visible:=False;
                    end
                    else
                    begin
                        if (pos('*',strNo)>0) then strNo:=LeftStr(strNo,pos('*',strNo)-1);
                        TLabel(FindComponent('lblCom1No_11')).Caption:=strNo;
                        TShape(FindComponent('shpCom1_11')).Visible:=True;
                        TShape(FindComponent('shpCom1_11')).Top:=Round(TOP_COUNT - HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                        TShape(FindComponent('shpCom1_11')).Height:=Round(HEIGHT_COUNT * (StrToInt(strNo) / 5.0));
                    end;
                    strSv:=Format('%s',[strGPGSV[16]]);
                    if Trim(strSv)='' then strSv:='0';
                    TLabel(FindComponent('lblCom1SV_11')).Caption:=strSv;
                    strEi:=Format('%s',[strGPGSV[17]]);
                    if Trim(strEi)='' then strEi:='0';
                    TLabel(FindComponent('lblCom1EI_11')).Caption:=strEi;
                    strAz:=Format('%s',[strGPGSV[18]]);
                    if Trim(strAz)='' then strAz:='0';
                    TLabel(FindComponent('lblCom1Az_11')).Caption:=strAz;
                    for i := 0 to 11 do
                    begin
                        if (strSv<>'0') and (strSv=strFixNumber[i]) then
                        begin
                            bolFix:=True;
                            Break;
                        end;
                    end;
                    if bolFix=True then
                    begin
                        TLabel(FindComponent('lblCom1No_11')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1SV_11')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1EI_11')).Color:=RGB(202, 255, 112);
                        TLabel(FindComponent('lblCom1Az_11')).Color:=RGB(202, 255, 112);
                        bolFix:=False;
                    end
                    else if (LeftStr(strNo,1)='*')  or (Trim(strNo)='') then
                    begin
                        TLabel(FindComponent('lblCom1No_11')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1SV_11')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1EI_11')).Color:=RGB(255, 105, 180);
                        TLabel(FindComponent('lblCom1Az_11')).Color:=RGB(255, 105, 180);
                    end
                    else
                    begin
                        TLabel(FindComponent('lblCom1No_11')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1SV_11')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1EI_11')).Color:=RGB(7, 192, 238);
                        TLabel(FindComponent('lblCom1Az_11')).Color:=RGB(7, 192, 238);
                    end;
                end
                else
                begin

                    TShape(FindComponent('shpCom1_11')).Visible:=False;
                    TLabel(FindComponent('lblCom1No_11')).Caption:='';
                    TLabel(FindComponent('lblCom1SV_11')).Caption:='';
                    TLabel(FindComponent('lblCom1EI_11')).Caption:='';
                    TLabel(FindComponent('lblCom1Az_11')).Caption:='';
                    TLabel(FindComponent('lblCom1No_11')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1SV_11')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1EI_11')).Color:=clBlack;
                    TLabel(FindComponent('lblCom1Az_11')).Color:=clBlack;
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
    end;
    //strGPGSV.Free;

end;

procedure TfrmGpsTcMain.funcGPGGA(GPGGA_Data:TStringList);
var
    strNumber:string;
begin
    try
    begin
        If (Trim(GPGGA_Data[2]) <> '') and (IsNumberic(Trim(GPGGA_Data[2])))  then
            strGGAResult.Add(GPGGA_Data[3] +' '+ LeftStr(GPGGA_Data[2], 2) + Format('%.6f°',[StrToFloat(RightStr(GPGGA_Data[2], 7)) / 60]) );
        If (Trim(GPGGA_Data[4]) <> '') And (IsNumberic(Trim(GPGGA_Data[4]))) Then
            strGGAResult.Add(GPGGA_Data[5] +' ' + LeftStr(GPGGA_Data[4], 3) + Format('%.6f°',[StrToFloat(RightStr(GPGGA_Data[4], 7)) / 60])) ;
        If Trim(GPGGA_Data[10]) <> '' Then
            strGGAResult.Add(GPGGA_Data[9] +' ' + LowerCase(GPGGA_Data[10]));
        strNumber:= Format('%s',[GPGGA_Data[7]]);
        if strNumber='' then strNumber:='0';
        strGGAResult.Add(strNumber);
    end
    except
        on EStringListError do Sleep(1);
    end;
end;
procedure TfrmGpsTcMain.funcGPRMC(GPRMC_Data:TStringList);
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
        strRMCResult.Add(strSpeed+' Km/H');
        strRMCResult.Add(strCourse+'°');

        Insert('-',strGPStime,3);
        Insert('-',strGPStime,6);
        dtGPStime1:=strtodate(strGPStime);
        strGPStimeTemp1:=FormatDateTime('YYYY/MM/DD',dtGPStime1);
        strGPStimeTemp2:=GPRMC_Data[1];
        Insert(':',strGPStimeTemp2,3);
        Insert(':',strGPStimeTemp2,6);
        dtGPStime2:=StrToTime(strGPStimeTemp2);
        strGPStimeTemp2:=FormatDateTime('HH:MM:SS',dtGPStime2);
        strRMCResult.Add(Format('%s %s',[strGPStimeTemp1,strGPStimeTemp2]));
        
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
        strRMCResult.Add(Format('%s %s',[strGPStimeTemp1,strGPStimeTemp2]));
    except
        on EStringListError do Sleep(1);
    end;
end;
//==================================================================//
//==================================================================//
procedure TfrmGpsTcMain.FormCreate(Sender: TObject);
var
    CommList: TStrings;
    iIndex,Count:Integer;
begin
    CommList:= TStringList.Create;
    if GetSysComm(CommList) then
    begin
        for Count:= 0 to CommList.Count - 1 do
            cbbCom.Items.Add(CommList[Count]);
        cbbCom.ItemIndex:=0;
    end;
    CommList.free;

    iIndex:=0;
    TMemo(FindComponent('txtMessage_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtModeResult_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtTypeResult_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtLatitude_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtLongitude_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtAltitude_'+inttostr(iIndex))).Text:='';
    TMemo(FindComponent('txtSpeed_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtCourse_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtNumber_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtGPStime_'+inttostr(iIndex))).Text:='';
    TEdit(FindComponent('txtLocaltime_'+inttostr(iIndex))).Text:='';

    //TImage(FindComponent('img'+inttostr(i))).Clear;
    for iIndex:= 0 to 11 do
    begin
        TShape(FindComponent('shpCom1_'+inttostr(iIndex))).Visible:=False;
        TLabel(FindComponent('lblCom1No_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom1SV_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom1Az_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom1EI_'+inttostr(iIndex))).Caption:='';
        TLabel(FindComponent('lblCom1No_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom1SV_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom1Az_'+inttostr(iIndex))).Font.Color:=clBlack;
        TLabel(FindComponent('lblCom1EI_'+inttostr(iIndex))).Font.Color:=clBlack;
    end;
end;

procedure TfrmGpsTcMain.btnStart_0Click(Sender: TObject);
var
    strComPort:string;
    iIndex,j,FileNumber:Integer;
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
  inherited;
    iIndex:=1;
    if TButton(FindComponent('btnStart_'+inttostr(iIndex))).Caption='连接' then
    begin
        TMemo(FindComponent('txtMessage_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtModeResult_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtTypeResult_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtLatitude_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtLongitude_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtAltitude_'+inttostr(iIndex))).Text:='';
        TMemo(FindComponent('txtSpeed_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtCourse_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtNumber_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtGPStime_'+inttostr(iIndex))).Text:='';
        TEdit(FindComponent('txtLocaltime_'+inttostr(iIndex))).Text:='';

        for j:= 0 to 11 do
        begin
            TShape(FindComponent('shpCom1_'+inttostr(j))).Visible:=False;
            TLabel(FindComponent('lblCom1No_'+inttostr(j))).Caption:='';
            TLabel(FindComponent('lblCom1SV_'+inttostr(j))).Caption:='';
            TLabel(FindComponent('lblCom1Az_'+inttostr(j))).Caption:='';
            TLabel(FindComponent('lblCom1EI_'+inttostr(j))).Caption:='';
            TLabel(FindComponent('lblCom1No_'+inttostr(j))).Font.Color:=clBlack;
            TLabel(FindComponent('lblCom1SV_'+inttostr(j))).Font.Color:=clBlack;
            TLabel(FindComponent('lblCom1Az_'+inttostr(j))).Font.Color:=clBlack;
            TLabel(FindComponent('lblCom1EI_'+inttostr(j))).Font.Color:=clBlack;
        end;
    end
    else if TButton(FindComponent('btnStart_'+inttostr(iIndex))).Caption='断开'  then
    begin
        cbbCom.Enabled:=True;
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
            strNo[j]:=TLabel(FindComponent('lblCom1No_'+inttostr(j))).Caption;
            strSv[j]:=TLabel(FindComponent('lblCom1SV_'+inttostr(j))).Caption;
            strAz[j]:=TLabel(FindComponent('lblCom1Az_'+inttostr(j))).Caption;
            strEi[j]:=TLabel(FindComponent('lblCom1EI_'+inttostr(j))).Caption;
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

procedure TfrmGpsTcMain.Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
var
    i,j:Integer;
    CommIndex:Integer;
begin
  inherited;
    CommIndex:=1;
    if strCmdCommKey[CommIndex]= 'ATVERSION' then
    begin
        SendToComm(CommIndex,'ATGPSTC','AT^GT_CM=GPSTC',True,CTimeOut*10);
    end
    else if strCmdCommKey[CommIndex]= 'ATGPSTC' then
    begin
                strTotal := TStringList.Create;
        strGPGSA := TStringList.Create;
        strGPGSV := TStringList.Create;
        strGPRMC := TStringList.Create;
        strGPGGA := TStringList.Create;
        strRMCResult := TStringList.Create;
        strGGAResult := TStringList.Create;
        strTotal.Clear;
        strGPGSA.Clear;
        strGPGSV.Clear;
        strGPRMC.Clear;
        strGPGGA.Clear;
        strRMCResult.Clear;
        strGGAResult.Clear;

        strTotal.Delimiter:='$';
        strTotal.DelimitedText:=StrCommRecText[CommIndex];
        for i:=0 to strTotal.Count-2 do
        begin
            try
                if Pos('GPGGA',strTotal[i])>0 then
                begin
                    strGPGGA.Delimiter:=',';
                    strGPGGA.DelimitedText:=strTotal[i];
                    funcGPGGA(strGPGGA);
                end;
                if Pos('GPGSA',strTotal[i])>0 then
                begin
                    strGPGSA.Delimiter:=',';
                    strGPGSA.DelimitedText:=strTotal[i];
                    funcGPGSA(strGPGSA);
                    if strFixMode='3D定位' then
                        EdtTypeResult_0.Color:=clLime
                    else
                        EdtTypeResult_0.Color:=clRed;
                    if strOperatingMode='自动' then
                        EdtModeResult_0.Color:=clLime
                    else
                        EdtModeResult_0.Color:=clRed;
                    EdtModeResult_0.Text:=strOperatingMode;
                    EdtTypeResult_0.Text:=strFixMode;
                end;
                if Pos('GPGSV',strTotal[i])>0 then
                begin
                    strGPGSV.Delimiter:=',';
                    strGPGSV.DelimitedText:=strTotal[i];
                    funcGPGSV(strGPGSV);
                end;
                if Pos('GPRMC',strTotal[i])>0 then
                begin
                    strGPRMC.Delimiter:=',';
                    strGPRMC.DelimitedText:=strTotal[i];
                    funcGPRMC(strGPRMC);
                end;
                if (strFixMode='2D定位') or (strFixMode='3D定位') then
                begin
                    EdtLatitude_0.Text:=strGGAResult[0];
                    EdtLongitude_0.Text:=strGGAResult[1];
                    EdtAltitude_0.Text:=strGGAResult[2];
                    EdtNumber_0.Text:=strGGAResult[3];
                    EdtSpeed_0.Text:=strRMCResult[0];
                    EdtCourse_0.Text:=strRMCResult[1];
                    EdtGPStime_0.Text:=strRMCResult[2];
                    EdtLocaltime_0.Text:=strRMCResult[3];
                end
                else
                begin
                    EdtLatitude_0.Text:='';
                    EdtLongitude_0.Text:='';
                    EdtAltitude_0.Text:='';
                    EdtNumber_0.Text:='';
                    EdtSpeed_0.Text:='';
                    EdtCourse_0.Text:='';
                    EdtGPStime_0.Text:='';
                    EdtLocaltime_0.Text:='';
                end;
                //if Length(mmoMessage_0.Text)>=65535 then
                //    mmoMessage_0.Text:='';

                //mmoMessage_0.Text:=mmoMessage_0 + strInBuffer;
                //mmoMessage_0.SelText:=Length(mmoMessage_0.Text);
                except
                    on EStringListError do Sleep(1);
                end;

            end;

        mmoMessage_0.Lines.Add(StrCommRecText[CommIndex]);
    end
    else if strCmdCommKey[CommIndex]= 'ATDRVTEST' then
    else
    begin
        SendToComm(CommIndex);
    end;
end;

procedure TfrmGpsTcMain.FormResize(Sender: TObject);
begin
    pnlGpsTc.Left:=Trunc((Self.Width - pnlGpsTc.Width)/2);
    pnlGpsTc.Top:= Trunc((self.Height - pnlGpsTc.Height) / 2);
end;


end.
