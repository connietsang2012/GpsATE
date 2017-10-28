unit uLongWaitTrd;
 
interface
 
uses
  Classes,Windows,Messages,SyncObjs;
 
type
  TLongWaitTrd = class(TThread)
  private
    FMainWin:THandle;
    QuitEvent: TEvent;
    procedure  SendFeedBackToMainWin();
    procedure  DoTheHardWork();

  protected
    procedure Execute; override;
  public
    constructor  Create(CreateSuspended: Boolean);
    destructor   Destroy; override;
    function  ExitLongWaitTrd():Boolean;
  published
    property MainWin:THandle read FMainWin write FMainWin;
 
  end;
 
implementation
uses
    uClientMain;

 
constructor TLongWaitTrd.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
end;

destructor TLongWaitTrd.Destroy;
begin
  inherited;
end;
 
 
 
procedure TLongWaitTrd.DoTheHardWork();
begin
    //to do 
end;
 
procedure TLongWaitTrd.Execute;
var  
  Msg: TMsg;
begin
  FreeOnTerminate:=True;
//1.长等待型线程示例
//  while GetMessage(Msg, 0, 0, 0) do  
//  begin
//     if (Msg.message=WM_USER+1000) then //任务来了
//     begin
//        DoTheHardWork();
//        SendFeedBackToMainWin;
//     end;
//     if (Msg.message=WM_QUIT) then
//     begin
//        QuitEvent.SetEvent;
//        Break;
//     end;
//  end;
//2.长工作型线程示例
//   while(true) do
//   begin
//     if  PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
//     begin
//        if (Msg.message=WM_QUIT) then
//        begin
//          QuitEvent.SetEvent;
//          Break;
//        end;
//     end;
//     DoTheHardWork();
//   end;
    
end;
 
function TLongWaitTrd.ExitLongWaitTrd;
begin
  Result:=true;
  QuitEvent:=TEvent.Create(nil,True,False,'QuitEvent');
  PostThreadMessage(ThreadID,WM_QUIT,0,0);
  if  (QuitEvent.WaitFor(2000)=wrTimeOut) then
       Result:=false;
 
  QuitEvent.Free ;
    
end;
 
procedure TLongWaitTrd.SendFeedBackToMainWin();
var
  Status:String;
begin
   if (MainWin<>0) then
   begin
     Status:='The data has been processed by thread.';
     PostMessage(MainWin,WM_USER+2000,0,Integer(Status))
   end;
    
end;
 
end.
 