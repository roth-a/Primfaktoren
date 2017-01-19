{-----------------------------------------------------------------------------
 Unit Name: UMathematik
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
 Description:   Mathematische Reihen und Besonderheiten
-----------------------------------------------------------------------------}
unit UMathematik;


interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,nints,math,nrats;


type
  TMathematik=class
  public
    function   QFtostr(a,b,c:IInteger):string;

    procedure PerfekteZahlen(const MaxStellen:integer);
    function  QuadratischeFunktion(const x,a,b,c:IRational):IRational;  overload;
    function  QuadratischeFunktion(const x,a,b,c:IInteger):IInteger;    overload;

  end;



var  Mathematik:TMathematik;


implementation
uses Uprimfaktoren,Uitisprime,UAnderes,UPrimetest;






{-----------------------------------------------------------------------------
  Description:  Perfekte Zahlen  auflisten
  Procedure:    PerfekteZahlen
  Arguments:    const MaxStellen:integer
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TMathematik.PerfekteZahlen(const MaxStellen:integer);
var zahl,tempi:iinteger;
    c:cardinal;
begin
  c:=2;
  faktoren.leereArray;
  repeat
    application.ProcessMessages;
    if stop then break;

    npow(tempi,nint(2),c);
    nsub(tempi,1);

    if itisprime.AutoMethode(tempi) then
      begin
      npow(zahl,2,c-1);
      nmul(zahl,tempi);                      // 2^(n - 1)  *(2^n - 1)

      faktoren.add(zahl);
      Uanderes.writeGrid(nstr(zahl),inttostr(Uanderes.anzstellen(zahl)));
      end;
    inc(c);
  until c*log10(2)*2>MaxStellen;        // tempi ist 2^c; da aber c*lg(2)=MaxStellen
end;





{-----------------------------------------------------------------------------
  Description:  f(x)=ax^2+bx+c
  Procedure:    QuadratischeFunktion
  Arguments:    const x,a,b,c:IRational
  Result:       IRational
  Detailed description:      f(x)=ax^2+bx+c
-----------------------------------------------------------------------------}
function  TMathematik.QuadratischeFunktion(const x,a,b,c:IRational):IRational;
var mittelteil:IRational;
begin
  // ax^2
  nsqr(result,x);
  nmul(result,a);
  // bx
  nmul(mittelteil,x,b);
  //  alles addieren
  nadd(result,mittelteil);
  nadd(result,c);
end;
{-----------------------------------------------------------------------------
  Description:  f(x)=ax^2+bx+c
  Procedure:    QuadratischeFunktion
  Arguments:    const x,a,b,c:IInteger
  Result:       IInteger
  Detailed description:   f(x)=ax^2+bx+c
-----------------------------------------------------------------------------}
function  TMathematik.QuadratischeFunktion(const x,a,b,c:IInteger):IInteger;
var mittelteil:IInteger;
begin
  // ax^2
  nsqr(result,x);
  nmul(result,a);
  // bx
  nmul(mittelteil,x,b);
  //  alles addieren
  nadd(result,mittelteil);
  nadd(result,c);
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    QFtostr
  Arguments:    a,b,c:IInteger
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function   TMathematik.QFtostr(a,b,c:IInteger):string;
begin
{  result:=nstr(a)+'x^2 ';
  if nneg(}


end;




end.
