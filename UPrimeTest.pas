{-----------------------------------------------------------------------------
 Unit Name: UPrimeTest             // Unsichere Aussagen
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}
unit UPrimeTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,
  nints;



type
      TPrimeTest= class
        private
        public
          function Fermat(const zahl:IInteger; NurMit2AlsBase:boolean=false):boolean;
          function Euler(const zahl:IInteger; NurMit2AlsBase:boolean=false):boolean;
          function TestPrimeTeilerfremd(zahl:IInteger; anzProbieren:cardinal=1000):boolean;
      end;


        // small prime array
const   spa:array[0..25] of byte=(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101);
        sichereObergrenze=63680000;

var    PrimeTest:TPrimeTest;

implementation
uses Uanderes,Uitisprime;




{-----------------------------------------------------------------------------
  Description:  Fermatscher Pseudo Primzahl Test
  Procedure:    Fermat
  Arguments:    const zahl:IInteger
  Result:       boolean
  Detailed description:
                Fermatscher Pseudo Primzahl Test
                  findet alle Primzahlen,  jedoch manchmal auch welche mehr
                  Link: http://de.wikipedia.org/wiki/Fermatscher_Primzahltest
------------------------------------------------------------------------------}
function TPrimeTest.Fermat(const zahl:IInteger; NurMit2AlsBase:boolean=false):boolean;
var temp,tempzahl:iinteger;
    i,bis:byte;
begin
  result:=true;
  if ncmp(zahl,4)<0 then exit;
  nsub(temp,zahl,nint(1));

  if (ncmp(zahl,340)<=0) or NurMit2AlsBase then  bis:=0 else bis :=length(spa)-1;           //bei zahlen < 340 reicht die basis 2 aus                 außerdem verhindere ich den Fehler wenn er versucht berechnungen mit klein mod groß auszuühren

  for i:=0 to bis do
    begin
    NPowMod(tempzahl,nint(spa[i]),temp,zahl);       //tempzahl:=prim^temp mod zahl
    if not(ncmp(tempzahl,1)=0) then
      begin
      result:= false;
      break;
      end;
    end;
end;



{-----------------------------------------------------------------------------
  Description:  Eulerscher Pseudo Primzahl Test
  Procedure:    Euler
  Arguments:    const zahl:IInteger
  Result:       boolean
  Detailed description:
                    Eulerscher Pseudo Primzahl Test
                      findet alle Primzahlen,  jedoch manchmal auch welche mehr
                      Link: http://de.wikipedia.org/wiki/Fermatscher_Primzahltest
-----------------------------------------------------------------------------}
function TPrimeTest.Euler(const zahl:IInteger; NurMit2AlsBase:boolean=false):boolean;
var temp,tempzahl,zmin1:iinteger;
    i,bis:byte;
begin
  result:=true;
  if ncmp(zahl,4)<0 then exit;
  nsub(zmin1,zahl,nint(1));
  ndiv(temp,zmin1,2);

  if (ncmp(zahl,340)<=0) or NurMit2AlsBase then  bis:=0 else bis :=length(spa)-1;           //bei zahlen < 340 reicht die basis 2 aus                 außerdem verhindere ich den Fehler wenn er versucht berechnungen mit klein mod groß auszuühren

  for i:=0 to bis do
    begin
    NPowMod(tempzahl,nint(spa[i]),temp,zahl);       //tempzahl:=prim^temp mod zahl
    if (ncmp(tempzahl,1)<>0) and (ncmp(tempzahl,zmin1)<>0) then
      begin
      result:= false;
      break;
      end;
    end;
end;





{-----------------------------------------------------------------------------
  Description:  Testet ob die Zahl zu anderen Zufallszahlenteilerfrem ist
  Procedure:    TestPrimeTeilerfrem
  Arguments:    zahl:IInteger
  Result:       boolean
  Detailed description:
                          Es ist ein sehr einfacher und doch of sehr wirkungsvoller Test
                            ob die Zahl eine Primzahl ist, oder nicht.
-----------------------------------------------------------------------------}
function   TPrimeTest.TestPrimeTeilerfremd(zahl:IInteger; anzProbieren:cardinal=1000):boolean;
var i:cardinal;
    temp:iinteger;
begin
  result:=true;
  if not nodd(zahl) then  begin  result:=false; exit; end;      //test auf 2

  for  i:=1 to anzProbieren do
    begin
    nset(temp,uanderes.ArndRange(nint(2),zahl));       //ungerade zufallszahl erstellen
    nodd(temp,true);
    if not itisprime.teilerfremd(zahl,temp) then
      begin
      result:=false;
      break;
      end;
    end;
end;



end.
