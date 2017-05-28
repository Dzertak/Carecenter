unit UnitServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdSocketHandle, IdBaseComponent, IdComponent, IdTCPServer, jpeg,
  ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    idtcpsrvr1: TIdTCPServer;
    mmo1: TMemo;
    img1: TImage;

    procedure FormCreate(Sender: TObject);
    procedure idtcpsrvr1Execute(AThread: TIdPeerThread);
    procedure idtcpsrvr1Connect(AThread: TIdPeerThread);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  IdSocketHandle: TIdSocketHandle;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
IdSocketHandle.IP:='10.75.5.59';
//IdSocketHandle.Port:=8080;
idtcpsrvr1.Active:=True;

end;

procedure TForm1.idtcpsrvr1Execute(AThread: TIdPeerThread);
begin
//AThread.Connection.Writeln('Это сообщение сервера');
end;

procedure TForm1.idtcpsrvr1Connect(AThread: TIdPeerThread);
begin
 ShowMessage('Hi');
end;

end.
