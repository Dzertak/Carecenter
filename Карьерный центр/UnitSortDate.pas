unit UnitSortDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, frxpngimage, ExtCtrls;

type
  TFormSortDate = class(TForm)
    img1: TImage;
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSortDate: TFormSortDate;

implementation

uses UnitContract, UnitDataModule;

{$R *.dfm}

procedure TFormSortDate.btn1Click(Sender: TObject);
begin
if Length(edt1.Text)<>4 then
ShowMessage('�� ������ ������ ����')
else
begin
FormContract.year:=edt1.text;
with DataModule1.qryContract do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select ������������, ��������, ���, ������, ����_����������, ���_���������,���_��������,���_��������, ���_�������');
  SQL.Add('From tmp');
  SQL.Add('Where ����_���������� Between #01/01/'+edt1.Text+'# AND #01/01/'+IntToStr(StrToInt(edt1.Text)+1)+'#');
  Open;
end;
//DataModule1.qryTmpCount.Active:=False;
//DataModule1.qryTmpCount.Active:=True;
FormSortDate.Close;
end;
end;

procedure TFormSortDate.edt1Change(Sender: TObject);
begin
 if Length(edt1.Text)>4 then
 edt1.Text:=Copy(edt1.Text,1,4);
end;

procedure TFormSortDate.edt1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

end.
