unit UnitRabotodatel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, StdCtrls,
  jpeg, GridsEh, DBGridEh, frxpngimage, ExtCtrls;

type
  TFormRabotodateli = class(TForm)
    img1: TImage;
    img4: TImage;
    img3: TImage;
    img5: TImage;
    edt1: TEdit;
    lbl1: TLabel;
    dbgrdh1: TDBGridEh;
    img6: TImage;
    img7: TImage;
    procedure edt1Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRabotodateli: TFormRabotodateli;

implementation

uses UnitDataModule, UnitVakansii, UnitAddRabotodatel;

{$R *.dfm}

procedure TFormRabotodateli.edt1Change(Sender: TObject);
begin
 with DataModule1.qryRabotodateli do
begin
Active:=False;
sql.Clear;
SQL.Add('Select * From Работодатели р');
SQL.Add(' Where р.Название LIKE ''%'+edt1.Text+'%'' OR р.Адрес LIKE ''%'+edt1.Text+'%'' OR р.Телефон LIKE ''%'+edt1.Text+'%''' );
SQL.Add('OR р.Имейл LIKE ''%'+edt1.Text+'%'' OR р.Имя_контактного_лица LIKE ''%'+edt1.Text+'%''');
//Active:=True;
//ExecSQL;
Open;
end;
end;

procedure TFormRabotodateli.btn2Click(Sender: TObject);
begin
FormVakansii.Show;
end;

procedure TFormRabotodateli.img4Click(Sender: TObject);
begin
FormAddRabotodatel.Show;
end;

procedure TFormRabotodateli.img7Click(Sender: TObject);
begin
FormVakansii.Show;
end;

end.
