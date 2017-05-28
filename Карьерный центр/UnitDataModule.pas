unit UnitDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    con1: TADOConnection;
    qry1: TADOQuery;
    qrySpecial: TADOQuery;
    dsSpecial: TDataSource;
    dsStudents: TDataSource;
    qryStudents: TADOQuery;
    atncfldStudents_1: TAutoIncField;
    intgrfldStudents_2: TIntegerField;
    wdstrngfldStudentsDSDesigner: TWideStringField;
    wdstrngfldStudentsDSDesigner2: TWideStringField;
    wdstrngfldStudentsDSDesigner3: TWideStringField;
    wdstrngfldStudents_3: TWideStringField;
    wdstrngfldStudents_4: TWideStringField;
    wdstrngfldStudentsDSDesigner4: TWideStringField;
    cmd1: TADOCommand;
    qry2: TADOQuery;
    qrySQL: TADOQuery;
    cmdSQL: TADOCommand;
    dsRabotodateli: TDataSource;
    qryRabotodateli: TADOQuery;
    qryVakansii: TADOQuery;
    dsVakansii: TDataSource;
    qryContract: TADOQuery;
    dsContract: TDataSource;
    qrySearchStudents: TADOQuery;
    dsSearchStudent: TDataSource;
    dsSearchVakansii: TDataSource;
    qrySearchVakansii: TADOQuery;
    qrySQL2: TADOQuery;
    qryTMP: TADOQuery;
    dsTMP: TDataSource;
    qryTmpCount: TADOQuery;
    dsTMPCount: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
