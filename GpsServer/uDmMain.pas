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
    sDBName : string;  //配置文件中读取数据库名称 2014.2.17
begin
    //从文件读取参数 (TCP/基本设置/GPS设置),并将其显示各控件上。
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    MyIniFile:=Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        SerIp:=ReadString('DataBase', 'Ip','127.0.0.1');
        sDBName :=ReadString('DataBase', 'DBName','GPSTest'); //2014.2.17 
    end;
    MyIniFile.Free;

    //设置连接数据库
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
    //从文件读取参数 (TCP/基本设置/GPS设置),并将其显示各控件上。
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
