{-----------------------------------------------------------------------------
 Unit Name: UPrimzahlen
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}

unit UPrimzahlen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,dateutils,
  nints,Uprimfaktoren;



type
      TPrimzahlen= class
        private
        public
          procedure listPrimzahlen(var anzgefunden:cardinal; const start,ende:IInteger; inDateiSchreiben:boolean=false);
          procedure listZufallsPrimzahlen(const groesse,anzahl:integer);

          procedure CalcPrimeArray(MaxZahl:IInteger; ab2:boolean=false);              overload;
          procedure CalcPrimeArray(MaxZahl:Cardinal; ab2:boolean=false);  overload;
          procedure CalcPrimeArray(MaxZahl:Int64; ab2:boolean=false);     overload;
      end;




var    Primzahlen:TPrimzahlen;

      PrimeArray:Tiiarray;   //unsichere Primzahlen




implementation
uses UItIsPrime,Uanderes,Unit1,Utxt,UPrimetest,UStopTime;





{procedure TPrimzahlen.listPrimzahlen(var ar:Tiiarray; const start,ende:IInteger);
var i:iinteger;
    lauf:cardinal;
begin
ar.leereArray;

lauf:=0;
nset(i,start);
nodd(i,true);
repeat
  if Uanderes.teilbar(i,nint(1001)) then
    begin
    application.ProcessMessages;
    if stop then exit;
    // hier kommt bla bla für die Aussenwelt
    Uanderes.zfps(lauf);
    form1.schreibeinfofenster;
    end;

  if itisprime.AutoMethode(i) then    // wenn gefunden primzahl
    begin
    Uanderes.writeGrid('',nstr(i));
    ar.add(i);
    end;
  inc(lauf);
  nadd(i,2);
until ncmp(ende,i)<0 ;

end;}



{-----------------------------------------------------------------------------
  Description:  Listet Primzahlen aus einem Bereich in die Liaste oder in eine Datei auf
  Procedure:    listPrimzahlen
  Arguments:    var ar:Tiiarray; const start,ende:IInteger
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TPrimzahlen.listPrimzahlen(var anzgefunden:cardinal; const start,ende:IInteger; inDateiSchreiben:boolean=false);
var i:iinteger;
    path:string;
begin
  if inDateiSchreiben then path:=ExtractFilePath(Application.ExeName)+'Primzahlen aufgelistet '+dateToStr(now)+'  '+inttostr(hourof(now))+' h '+inttostr(minuteof(now))+' min.txt';

  schritte:=0;
  anzgefunden:=0;
  nset(i,start);
  nodd(i,true);
  repeat
    if uanderes.teilbar(i,nint(1001))or stop then
      begin
      application.ProcessMessages;
      if stop then exit;
      // hier kommt bla bla für die Aussenwelt
      uanderes.zfps(schritte);
      form1.schreibeinfofenster;
      end;

    if itisprime.AutoMethode(i) then    // wenn gefunden primzahl
      begin
      if  inDateiSchreiben then  txt.intxtschreiben(nstr(i),path,'.txt',false)
      else uanderes.writeGrid(nstr(i));
      application.ProcessMessages;
      inc(anzgefunden);
      end;
    inc(schritte);
    nadd(i,2);
  until ncmp(ende,i)<0 ;

  if  inDateiSchreiben then  txt.intxtschreiben(floattostr(roundto(anzgefunden/schritte*100,-2))+'% Primzahlen wurden in diesem Bereich gefunden',path,'.txt',false)
  else uanderes.writeGrid(floattostr(roundto(anzgefunden/schritte*100,-2))+'% Primzahlen wurden in diesem Bereich gefunden');
end;




{-----------------------------------------------------------------------------
  Description:  Listet Zufällige Primzahlen auf (Gefunden Primzahltest)
  Procedure:    listZufallsPrimzahlen
  Arguments:    const groesse,anzahl:integer
  Result:       None
  Detailed description:   Unsichere Berechnung weil primzahltest
                          Mit der Formel 2x^2-199
-----------------------------------------------------------------------------}
procedure TPrimzahlen.listZufallsPrimzahlen(const groesse,anzahl:integer);
var i,anzVer:cardinal;
    zahl:IInteger;
begin
  i:=0;
  anzver:=0;
  repeat
    inc(anzver);
    uanderes.Arnd(zahl,groesse div 2);
    nsqr(zahl);
    nmul(zahl,2);
    nsub(zahl,199);
    if primetest.Fermat(zahl) and primetest.Euler(zahl) then  // ist eine Primzahl
      begin
      Uanderes.writeGrid(nstr(zahl),'','Ja','Ja');

      application.ProcessMessages;
      if stop then exit;
      // hier kommt bla bla für die Aussenwelt
      form1.schreibeinfofenster;

      inc(i);
      end;
  until i>=anzahl;
  Uanderes.writeGrid('Fundrate '+floattostr(roundto(anzahl/anzver*100,-2))+'%     Diese Primzahlen wurden mit der Formel 2*x^2 - 199 errechnet');
end;




{-----------------------------------------------------------------------------
  Description:  Berechnet das Array aus Primzahlen
  Procedure:    CalcPrimeArray
  Arguments:    MaxZahl:IInteger;
  Detailed description:   Unsichere Berechnung weil primzahltest
-----------------------------------------------------------------------------}
procedure TPrimzahlen.CalcPrimeArray(MaxZahl:IInteger; ab2:boolean=false);
var zahl:IInteger;
begin
  //setzten der Anfangszahl
  if primeArray.anzahl=0 then
    begin
    primeArray.add(nint(2));
    nset(zahl,3);
    end
  else
    if ncmp(MaxZahl,primeArray[-1])<=0 then
      exit                         //damit er rausspringt wenn es garnix zu berechnen gibt
    else
      nset(zahl,primeArray[-1]);

  form1.CheckPrimeArray.Enabled:=false;

  nodd(zahl,true);

  repeat
    if (primearray.anzahl mod 500 =0) or stop then
      begin
      application.ProcessMessages;
      if stop then exit;
      // hier kommt bla bla für die Aussenwelt
      Uanderes.zfps(primearray.anzahl);
      schritte:=nlong(zahl);
      form1.schreibeinfofenster;
      end;

    if primetest.Euler(zahl,true) then   PrimeArray.add(zahl);   //hinzugefügt
    nadd(zahl,2);

  until ncmp(zahl,maxzahl)>0 ;

  form1.CheckPrimeArray.Enabled:=true;
end;
{-----------------------------------------------------------------------------
  Arguments:    MaxZahl:Integer; ab2:boolean=false
-----------------------------------------------------------------------------}
procedure TPrimzahlen.CalcPrimeArray(MaxZahl:Cardinal; ab2:boolean=false);
begin
  CalcPrimeArray(nint(MaxZahl),ab2);

//der Vergleich mit einer Rechnung ohne IInteger sondern mit Integer ist schneller und überrascht somit!!!

{var zahl:Cardinal;
begin
  //setzten der Anfangszahl
  if primeArray.anzahl=0 then
    begin
    primeArray.add(nint(2));
    zahl:=3;
    end
  else
    if ncmp(primeArray[-1],MaxZahl)<=0 then
      exit                         //damit er rausspringt wenn es garnix zu berechnen gibt
    else
      zahl :=nlong(primeArray[-1]);

  form1.CheckPrimeArray.Enabled:=false;

  if not odd(zahl) then inc(zahl);

  repeat
    if (primearray.anzahl mod 500 =0) or stop then
      begin
      application.ProcessMessages;
      if stop then exit;
      // hier kommt bla bla für die Aussenwelt
      Uanderes.zfps(primearray.anzahl);
      schritte:=zahl;
      form1.schreibeinfofenster;
      end;

    if primetest.Euler(nint(zahl),true) then   PrimeArray.add(nint(zahl));   //hinzugefügt
    zahl:=zahl+2;

  until zahl > maxzahl ;

  form1.CheckPrimeArray.Enabled:=true;}
end;
{-----------------------------------------------------------------------------
  Arguments:    MaxZahl:Int64; ab2:boolean=false
-----------------------------------------------------------------------------}
procedure TPrimzahlen.CalcPrimeArray(MaxZahl:Int64; ab2:boolean=false);
begin
  CalcPrimeArray(nint(MaxZahl),ab2);
end;


end.
