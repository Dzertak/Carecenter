unit UnitStudents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, GridsEh, DBGridEh, StdCtrls, DBCtrls, Buttons,superobject,
  frxpngimage, Mask;

type
  TFormStudents = class(TForm)
    img1: TImage;
    img2: TImage;
    dbgrdh1: TDBGridEh;
    edt1: TEdit;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    lbl1: TLabel;
    dbedt1: TDBEdit;
    img6: TImage;
    img7: TImage;
    procedure edt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStudents: TFormStudents;
  isSorted:Boolean;
      JsonObject: ISuperObject;
    JsonStream: TStringStream;

implementation

uses
  UnitDataModule, UnitJSON, DB, UnitAddStudent, UnitPrint, UnitSpecial;

{$R *.dfm}

procedure TFormStudents.edt1Change(Sender: TObject);
begin
 with DataModule1.qryStudents do
begin
Active:=False;
sql.Clear;
SQL.Add('Select �.���_��������, �.���_�������������, �.���, ����.�������� As �������������, �.������, �.���_�����������, �.���_�������, �.����������');
SQL.Add(' From �������� �, ������������� ����');
SQL.Add(' Where �.���_�������������=����.���_�������������');
SQL.Add(' AND (�.��� LIKE ''%'+edt1.Text+'%'' OR ����.�������� LIKE ''%'+edt1.Text+'%'' OR �.������ LIKE ''%'+edt1.Text+'%''' );
SQL.Add('OR �.���������� LIKE ''%'+edt1.Text+'%'' OR �.���_����������� LIKE ''%'+edt1.Text+'%'' OR �.���_������� LIKE ''%'+edt1.Text+'%'')');
Open;
end;
end;

procedure TFormStudents.btn1Click(Sender: TObject);
var count,i:Integer;
begin
FormJSON.mmo1.Lines.Clear;
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add(' "��������":[');
DataModule1.qryStudents.Last;
count:=DataModule1.qryStudents.RecordCount;
DataModule1.qryStudents.First;
i:=1;
with DataModule1.qryStudents do
begin
while not Eof do
begin
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add('"���_��������":'+FieldByName('���_��������').AsString+',');
FormJSON.mmo1.Lines.Add('"���":"'+FieldByName('���').AsString+'",');
FormJSON.mmo1.Lines.Add('"���_�������������":'+FieldByName('���_�������������').AsString+',');
FormJSON.mmo1.Lines.Add('"������":"'+FieldByName('������').AsString+'",');
FormJSON.mmo1.Lines.Add('"���_�����������":"'+FieldByName('���_�����������').AsString+'",');
FormJSON.mmo1.Lines.Add('"���_�������":"'+FieldByName('���_�������').AsString+'",');
FormJSON.mmo1.Lines.Add('"����������":"'+FieldByName('����������').AsString+'"');
if i=count then
FormJSON.mmo1.Lines.Add('}')
else  FormJSON.mmo1.Lines.Add('},');
i:=i+1;
Next;
end;
First;
end;
FormJSON.mmo1.Lines.Add(']');
FormJSON.mmo1.Lines.Add('}');
FormJSON.Show;
end;

procedure TFormStudents.img4Click(Sender: TObject);
begin
FormAddStudent.Show;
end;

procedure TFormStudents.img5Click(Sender: TObject);
begin
//FormPrint.Show;
FormPrint.frxrprt1.ShowReport();
FormPrint.frxrprt1.Export(FormPrint.frxpdfxprt1);
end;

procedure TFormStudents.btn2Click(Sender: TObject);
begin
FormSpecial.Show;
end;

procedure TFormStudents.btn3Click(Sender: TObject);
begin
ShowMessage(dbedt1.Text);
end;

procedure TFormStudents.img3Click(Sender: TObject);
var command:AnsiString;
note:string;
begin
with DataModule1.qrySQL do
begin
  Active:=False;
  SQL.Clear;
  SQL.Text:='Select * From �������� Where ���_��������='+dbedt1.Text;
  Open;
end;
  if MessageDlg('�� ������������� ������ ��������� �������� '+#10+#13+DataModule1.qrySQL.FieldByName('���').AsString+' � �����?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
note:=InputBox('������� ��������','������� "���������� ��� ��������"','');
command:='Insert into �����_���������(������������,���,���_�������������,������,���_�����������,���_�������,����������) '+
'Select false, ���,���_�������������,������,���_�����������,���_�������,����������+". '+note+'" From �������� '+
'Where ���_��������='+dbedt1.Text;
DataModule1.cmd1.CommandText:=command;
DataModule1.cmd1.Execute;
DataModule1.cmd1.CommandText:='Delete From �������� Where ���_��������='+dbedt1.Text;
DataModule1.cmd1.Execute;
ShowMessage('������� �������� � �����');
end;
 end;
procedure TFormStudents.img6Click(Sender: TObject);
var count,i:Integer;
begin
FormJSON.mmo1.Lines.Clear;
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add(' "��������":[');
DataModule1.qryStudents.Last;
count:=DataModule1.qryStudents.RecordCount;
DataModule1.qryStudents.First;
i:=1;
with DataModule1.qryStudents do
begin
while not Eof do
begin
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add('"���_��������":'+FieldByName('���_��������').AsString+',');
FormJSON.mmo1.Lines.Add('"���":"'+FieldByName('���').AsString+'",');
FormJSON.mmo1.Lines.Add('"���_�������������":'+FieldByName('���_�������������').AsString+',');
FormJSON.mmo1.Lines.Add('"������":"'+FieldByName('������').AsString+'",');
FormJSON.mmo1.Lines.Add('"���_�����������":"'+FieldByName('���_�����������').AsString+'",');
FormJSON.mmo1.Lines.Add('"���_�������":"'+FieldByName('���_�������').AsString+'",');
FormJSON.mmo1.Lines.Add('"����������":"'+FieldByName('����������').AsString+'"');
if i=count then
FormJSON.mmo1.Lines.Add('}')
else  FormJSON.mmo1.Lines.Add('},');
i:=i+1;
Next;
end;
First;
end;
FormJSON.mmo1.Lines.Add(']');
FormJSON.mmo1.Lines.Add('}');
FormJSON.Show;

end;

procedure TFormStudents.img7Click(Sender: TObject);
begin
FormSpecial.Show;
end;

end.
