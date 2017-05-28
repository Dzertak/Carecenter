unit UnitPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxPreview, frxExportPDF;

type
  TFormPrint = class(TForm)
    frxrprt1: TfrxReport;
    frxprvw1: TfrxPreview;
    frxdbdtst1: TfrxDBDataset;
    frxpdfxprt1: TfrxPDFExport;
    frxdbdtstSTUDENTS: TfrxDBDataset;
    frxdbdtstSPECIAL: TfrxDBDataset;
    frxdbdtstRABOTODATEL: TfrxDBDataset;
    frxrprtSTUDENT: TfrxReport;
    frxrprtSPECIAL: TfrxReport;
    frxrprtRABOTODATEL: TfrxReport;
    frxdbdtstRabotodatelTHE: TfrxDBDataset;
    frxpdfxprt2: TfrxPDFExport;
    frxpdfxprt3: TfrxPDFExport;
    frxprvw2: TfrxPreview;
    frxprvw3: TfrxPreview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrint: TFormPrint;

implementation

uses
  UnitDataModule;

{$R *.dfm}

end.
