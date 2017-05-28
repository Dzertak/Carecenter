unit UnitVakansii;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh,
  DBGridEh, StdCtrls, jpeg, frxpngimage, ExtCtrls;

type
  TFormVakansii = class(TForm)
    dbgrdh1: TDBGridEh;
    img1: TImage;
    img4: TImage;
    img3: TImage;
    img5: TImage;
    edt1: TEdit;
    lbl1: TLabel;
    procedure edt1Change(Sender: TObject);
    procedure img4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVakansii: TFormVakansii;

implementation

uses UnitDataModule, UnitAddVakansii;

{$R *.dfm}

procedure TFormVakansii.edt1Change(Sender: TObject);
begin
with DataModule1.qryVakansii do
begin
Active:=False;
sql.Clear;
SQL.Add('Select в.Код_Вакансии,в.Код_работодателя,р.Название AS Работодатель,в.Название, в.Дата_создания');
SQL.Add(' From Вакансии в, Работодатели р');
SQL.Add(' Where в.Код_работодателя=р.Код_работодателя');
SQL.Add(' AND (р.Название LIKE ''%'+edt1.Text+'%'' OR в.Название LIKE ''%'+edt1.Text+'%'')');
//Active:=True;
//ExecSQL;
Open;
end;
end;

procedure TFormVakansii.img4Click(Sender: TObject);
begin
FormAddVakansii.Show;
end;

end.
