unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TFormMain = class(TForm)
    img1: TImage;
    imgEmploy: TImage;
    imgStudents: TImage;
    imgContrakt: TImage;
    imgArchive: TImage;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure imgStudentsClick(Sender: TObject);
    procedure imgEmployClick(Sender: TObject);
    procedure imgContraktClick(Sender: TObject);

  private

  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitStart, UnitDataModule, DB, UnitStudents, UnitRabotodatel,
  UnitContract;

{$R *.dfm}

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FormStart.close;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  lbl1.Font.Color:= RGB(250, 189, 61);
{DataModule1.qryMain.Active:=False;
   DataModule1.qryMain.SQL.Clear;
   DataModule1.qryMain.SQL.Text:='Select Count(���_��������) as C From �����_��������� Where ������������=true';
   DataModule1.qryMain.ExecSQL;
   DataModule1.qryMain.Active:=True;        }


  //lbl1.Caption:='��������������: '+DataModule1.qryMain.FieldValues['C'];
end;

procedure TFormMain.imgStudentsClick(Sender: TObject);
begin
FormStudents.show;
end;

procedure TFormMain.imgEmployClick(Sender: TObject);
begin
FormRabotodateli.Show;
end;

procedure TFormMain.imgContraktClick(Sender: TObject);
begin
FormContract.show;
end;

end.
