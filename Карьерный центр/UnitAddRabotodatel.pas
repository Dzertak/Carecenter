unit UnitAddRabotodatel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TFormAddRabotodatel = class(TForm)
    img1: TImage;
    pnl1: TPanel;
    edt1: TEdit;
    lbl1: TLabel;
    edt2: TEdit;
    lbl2: TLabel;
    edt3: TEdit;
    lbl3: TLabel;
    edt4: TEdit;
    lbl4: TLabel;
    edt5: TEdit;
    lbl5: TLabel;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddRabotodatel: TFormAddRabotodatel;

implementation

uses UnitDataModule;

{$R *.dfm}

procedure TFormAddRabotodatel.btn1Click(Sender: TObject);
begin
with DataModule1.cmdSQL do
begin
CommandText:='Insert into ������������(��������,���_�����������_����,�����,�������,�����) Values('''+edt1.Text+''', '''+edt2.Text+''', '''+edt3.Text+''','''+edt4.Text+''','''+edt5.Text+''')';
Execute;
end;
ShowMessage('������������ ��������');
edt1.Text:='';
edt2.Text:='';
edt3.Text:='';
edt4.Text:='';
edt5.Text:='';
end;

end.
