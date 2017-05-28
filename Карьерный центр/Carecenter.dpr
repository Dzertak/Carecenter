program Carecenter;

uses
  Forms,
  UnitStart in 'UnitStart.pas' {FormStart},
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitStudents in 'UnitStudents.pas' {FormStudents},
  UnitDataModule in 'UnitDataModule.pas' {DataModule1: TDataModule},
  UnitJSON in 'UnitJSON.pas' {FormJSON},
  UnitAddStudent in 'UnitAddStudent.pas' {FormAddStudent},
  UnitPrint in 'UnitPrint.pas' {FormPrint},
  UnitSpecial in 'UnitSpecial.pas' {FormSpecial},
  UnitRabotodatel in 'UnitRabotodatel.pas' {FormRabotodateli},
  UnitVakansii in 'UnitVakansii.pas' {FormVakansii},
  UnitContract in 'UnitContract.pas' {FormContract},
  UnitSortDate in 'UnitSortDate.pas' {FormSortDate},
  UnitAddRabotodatel in 'UnitAddRabotodatel.pas' {FormAddRabotodatel},
  UnitAddVakansii in 'UnitAddVakansii.pas' {FormAddVakansii};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStart, FormStart);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormStudents, FormStudents);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormJSON, FormJSON);
  Application.CreateForm(TFormAddStudent, FormAddStudent);
  Application.CreateForm(TFormPrint, FormPrint);
  Application.CreateForm(TFormSpecial, FormSpecial);
  Application.CreateForm(TFormRabotodateli, FormRabotodateli);
  Application.CreateForm(TFormVakansii, FormVakansii);
  Application.CreateForm(TFormContract, FormContract);
  Application.CreateForm(TFormSortDate, FormSortDate);
  Application.CreateForm(TFormAddRabotodatel, FormAddRabotodatel);
  Application.CreateForm(TFormAddVakansii, FormAddVakansii);
  Application.Run;
end.
