unit UnitAddVakansii;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg;

type
  TFormAddVakansii = class(TForm)
    img1: TImage;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    dtp1: TDateTimePicker;
    btn1: TButton;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddVakansii: TFormAddVakansii;

implementation

uses UnitDataModule;

{$R *.dfm}

procedure TFormAddVakansii.btn1Click(Sender: TObject);
begin
with DataModule1.cmdSQL do
begin
CommandText:='Insert into ��������(��������,���_������������,����_��������) Values('''+edt1.Text+''', '+edt2.Text+', #'+DateToStr(dtp1.Date)+'#)';
Execute;
end;
ShowMessage('�������� ���������');
edt1.Text:='';
edt2.Text:='';

end;

end.
