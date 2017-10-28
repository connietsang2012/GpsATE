unit uClientSendThread;

interface

uses
  Classes,Forms,sysutils;

type
  tClientSend = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
uses
    uClientMain,uPublicFunc,uGlobalVar;

{ tClientSend }
//-----------------------------连接服务器的线程----------------------------//
procedure tClientSend.Execute;
begin
    while not Terminated  do
    begin
        Sleep(1);
        if not(frmClientMain.ClientSocket_0.Socket.Connected) then
        begin
            Sleep(100);
            ConnectServer(0,strTcpIp,StrToInt(strTcpPort));
            Sleep(100);
        end;
        if not(frmClientMain.ClientSocket_1.Socket.Connected) then
        begin
            Sleep(100);
            ConnectServer(1,strTcpIp,StrToInt(strTcpPort));
            Sleep(100);
        end;
        if not(frmClientMain.ClientSocket_2.Socket.Connected) then
        begin
            Sleep(100);
            ConnectServer(2,strTcpIp,StrToInt(strTcpPort));
            Sleep(100);
        end;
        if not(frmClientMain.ClientSocket_3.Socket.Connected) then
        begin
            Sleep(100);
            ConnectServer(3,strTcpIp,StrToInt(strTcpPort));
            Sleep(100);
        end;
        if not(frmClientMain.ClientSocket_4.Socket.Connected) then
        begin
            Sleep(100);
            ConnectServer(4,strTcpIp,StrToInt(strTcpPort));
            Sleep(100);
        end;
        Application.ProcessMessages;
    end;
    
end;

end.
