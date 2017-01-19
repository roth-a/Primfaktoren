{-----------------------------------------------------------------------------
 Unit Name: Haupt Unit
 Author:    Alexander Roth
 Date:      26-Feb-2006
 Lizenshinweise:  Infos-->Lizensbedingungen
-----------------------------------------------------------------------------}
program Primfaktoren;



{%TogetherDiagram 'ModelSupport_Primfaktoren\default.txaPackage'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UPrimfaktoren in 'UPrimfaktoren.pas',
  UPrimeTest in 'UPrimeTest.pas',
  Uanderes in 'Uanderes.pas',
  UItIsPrime in 'UItIsPrime.pas',
  Unit2 in 'Unit2.pas' {Form2},
  UstopTime in 'UstopTime.pas',
  Utxt in 'Utxt.pas',
  UPrimzahlen in 'UPrimzahlen.pas',
  UMathematik in 'UMathematik.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := 'Primfaktoren';
  Application.Title := 'Primfaktoren';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;

  faktoren.Free;
  PrimeArray.Free;
end.
