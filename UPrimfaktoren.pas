{-----------------------------------------------------------------------------
 Unit Name: UPrimfaktoren
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
 Beschreibung:
      Erst mal muss ich dem Programmierer von DEC, Hagen Reddmann, danken.
      Er hat diese wundervolle Library geschrieben, mit der man mit so großen Zahlen rechnen kann wie man will.  (Bis der Speicher voll ist.)
-----------------------------------------------------------------------------}

unit UPrimfaktoren;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,
  nints;



type

      TRekursivHilfe=(RStart,RContinue,RStop);

      Tiiarray=class
        private
          FIIarray:array of IInteger;
          function readIIArray(idx:integer):IInteger;
        public
          anzahl:cardinal;
          Lauf:cardinal;
          RekursivHilfe:TRekursivHilfe;
          procedure leereArray;
          procedure add(const zahl:iinteger);
          procedure writeIIArray(idx:integer; value:IInteger);
          property IIarray[idx:integer]:IInteger read readIIArray write writeIIArray;          default;
        end;


      tprimfaktoren= class
        private
          function FrageObTrotzPrimWeiter(zahl:IInteger):boolean;

          procedure TeileDurch2(var zahl:iinteger);
          function TeileDurch(var zahl:iinteger; const Divisor:iinteger; DelDouble:boolean=false):boolean;
        public
          function ungeradeZahlen(zahl:iinteger; MaxZahl:iinteger; FaktorenbeginnAmAnfang:boolean=false; StartNewLaufPrimeArray:boolean=false):IInteger;overload;
          procedure ungeradeZahlen(zahl:iinteger; FaktorenbeginnAmAnfang:boolean=false; StartNewLaufPrimeArray:boolean=false);                    overload;
          procedure pollardRho(zahl:iinteger;  summand:cardinal=0; startwert:cardinal=0);

          procedure AutoMethode(zahl:iinteger; FaktorenbeginnAmAnfang:boolean=false);
          function GGT(a, b: iinteger): iinteger;
      end;



const goesenSchranke=10000000;
var    primfaktoren:tprimfaktoren;

       faktoren : Tiiarray;

       stop:boolean;

implementation
uses unit1,Uanderes,UPrimeTest,Uitisprime,UStopTime,Uprimzahlen;


{-----------------------------------------------------------------------------
  Description:  Fließt die Werte aus  für die Property
  Procedure:    readIIArray
  Arguments:    idx:integer
  Result:       IInteger
  Detailed description:
  
-----------------------------------------------------------------------------}
function Tiiarray.readIIArray(idx:integer):IInteger;             // idx=-1  ist letzte Eintrag
begin
  if not(Assigned(FIIarray))or(idx>anzahl-1)or(idx<-2) then
    begin
    nset(result,1);
    exit;
    end;

  if  idx=-1 then idx:=anzahl-1 ;
  nset(result,Fiiarray[idx]);
end;


{-----------------------------------------------------------------------------
  Description:  Gibt die Werte für die Property aus
  Procedure:    writeIIArray
  Arguments:    idx:integer; value:IInteger
  Result:       None
  Detailed description:

-----------------------------------------------------------------------------}
procedure Tiiarray.writeIIArray(idx:integer; value:IInteger);           // idx=-1  ist letzte Eintrag
begin
  if ncmp(value,1)<0 then exit;

  if  Assigned(FIIarray) then
    begin
    if idx>=length(FIIarray) then  setlength(FIIarray,idx+1)
    end
  else
     setlength(FIIarray,1);

  anzahl:=length(FIIarray);

  if idx=-1 then idx:=anzahl-1;

  nset(FIIarray[idx],value);
end;


{-----------------------------------------------------------------------------
  Description:  leert das Array
  Procedure:    leereArray
  Arguments:    None
  Result:       None
  Detailed description:

-----------------------------------------------------------------------------}
procedure Tiiarray.leereArray;
begin
  FIIarray:=nil;
  anzahl:=0;
  lauf:=0;
end;


{-----------------------------------------------------------------------------
  Description:  Fügt dem Array ein wieteren Punkt hinzu und beschreibt ihn
  Procedure:    add
  Arguments:    var ar:Tiiarray; const zahl:iinteger
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure Tiiarray.add(const zahl:iinteger);
begin
  writeIIArray(anzahl,zahl);
end;









{==============================================================================
  Procedure:    FrageObTrotzPrimWeiter	
  Belongs to:   tprimfaktoren
  Result:       boolean
  Parameters:   
                  zahl : IInteger  =   
                    
  Description:  
==============================================================================}
function tprimfaktoren.FrageObTrotzPrimWeiter(zahl:IInteger):boolean;
var    fragezahl:string;
begin
  //fragen wenn die Zahl groß ist
  fragezahl:=nstr(zahl);
  if length(fragezahl)>50 then delete(fragezahl,50,length(fragezahl)-50);
  fragezahl:=fragezahl+'...'   ;

   case MessageDlg('Der Primzahltest hat ergeben, dass diese Zahl ('+fragezahl+'  Stellen= '+inttostr(length(nstr(zahl)))+') wahrscheinlich eine Primzahl ist.'+#13+#10+''+#13+#10+'Klicken Sie Ja für:'+#13+#10+'  Sie akzeptieren eine winzige Wahrscheinlichkeit, dass diese Zahl keine Primzahl ist.'+#13+#10+''+#13+#10+'Klicken Sie Nein für:'+#13+#10+'  Sie wollen diese große Zahl wirklich sicher überpüfen lassen. Dies würde extrem lange dauern.', mtConfirmation, [mbYes, mbNo], 0) of
    mrYes: result:=false ;
    mrNo:  result:=true;
  end;
end;


{==============================================================================
  Procedure:    AutoMethode
  Belongs to:   tprimfaktoren
  Result:       None
  Parameters:   
                  zahl : iinteger  =   
                  FaktorenbeginnAmAnfang : boolean  = false  
                    
  Description:  Wählt eine automatische Methode aus um die Primfaktoren auszurechnen
==============================================================================}
procedure tprimfaktoren.AutoMethode(zahl:iinteger; FaktorenbeginnAmAnfang:boolean=false);
var IstPrim:boolean;
    temp:IInteger;
begin
  TeileDurch2(zahl);    //der Faktor 2 wird vollständig eliminiert

  IstPrim:=primetest.Euler(zahl);
  if  (ncmp(zahl, quadrat(nint(goesenSchranke))) >0) and IstPrim  then  //wenn zu groß und prim
    begin
    if FrageObTrotzPrimWeiter(zahl) then      //wenn zu groß und trotzdem soll gerechnet werden
      primfaktoren.ungeradeZahlen(zahl,FaktorenbeginnAmAnfang,true)
    else        //wenn zu groß und ncih gerechnet werden soll
      begin
      faktoren.add(zahl);
      if form1.BCheckDetail then Uanderes.writeGrid('1',nstr(faktoren[-1]));
      end;
    end
  else   // wenn es keine Primzahl, oder noch zerlegbar ist dann
    begin
    if form1.BCheckPrimeArray then
      primearray.RekursivHilfe:=RStart;

    temp:=primfaktoren.ungeradeZahlen(zahl,nint(goesenSchranke),FaktorenbeginnAmAnfang,true);
    if (ncmp(temp,0)<>0) then  //wenn es noch nicht ganz zerlegt wurde, dann
      if primetest.Euler(temp) then
          AutoMethode(temp,false)
      else
        self.pollardRho(temp)
    end;
end;



{==============================================================================
  Procedure:    TeileDurch
  Belongs to:   tprimfaktoren
  Result:       boolean
  Parameters:
                  zahl : iinteger  =
                  Divisor : iinteger  =
                  DelDouble : boolean  = false

  Description:  Teilt durch den Divisor und fügt den Faktor dem faktoren Array hinzu
                Rückgabe ist result:= (zahl mod divisor =0)
==============================================================================}
function tprimfaktoren.TeileDurch(var zahl:iinteger; const Divisor:iinteger; DelDouble:boolean=false):boolean;
var anz:word;
begin
  result:=false;
  anz:=0;
  nset(aktuellezahl,Divisor);
  while uanderes.teilbar(zahl,Divisor) do
    begin
    inc(anz);
    result:=true;
    inc(schritte);

    if not DelDouble  or (anz<=1)  then  //entweder sollen sie immer hinzugefügt werden, oder es wurde noch nie hinzugefügt
      faktoren.add(Divisor);   // da das ja ein faktor ist wird er hinzugefügt

    ndiv(zahl,Divisor);
    if form1.BCheckDetail then Uanderes.writeGrid(nstr(zahl),nstr(faktoren[-1]));
    end;
end;



{-----------------------------------------------------------------------------
  Description:  Teilt durch den Faktor 2
  Procedure:    TeileDurch2
  Arguments:    zahl:iinteger
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure tprimfaktoren.TeileDurch2(var zahl:iinteger);
begin
  nset(aktuellezahl,2);
  while not nodd(zahl) do
    begin
    inc(schritte);

    faktoren.add(nint(2));   // da das ja ein faktor ist wird er hinzugefügt
    ndiv(zahl,2);
    if form1.BCheckDetail then Uanderes.writeGrid(nstr(zahl),nstr(faktoren[-1]));
    end;
end;


{==============================================================================
  Procedure:    ungeradeZahlen	
  Belongs to:   tprimfaktoren
  Result:       IInteger
  Parameters:   
                  zahl : iinteger  =   
                  MaxZahl : iinteger  =   
                  FaktorenbeginnAmAnfang : boolean  = false  
                  StartNewLaufPrimeArray : boolean  = false  
                    
  Description:  
      Bekommt durch druchprobieren der ungeraden Zahlen heraus ob Primzahl oder nicht
                                                          --> Dann Faktoren in Array
      Diese Procedure errechnet die Primfakoren einer Zahl, ohne die (un)nötgen Primzahlen auszurechnen.
      Dadurch hat es den Vorteil relativ schnell zu sein,
      da das Programm sonst enorm viel Zeit darauf verwenden müsste die Primzahlen zu prüfen.

      Er gibt die Rest Zahl zurück falls er sie nicht mehr berechnen kann wegen der Sperre,
        wenn er komplett fertig ist gibt er 0 zurück
==============================================================================}
function tprimfaktoren.ungeradeZahlen(zahl:iinteger; MaxZahl:iinteger; FaktorenbeginnAmAnfang:boolean=false; StartNewLaufPrimeArray:boolean=false):IInteger;
var afaktor:iinteger;
    MussAktualisiertWerden:cardinal;
begin
  if ncmp(MaxZahl,uanderes.wurzel(zahl))>0 then
    begin
    MaxZahl:=uanderes.wurzel(zahl);
    nadd(MaxZahl,1);
    end;

  TeileDurch2(zahl);
  //wie oft aktualisiert werden muss
  if Uanderes.anzstellen(zahl)>0 then
    MussAktualisiertWerden:=round(200000000  /sqr(Uanderes.anzstellen(zahl)))+1
  else
    MussAktualisiertWerden:=1000000;

  // wann er das primearray benutzt     in den anderen beiden Fällen soll er hier ja garnix machen
  if primeArray.RekursivHilfe=RStart then
    begin
    primearray.Lauf:=1;   // primearray[1]=3
    primeArray.RekursivHilfe:=RContinue;
    end;

  if not geschop then  form1.LNowProbierverfahren.Font.Color :=clgreen;
  if  (faktoren.anzahl=0)or(FaktorenbeginnAmAnfang) then
    nset(afaktor,3)
  else
    nset(afaktor,faktoren[-1] );
  nodd(afaktor,true);

  while  (ncmp(afaktor,MaxZahl)<=0) do                 // genau das selbe wie  afaktor,  Uanderes.wurzel(zahl)
    begin
    inc(schritte);
    if (not geschop)and( Uanderes.teilbar(schritte,MussAktualisiertWerden)) then
      begin
      form1.schreibeinfofenster;
      application.ProcessMessages;
      if stop then exit;
      // hier kommt bla bla für die Aussenwelt
      nset(aktuellezahl,afaktor);
      nset(restzahl,zahl);
      Uanderes.zfps(schritte);
      end;

    TeileDurch(zahl,afaktor);

    // afaktor hochsetzen
    if primeArray.RekursivHilfe=RContinue then
      begin
      nset(afaktor,PrimeArray[primearray.Lauf]) ;
      inc(primearray.Lauf);
      if primearray.Lauf>=primearray.anzahl then primeArray.RekursivHilfe:=RStop;
      end
    else
      nadd(afaktor,2);                     //    else   nadd(afaktor,2);   //früher war das ohne das primeArray so

    end;

  if (ncmp(uanderes.quadrat(MaxZahl),zahl)<0) then
    result:=zahl
  else
    begin
    nset(result,0);
    faktoren.add(zahl);  // die zahl, die keine weiteren Teiler hat wird hier hinzugefügt
    if form1.BCheckDetail then Uanderes.writeGrid('1',nstr(faktoren[-1]));
    end;

  if not geschop then  form1.LNowProbierverfahren.Font.Color :=clblack;
end;

{==============================================================================
  Parameters:
                  zahl : iinteger  =
                  FaktorenbeginnAmAnfang : boolean  = false
                  StartNewLaufPrimeArray : boolean  = false
==============================================================================}
procedure tprimfaktoren.ungeradeZahlen(zahl:iinteger; FaktorenbeginnAmAnfang:boolean=false; StartNewLaufPrimeArray:boolean=false);
var max:IInteger;
begin
  max:=uanderes.wurzel(zahl);
  nadd(max,1);

  self.ungeradeZahlen(zahl,max,FaktorenbeginnAmAnfang, StartNewLaufPrimeArray);
end;


{-----------------------------------------------------------------------------
  Description:  Pollard-Rho-Methode
  Procedure:    pollardRho
  Arguments:    zahl:iinteger; summand:cardinal=0; startwert:cardinal=0
  Result:       None
  Detailed description:       http:// de.wikipedia.org/wiki/Pollard-Rho-Methode
-----------------------------------------------------------------------------}
procedure tprimfaktoren.pollardRho(zahl:iinteger;  summand:cardinal=0; startwert:cardinal=0);
var z1,z2,temp:iinteger;


    function funktion(const vor:iinteger):iinteger;
    begin
      nset(result,Uanderes.quadrat(vor));
      nadd(result,summand);
      nmod(result,zahl);
    end;

begin
  TeileDurch2(zahl);

  nset(aktuellezahl,0);
  if not geschop then  form1.LNowPollard.Font.Color :=clgreen;
  schritte:=0;

  if summand =0 then summand:=random(100)+2;
  if startwert=0 then  startwert:= random(100)+2;

  nset(z1,funktion(   nint(startwert)   ));
  nset(z2,funktion(funktion(z1)));

  nsub(temp,z1,z2);

  repeat
    inc(schritte);
    if (not geschop)and( Uanderes.teilbar(schritte,10000)) then
      begin
      // hier kommt bla bla für die Aussenwelt
      form1.schreibeinfofenster;
      application.ProcessMessages;
      if stop then exit;

      nset(aktuellezahl,0);
      nset(restzahl,zahl);
      Uanderes.zfps(schritte);
      end;

    nset(z1,funktion(z1));
    nset(z2,funktion(funktion(z2)));

    nsub(temp,z1,z2);
  // until  not(NGCD1(temp,zahl)) ;    // bis keine relativen primzahlen mehr
  until  not(itisprime.teilerfremd(temp,zahl)) ;    // bis keine relativen primzahlen mehr

  application.ProcessMessages;
  if stop then exit;

  // gefunden
  nset(z1,ggt(temp,zahl));
  // NGCD(z1,temp,zahl);

  AutoMethode(z1,true);       // rekursion  oder übergabe an andere Procedure        //   rekursion   rekursion   rekursion   rekursion   rekursion   rekursion   rekursion   rekursion
  ndiv(z2,zahl,z1);
  AutoMethode(z2,true);      //   rekursion   rekursion   rekursion   rekursion   rekursion   rekursion   rekursion   rekursion

  if not geschop then  form1.LNowPollard.Font.Color :=clblack;
end;





{-----------------------------------------------------------------------------
  Description:  GGT
  Procedure:    GGT
  Arguments:    a, b: iinteger
  Result:       iinteger
  Detailed description:  Berechnet GGt mit Hilfe von Modulo und gibt den ggt (Größten Gemeinsamen Teiler raus
-----------------------------------------------------------------------------}
function tprimfaktoren.GGT(a, b: iinteger): iinteger;
begin
  repeat
    nset(Result, b);
    nswp(a, b);
    nmod(b,a);
  until ncmp(b,0)=0 ;
end;










end.
