{-----------------------------------------------------------------------------
 Unit Name: UItIsPrime           // sichere Aussagen
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}
unit UItIsPrime;      // prüft nur ob und gibt keine Faktoren aus

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,
  nints, UPrimfaktoren;



type
      TItIsPrime= class
        private
        public
          function pollardRho(zahl:iinteger;  summand:cardinal=0; startwert:cardinal=0):boolean;
          function primfaktor(zahl:iinteger):boolean;
          function teilerfremd(a, b: iinteger): boolean;
          function AutoMethode(zahl:iinteger):boolean;
      end;




var    ItIsPrime:TItIsPrime;


implementation
uses Uanderes,unit1,Uprimetest;



{-----------------------------------------------------------------------------
  Description:  Wählt die schnellste Methode aus und sagt ob prim oder nicht
  Procedure:    AutoMethode
  Arguments:    zahl:iinteger
  Result:       boolean
  Detailed description:
    er überprüft erstmal ob der fermat sagt, dass es keine primzahl ist. Denn dann ist es auch absolut sihcer keine
      ansonsten muss er normal testen 
-----------------------------------------------------------------------------}
function TItIsPrime.AutoMethode(zahl:iinteger):boolean;
begin
  if  ncmp(zahl,uanderes.quadrat(nint(goesenSchranke))) >0  then     result:=primetest.Euler(zahl)
  else
    if primetest.Euler(zahl) then
      result:=ItIsPrime.primfaktor(zahl)
    else
      result:=false;
end;



{-----------------------------------------------------------------------------
  Description:  Bekommt durch probieren ungerader Zahlen   --> if prim then true else false
  Procedure:    primfaktor
  Arguments:    zahl:iinteger
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function TItIsPrime.primfaktor(zahl:iinteger):boolean;
var afaktor:iinteger;
begin
  result:=true;
  nset(afaktor,2);

  while  (ncmp(uanderes.quadrat(afaktor), zahl)<=0) do                 // genau das selbe wie  afaktor,  anderes.wurzel(zahl)
    begin
    inc(schritte);
    if (not geschop)and(uanderes.teilbar(schritte,100000)) then    begin    application.ProcessMessages;    if stop then exit;    end;

    // mod überpüfung
    if uanderes.teilbar(zahl,afaktor) then
      begin
      result:=false;
      exit;
      end
    else   if ncmp(afaktor,2)=0  then  nadd(afaktor,1) else nadd(afaktor,2);   // erhöhe um 2    und gehe so alle ungeraden durch
    end;
end ;




{-----------------------------------------------------------------------------
  Description:  Pollard-Rho-Methode  mit boolean Ausgabe
  Procedure:    pollardRho
  Arguments:    zahl:iinteger; summand:cardinal=0; startwert:cardinal=0
  Result:       boolean
  Detailed description:     http://de.wikipedia.org/wiki/Pollard-Rho-Methode
-----------------------------------------------------------------------------}
function TItIsPrime.pollardRho(zahl:iinteger;  summand:cardinal=0; startwert:cardinal=0):boolean;
var z1,z2,temp:iinteger;


    function funktion(const vor:iinteger):iinteger;
    begin
      nset(result,uanderes.quadrat(vor));
      nadd(result,summand);
      nmod(result,zahl);
    end;
begin
  result:=true;
  nset(aktuellezahl,0);
  schritte:=0;

  if summand =0 then summand:=random(100)+2;
  if startwert=0 then  startwert:= random(100)+2;

  nset(z1,funktion(   nint(startwert)   ));
  nset(z2,funktion(funktion(z1)));

  nsub(temp,z1,z2);

  repeat
    inc(schritte);
    if (not geschop)and(uanderes.teilbar(schritte,100000)) then    begin    application.ProcessMessages;    if stop then exit;    end;

    nset(z1,funktion(z1));
    nset(z2,funktion(funktion(z2)));

    nsub(temp,z1,z2);
  until  not(itisprime.teilerfremd(temp,zahl)) ;    // bis keine relativen primzahlen mehr

  // gefunden
  nset(z1,primfaktoren.ggt(temp,zahl));
  if (ncmp(z1,zahl)<0)and(ncmp(z1,1)>0) then result:=false;
end;




{-----------------------------------------------------------------------------
  Description:  Prüft auf Teilerfremdheit und gibt boolean zurück
  Procedure:    teilerfremd
  Arguments:    a, b: iinteger
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function TItIsPrime.teilerfremd(a, b: iinteger): boolean;
var temp:iinteger;
begin
  repeat
    nset(temp, b);
    nswp(a, b);
    nmod(b,a);
  until ncmp(b,0)=0 ;

  if ncmp(temp,1)=0 then result:=true   else  result:=false;
end;







end.
