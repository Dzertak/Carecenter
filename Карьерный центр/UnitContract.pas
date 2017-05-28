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
SQL.Add('Select Код_студента, ФИО, Группа, Год_поступления, Год_выпуска, Примечание');
SQL.Add('From Студенты с Where Код_студента='+edt1.Text+'');
Open;
end;
if DataModule1.qrySearchStudents.RecordCount>0 then
begin
isStudent:=True;
if isVakansii=True then img2.Enabled:=True;
lbl9.Caption:=DataModule1.qrySearchStudents.FieldByName('Группа').AsString;
lbl8.Caption:=DataModule1.qrySearchStudents.FieldByName('ФИО').AsString;
end
else
begin
img2.Enabled:=False;
isStudent:=False;
ShowMessage('Студент не найден');
lbl9.Caption:='Группа не определена';
lbl8.Caption:='Студент не определён';
end;
 end
 else
 begin
 img2.Enabled:=False;
lbl9.Caption:='Группа не определена';
lbl8.Caption:='Студент не определён';
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
SQL.Add('Select Код_вакансии, в.Название As Должность, р.Название AS Работодатель,Дата_создания');
SQL.Add('From Вакансии в, Работодатели р Where Код_вакансии='+edt2.Text+' AND в.Код_работодателя=р.Код_работодателя');
Open;
end;
if DataModule1.qrySearchVakansii.RecordCount>0 then
begin
isVakansii:=True;
if isStudent=True then img2.Enabled:=True;
dtp1.Enabled:=True;
lbl12.Caption:=DataModule1.qrySearchVakansii.FieldByName('Должность').AsString;
lbl13.Caption:=DataModule1.qrySearchVakansii.FieldByName('Работодатель').AsString;
end
else
begin
lbl12.Caption:='Вакансия не определена';
lbl13.Caption:='Предприятие не определенно';
dtp1.Enabled:=False;
img2.Enabled:=False;
isVakansii:=False;
ShowMessage('Вакансия не найдена');
end;
end
 else
 begin
 img2.Enabled:=False;
lbl12.Caption:='Должность не определена';
lbl13.Caption:='Предприятие не определенно';
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
SQL.Add('Select р.Название AS Работодатель, в.Название AS Вакансия, с.ФИО, с.Группа, к.Дата_подписания, к.Код_контракта, к.Код_вакансии, к.Код_Студента, с.Год_выпуска ');
SQL.Add(' From Архив_работодателей р, Архив_вакансий в, Архив_студентов с, Контракты к');
SQL.Add(' Where к.Код_студента=с.Код_студента AND к.Код_вакансии=в.Код_вакансии AND в.Код_работодателя=р.Код_работодателя');
SQL.Add(' AND (р.Название LIKE ''%'+edt3.Text+'%'' OR в.Название LIKE ''%'+edt3.Text+'%'' OR с.ФИО LIKE ''%'+edt3.Text+'%''' );
SQL.Add('OR с.Группа LIKE ''%'+edt3.Text+'%'')');
Open;
end;
command:='Select р.Название AS Работодатель, в.Название AS Вакансия, с.ФИО AS ФИО, с.Группа AS Группа, к.Дата_подписания AS Дата_подписания, к.Код_контракта, к.Код_вакансии, к.Код_Студента, с.Год_выпуска '+
'Into tmp From Архив_работодателей р, Архив_вакансий в, Архив_студентов с, Контракты к '+
'Where к.Код_студента=с.Код_студента AND к.Код_вакансии=в.Код_вакансии AND в.Код_работодателя=р.Код_работодателя AND (р.Название LIKE ''%'+edt3.Text+'%'' OR в.Название LIKE ''%'+edt3.Text+'%'' OR с.ФИО LIKE ''%'+edt3.Text+'%'' OR с.Группа LIKE ''%'+edt3.Text+'%'') ';
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
SQL.Add('Select р.Название AS Работодатель, в.Название AS Вакансия, с.ФИО, с.Группа, к.Дата_подписания, к.Код_контракта, к.Код_вакансии, к.Код_Студента, с.Год_выпуска');
SQL.Add(' From Архив_работодателей р, Архив_вакансий в, Архив_студентов с, Контракты к');
SQL.Add(' Where к.Код_студента=с.Код_студента AND к.Код_вакансии=в.Код_вакансии AND в.Код_работодателя=р.Код_работодателя');
SQL.Add(' AND (р.Название LIKE ''%'+edt3.Text+'%'' OR в.Название LIKE ''%'+edt3.Text+'%'' OR с.ФИО LIKE ''%'+edt3.Text+'%''' );
SQL.Add('OR с.Группа LIKE ''%'+edt3.Text+'%'')');
Open;
end;
command:='Select р.Название AS Работодатель, в.Название AS Вакансия, с.ФИО AS ФИО, с.Группа AS Группа, к.Дата_подписания AS Дата_подписания, к.Код_контракта, к.Код_вакансии, к.Код_Студента, с.Год_выпуска '+
'Into tmp From Архив_работодателей р, Архив_вакансий в, Архив_студентов с, Контракты к '+
'Where к.Код_студента=с.Код_студента AND к.Код_вакансии=в.Код_вакансии AND в.Код_работодателя=р.Код_работодателя AND (р.Название LIKE ''%'+edt3.Text+'%'' OR в.Название LIKE ''%'+edt3.Text+'%'' OR с.ФИО LIKE ''%'+edt3.Text+'%'' OR с.Группа LIKE ''%'+edt3.Text+'%'') ';
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
  SQL.Add('Select в.Код_вакансии,в.Код_работодателя,р.Название AS Работодатель,в.Название,в.Дата_создания,');
  SQL.Add('р.Код_работодателя, р.Адрес,р.Телефон,р.Имейл,р.Имя_контактного_лица');
  SQL.Add('From Вакансии в, Работодатели р Where в.Код_вакансии='+edt2.Text+' AND в.Код_работодателя=р.Код_работодателя');
  Open;
  end;
  rabotodatel:=DataModule1.qrySQL.FieldByName('Работодатель').AsString;

  with DataModule1.qrySQL do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select ФИО,Код_специальности,Группа,Год_поступления,Год_выпуска,Примечание from Студенты Where Код_студента='+edt1.Text);
  Open;
end;

 with DataModule1.qrySQL2 do
 begin
   Active:=False;
   SQL.Clear;
   SQL.Add('Select Код_работодателя,Название,Телефон,Имейл,Имя_контактного_лица From Архив_работодателей Where Название='''+rabotodatel+'''');
   Open;
 end;

 if DataModule1.qrySQL2.RecordCount=0 then
 begin
   DataModule1.cmd1.CommandText:='Insert into Архив_работодателей(Название,Адрес,Телефон,Имейл,Имя_контактного_лица) Select Название,Адрес,Телефон,Имейл,Имя_контактного_лица From Работодатели Where Название='''+rabotodatel+'''';
   DataModule1.cmd1.Execute;
 end;

  DataModule1.cmd1.CommandText:='Insert into Архив_студентов(ФИО,Группа,Год_поступления,Год_выпуска,Трудоустроен,Код_специальности) Values('''+DataModule1.qrySQL.FieldByName('ФИО').AsString+''','''+DataModule1.qrySQL.FieldByName('Группа').AsString+''','''+DataModule1.qrySQL.FieldByName('Год_поступления').AsString+''','''+DataModule1.qrySQL.FieldByName('Год_выпуска').AsString+''',true,'+DataModule1.qrySQL.FieldByName('Код_специальности').AsString+')';
  DataModule1.cmd1.Execute;

    with DataModule1.qrySQL do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select Название,Дата_создания from Вакансии Where Код_вакансии='+edt2.Text);
  Open;
end;

  DataModule1.cmd1.CommandText:='Insert into Архив_Вакансий(Код_работодателя,Название,Дата_создания) Values('+DataModule1.qrySQL2.FieldByName('Код_работодателя').AsString+','''+DataModule1.qrySQL.FieldByName('Название').AsString+''','''+DataModule1.qrySQL.FieldByName('Дата_создания').AsString+''')';
  DataModule1.cmd1.Execute;

  DataModule1.cmd1.CommandText:='Insert into Контракты(Код_студента,Код_вакансии,Дата_подписания) Select MAX(с.Код_студента), MAX(в.Код_вакансии), #'+DatetoStr(dtp1.Date)+'# From Архив_вакансий в,Архив_студентов с';
  DataModule1.cmd1.Execute;


  DataModule1.cmd1.CommandText:='Delete From Студенты Where Код_студента='+edt1.Text;
  DataModule1.cmd1.Execute;
  DataModule1.cmd1.CommandText:='Delete From Вакансии Where Код_вакансии='+edt2.Text;
  DataModule1.cmd1.Execute;

  with DataModule1.qryContract do
begin
Active:=False;
sql.Clear;
SQL.Add('Select р.Название AS Работодатель, в.Название AS Вакансия, с.ФИО, с.Группа, к.Дата_подписания, к.Код_контракта, к.Код_вакансии, к.Код_Студента,с.Год_выпуска');
SQL.Add(' From Архив_работодателей р, Архив_вакансий в, Архив_студентов с, Контракты к');
SQL.Add(' Where к.Код_студента=с.Код_студента AND к.Код_вакансии=в.Код_вакансии AND в.Код_работодателя=р.Код_работодателя');
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
FormJSON.mmo1.Lines.Add(' "Контракты":[');
DataModule1.qryContract.Last;
count:=DataModule1.qryContract.RecordCount;
DataModule1.qryContract.First;
i:=1;
with DataModule1.qryContract do
begin
while not Eof do
begin
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add('"Код_контракта":'+FieldByName('Код_контракта').AsString+',');
FormJSON.mmo1.Lines.Add('"Код_студента":'+FieldByName('Код_студента').AsString+',');
FormJSON.mmo1.Lines.Add('"Код_вакансии":'+FieldByName('Код_вакансии').AsString+',');
FormJSON.mmo1.Lines.Add('"ФИО":"'+FieldByName('ФИО').AsString+'",');
FormJSON.mmo1.Lines.Add('"Группа":"'+FieldByName('Группа').AsString+'",');
FormJSON.mmo1.Lines.Add('"Работодатель":"'+FieldByName('Работодатель').AsString+'",');
FormJSON.mmo1.Lines.Add('"Вакансия":"'+FieldByName('Вакансия').AsString+'",');
FormJSON.mmo1.Lines.Add('"Дата_подписания":"'+FieldByName('Дата_подписания').AsString+'",');
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
if cbb1.Text='По Студенту' then
begin
  if DataModule1.qryContract.RecordCount>1 then
  ShowMessage('Выберите только одного студента')
  else
  begin
  FormPrint.frxrprtSTUDENT.ShowReport();
  FormPrint.frxrprtSTUDENT.Export(FormPrint.frxpdfxprt1);
  end;
  end;
 if cbb1.Text='По Специальности' then
 begin
   isspec:=False;
      with DataModule1.qryContract do
      begin
        Last;
        spec:=FieldByName('Группа').AsString;
        First;
   while not Eof do
   begin
     if Copy(DataModule1.qryContract.Fieldbyname('Группа').AsString,1,2)=Copy(spec,1,2) then
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
 else ShowMessage('Выберите только одну специальность');
 end;
 if cbb1.Text='По Предприятию' then
 begin

   isspec:=False;
      with DataModule1.qryContract do
      begin
        Last;
        spec:=FieldByName('Работодатель').AsString;
        First;
   while not Eof do
   begin
     if DataModule1.qryContract.Fieldbyname('Работодатель').AsString = spec then
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
     SQL.Add('Select top 1 Работодатель from tmp Where Работодатель='''+spec+'''');
     Active:=True;
   end;
        FormPrint.frxrprtRABOTODATEL.ShowReport();
        FormPrint.frxrprtRABOTODATEL.Export(FormPrint.frxpdfxprt3);
   end
 else ShowMessage('Выберите только одно Предприятие');
 end;
    
end;

procedure TFormContract.img6Click(Sender: TObject);
var count,i:Integer;
begin
FormJSON.mmo1.Lines.Clear;
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add(' "Контракты":[');
DataModule1.qryContract.Last;
count:=DataModule1.qryContract.RecordCount;
DataModule1.qryContract.First;
i:=1;
with DataModule1.qryContract do
begin
while not Eof do
begin
FormJSON.mmo1.Lines.Add('{');
FormJSON.mmo1.Lines.Add('"Код_контракта":'+FieldByName('Код_контракта').AsString+',');
FormJSON.mmo1.Lines.Add('"Код_студента":'+FieldByName('Код_студента').AsString+',');
FormJSON.mmo1.Lines.Add('"Код_вакансии":'+FieldByName('Код_вакансии').AsString+',');
FormJSON.mmo1.Lines.Add('"ФИО":"'+FieldByName('ФИО').AsString+'",');
FormJSON.mmo1.Lines.Add('"Группа":"'+FieldByName('Группа').AsString+'",');
FormJSON.mmo1.Lines.Add('"Работодатель":"'+FieldByName('Работодатель').AsString+'",');
FormJSON.mmo1.Lines.Add('"Вакансия":"'+FieldByName('Вакансия').AsString+'",');
FormJSON.mmo1.Lines.Add('"Дата_подписания":"'+FieldByName('Дата_подписания').AsString+'",');
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
