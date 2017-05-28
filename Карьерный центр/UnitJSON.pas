unit UnitJSON;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, superobject, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFormJSON = class(TForm)
    img1: TImage;
    mmo1: TMemo;
    edt1: TEdit;
    idtcpclnt1: TIdTCPClient;
    procedure FormActivate(Sender: TObject);
    procedure idtcpclnt1Connected(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormJSON: TFormJSON;
    JsonObject: ISuperObject;
    JsonStream: TStringStream;
        i,  Cnt, Id: integer;

implementation

{$R *.dfm}

procedure TFormJSON.FormActivate(Sender: TObject);
begin

JsonStream := TStringStream.Create(mmo1.Lines.Text);
//JsonObject := SO(UTF8Decode(StringReplace(JsonStream.DataString,'\n', '\r\n', [rfReplaceAll, rfIgnoreCase])));
//JsonObject:=SO(UTF8Decode(JsonStream.DataString));
//JsonObject:= SO(mmo1.Lines.Text);
//JsonObject:= TSuperObject.ParseStream(JsonStream,False,True);
mmo1.Lines.Clear;
mmo1.Lines.Add(JsonStream.DataString);
//ShowMessage(JsonStream.DataString);
//mmo1.Lines.Add(Utf8ToAnsi(JsonObject.AsJSon(True,False)));
{
HttpCli.SendStream := JsonStream;
    HttpCli.SendStream.Write(JsonStream.datastring, JsonStream.Size);
    HttpCli.SendStream.Seek(0, 0);
    HttpCli.RcvdStream := TMemoryStream.Create;
    HttpCli.URL := Trim('http://127.0.0.1');
    HttpCli.PostAsync;   }
end;

procedure TFormJSON.idtcpclnt1Connected(Sender: TObject);
begin
ShowMessage(idtcpclnt1.Readln);
end;

end.
