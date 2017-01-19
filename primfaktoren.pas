{-----------------------------------------------------------------------------
 Unit Name: primfaktoren
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}


unit primfaktoren;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,
  nints;



type
       Tiiarray=array of iinteger;

      tprimzahlen= class
        private
          function wurzel(zahl:iinteger):iinteger;
          function teilbar(zahl,m:iinteger):boolean;
          function durch(divident,divisor:iinteger):iinteger;
          procedure add(var ar:Tiiarray; zahl:iinteger);
        public
          procedure primfaktor(zahl:iinteger);
      end;




var    primzahlen:tprimzahlen;


        faktoren : Tiiarray;
        stop:boolean;
        aktuellezahl,restzahl:iinteger;
implementation
uses unit1,unit3;



function tprimzahlen.wurzel(zahl:iinteger):iinteger;
begin
nsqrt(zahl);
result:=zahl;
end;


function tprimzahlen.teilbar(zahl,m:iinteger):boolean;
begin
nmod(zahl,m);
result:= ncmp(zahl,0)=0;
end;


function tprimzahlen.durch(divident,divisor:iinteger):iinteger;
begin
ndiv(divident,divisor);
result:=divident;
end;


procedure tprimzahlen.add(var ar:Tiiarray; zahl:iinteger);
begin
setlength(ar,length(ar)+1);
nset(faktoren[length(ar)-1],zahl);
end;




procedure tprimzahlen.primfaktor(zahl:iinteger);
var afaktor:iinteger;
    nochprim :boolean;
begin
nochprim:=true;
if   faktoren=nil then
  nset(afaktor,2)
else
  nset(afaktor,faktoren[length(faktoren)-1] );

while  (ncmp(afaktor, wurzel(zahl))<=0) do
  begin
  if teilbar(afaktor,nint(100001)) then
    begin
    //hier kommt bla bla für die Aussenwelt
    application.ProcessMessages;
    nset(aktuellezahl,afaktor);
    nset(restzahl,zahl);
    if stop then exit;
    form1.Frame11.schreibeinfofenster;
    end;

  //mod überpüfung
  if teilbar(zahl,afaktor) then
    begin
    nochprim:=false;
    add(faktoren,afaktor);   //da das ja ein faktor ist wird er hinzugefügt
    primfaktor(durch(zahl,afaktor));     //rekursion
    nset(afaktor,zahl); //verlassen der schleife
    end
  else   if ncmp(afaktor,2)=0  then  nadd(afaktor,1) else nadd(afaktor,2);   //erhöhe um 2
  end;
if nochprim then   add(faktoren,zahl);  //die faktoren, die keine weitere Teiler haben werden hier hinzugefügt
end ;









end.
