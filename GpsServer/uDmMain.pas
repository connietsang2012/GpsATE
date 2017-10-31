unit uDmMain;

interface

uses
  SysUtils, Classes, DB, ADODB,IniFiles, DBAccess, Uni, UniDacVcl, UniProvider, SQLServerUniProvider;

type
  TDMMain = class(TDataModule)
    UniConGpsTest: TUniConnection;
    UniConDGpsTest: TUniConnectDialog;
    SQLServerUniGpsTest: TSQLServerUniProvider;
    conConnGpsTest: TADOConnection;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure conConnGpsTestBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;

implementation

{$R *.dfm}

//uses uPublicFunc;
procedure TDMMain.DataModuleCreate(Sender: TObject);
var
    ParamFilename,SerIp:string;
    MyIniFile:Tinifile;
    sDBName : string;  //�����ļ��ж�ȡ���ݿ����� 2014.2.17
begin
    //���ļ���ȡ���� (TCP/��������/GPS����),��������ʾ���ؼ��ϡ�
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    MyIniFile:=Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        SerIp:=ReadString('DataBase', 'Ip','127.0.0.1');
        sDBName :=ReadString('DataBase', 'DBName','GPSTest'); //2014.2.17 
    end;
    MyIniFile.Free;

    //�����������ݿ�
    with UniConGpsTest do
    begin
        Disconnect;
        ProviderName:='SQL Server';
        Username:='sa';
        Password:='sa123ABC';
        Server:=SerIp;
        Database:= sDBName;
        try
          Connect;
        except
          on E:Exception do
          begin
              Sleep(1);
          end;
        end;
    end;
end;
procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
    UniConGpsTest.Disconnect;
end;
procedure TDMMain.conConnGpsTestBeforeConnect(Sender: TObject);
var
    ParamFilename:string;
    LoginUser,PassWd,SerIp:string;
    MyIniFile:Tinifile;
    sDBName : string;
begin
    //���ļ���ȡ���� (TCP/��������/GPS����),��������ʾ���ؼ��ϡ�
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    MyIniFile:=Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        SerIp:=ReadString('DataBase', 'Ip','127.0.0.1');
        sDBName :=ReadString('DataBase', 'DBName','GPSTest');
    end;
    MyIniFile.Free;

    LoginUser:='sa';
    PassWd:='sa123ABC';
    try
        conConnGpsTest.ConnectionString:='Provider=SQLOLEDB.1;Password='+PassWd
        										+ ';Persist Security Info=True;User ID='+LoginUser+';Initial Catalog='
                            + sDBName + ';Data Source='+SerIp;
    except
        on E:Exception do
        begin
            Sleep(1);
        end;
    end;
end;

end.
