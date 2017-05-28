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
SQL.Add('Select �.���_��������,�.���_������������,�.�������� AS ������������,�.��������, �.����_��������');
SQL.Add(' From �������� �, ������������ �');
SQL.Add(' Where �.���_������������=�.���_������������');
SQL.Add(' AND (�.�������� LIKE ''%'+edt1.Text+'%'' OR �.�������� LIKE ''%'+edt1.Text+'%'')');
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
