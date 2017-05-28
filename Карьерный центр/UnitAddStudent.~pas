unit UnitAddStudent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, ComCtrls;

type
  TFormAddStudent = class(TForm)
    img1: TImage;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt1: TEdit;
    edt3: TEdit;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    mmo1: TMemo;
    cbb1: TComboBox;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddStudent: TFormAddStudent;

implementation

uses UnitDataModule;

{$R *.dfm}

procedure TFormAddStudent.btn1Click(Sender: TObject);
begin
with DataModule1.cmdSQL do
begin
CommandText:='Insert into Студенты(ФИО,Группа,Год_поступления,Год_выпуска,Примечание,Код_специальности) Select '''+edt1.Text+''', '''+edt3.Text+''', '''+DateToStr(dtp1.Date)+''','''+DateToStr(dtp2.Date)+''','''+mmo1.Lines.Text+''', Код_специальности From Специальности Where Название='''+cbb1.Text+'''';
Execute;
{
SQL.Clear;
SQL.Add('Insert into Студенты(ФИО,Группа,Год_поступления,Год_выпуска,Примечание,Код_специальности)');
SQL.Add('Select '''+edt1.Text+''', '''+edt3.Text+''', '''+DateToStr(dtp1.Date)+''','''+DateToStr(dtp2.Date)+''','''+mmo1.Lines.Text+''', Код_специальности From Специальности Where Название='''+cbb1.Text+'''');
ExecSQL;
Active:=True;    }
end;
ShowMessage('Студент добавлен');
edt1.Text:='';
mmo1.Lines.Clear;
end;
end.
