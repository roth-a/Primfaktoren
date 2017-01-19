{-----------------------------------------------------------------------------
 Unit Name: Uanderes
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}
unit Uanderes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,nrats,
  nints, UPrimfaktoren,JclFileUtils;



type
      Tsetofchar=set of char;

      procedure shellsort(var a:array of cardinal);   overload;
      procedure shellsort(var a:Tiiarray);            overload;

      procedure writeGrid(const zahl:string=''; faktor:string=''; Fermat:string=''; Euler:string='');                overload;
      procedure writeGrid(zeile:cardinal; const  zahl:string=''; faktor:string=''; Fermat:string=''; Euler:string='');overload;
      function artostr(ar:Tiiarray):string;
      procedure zfps(lauf:cardinal);
      function quadrat(zahl:iinteger):iinteger;
      function durch(divident,divisor:iinteger):iinteger;

      function wurzel(zahl:iinteger):iinteger;
      procedure NRoot(var R: IRational; const A: IInteger; Root: Integer);   overload;
      function  NRoot(const A: IInteger; Root: Integer; Precision:cardinal): IRational; overload;

      function Arnd(stellen:integer):IInteger;               overload;
      procedure Arnd(var zahl:IInteger; const stellen:integer);   overload;
      function Arnd0toMAX(MAXstellen:integer):IInteger;
      function ArndRange(min,max:IInteger):IInteger;

      function teilbar(zahl,m:iinteger):boolean;                overload;
      function teilbar(zahl:iinteger; m:integer):boolean;        overload;
      function teilbar(zahl,m:integer):boolean;                  overload;

      function anzstellen(zahl:IInteger):integer;      overload;
      function anzstellen(zahl:cardinal):integer;       overload;
      function anzstellen(zahl:string):integer;        overload;

      function bootostr(b:boolean):string;
      function boolsign(a:boolean):shortint;
      function boolUngleich(a,b:boolean):boolean;
      function boolGleich(a,b:boolean):boolean;

      procedure korrigiere(var s:String; const zeichen:Tsetofchar);
      function  ADialog(var return:integer; const cap,text:string; start,min,max:integer):boolean;    overload;
      function  ADialog(var return:string; const cap,text:string; zeichen:Tsetofchar=['0' .. '9',#22,#3,#8]):boolean;        overload;

      function GetFileVersion(FileName: string): string;

      function NFloat(const A: IRational): Extended; overload;

      function F2tostr(const a,b,c:Integer):string;

var     aktuellezahl,restzahl,temp:iinteger;
        time,fps:longint;
        // für die außenwelt
        schritte:cardinal;
implementation
uses unit1;


{-----------------------------------------------------------------------------
  Procedure:    bootostr
  Arguments:    b:boolean
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function bootostr(b:boolean):string;
begin
  //   if b then result:='Wahr' else result:='Falsch';
  //   if b then result:='True' else result:='False';
  if b then result:='Ja' else result:='Nein';
end;


{-----------------------------------------------------------------------------
  Description:  Gibt den Werte eines Boolean als 1 oder -1 aus
  Procedure:    boolsign
  Arguments:    a:boolean
  Result:       shortint
  Detailed description:
-----------------------------------------------------------------------------}
function boolsign(a:boolean):shortint;
begin
  if a then
    result:=1
  else
    result:=-1;
end;



{-----------------------------------------------------------------------------
  Description:  Vergleicht boolean  a<>b then true
  Procedure:    boolUngleich
  Arguments:    a,b:boolean
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function boolUngleich(a,b:boolean):boolean;
begin
  result:=true;                                              // Überprüfung durch überprüfung des Gegenteils
  if (a and b) or  (not(a) and not(b))  then result:=false;
end;

{-----------------------------------------------------------------------------
  Description:   a=b then true
  Procedure:    boolGleich
  Arguments:    a,b:boolean
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function boolGleich(a,b:boolean):boolean;
begin
  result:=false;                                              // Überprüfung durch überprüfung des Gegenteils
  if (a and b) or  (not(a) and not(b))  then result:=true;
end;






{-----------------------------------------------------------------------------
  Description:  Eine der schnellsten methoden zum Sortieren
  Procedure:    shellsort
  Arguments:    var a:array of cardinal
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure shellsort(var a:array of cardinal);
var  bis,i,j,k:longint;
      h:word;
begin
  bis:=high(a);
  k:= bis shr 1;
  while k>0 do
    begin
    for i:=0 to bis-k do
      begin
      j:=i;
      while (j>=0) and(a[j]>a[j+k]) do
        begin
        h:=a[j];
        a[j]:=a[j+k];
        a[j+k]:=h;
        if j>k then dec(j,k) else j:=0;
        end;
      end;
    k:= k shr 1;
    end;
end;
{-----------------------------------------------------------------------------
  Description:  Eine der schnellsten methoden zum Sortieren
  Procedure:    shellsort
  Arguments:    var a:Tiiarray
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure shellsort(var a:Tiiarray);
var  bis,i,j,k:longint;
    h:IInteger;
begin
  bis:=a.anzahl-1;
  k:= bis shr 1;
  while k>0 do
    begin
    for i:=0 to bis-k do
      begin
      j:=i;
      while (j>=0) and  (ncmp(a[j],a[j+k])>0 ) do
        begin
        nset(h,a[j]);
        a.writeIIArray(j,a[j+k]);
        a.writeIIArray(j+k,h);
        if j>k then dec(j,k) else j:=0;
        end;
      end;
    k:= k shr 1;
    end;
end;



{-----------------------------------------------------------------------------
  Description:  Listet ein Arra kurz in einem String auf       2^2, 3, 5^2, 11, 23
  Procedure:    artostr
  Arguments:    ar:Tiiarray
  Result:       string
  Detailed description:
                Durch zählen der Faktoren kann eine Potenzschreibweise gewählz werden
-----------------------------------------------------------------------------}
function artostr(ar:Tiiarray):string;
var i,potlauf:integer;
begin
  result:='';
  potlauf:=1;

  uanderes.shellsort(ar);

  for i:=0 to ar.anzahl-1 do
    begin
    if  ncmp(ar[i],ar[i+1])=0 then  //falls das jetztige element mit dem nächsten identisch ist, dann beginne zu zählen
      inc(potlauf);

    if  (potlauf =1) then    //wenn er nicht zählt
      result:=result+', '+nstr(ar[i])  ;         // wenn er nicht gezählt hat, dann schreibe normal

    if  (ncmp(ar[i],ar[i+1])<>0)and (potlauf >1) then      //wenn ende des zählens ist
      begin
      result:=result+', '+nstr(ar[i])+'^'+inttostr(potlauf);
      potlauf:=1;
      end;
    end;


  if (potlauf >1) then result:=result+', '+nstr(ar[ar.anzahl-1])+'^'+inttostr(potlauf);
  delete(result,1,2);
end;
{function artostr(ar:Tiiarray):string;
var i:integer;
begin
  result:=nstr(ar[0]);
  for i:=1 to ar.anzahl-1 do
    result:=result+', '+nstr(ar[i]);
end;}


{-----------------------------------------------------------------------------
  Description:  Sagt wie viele Schritte er pro sec macht
  Procedure:    zfps
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure zfps(lauf:cardinal);
begin
  schritte:=lauf;
  // if temp=nil then exit;
  nsub(temp,nint(lauf),temp);
  if (gettickcount-time)<> 0 then
    fps:=round(        (nint64(temp)/(gettickcount-time)*1000)*3/10   +fps*7/10        );          // ich muss hier in prozenten die alte fps mit eingehen lassen, da sonst die anzeige zu schnell wechselt
  nset(temp,nint(lauf));
  time:=gettickcount;
end;



{-----------------------------------------------------------------------------
  Description:  Wurzel als Fuktion
  Procedure:    wurzel
  Arguments:    zahl:iinteger
  Result:       iinteger
  Detailed description:
-----------------------------------------------------------------------------}
function wurzel(zahl:iinteger):iinteger;
begin
  nsqrt(zahl);
  result:=zahl;
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    NFloat
  Arguments:    const A: IRational
  Result:       Extended
  Autor:  Hagen Reddmann
  Detailed description:
-----------------------------------------------------------------------------}
function NFloat(const A: IRational): Extended; overload;
var
  N,D: IInteger;
  Ns,Ds: Integer;
begin
  if A <> nil then
  begin
    N := A.N;
    D := A.D;
    Ns := NSize(N);
    Ds := NSize(D);
    if Ns < 127 then NShl(N, 127 - Ns)
      else NShr(N, Ns - 127);
    if Ds < 64 then NShl(D, 64 - Ds)
      else NShr(D, Ds - 64);
    NDiv(N, D);
    Result := NFloat(N) * IntPower(2, Ns - Ds - 63);        // keine Rekursion denn n ist ein IInteger und kein IRational
  end else Result := 0.0;
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    NRoot
  Arguments:    var R: IRational; const A: IInteger; Root: Integer
  Result:       None
  Detailed description:  R = A^(1/Root)
-----------------------------------------------------------------------------}
procedure NRoot(var R: IRational; const A: IInteger; Root: Integer);
resourcestring
  sNRoot = 'NRoot(), invalid paramater Root, must be >= 2';
var
  N,D: IInteger;
  P: Cardinal;
begin
  if Root < 2 then NRaise(@sNRoot);
  P := NPrc(R);             // Genauigkeit in Bits holen
  NShl(N, A, P * Root);     // N := A * (2^p)^root == A * 2^(p*root) == A shl (p*root)
  while not Odd(Root) do
  begin
    NSqrt(N);
    Root := Root shr 1;
  end;
  if Root > 1 then
    nints.NRoot(N, Root);   // N := A^(1/root) * 2^p
  NBit(D, P, True);   // D := 2^p;  NBit() ist sehr sehr schnell
  NSet(R, N, D);      // R := N / D == A^(1/root) * 2^p / 2^p == A^(1/root) mit P Bits Genauigkeit
end;
{-----------------------------------------------------------------------------
  Description:  Oben als Funktion
  Procedure:    NRoot
  Arguments:    const A: IInteger; Root: Integer
  Result:       IRational
  Detailed description:
-----------------------------------------------------------------------------}
function NRoot(const A: IInteger; Root: Integer; Precision:cardinal): IRational;
begin
  nprc(result,precision);
  nroot(result,a,root);
end;




{-----------------------------------------------------------------------------
  Description:  Quadrat als Fuktion
  Procedure:    quadrat
  Arguments:    zahl:iinteger
  Result:       iinteger
  Detailed description:
-----------------------------------------------------------------------------}
function quadrat(zahl:iinteger):iinteger;
begin
  nsqr(zahl);
  result:=zahl;
end;


{-----------------------------------------------------------------------------
  Description:  zahl mod M =0 then true else false;
  Procedure:    teilbar
  Arguments:    zahl,m:iinteger
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function teilbar(zahl,m:iinteger):boolean;
begin
  nmod(zahl,m);
  result:= ncmp(zahl,0)=0;
end;
{-----------------------------------------------------------------------------
  Arguments:    zahl:iinteger; m:integer
-----------------------------------------------------------------------------}
function teilbar(zahl:iinteger; m:integer):boolean;
begin
  nmod(zahl,m);
  result:= ncmp(zahl,0)=0;
end;
{-----------------------------------------------------------------------------
  Arguments:    zahl,m:integer
-----------------------------------------------------------------------------}
function teilbar(zahl,m:integer):boolean;
begin
  result:= zahl mod m =0;
end;


{-----------------------------------------------------------------------------
  Description:   Division als Funktion
  Procedure:    durch
  Arguments:    divident,divisor:iinteger
  Result:       iinteger
  Detailed description:
-----------------------------------------------------------------------------}
function durch(divident,divisor:iinteger):iinteger;
begin
  ndiv(divident,divisor);
  result:=divident;
end;



{-----------------------------------------------------------------------------
  Description:  Schreibt in das Stringgrid  und fügt immer eine neue Zeile hinzu
  Procedure:    writeGrid
  Arguments:    const zahl:string=''; faktor:string=''; Fermat:string=''; Euler:string=''
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure writeGrid(const zahl:string=''; faktor:string=''; Fermat:string=''; Euler:string='');
begin
  form1.StringGrid1.RowCount:=form1.StringGrid1.RowCount+1;
  form1.StringGrid1.Cells[0,form1.StringGrid1.RowCount-1]:=zahl;
  form1.StringGrid1.Cells[1,form1.StringGrid1.RowCount-1]:=faktor;
  form1.StringGrid1.Cells[2,form1.StringGrid1.RowCount-1]:=Fermat;
  form1.StringGrid1.Cells[3,form1.StringGrid1.RowCount-1]:=Euler;
  form1.StringGrid1.Row:=form1.StringGrid1.RowCount-1;
  form1.StringGrid1.Col:=0;
end;


{-----------------------------------------------------------------------------
  Description:  Schreibt in das Stringgrid und kann auch Zeilen überschreiben
  Procedure:    writeGrid
  Arguments:    zeile:cardinal; const zahl:string=''; faktor:string=''; Fermat:string=''; Euler:string=''
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure writeGrid(zeile:cardinal; const  zahl:string=''; faktor:string=''; Fermat:string=''; Euler:string='');
begin
  if zeile>=form1.StringGrid1.RowCount then writeGrid(zahl,faktor,fermat,euler)
  else
    begin
    form1.StringGrid1.Cells[0,zeile]:=zahl;
    form1.StringGrid1.Cells[1,zeile]:=faktor;
    form1.StringGrid1.Cells[2,zeile]:=Fermat;
    form1.StringGrid1.Cells[3,zeile]:=Euler;
    if zeile=0 then form1.StringGrid1.Row:=1;
    form1.StringGrid1.Col:=0;
    end;
end;






{-----------------------------------------------------------------------------
  Description:  Zufallszahlen auf Dezimalstellen
  Procedure:    Arnd
  Arguments:    stellen:integer
  Result:       IInteger
  Detailed description:    anstadt auf Bytes
-----------------------------------------------------------------------------}
function Arnd(stellen:integer):IInteger;
begin
//   nrnd(result,round(       (random(stellen-1)+1)      /math.Log10(2)));
  nrnd(result,round(stellen/math.Log10(2)     ));
end;
{-----------------------------------------------------------------------------
  Description:   Wie oben nur als Procedure
  Arguments:    var zahl:IInteger; const stellen:integer
-----------------------------------------------------------------------------}
procedure Arnd(var zahl:IInteger; const stellen:integer);
begin
  nset(zahl,Arnd(stellen));
end;


{-----------------------------------------------------------------------------
  Description:  Keine bestimmte Anzahl von Stellen sondern nur MAX-Stellen
  Procedure:    Arnd0toMAX
  Arguments:    MAXstellen:integer
  Result:       IInteger
  Detailed description:
-----------------------------------------------------------------------------}
function Arnd0toMAX(MAXstellen:integer):IInteger;
begin
  nrnd(result,round(       (random(MAXstellen-1)+1)      /math.Log10(2)));
end;

{-----------------------------------------------------------------------------
  Description:  Zufallsbereich der Zufallszahlen
  Procedure:    ArndRange
  Arguments:    min,max:IInteger
  Result:       IInteger
  Detailed description:       Beim generieren wird keine Beachtung auf die Beschränkung gelegt
                              sondern es werden später nur die durchgelassen die in die Beschränkung passen.
-----------------------------------------------------------------------------}
function ArndRange(min,max:IInteger):IInteger;
begin
  repeat
    nrnd(result,anzstellen(max)+1);
  until (ncmp(min,result)<=0)and(ncmp(max,result)>=0) ;
end;






{-----------------------------------------------------------------------------
  Description:  Berechnet die Stellen einer Zahl
  Procedure:    anzstellen
  Arguments:    zahl:IInteger
  Result:       integer
  Detailed description:
-----------------------------------------------------------------------------}
function anzstellen(zahl:IInteger):integer;
begin
  result:=length(nstr(zahl));
end;
{-----------------------------------------------------------------------------
  Arguments:    zahl:cardinal
-----------------------------------------------------------------------------}
function anzstellen(zahl:cardinal):integer;
begin
  result:=length(inttostr(zahl));
end;
{-----------------------------------------------------------------------------
  Arguments:    zahl:string
-----------------------------------------------------------------------------}
function anzstellen(zahl:string):integer;
begin
  result:=length(zahl);
end;



{-----------------------------------------------------------------------------
  Description:  Löscht Zeichen die da nicht reinpassen
  Procedure:    korrigiere
  Arguments:    var s:String; const zeichen:Tsetofchar
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure korrigiere(var s:String; const zeichen:Tsetofchar);
var c : word;
begin
  c:=1;
  while c<= length(s) do
    begin
    if not(s[c] in zeichen)  then
      delete(s,c,1)
    else
      inc(c);
    end;
end;




{-----------------------------------------------------------------------------
  Description:  Eingabedialog
  Procedure:    ADialog
  Arguments:    var return:integer; const cap,text:string; start,min,max:integer
  Result:       boolean
  Detailed description:
                Gibt true zurück wenn OK
                wenn Canel dann false

                überprüft ob das eine Integer Zahl und korrigier wenn nötig
-----------------------------------------------------------------------------}
function  ADialog(var return:integer; const cap,text:string; start,min,max:integer):boolean;
var temps:string;
begin
  result:=false;
  temps:=inttostr(start);
  if dialogs.InputQuery(cap,text,temps) then
    begin
    result:=true;
    if temps='' then exit;
    uanderes.korrigiere(temps,['0' .. '9','-']);
    if temps='' then return:=0 else return:= strtoint(temps);
    if return>max then return:=max;
    if return<min then return:=min;
    end;
end;
{-----------------------------------------------------------------------------
  Description:  Gibt String zurück und prüft auf Zeichen
  Arguments:    var return:string; const cap,text:string; zeichen:Tsetofchar
-----------------------------------------------------------------------------}
function  ADialog(var return:string; const cap,text:string; zeichen:Tsetofchar=['0' .. '9',#22,#3,#8]):boolean;
begin
  result:=false;
  if dialogs.InputQuery(cap,text,return) then
    begin
    if return='' then exit;
    result:=true;
    uanderes.korrigiere(return,zeichen);
    end;
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    GetFileVersion
  Arguments:    FileName: string
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function GetFileVersion(FileName: string): string;
var fi: TJclFileVersionInfo;
begin
  fi:=TJclFileVersionInfo.Create(FileName);
  try
    result:=fi.FileVersion;
  finally
    fi.free;
  end;
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    F2tostr
  Arguments:    const a,b,c:Integer
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function F2tostr(const a,b,c:Integer):string; overload;
var schonDavor:boolean;

  function Koeffizient(k:Integer):string;
  begin
    case k of
      0:result:='';
      1:begin
        if schonDavor then
          result:='+ '
        else
          result:=' '
        end;
      -1:result:='- ';
    else
      begin
      if k>=0 then
        if schonDavor then
          result:='+ '
        else
          result:=' '
      else
        result:='- ';
      result:=result+inttostr(abs(k));
      end;
    end;
  end;
begin
//  result:='f(x)='+inttostr(a)+'x^2 + '+inttostr(b)+'x + '+inttostr(c);

  schonDavor:=false;

  result:='f(x)= ';

  if a<>0 then
    begin
    result:=result+Koeffizient(a)+'x^2 ';
    schonDavor:=true;
    end;


  if b<>0 then
    begin
    result:=result+Koeffizient(b)+'x ';
    if b<>0 then
      schonDavor:=true;
    end;


  case c of
    0:result:=result+'';
    1:begin
      if schonDavor then
        result:=result+'+ 1'
      else
        result:=result+' 1'
      end;
    -1:result:=result+'- 1';
  else
    result:=result+Koeffizient(c);
  end;


//result:=result+'___'+'f(x)='+inttostr(a)+'x^2 + '+inttostr(b)+'x + '+inttostr(c);
end;





end.



