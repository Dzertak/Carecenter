unit UnitContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh,
  DBGridEh, StdCtrls, ExtCtrls, frxpngimage, DBCtrls, ComCtrls, ToolWin,
  ImgList, jpeg;

type
  TFormContract = class(TForm)
    img1: TImage;
    dbgrdh1: TDBGridEh;
    edt3: TEdit;
    lbl5: TLabel;
    grp1: TGroupBox;
    lbl2: TLabel;
    edt1: TEdit;
    lbl3: TLabel;
    edt2: TEdit;
    dtp1: TDateTimePicker;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    img2: TImage;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    img3: TImage;
    cbb1: TComboBox;
    lbl4: TLabel;
    img6: TImage;
    img4: TImage;
    procedure edt1Change(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure edt3Change(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
  private
    { Private declarations }
  public
    year:string;
  end;

var
  FormContract: TFormContract;
  isStudent,isVakansii:Boolean;


implementation

uses UnitDataModule, UnitSortDate, UnitJSON, UnitPrint;

{$R *.dfm}

procedure TFormContract.edt1Change(Sender: TObject);
begin
if Length(edt1.Text)>0 then
begin
with DataModule1.qrySearchStudents do
begin
Active:=False;
sql.Clear;
SQL.Add('Select ���_��������, ���, ������, ���_�����������, ���_�������, ����������');
SQL.Add('From �������� � Where ���_��������='+edt1.Text+'');
Open;
end;
if DataModule1.qrySearchStudents.RecordCount>0 then
begin
isStudent:=True;
if isVakansii=True then img2.Enabled:=True;
lbl9.Caption:=DataModule1.qrySearchStudents.FieldByName('������').AsString;
lbl8.Caption:=DataModule1.qrySearchStudents.FieldByName('���').AsString;
end
else
begin
img2.Enabled:=False;
isStudent:=False;
ShowMessage('������� �� ������');
lbl9.Caption:='������ �� ����������';
lbl8.Caption:='������� �� ��������';
end;
 end
 else
 begin
 img2.Enabled:=False;
lbl9.Caption:='������ �� ����������';
lbl8.Caption:='������� �� ��������';
 end;
end;

procedure TFormContract.edt2Change(Sender: TObject);
begin
if Length(edt2.Text)>0 then
Begin
with DataModule1.qrySearchVakansii do
begin
Active:=False;
sql.Clear;
SQL.Add('Select ���_��������, �.�������� As ���������, �.�������� AS ������������,����_��������');
SQL.Add('From �������� �, ������������ � Where ���_��������='+edt2.Text+' AND �.���_������������=�.���_������������');
Open;
end;
if DataModule1.qrySearchVakansii.RecordCount>0 then
begin
isVakansii:=True;
if isStudent=True then img2.Enabled:=True;
dtp1.Enabled:=True;
lbl12.Caption:=DataModule1.qrySearchVakansii.FieldByName('���������').AsString;
lbl13.Caption:=DataModule1.qrySearchVakansii.FieldByName('������������').AsString;
end
else
begin
lbl12.Caption:='�������� �� ����������';
lbl13.Caption:='����������� �� �����������';
dtp1.Enabled:=False;
img2.Enabled:=False;
isVakansii:=False;
ShowMessage('�������� �� �������');
end;
end
 else
 begin
 img2.Enabled:=False;
lbl12.Caption:='��������� �� ����������';
lbl13.Caption:='����������� �� �����������';
 end;
 end;


procedure TFormContract.FormCreate(Sender: TObject);
var command:AnsiString;
begin
  year:='';
DataModule1.cmd1.CommandText:='Drop Table tmp';
DataModule1.cmd1.Execute;
  with DataModule1.qryContract do
begin
Active:=False;
sql.Clear;
SQL.Add('Select �.�������� AS ������������, �.�������� AS ��������, �.���, �.������, �.����_����������, �.���_���������, �.���_��������, �.���_��������, �.���_������� ');
SQL.Add(' From �����_������������� �, �����_�������� �, �����_��������� �, ��������� �');
SQL.Add(' Where �.���_��������=�.���_�������� AND �.���_��������=�.���_�������� AND �.���_������������=�.���_������������');
SQL.Add(' AND (�.�������� LIKE ''%'+edt3.Text+'%'' OR �.�������� LIKE ''%'+edt3.Text+'%'' OR �.��� LIKE ''%'+edt3.Text+'%''' );
SQL.Add('OR �.������ LIKE ''%'+edt3.Text+'%'')');
Open;
end;
command:='Select �.�������� AS ������������, �.�������� AS ��������, �.��� AS ���, �.������ AS ������, �.����_���������� AS ����_����������, �.���_���������, �.���_��������, �.���_��������, �.���_������� '+
'Into tmp From �����_������������� �, �����_�������� �, �����_��������� �, ��������� � '+
'Where �.���_��������=�.���_�������� AND �.���_��������=�.���_�������� AND �.���_������������=�.���_������������ AND (�.�������� LIKE ''%'+edt3.Text+'%'' OR �.�������� LIKE ''%'+edt3.Text+'%'' OR �.��� LIKE ''%'+edt3.Text+'%'' OR �.������ LIKE ''%'+edt3.Text+'%'') ';
DataModule1.cmd1.CommandText:=command;
DataModule1.cmd1.Execute;
isStudent:=False;
isVakansii:=False;

end;

procedure TFormContract.edt1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0; 
end;

procedure TFormContract.edt2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TFormContract.edt3Change(Sender: TObject);
var command:AnsiString;
begin
  year:='';
DataModule1.cmd1.CommandText:='Drop Table tmp';
DataModule1.cmd1.Execute;
  with DataModule1.qryContract do
begin
Active:=False;
sql.Clear;
SQL.Add('Select �.�������� AS ������������, �.�������� AS ��������, �.���, �.������, �.����_����������, �.���_���������, �.���_��������, �.���_��������, �.���_�������');
SQL.Add(' From �����_������������� �, �����_�������� �, �����_��������� �, ��������� �');
SQL.Add(' Where �.���_��������=�.���_�������� AND �.���_��������=�.���_�������� AND �.���_������������=�.���_������������');
SQL.Add(' AND (�.�������� LIKE ''%'+edt3.Text+'%'' OR �.�������� LIKE ''%'+edt3.Text+'%'' OR �.��� LIKE ''%'+edt3.Text+'%''' );
SQL.Add('OR �.������ LIKE ''%'+edt3.Text+'%'')');
Open;
end;
command:='Select �.�������� AS ������������, �.�������� AS ��������, �.��� AS ���, �.������ AS ������, �.����_���������� AS ����_����������, �.���_���������, �.���_��������, �.���_��������, �.���_������� '+
'Into tmp From �����_������������� �, �����_�������� �, �����_��������� �, ��������� � '+
'Where �.���_��������=�.���_�������� AND �.���_��������=�.���_�������� AND �.���_������������=�.���_������������ AND (�.�������� LIKE ''%'+edt3.Text+'%'' OR �.�������� LIKE ''%'+edt3.Text+'%'' OR �.��� LIKE ''%'+edt3.Text+'%'' OR �.������ LIKE ''%'+edt3.Text+'%'') ';
DataModule1.cmd1.CommandText:=command;
DataModule1.cmd1.Execute;
end;

procedure TFormContract.img2Click(Sender: TObject);
var rabotodatel:string;
begin
with DataModule1.qrySQL do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select �.���_��������,�.���_������������,�.�������� AS ������������,�.��������,�.����_��������,');
  SQL.Add('�.���_������������, �.�����,�.�������,�.�����,�.���_�����������_����');
  SQL.Add('From �������� �, ������������ � Where �.���_��������='+edt2.Text+' AND �.���_������������=�.���_������������');
  Open;
  end;
  rabotodatel:=DataModule1.qrySQL.FieldByName('������������').AsString;

  with DataModule1.qrySQL do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select ���,���_�������������,������,���_�����������,���_�������,���������� from �������� Where ���_��������='+edt1.Text);
  Open;
end;

 with DataModule1.qrySQL2 do
 begin
   Active:=False;
   SQL.Clear;
   SQL.Add('Select ���_������������,��������,�������,�����,���_�����������_���� From �����_������������� Where ��������='''+rabotodatel+'''');
   Open;
 end;

 if DataModule1.qrySQL2.RecordCount=0 then
 begin
   DataModule1.cmd1.CommandText:='Insert into �����_�������������(��������,�����,�������,�����,���_�����������_����) Select ��������,�����,�������,�����,���_�����������_���� From ������������ Where ��������='''+rabotodatel+'''';
   DataModule1.cmd1.Execute;
 end;

  DataModule1.cmd1.CommandText:='Insert into �����_���������(���,������,���_�����������,���_�������,������������,���_�������������) Values('''+DataModule1.qrySQL.FieldByName('���').AsString+''','''+DataModule1.qrySQL.FieldByName('������').AsString+''','''+DataModule1.qrySQL.FieldByName('���_�����������').AsString+''','''+DataModule1.qrySQL.FieldByName('���_�������').AsString+''',true,'+DataModule1.qrySQL.FieldByName('���_�������������').AsString+')';
  DataModule1.cmd1.Execute;

    with DataModule1.qrySQL do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select ��������,����_�������� from �������� Where ���_��������='+edt2.Text);
  Open;
end;

  DataModule1.cmd1.CommandText:='Insert into �����_��������(���_������������,��������,����_��������) Values('+DataModule1.qrySQL2.FieldByName('���_������������').AsString+','''+DataModule1.qrySQL.FieldByName('��������').AsString+''','''+DataModule1.qrySQL.FieldByName('����_��������').AsString+''')';
  DataModule1.cmd1.Execute;

  DataModule1.cmd1.CommandText:='Insert into ���������(���_��������,���_��������,����_����������) Select MAX(�.���_��������), MAX(�.���_��������), #'+DatetoStr(dtp1.Date)+'# From �����_�������� �,�����_��������� �';
  DataModule1.cmd1.Execute;


  DataModule1.cmd1.CommandText:='Delete From �������� Where ���_��������='+edt1.Text;
  DataModule1.cmd1.Execute;
  DataModule1.cmd1.CommandText:='Delete From �������� Where ���_��������='+edt2.Text;
  DataModule1.cmd1.Execute;

  with DataModule1.qryContract do
begin
Active:=False;
sql.Clear;
SQL.Add('Select �.�������� AS ������������, �.�������� AS ��������, �.���, �.������, �.����_����������, �.���_���������, �.���_��������, �.���_��������,�.���_�������');
SQL.Add(' From �����_������������� �, �����_�������� �, �����_��������� �, ��������� �');
SQL.Add(' Where �.���_��������=�.���_�������� AND �.���_��������=�.���_�������� AND �.���_������������=�.���_������������');
Open;
end;
//DataModule1.qryTmpCount.Active:=False;
//DataModule1.qryTmpCount.Active:=True;

end;

procedure TFormContract.btn2Click(Sender: TObject);
begin
FormSortDate.Show;
end;

procedure TFormContract.btn1Click(Sender: TObject);
var count,i:Integer;
begin
FormJSON.mmo1.Lines.Clear;
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add(' "���������":[');
DataModule1.qryContract.Last;
count:=DataModule1.qryContract.RecordCount;
DataModule1.qryContract.First;
i:=1;
with DataModule1.qryContract do
begin
while not Eof do
begin
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add('"���_���������":'+FieldByName('���_���������').AsString+',');
FormJSON.mmo1.Lines.Add('"���_��������":'+FieldByName('���_��������').AsString+',');
FormJSON.mmo1.Lines.Add('"���_��������":'+FieldByName('���_��������').AsString+',');
FormJSON.mmo1.Lines.Add('"���":"'+FieldByName('���').AsString+'",');
FormJSON.mmo1.Lines.Add('"������":"'+FieldByName('������').AsString+'",');
FormJSON.mmo1.Lines.Add('"������������":"'+FieldByName('������������').AsString+'",');
FormJSON.mmo1.Lines.Add('"��������":"'+FieldByName('��������').AsString+'",');
FormJSON.mmo1.Lines.Add('"����_����������":"'+FieldByName('����_����������').AsString+'",');
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

procedure TFormContract.img3Click(Sender: TObject);
var spec:string;
isspec:Boolean;
begin
if cbb1.Text='�� ��������' then
begin
  if DataModule1.qryContract.RecordCount>1 then
  ShowMessage('�������� ������ ������ ��������')
  else
  begin
  FormPrint.frxrprtSTUDENT.ShowReport();
  FormPrint.frxrprtSTUDENT.Export(FormPrint.frxpdfxprt1);
  end;
  end;
 if cbb1.Text='�� �������������' then
 begin
   isspec:=False;
      with DataModule1.qryContract do
      begin
        Last;
        spec:=FieldByName('������').AsString;
        First;
   while not Eof do
   begin
     if Copy(DataModule1.qryContract.Fieldbyname('������').AsString,1,2)=Copy(spec,1,2) then
     isspec:=True
     else Break;
    Next;
   end;
   end;
   if isspec=True then
   begin
        FormPrint.frxrprtSPECIAL.ShowReport();
        FormPrint.frxrprtSPECIAL.Export(FormPrint.frxpdfxprt2);
   end
 else ShowMessage('�������� ������ ���� �������������');
 end;
 if cbb1.Text='�� �����������' then
 begin

   isspec:=False;
      with DataModule1.qryContract do
      begin
        Last;
        spec:=FieldByName('������������').AsString;
        First;
   while not Eof do
   begin
     if DataModule1.qryContract.Fieldbyname('������������').AsString = spec then
     isspec:=True
     else Break;
    Next;
   end;
   end;
   if isspec=True then
   begin
     with DataModule1.qryTmpCount do
   begin
     active:=False;
     SQL.Clear;
     SQL.Add('Select top 1 ������������ from tmp Where ������������='''+spec+'''');
     Active:=True;
   end;
        FormPrint.frxrprtRABOTODATEL.ShowReport();
        FormPrint.frxrprtRABOTODATEL.Export(FormPrint.frxpdfxprt3);
   end
 else ShowMessage('�������� ������ ���� �����������');
 end;
    
end;

procedure TFormContract.img6Click(Sender: TObject);
var count,i:Integer;
begin
FormJSON.mmo1.Lines.Clear;
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add(' "���������":[');
DataModule1.qryContract.Last;
count:=DataModule1.qryContract.RecordCount;
DataModule1.qryContract.First;
i:=1;
with DataModule1.qryContract do
begin
while not Eof do
begin
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add('"���_���������":'+FieldByName('���_���������').AsString+',');
FormJSON.mmo1.Lines.Add('"���_��������":'+FieldByName('���_��������').AsString+',');
FormJSON.mmo1.Lines.Add('"���_��������":'+FieldByName('���_��������').AsString+',');
FormJSON.mmo1.Lines.Add('"���":"'+FieldByName('���').AsString+'",');
FormJSON.mmo1.Lines.Add('"������":"'+FieldByName('������').AsString+'",');
FormJSON.mmo1.Lines.Add('"������������":"'+FieldByName('������������').AsString+'",');
FormJSON.mmo1.Lines.Add('"��������":"'+FieldByName('��������').AsString+'",');
FormJSON.mmo1.Lines.Add('"����_����������":"'+FieldByName('����_����������').AsString+'",');
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

procedure TFormContract.img4Click(Sender: TObject);
begin
FormSortDate.Show;
end;

end.
