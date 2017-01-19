{-----------------------------------------------------------------------------
 Unit Name: Unit1
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}




{**************************************************************************
Infos zu Zahlen:
  http://de.wikipedia.org/wiki/Liste_besonderer_Zahlen#Bis_1_Milliarde
**************************************************************************}


unit Unit1;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs,  ExtCtrls,  nints, Menus, Grids, JvExStdCtrls, JvButton, JvCtrls,
  StdCtrls, JvExControls, JvComponent, JvOutlookBar ,  Shellapi,decutil,
  dateutils,   math, ComCtrls, nrats,strutils,xpman;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    JvOutlookBar1: TJvOutlookBar;
    CheckDetail: TCheckBox;
    JvImgBtn1: TJvImgBtn;
    PopupMenu1: TPopupMenu;
    abelleinDateispeichern1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Label5: TLabel;
    Label7: TLabel;
    Label111: TLabel;
    Label3: TLabel;
    Label120: TLabel;
    Label4: TLabel;
    Label130: TLabel;
    Label6: TLabel;
    Label132: TLabel;
    Label8: TLabel;
    Label140: TLabel;
    Label9: TLabel;
    Label110: TLabel;
    Label10: TLabel;
    Label150: TLabel;
    NormaleSpaltenbreite1: TMenuItem;
    N1: TMenuItem;
    GleichgroeSpaltenbreite1: TMenuItem;
    StringGrid1: TStringGrid;
    LNowProbierverfahren: TLabel;
    LNowPollard: TLabel;
    CheckPrimeArray: TCheckBox;
    BVorausberechnung: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure JvOutlookBarMain0Button3(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure JvOutlookBarMain0Button5(Sender: TObject);
    procedure JvOutlookBarMain0Button2(Sender: TObject);
    procedure JvOutlookBarMain0Button0(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure lblTypingClick(Sender: TObject);
    procedure JvOutlookBarMain3Button0(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure JvOutlookBarMain3Button1(Sender: TObject);
    procedure JvOutlookBarMain2Button0(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure abelleinDateispeichern1Click(Sender: TObject);
    procedure SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure JvOutlookBarMain2Button1(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure JvOutlookBarMain1Button0(Sender: TObject);
    procedure JvOutlookBarMain1Button1(Sender: TObject);
    procedure JvOutlookBarMain3Button2(Sender: TObject);
    procedure JvOutlookBarMain3Button3(Sender: TObject);
    procedure JvOutlookBarMain2Button2(Sender: TObject);
    procedure NormaleSpaltenbreite1Click(Sender: TObject);
    procedure GleichgroeSpaltenbreite1Click(Sender: TObject);
    procedure JvOutlookBarMain2Button3(Sender: TObject);
    procedure JvOutlookBarMain0Button4(Sender: TObject);
    procedure JvOutlookBarMain2Button4(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvOutlookBarMain2Button5(Sender: TObject);
    procedure CheckPrimeArrayClick(Sender: TObject);
    procedure BVorausberechnungClick(Sender: TObject);
    procedure JvOutlookBarMain3Button4(Sender: TObject);
    procedure CheckDetailClick(Sender: TObject);
    procedure JvOutlookBarMain2Button6(Sender: TObject);
    procedure JvOutlookBarMain4Button0(Sender: TObject);
    procedure JvOutlookBarMain4Button1(Sender: TObject);
    procedure JvOutlookBarMain4Button2(Sender: TObject);
    procedure JvOutlookBar1Pages1Buttons2Click(Sender: TObject);
    procedure JvOutlookBar1Pages2Buttons6Click(Sender: TObject);
  private
    { Private declarations }
        procedure zufallpruefung(stellen:word);
        procedure spaltenGleichGros;
        procedure spaltenNormal;
        procedure spaltengroesse(spal1,spal2,spal3,spal4:integer);
        function BerechAnfang(BCheckDetail:boolean=false;  Bgeschop:boolean=false;  Bloeschen:boolean=true):boolean;
        procedure BerechEnde(BCheckDetail:boolean=false);
        procedure EigabefeldBerechnen(SZahl:string);
  public
    { Public declarations }
        BCheckPrimeArray,
        BCheckDetail:boolean;


        procedure ausgabe(zahl:IInteger);
        procedure loeschen;
        procedure schreibeinfofenster;
    end;


var
  Form1: TForm1;

  geschOp,    // geschwindigkeitsoptimiert für Zahlendurchlauf
  amrechnen:boolean;

  version:string='3.6';

implementation
uses  UPrimfaktoren,UPrimeTest,Uanderes,UItIsPrime,UstopTime,Utxt,Uprimzahlen,  Unit2,Umathematik;

{$R *.dfm}





procedure Tform1.spaltenGleichGros;
begin
  self.StringGrid1.ColWidths[0]:=150;
  self.StringGrid1.ColWidths[1]:=200;
  self.StringGrid1.ColWidths[2]:=110;
  self.StringGrid1.ColWidths[3]:=110;
end;


procedure Tform1.spaltenNormal;
begin
  self.StringGrid1.ColWidths[0]:=290;
  self.StringGrid1.ColWidths[1]:=250;
  self.StringGrid1.ColWidths[2]:=70;
  self.StringGrid1.ColWidths[3]:=70;
end;


procedure Tform1.spaltengroesse(spal1,spal2,spal3,spal4:integer);
begin
  self.StringGrid1.ColWidths[0]:=spal1;
  self.StringGrid1.ColWidths[1]:=spal2;
  self.StringGrid1.ColWidths[2]:=spal3;
  self.StringGrid1.ColWidths[3]:=spal4;
end;


procedure Tform1.loeschen;
begin
  self.StringGrid1.RowCount:=2;

  Label111.Caption:='';
  Label120.Caption:='';
  Label130.Caption:='';
  Label132.Caption:='';
  Label140.Caption:='';
  Label110.Caption:='';
  Label150.Caption:='';
end;


{-----------------------------------------------------------------------------
  Description:  Macht Standartaktionen am Anfang
  Procedure:    BerechAnfang
  Arguments:    BCheckDetail:boolean=false;Bloeschen:boolean=true
  Result:       boolean
  Detailed description:
        Das muss immer vor den Dialogen stehen die exit machen, da sonst BerechEnde nicht ausgeführt wird
-----------------------------------------------------------------------------}
function Tform1.BerechAnfang(BCheckDetail:boolean=false;  Bgeschop:boolean=false;  Bloeschen:boolean=true):boolean;
begin
  result:= amrechnen;
  if result then exit;

  faktoren.leereArray;

  amrechnen:=true;
  stop:=false;
  label2.Caption:='Bitte Warten';
  self.LNowProbierverfahren.Font.Color :=clblack;
  self.LNowPollard.Font.Color :=clblack;

  Uanderes.writeGrid(0,'Zerkleinerte Zahl','Primfaktor','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');

  self.CheckDetail.Checked:=BCheckDetail;
  self.StringGrid1.SetFocus;
  geschop:=Bgeschop;
  if Bloeschen then loeschen;
end;


{-----------------------------------------------------------------------------
  Description:  Macht Standartaktionen am Ende
  Procedure:    BerechEnde
  Arguments:    BCheckDetail:boolean=false
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure Tform1.BerechEnde(BCheckDetail:boolean=false);
begin
  if stop then
    Uanderes.writeGrid('Abbruch')
  else
    Uanderes.writeGrid('Fertig');

  label2.Caption:='';
  edit1.SetFocus;
  amrechnen:=false;
  stop:=false;
  geschop:=false;

  self.CheckDetail.Checked:=BCheckDetail;

  schreibeinfofenster;
  self.LNowProbierverfahren.Font.Color :=clblack;
  self.LNowPollard.Font.Color :=clblack;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    ausgabe
  Arguments:    zahl:IInteger
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure Tform1.ausgabe(zahl:IInteger);
begin
  if Uanderes.anzstellen(zahl)<500 then
    Uanderes.writeGrid(nstr(zahl),
                          nstr(faktoren[-1]),
                          Uanderes.bootostr(PrimeTest.Fermat(zahl)),
                          Uanderes.bootostr(PrimeTest.Euler(zahl)))
  else
    Uanderes.writeGrid(nstr(zahl),
                          nstr(faktoren[-1]));
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    EigabefeldBerechnen
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.EigabefeldBerechnen(SZahl:string);
begin
  self.spaltenNormal;
  schritte:=0;
  faktoren.leereArray;

  Uanderes.korrigiere(SZahl,['0'..'9']);

  if ncmp(nint(SZahl),1)>=0 then
    begin
    if not geschop then Uanderes.writeGrid(SZahl+'  ist zu zerlegen!','',Uanderes.bootostr(PrimeTest.Fermat(nint(SZahl))),Uanderes.bootostr(PrimeTest.Euler(nint(SZahl))));
    primfaktoren.AutoMethode(nint(SZahl));
    end
  else
    if not geschop then Uanderes.writeGrid(SZahl+'  kann nicht zerlegt werden','Ungültige Eingabe');


  if not geschop then
    if not stop then
      if  faktoren.anzahl=1 then
        Uanderes.writeGrid('Primzahl')
      else
        Uanderes.writeGrid('Anzahl der Faktoren= '+inttostr(faktoren.anzahl),'Die Faktoren sind: '+Uanderes.artostr(faktoren))
    else
      Uanderes.writeGrid('Abbruch');
end;




{-----------------------------------------------------------------------------
  Description:  Start Button
  Procedure:    Button1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.Button1Click(Sender: TObject);
var s:string;
begin
  if self.BerechAnfang(true) then exit;

  s:=edit1.Text;
  Uanderes.korrigiere(s,['0'..'9']);
  self.EigabefeldBerechnen(edit1.Text);
  edit1.Text:=s;

  self.BerechEnde;
end;



{-----------------------------------------------------------------------------
  Description:   Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create
  Procedure:    FormCreate
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.FormCreate(Sender: TObject);
var stelle:integer;
begin
  version:=uanderes.getfileversion(Application.ExeName);
  //hier wird jetzt die punkte weggemacht bis auf den 1. damit es auch schön aussieht
  stelle:=pos('.',version)+1;
  repeat
    stelle:=posex('.',version,stelle);
    delete(version,stelle,1);
  until  posex('.',version,stelle)=0;
  for stelle:=0 to 3 do
    if AnsiLastChar(version)='0' then delete(version,length(version),1);
  self.Caption:='Primfaktoren               Version:  '+version;


  nstrformat.LeftAlign:=true;
  nstrformat.DigitsPerBlock:=3;
  NStrFormat.BlockSep:='';

  randomize;
  stop:=false;
  geschop:=false;

  faktoren:=TIIarray.Create;
  faktoren.leereArray;

  PrimeArray:=TIIarray.Create;
  PrimeArray.leereArray;

  decutil.RandomSeed;

  self.BCheckPrimeArray:=self.CheckPrimeArray.Checked;
  self.BCheckDetail:=self.CheckDetail.Checked;

  self.Edit1.Text:=inttostr(random(1000000)+2);
end;




procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ord(key) = 13)then self.Button1.Click;
  self.OnKeyDown(nil,key,shift);
end;



procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  // showmessage(inttostr(ord(key)));
  stop:=(Key=VK_ESCAPE);                                // escape
  label2.Caption:='';

  if (ord(key) = 112)then     //112 = f1
    form2.Show;
  if (shift<>[ssCtrl])and(ord(key) = 85) then       //85=u
    begin
    form2.Show;
    form2.TabSheetControl.ActivePage:=form2.Tabupdate;
    form2.BCheckUpdate.Click;
    end;
  if ord(key) = 65 then            //65=a   öffnet info feld
    form2.Show;
  if (shift<>[ssCtrl])and(ord(key) = 86) then                //86=v   öffnet versionsfeld
     showmessage('Primfaktoren    Version '+version);
  if ord(key) = 76 then     //76=L
    begin
    form2.Show;
    form2.TabSheetControl.ActivePage:=form2.TabLizenz;
    end;
end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  stop:=true;
  halt;
end;


procedure TForm1.FormActivate(Sender: TObject);
var temp:IInteger;
begin
  nset(temp,114730753);
  nmul(temp,106113113);
  form1.Edit1.Text:=nstr(temp);


  self.JvOutlookBar1.ActivePageIndex:=0;

  Uanderes.writeGrid(0,'Zerkleinerte Zahl','Primfaktor','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');

  if self.BCheckPrimeArray then primzahlen.CalcPrimeArray(10000);
end;




{-----------------------------------------------------------------------------
  Description:  Zerlegt eine bestimmt Anzahl von Zufallszahlen
  Procedure:    zufallpruefung
  Arguments:    stellen:word
  Result:       None
  Detailed description:    Hat eine integrierte Prüfung
-----------------------------------------------------------------------------}
procedure Tform1.zufallpruefung(stellen:word);
const mal=20;
var i,j,anzrichtig:cardinal;
    rech,zahl:iinteger;
begin
  if self.BerechAnfang(false) then exit;
  Uanderes.writeGrid(0,'Zufallszahl','Primfaktoren','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');

  anzrichtig:=0;
  for j:=1 to mal do
    begin
    if stop then break;
    application.ProcessMessages;
    
    faktoren.leereArray;

    schritte:=0;
    nset(rech,1);

    Uanderes.Arnd(zahl,stellen) ;
    self.Edit1.Text:=nstr(zahl);

    primfaktoren.AutoMethode(zahl);

    //jetzt kommt die prüfung
    for i:=0 to faktoren.anzahl-1 do
      nmul(rech,faktoren[i]);
    if ncmp(rech,zahl)=0 then
      begin
      inc(anzrichtig);
      if faktoren.anzahl>1 then
        Uanderes.writeGrid(nstr(zahl),Uanderes.artostr(faktoren),Uanderes.bootostr(false),Uanderes.bootostr(false))
      else
        Uanderes.writeGrid(nstr(zahl),'Primzahl',Uanderes.bootostr(true),Uanderes.bootostr(true))
      end
    else
      Uanderes.writeGrid(nstr(zahl),'Misserfolg  Achtung!!!');
    if self.BCheckDetail then Uanderes.writeGrid('---------------------------------------------------------------------------------------------------------------------','---------------------------------------------------------------------------------------------------------------------','---------------------------------------------------------------------------------------------------------------------','---------------------------------------------------------------------------------------------------------------------');
    end;

  if mal=anzrichtig then
    Uanderes.writeGrid(inttostr(mal)+' Zahlen wurden erfolgreich zerlegt')
  else
    Uanderes.writeGrid('Es wurden '+inttostr(anzrichtig)+' von '+inttostr(mal)+' Richtig gerechnet','Misserfolg  Achtung!!!');

  self.BerechEnde;
end;



{-----------------------------------------------------------------------------
  Description:  Zerlegt 15 stellige Zahlen
  Procedure:    JvOutlookBar1Pages0Buttons3Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain0Button3(Sender: TObject);
begin
  zufallpruefung(15);
end;





procedure TForm1.Edit1Change(Sender: TObject);
begin
  label2.Caption:=inttostr(length(edit1.Text))+' Stellen';
  edit1.Hint:=inttostr(length(edit1.Text))+' Stellen';
end;

{-----------------------------------------------------------------------------
  Description:  Zerlegt 5 stellige Zahlen
  Procedure:    JvOutlookBar1Pages0Buttons1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain0Button5(Sender: TObject);
begin
  zufallpruefung(5);
end;


{-----------------------------------------------------------------------------
  Description:  Zerlegt 10 stellige Zahlen
  Procedure:    JvOutlookBar1Pages0Buttons2Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain0Button2(Sender: TObject);
begin
  zufallpruefung(10);
end;



{-----------------------------------------------------------------------------
  Description:  Zerlegt eine 30 stellige Zahl
  Procedure:    JvOutlookBar1Pages0Buttons0Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain0Button0(Sender: TObject);
begin
  if self.BerechAnfang(true) then exit;

  edit1.Text:=nstr(Uanderes.Arnd(30));
  self.EigabefeldBerechnen(edit1.Text);
  self.schreibeinfofenster;

  self.BerechEnde;
end;



procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  // showmessage(inttostr(ord(key)));

  if not(key in ['0' .. '9',#22,#3,#8])  then
      key := #0;
end;



procedure TForm1.lblTypingClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', ('http://www.roth.22o.de'), nil, nil, SW_ShowNormal);
end;



procedure TForm1.JvImgBtn1Click(Sender: TObject);
begin
  form2.Show;
end;




{-----------------------------------------------------------------------------
  Description:  Lügende Pseudo Primzahlen rausfinden
  Procedure:    JvOutlookBar1Pages1Buttons0Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
  
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain3Button0(Sender: TObject);
const ende=1000000;
var i,     erstezahle,erstezahlf,anzges:Iinteger;
    erstemale,erstemalf:boolean ;
    anzfak,anzprim:cardinal;
    s:string;
begin
  if not Uanderes.ADialog(s,'Berechnung ab Startwert beginnen','Bitte Geben Sie einen Startwert an der >'+inttostr(sichereObergrenze)+' ist.'+#10+'Denn unter '+inttostr(sichereObergrenze)+' gibt es keine Lügenden Pseudoprimzahlen',
            ['0'..'9']) then  exit;

  if self.BerechAnfang(false,true) then exit;
  self.spaltenNormal;
  Uanderes.writeGrid(0);

  s:=inttostr(sichereObergrenze);
  // erstmal den Text schreiben
  Uanderes.writeGrid('Lügende Pseudo Primzahlen sind Zahlen,');
  Uanderes.writeGrid('  die durch verschiedene Tests,','(wie Fermatscher Primzahltest)');
  Uanderes.writeGrid('  als Primzahlen gedeutet werden,','(oder Eulerscher Primzahltest)');
  Uanderes.writeGrid('  aber keine sind.');
  Uanderes.writeGrid('Die Lügenden Pseudo Primzahlen zu finden,');
  Uanderes.writeGrid('  beansprucht sehr viel Zeit.');
  Uanderes.writeGrid('Die Zahl, die rechts neben dem Start-Button','angezeigt wird');
  Uanderes.writeGrid('  zeigt die Zahl, die gerade berechnet wird.');
  Uanderes.writeGrid('Zum Abbrechen drücke ESC');
  Uanderes.writeGrid();
  anzfak:=0;  anzprim:=0;  nset(anzges,0);
  nset(i,s);     nodd(i,true);

  erstemale:=false;  erstemalf:=false;

  while  ncmp(i,Uanderes.quadrat(nint(ende)))<=0 do
    begin
    if Uanderes.teilbar(i,nint(10001)) then
      begin
      if stop then break;
      application.ProcessMessages;
      label2.Caption:=nstr(i);
      end;
    if itisprime.AutoMethode(i) then
      begin
      // primzahl
      inc(anzprim);
      if (not PrimeTest.Euler(i))and(not erstemale) then
        begin
        erstemale:=true;
        nset(erstezahle,i);
        end;
      if (not PrimeTest.Fermat(i))and(not erstemalf) then
        begin
        erstemalf:=true;
        nset(erstezahlf,i);
        end;
      if erstemale and erstemalf then break;
      end
    else    {keine Primzahl}    inc(anzfak);
    nadd(i,2);
    nadd(anzges,1);
    end;
  Uanderes.writeGrid('Startwert= '+s,'Endwert= '+nstr(i));
  Uanderes.writeGrid('Primzahlen= '+inttostr(anzprim),'Zusammengesetzte= '+inttostr(anzfak));
  Uanderes.writeGrid('Gesamt= '+nstr(anzges),'Prim + Zusamm.= '+inttostr(anzfak+anzprim));
  Uanderes.writeGrid('1. Pollard Pseudo= '+nstr(erstezahle),'1. Fermat Pseudo= '+nstr(erstezahlf));

  self.BerechEnde;
end;



{-----------------------------------------------------------------------------
  Description:  Schnellste Startwerte bei Pollard-Rho finden
  Procedure:    JvOutlookBar1Pages1Buttons1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:

-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain3Button1(Sender: TObject);
type     Tstatistik=record
          prim:iinteger;
          startwert,summand:cardinal;
          zeit:double;
          end;
var i,summand,startwert:cardinal;
    best:array  of Tstatistik;
    path:string;

    tempweiter:boolean;

    maxsummand,
    maxstartwert,
    anzzahlen,
    stellen:integer;
begin
  if not Uanderes.ADialog(maxstartwert,'Schnellste Startwerte bei Pollard-Rho finden','Bitte Geben Sie den max Startwert an'
                        ,100,0,10000000) then  exit;
  if not Uanderes.ADialog(maxsummand,'Schnellste Startwerte bei Pollard-Rho finden','Bitte Geben Sie den max Summand an'
                        ,100,10,10000000) then  exit;

  if not Uanderes.ADialog(anzzahlen,'Schnellste Startwerte bei Pollard-Rho finden','Bitte Geben Sie die Anzahl der Zahlen an'
                        ,10,1,10000000) then  exit;
  if not Uanderes.ADialog(stellen,'Schnellste Startwerte bei Pollard-Rho finden','Bitte Geben Sie die Länge der zu testeten Primzahlen in Stellen an'
                        ,5,1,100) then  exit;

  if self.BerechAnfang then exit;
  Uanderes.writeGrid(0,'Untersuchte Zufallszahl','Zeit','Summand','Startwert');

  setlength(best,anzzahlen);

  // erstmal den Text schreiben
  Uanderes.writeGrid('Diese Untersuchung',' findet heraus,');
  Uanderes.writeGrid('  welche Anfangswerte',' für die,');
  Uanderes.writeGrid('  Pollard-Rho-Methode',' die Besten sind.');
  Uanderes.writeGrid('Diese Untersuchung','  beansprucht sehr viel Zeit.');
  Uanderes.writeGrid('Zum Abbrechen drücke',' ESC');
  Uanderes.writeGrid();


  // path:=ExtractFilePath(Application.ExeName)+dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten.txt';
  path:=ExtractFilePath(Application.ExeName)+dateToStr(now)+'  '+inttostr(hourof(now))+' h '+inttostr(minuteof(now))+' min.csv';

  repeat
    tempweiter:=true;
    faktoren.writeIIArray(-1,Uanderes.Arnd(stellen));
    if itisprime.AutoMethode(faktoren[-1]) then begin tempweiter:=false; faktoren.add(nint(10));  end;
  until (faktoren.anzahl>=anzzahlen)and not(tempweiter);


  self.spaltenGleichGros;

  for i:=0 to anzzahlen-1 do
    begin
    if stop then break;
    best[i].zeit:=10000000;
    for summand:=0 to maxsummand do
      begin
      label2.Caption:=inttostr(summand);
      application.ProcessMessages;
      if stop then break;
      for startwert:=1 to maxstartwert do
        begin
        stoptime.start;
        itisprime.pollardRho(nint(faktoren[i]),summand,startwert);
        if (best[i].zeit> stoptime.msec) then
          begin
          best[i].zeit:= stoptime.msec;
          nset(best[i].prim,faktoren[i]);
          best[i].summand:=summand;
          best[i].startwert:=startwert;
          end;
        end;
      Uanderes.writeGrid(i+8,nstr(faktoren[i]),floattostr(roundto(best[i].zeit,-3))+' ms','summand= '+inttostr(best[i].summand),'startwert= '+inttostr(best[i].startwert));
      end;
    txt.intxtschreiben(nstr(faktoren[i])+'; '+floattostr(roundto(best[i].zeit,-3))+' ms'+';'+'summand= '+inttostr(best[i].summand)+';'+'startwert= '+inttostr(best[i].startwert),
                                      '.csv',path,false);
    end;

  faktoren.leereArray;
  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  GGT berechnen
  Procedure:    JvOutlookBar1Pages2Buttons0Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:

-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain2Button0(Sender: TObject);
var a,b:string;
begin
  if not Uanderes.ADialog(a,'GGT berechnen','Bitte Geben Sie die 1. Zahl an',['0'..'9']) then  exit;
  if not Uanderes.ADialog(b,'GGT berechnen','Bitte Geben Sie die 2. Zahl an',['0'..'9']) then  exit;

  if self.BerechAnfang then exit;
  self.spaltenGleichGros;
  Uanderes.writeGrid(0,'Zahl1','Zahl2','GGT');

  if ncmp(primfaktoren.GGT(nint(a),nint(b)),1)=0 then  Uanderes.writeGrid('Teiler 1 = '+(a),'Teiler 2 = '+(b),'Teilerfremd')
  else Uanderes.writeGrid('Zahl 1 = '+(a),'Zahl 2 = '+(b),'GGT = '+nstr(primfaktoren.GGT(nint(a),nint(b))));
  // if ncmp(primfaktoren.GGT(nint(a),nint(b)),1)=0 then  showmessage('Die beiden Zahlen sind teilerfremd')
  // else showmessage(nstr(primfaktoren.GGT(nint(a),nint(b)))+' ist der GGT');

  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  KGV berechnen
  Procedure:    JvOutlookBar1Pages2Buttons1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain2Button1(Sender: TObject);
var a,b:string;
    kgv:IInteger;
begin
  if not Uanderes.ADialog(a,'KGV berechnen','Bitte Geben Sie die 1. Zahl an',['0'..'9']) then  exit;
  if not Uanderes.ADialog(b,'KGV berechnen','Bitte Geben Sie die 2. Zahl an',['0'..'9']) then  exit;

  if self.BerechAnfang then exit;
  self.spaltenNormal;
  Uanderes.writeGrid(0,'Zahl1','Zahl2');

  nmul(kgv,nint(a),nint(b));
  ndiv(kgv,primfaktoren.GGT(nint(a),nint(b)));

  Uanderes.writeGrid(a,b);
  Uanderes.writeGrid('Erweitern mit '+nstr(Uanderes.durch(kgv,nint(a))),'Erweitern mit '+nstr(Uanderes.durch(kgv,nint(b))));
  Uanderes.writeGrid('KGV = '+nstr(kgv),'KGV = '+nstr(kgv));

  self.BerechEnde;
end;




procedure TForm1.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbRight then self.PopupMenu1.Popup(x+self.Left+self.StringGrid1.Left+5
                                                ,y+self.Top+self.StringGrid1.Top+24);
end;




procedure TForm1.abelleinDateispeichern1Click(Sender: TObject);
begin
  self.SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
  self.SaveDialog1.FileName:=dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten.csv'  ;

  self.SaveDialog1.Execute;
end;



{-----------------------------------------------------------------------------
  Description:  Ließt die Tabelle aus und schreibt diese in eine txt Datei
  Procedure:    SaveDialog1CanClose
  Arguments:    Sender: TObject; var CanClose: Boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.SaveDialog1CanClose(Sender: TObject;  var CanClose: Boolean);
var text:string;
    i,j:word;
begin
  with self.StringGrid1 do
    begin
    text:='';
    for j:=0 to rowcount do
      begin
      for i:=0 to colcount do
        text:=text+cells[i,j]+';';
      text:=text+#13;
      end;
    end;
  txt.intxtschreiben(text,self.SaveDialog1.FileName,'.csv',false);
end;



{-----------------------------------------------------------------------------
  Description:  Größenänderung der Form
  Procedure:    FormCanResize
  Arguments:    Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    schreibeinfofenster
  Arguments:    None
  Result:       None
  Detailed description:

-----------------------------------------------------------------------------}
procedure Tform1.schreibeinfofenster;
begin
  if faktoren.anzahl=1 then label110.Caption:='Primzahl'
  else label110.Caption:=inttostr(faktoren.anzahl);

  if not(faktoren.anzahl=0) then
    begin
    label111.Caption:=nstr(faktoren[-1]);
    label111.Hint:=inttostr(length(nstr(faktoren[-1])))+' Stellen';
    end;

  label120.Caption:=nstr(aktuellezahl);
  label120.Hint:=inttostr(length(nstr(aktuellezahl)))+' Stellen';

  label130.Caption:=nstr(restzahl);
  label130.Hint:=inttostr(Uanderes.anzstellen(restzahl))+' Stellen';
  if (Uanderes.anzstellen(restzahl)<500)and PrimeTest.Euler(restzahl)then
    label130.Font.Color:=clred else label130.Font.Color:=clblack;

  label132.Caption:=nstr(Uanderes.nroot(restzahl,2,10),10,3);
  label132.Hint:=inttostr(Uanderes.anzstellen(Uanderes.wurzel(restzahl)))+' Stellen';

  label140.Caption:=inttostr(fps);
  label140.Hint:=inttostr(length(inttostr(fps)))+' Stellen';

  label150.Caption:=inttostr(schritte);
  label150.Hint:=inttostr(length(inttostr(schritte)))+' Stellen';
end;




{-----------------------------------------------------------------------------
  Description:  Primzahlen bereich auflisten
  Procedure:    JvOutlookBar1Pages3Buttons0Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain1Button0(Sender: TObject);
var start,ende:string;
    inDateiSchreiben:boolean;
    anzahl:cardinal;
begin
  start:='2';
  ende:='10000';
  if not Uanderes.ADialog(start,'Primzahlen berechnen','Bitte Geben Sie den Startwert an',['0'..'9']) then  exit;
  if not Uanderes.ADialog(ende,'Primzahlen berechnen','Bitte Geben Sie den Endwert an',['0'..'9']) then  exit;

  case dialogs.MessageDlg('Klicken Sei Ja um '+#13+#10+'   die Primzahlen in die Tabelle aufgelistet zu bekommen'+#13+#10+''+#13+#10+'Klicken Sei Nein um '+#13+#10+'   die Primzahlen in eine Datei gespeichert zu bekommen', dialogs.mtConfirmation, dialogs.mbYesNoCancel, 0) of
    mrYes:  inDateiSchreiben:=false;
    mrNo:   inDateiSchreiben:=true;
    mrCancel: exit;
    mrNone: inDateiSchreiben:=false;
    end;

  if self.BerechAnfang then exit;
  self.spaltengroesse(1000,70,70,70);
  Uanderes.writeGrid(0,'Primzahl');


  primzahlen.listPrimzahlen(anzahl,nint(start),nint(ende),inDateiSchreiben);

  if stop then Uanderes.writeGrid('Abbruch')  else  Uanderes.writeGrid('Es wurden '+inttostr(anzahl)+' Primzahlen gefunden');

  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  Zufällige Primzahlen berechnen
  Procedure:    JvOutlookBar1Pages3Buttons1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain1Button1(Sender: TObject);
var groesse,anzahl:integer;
begin
  if not Uanderes.ADialog(groesse,'Primzahlen berechnen','Bitte Geben Sie die Größenordnung in 10er Potenzen an'
                        ,20,1,1000) then  exit;

  if not Uanderes.ADialog(anzahl,'Primzahlen berechnen','Bitte Geben Sie die Anzahl der Primzahlen an'
                        ,100,1,100000) then  exit;
  showmessage('Diese Primzahlen werden über verschiedene Primzahltests berechnet.'+#13+#10+''+#13+#10+'Es besteht aber immer die Möglichkeit das die Zahl keine echte Primzahl ist.'+#13+#10+'Jedoch ist diese Möglichkeit meistens enorm klein.');


  if self.BerechAnfang then exit;
  self.spaltengroesse(1000,70,70,70);
  Uanderes.writeGrid(0,'Zufallsprimzahl');

  primzahlen.listZufallsPrimzahlen(groesse,anzahl);


  if stop then Uanderes.writeGrid('Abbruch') else   Uanderes.writeGrid('Es wurden '+inttostr(anzahl)+' Primzahlen ermittelt');

  self.BerechEnde;
end;





{-----------------------------------------------------------------------------
  Description:  Primorial bilden
  Procedure:    JvOutlookBar1Pages1Buttons2Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBar1Pages1Buttons2Click(Sender: TObject);
var maxzahl,i:integer;
    Primorial:IInteger;
begin
  if not Uanderes.ADialog(maxzahl,'Primorial bilden','Bitte geben sie das Maximum des Primorials an'
                        ,1000,1,1000000) then  exit;

  if self.BerechAnfang then exit;
  self.spaltengroesse(1000,0,70,70);

  primearray.leereArray;
  uprimzahlen.Primzahlen.CalcPrimeArray(maxzahl);
  if not stop then  Uanderes.writeGrid('Es wurden '+inttostr(primearray.anzahl)+' Primzahlen ermittelt');

  nset(Primorial,1);

  for i:=0 to  primearray.anzahl do
    begin
    if stop then begin  Uanderes.writeGrid('Abbruch'); break; end;
    nmul(Primorial,primearray[i]);
    end;

  if not stop then
    begin
    Uanderes.writeGrid('Nun werden alle Primzahlen miteinander multipliziert');
    Uanderes.writeGrid('Diese Zahl lautet');
    Uanderes.writeGrid(nstr(Primorial));
    Uanderes.writeGrid('Diese Zahl ist durch alle Primzahlen <= '+inttostr(maxzahl)+' teilbar');
    Uanderes.writeGrid('Sie ist '+inttostr(Uanderes.anzstellen(Primorial))+' Stellen lang');
    end;

  self.BerechEnde;
end;






{-----------------------------------------------------------------------------
  Description:  Fermat + Euler  <--->  GGT
  Procedure:    JvOutlookBar1Pages1Buttons2Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain3Button2(Sender: TObject);
var i,lauf,anzahl:integer;
    temp:IInteger;
    fer,eul,zggt:boolean;
begin
  if not Uanderes.ADialog(anzahl,'Fermat + Euler  <--->  GGT','Bitte Geben Sie die Anzahl der GGT Prüfungen an'
                        ,1000,1,1000000000) then  exit;


  if self.BerechAnfang then exit;
  Uanderes.writeGrid(0,'Zufallszahl','GGT Prüfung','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');

  self.spaltengroesse(400,40,70,70);
  i:=0;
  lauf:=0;

  repeat
    nset(temp,Uanderes.Arnd0toMAX(100));
    nodd(temp,true);

    fer:=primetest.Fermat(temp);
    eul:=primetest.Euler(temp);
    zggt:=primetest.TestPrimeTeilerfremd(temp,anzahl);

    if  Uanderes.boolUngleich(fer,eul) or Uanderes.boolUngleich(fer,zggt) then
      begin
      Uanderes.writeGrid(nstr(temp),Uanderes.bootostr(zggt),Uanderes.bootostr(fer),Uanderes.bootostr(eul));
      inc(i);

      application.ProcessMessages;
      if stop then begin  Uanderes.writeGrid('Abbruch'); break; end;

      if (fer or eul) and not(zggt) then Uanderes.writeGrid('Pseudoprimzahl gefunden','Cool!!!');         // euler sagt ja und man findet doch einen Teiler
      end;
    inc(lauf);
  until i>=20 ;

  if not stop then
    begin
    Uanderes.writeGrid('20 falsche GGT Aussagen in '+inttostr(lauf)+' Zahlen gefunden.');
    Uanderes.writeGrid('Das sind '+inttostr(round(20/lauf*100))+'% Fehlerrate für GGT');
    end;

  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  Fermat  <--->  Euler
  Procedure:    JvOutlookBar1Pages1Buttons3Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain3Button3(Sender: TObject);
var i:cardinal;
    groesse:integer;
    temp:IInteger;
    fer,eul:boolean;
begin
  if not Uanderes.ADialog(groesse,'Fermat  <--->  Euler','Bitte Geben Sie die Größenordnung in 10er Potenzen'
                        ,100,1,1000) then  exit;

  if self.BerechAnfang then exit;
  self.spaltengroesse(400,10,70,70);
  Uanderes.writeGrid(0,'Pseudo Primzahl','','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');

  i:=0;
  schritte:=0;
  repeat
    if Uanderes.teilbar(schritte,1000) then
      begin
      application.ProcessMessages;
      if stop then break;
      label2.Caption:=inttostr(schritte);
      Uanderes.zfps(schritte);
      self.schreibeinfofenster;
      if (schritte>0) and Uanderes.teilbar(schritte,1000000) then
        begin
        Uanderes.writeGrid('Es wurden in 1000000 Zufallszahlen (um 10^'+inttostr(groesse)+') keine Unterschiede');
        Uanderes.writeGrid('  zw. Fermat und Euler Primzahltest gefunden.');
        Uanderes.writeGrid('  Suche läuft weiter...  Bitte Warten...');
        end;
      end;
    inc(schritte);
    nset(temp,Uanderes.Arnd0toMAX(groesse));
    nodd(temp,true);

    fer:=primetest.Fermat(temp);
    eul:=primetest.Euler(temp);

    if  Uanderes.boolUngleich(fer,eul) then
      begin
      Uanderes.writeGrid(nstr(temp),'',Uanderes.bootostr(fer),Uanderes.bootostr(eul));
      inc(i);

      application.ProcessMessages;
      if stop then begin  Uanderes.writeGrid('Abbruch'); break; end;

      Uanderes.writeGrid('Pseudoprimzahl gefunden','Cool!!!');         // euler sagt ja und man findet doch einen Teiler
      end;
  until i>=20 ;

  self.BerechEnde;
end;





{-----------------------------------------------------------------------------
  Description:  Liste perfekte Zahlen auf
  Procedure:    JvOutlookBar1Pages2Buttons2Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
          http://de.wikipedia.org/wiki/Perfekte_Zahl
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain2Button2(Sender: TObject);
var groesse:integer;
begin
  if not Uanderes.ADialog(groesse,'Liste perfekte Zahlen auf','Bitte Geben Sie die maximale Stellenanzahl an'
                        ,1000,2,10000) then  exit;
  if (MessageDlg('Bei einer verschwindend gerignen Wahrscheinlichkeit kann es vorkommen, '+#13+#10+'  dass die Perfekte Zahl , gar keine ist.  (wegen Euler''schem Primzahltest mit Basen bis 101)'+#13+#10+'Außerdem findet das Programm keine ungeraden perfekten Zahlen, die vielleicht existieren könnten.'+#13+#10+'  Man hat bisher noch keine ungeraden perfekten Zahlen gefunden, da diese > als 10^300 sein müssen.', mtInformation, [mbOK, mbCancel], 0) = mrCancel) then exit;

  if self.BerechAnfang then exit;
  self.spaltengroesse(500,50,0,0);
  Uanderes.writeGrid(0,'Vollkommene Zahl','Stellen');

  mathematik.PerfekteZahlen(groesse);

  if stop then
    Uanderes.writeGrid('Abbruch')
  else
    Uanderes.writeGrid('Aus dem Bereich 2 bis 10^'+inttostr(groesse)+' wurden '+inttostr(faktoren.anzahl)+' Perfekte Zahlen gefunden.');

  self.BerechEnde;
end;




procedure TForm1.NormaleSpaltenbreite1Click(Sender: TObject);
begin
self.spaltenNormal;
end;

procedure TForm1.GleichgroeSpaltenbreite1Click(Sender: TObject);
begin
self.spaltenGleichGros;
end;





{-----------------------------------------------------------------------------
  Description:  Fibbonacci-Zahlen
  Procedure:    JvOutlookBar1Pages2Buttons3Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain2Button3(Sender: TObject);
const genau=1000;
var zahl,vorherzahl:iinteger;
    funde:cardinal;
    groesse:integer;

    a1,quotient:Irational;
    ausgabe:extended;

    inDateiSchreiben:boolean;
    path:string;
begin
  if not Uanderes.ADialog(groesse,'Fibbonacci-Zahlen','Bitte Geben Sie die maximale Stellenanzahl an'
                        ,100,2,10000) then  exit;


  case dialogs.MessageDlg('Klicken Sei Ja um '+#13+#10+'   die Fibbonacci-Zahlen in die Tabelle aufgelistet zu bekommen'+#13+#10+''+#13+#10+'Klicken Sei Nein um '+#13+#10+'   die Fibbonacci-Zahlen in eine Datei gespeichert zu bekommen', dialogs.mtConfirmation, dialogs.mbYesNoCancel, 0) of
    mrYes:  inDateiSchreiben:=false;
    mrNo:   inDateiSchreiben:=true;
    mrCancel: exit;
    mrNone: inDateiSchreiben:=false;
    end;
  if inDateiSchreiben then path:=ExtractFilePath(Application.ExeName)+'Fibbonacci-Zahlen '+dateToStr(now)+'  '+inttostr(hourof(now))+' h '+inttostr(minuteof(now))+' min.csv';

  if self.BerechAnfang then exit;
  self.spaltengroesse(350,70,100,20);

  if  inDateiSchreiben then  txt.intxtschreiben('Fibbonacci-Zahlen;Stellen;Fehler zu dem goldenen Schnitt',path,'.csv',true) ;
  Uanderes.writeGrid(0,'Fibbonacci-Zahlen','Stellen','Fehler zu dem goldenen Schnitt');


  //berechne Goldener Schnitt
  nprc(a1,genau);
  Uanderes.NRoot(a1,nint(5),2);
  nadd(a1,1);
  ndiv(a1,2);


  funde:=0;

  nset(vorherzahl,1);
  nset(zahl,1);
  Uanderes.writeGrid(nstr(zahl),inttostr(Uanderes.anzstellen(zahl)));
  Uanderes.writeGrid(nstr(zahl),inttostr(Uanderes.anzstellen(zahl)));

  repeat
    application.ProcessMessages;
    if stop then begin Uanderes.writeGrid('Abbruch'); break; end;

    nswp(zahl,vorherzahl);
    nadd(zahl,vorherzahl);

    nset(quotient,zahl);
    ndiv(quotient,vorherzahl);
    ndiv(quotient,a1);
    nsub(quotient,1);


    if  inDateiSchreiben then
      txt.intxtschreiben(nstr(zahl)+';'+inttostr(Uanderes.anzstellen(zahl))+';'+formatfloat('0.0000E+00',uanderes.nfloat(quotient)),path,'.csv',false)
    else
      Uanderes.writeGrid(nstr(zahl),inttostr(Uanderes.anzstellen(zahl)),formatfloat('0.0000E+00',uanderes.nfloat(quotient)));//,nstr(Uanderes.durch(zahl,vorherzahl)));

    if uanderes.anzstellen(zahl)mod 10=0 then self.Label2.Caption:='Stellen= '+inttostr(uanderes.anzstellen(zahl));
    inc(funde);
  until Uanderes.anzstellen(zahl)>groesse;

  if  inDateiSchreiben then
    txt.intxtschreiben('Aus dem Bereich 2 bis 10^'+inttostr(groesse)+' wurden '+inttostr(funde)+' Fibbonacci-Zahlen gefunden.',path,'.csv',false);
  Uanderes.writeGrid('Aus dem Bereich 2 bis 10^'+inttostr(groesse)+' wurden '+inttostr(funde)+' Fibbonacci-Zahlen gefunden.');

  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  100 Stellig - Extra viele Faktoren
  Procedure:    JvOutlookBar1Pages0Buttons4Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain0Button4(Sender: TObject);
var zahl:iinteger;
begin
  if self.BerechAnfang(true) then exit;

  self.spaltenNormal;

  nset(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));
  nmul(zahl,random(100000000));

  edit1.Text:=nstr(zahl);

  self.EigabefeldBerechnen(edit1.Text);

  self.BerechEnde;
end;



{-----------------------------------------------------------------------------
  Description:  Goldener Schnitt
  Procedure:    JvOutlookBar1Pages2Buttons4Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain2Button4(Sender: TObject);
const genau=1000;
var a1,a2:Irational;
begin
  if self.BerechAnfang then exit;
  self.spaltengroesse(self.StringGrid1.Width div 2,self.StringGrid1.Width div 2,0,0);


  nprc(a1,genau);
  Uanderes.NRoot(a1,nint(5),2);
  nadd(a1,1);
  ndiv(a1,2);

  nprc(a2,genau);
  Uanderes.NRoot(a2,nint(5),2);
  nneg(a2);
  nadd(a2,1);
  ndiv(a2,2);

  Uanderes.writeGrid('Der Goldene Schnitt','Genauigkeit von '+inttostr(genau)+' Stellen nach dem Komma');
  Uanderes.writeGrid('1. Lösung','2. Lösung');
  Uanderes.writeGrid(nstr(a1),nstr(a2));

  self.BerechEnde;
end;






{-----------------------------------------------------------------------------
  Description:  Fakultät berechnen
  Procedure:    JvOutlookBar1Pages2Buttons5Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain2Button5(Sender: TObject);
var  zahl,i:integer;
      fac:iinteger;
begin
  if not Uanderes.ADialog(zahl,'Fakultät berechnen','Bitte Geben Sie die Zahl an'
                        ,10,1,10000) then  exit;

  if self.BerechAnfang then exit;
  self.spaltengroesse(100,450,50,50);
  Uanderes.writeGrid(0,'Zahl','Fakultät','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');

  nset(fac,1);
  for i:=2 to zahl do
    nmul(fac,i);

  Uanderes.writeGrid(inttostr(zahl),nstr(fac),Uanderes.bootostr(false),Uanderes.bootostr(false));

  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  CheckPrimeArray   Click
  Procedure:    CheckPrimeArrayClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.CheckPrimeArrayClick(Sender: TObject);
begin
  self.BCheckPrimeArray:=self.CheckPrimeArray.Checked;

  if self.BCheckPrimeArray then
    begin
    primzahlen.CalcPrimeArray(50000);
    BVorausberechnung.Visible:=true;
    end
  else
    BVorausberechnung.Visible:=false;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    BVorausberechnungClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BVorausberechnungClick(Sender: TObject);
var ein:integer;
begin
  if not Uanderes.ADialog(ein,'Primzahlen vorrausberechnen','Es wurden bereits im Bereich von 2 bis '+nstr(primeArray[-1])+', '+inttostr(primeArray.anzahl)+' Primzahlen gefunden.'+#13+#10+''+#13+#10+'Geben Sie bitte eine Obergrenze der zu errechnenden Primzahlen an:'
            ,nlong(primeArray[-1]),2,1000000000) then exit;

  if self.BerechAnfang then exit;

  primzahlen.CalcPrimeArray(ein);

  self.BerechEnde;
end;



{-----------------------------------------------------------------------------
  Description:  Primfaktorzerlegung  mit und ohne Primarray
  Procedure:    JvOutlookBar1Pages3Buttons4Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain3Button4(Sender: TObject);
var stellen,
    maxstellen,
    anzahl1,anzahl2:integer;
    zeit:longint;

    zahl:iinteger;

    stoptemp:TStoptime;
begin
  if not Uanderes.ADialog(maxstellen,'Primfaktorzerlegung  mit und ohne Primarray','Bitte Geben Sie die Maximale Stellenanzahl an'
                        ,10,2,100) then  exit;

  if not Uanderes.ADialog(zeit,'Primfaktorzerlegung  mit und ohne Primarray','Bitte Geben Sie die Zerlegungszeit in Millisekunden an'
                        ,1000,10,100000) then  exit;


  if self.BerechAnfang(false,true,true) then exit;
  Uanderes.writeGrid(0,'Mit Primzahlen Array','Ohne Array');
  Uanderes.writeGrid('Es werden immer '+inttostr(zeit)+' Millisekunden Zahlen mit,');
  Uanderes.writeGrid('  bzw ohne Primzahlenarray überprüft');
  Uanderes.writeGrid();


  stoptemp:= TStoptime.Create;
  stoptime:= TStoptime.Create;
  try

    for stellen:=2 to maxstellen do
      begin


      anzahl1:=0;
      stoptime.start;
      stoptemp.start;
      //mit Array
      self.BCheckPrimeArray:=true;
      repeat
        inc(anzahl1);

        //zufallszahlen zerlegen
        Uanderes.Arnd(zahl,stellen);

        faktoren.leereArray;
        self.EigabefeldBerechnen(nstr(zahl));

        if stoptemp.msec>=100  then
          begin
          stoptemp.start;
          application.ProcessMessages;
          if stop then break;
          label2.Caption:=inttostr(anzahl1);
          end;
      until stoptime.msec >=zeit;

      application.ProcessMessages;
      if stop then break;

      anzahl2:=0;
      stoptime.start;
      stoptemp.start;
      //ohne Array
      self.BCheckPrimeArray:=false;
      repeat
        inc(anzahl2);

        //zufallszahlen zerlegen
        Uanderes.Arnd(zahl,stellen);
        faktoren.leereArray;
        self.EigabefeldBerechnen(nstr(zahl));

        if stoptemp.msec>=100  then
          begin
          stoptemp.start;
          application.ProcessMessages;
          if stop then break;
          label2.Caption:=inttostr(anzahl2);
          end;
      until stoptime.msec >=zeit;


      if not stop then
        begin
        Uanderes.writeGrid('-----------------------------------');
        Uanderes.writeGrid('Stellen = '+inttostr(stellen));
        Uanderes.writeGrid(floattostr(anzahl1)+' geprüfte Zahlen',floattostr(anzahl2)+' geprüfte Zahlen');
        Uanderes.writeGrid('D.h. Mit Array ist es '+floattostr(roundto((1-anzahl2/anzahl1)*100,-3))+'% schneller');
        end;

      application.ProcessMessages;
      if stop then break;
      end;

    self.BerechEnde;
  finally
    stoptemp.Free;
  end;
end;



{-----------------------------------------------------------------------------
  Procedure:    CheckDetailClick
-----------------------------------------------------------------------------}
procedure TForm1.CheckDetailClick(Sender: TObject);
begin
  self.BCheckDetail:=self.CheckDetail.Checked;
end;






{==============================================================================
  Procedure:    JvOutlookBar1Pages2Buttons6Click	
  Belongs to:   TForm1
  Result:       None
  Parameters:
                  Sender : TObject  =
                    
  Description:  Fakulatät zerlegen lassen
==============================================================================}
procedure TForm1.JvOutlookBar1Pages2Buttons6Click(Sender: TObject);
var zahl,maxzahl:integer;
    fac:iinteger;
begin
  if not Uanderes.ADialog(maxzahl,'Fakultäten zerlegen','Bitte Geben Sie die Maximale Fakultät an'
                        ,100,1,1000000) then  exit;

  if self.BerechAnfang then exit;

  Uanderes.writeGrid(0,'Zahl','Fakultät','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');
  self.CheckDetail.Checked:=false;
  faktoren.leereArray;

  nset(fac,1);
  //fakultät berechnen
  for zahl:=1 to maxzahl do
    begin
    nmul(fac,zahl);

    if stop then break;
    end;

  primfaktoren.ungeradeZahlen(fac);
  Uanderes.writeGrid('Anzahl der Faktoren= '+inttostr(faktoren.anzahl),'Die Faktoren sind: '+Uanderes.artostr(faktoren));


  self.BerechEnde;
end;



{==============================================================================
  Procedure:    JvOutlookBarMain2Button6
  Belongs to:   TForm1
  Result:       None
  Parameters:   
                  Sender : TObject  =

  Description:  Fakulatäten zerlegen lassen
==============================================================================}
procedure TForm1.JvOutlookBarMain2Button6(Sender: TObject);
var zahl,maxzahl:integer;
    fac:iinteger;
begin
  if not Uanderes.ADialog(maxzahl,'Fakultäten zerlegen','Bitte Geben Sie die Maximale Fakultät an'
                        ,100,1,10000) then  exit;

  if self.BerechAnfang then exit;

  Uanderes.writeGrid(0,'Zahl','Fakultät','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');
  self.CheckDetail.Checked:=false;

  nset(fac,1);
  for zahl:=1 to maxzahl do
    begin
    //fakultät berechnen
    nmul(fac,zahl);
    Uanderes.writeGrid(inttostr(zahl),nstr(fac),Uanderes.bootostr(false),Uanderes.bootostr(false));

    self.EigabefeldBerechnen(nstr(fac));

    Uanderes.writeGrid('---------------------------------------------------------------------------------------------------------------------','---------------------------------------------------------------------------------------------------------------------','---------------------------------------------------------------------------------------------------------------------','---------------------------------------------------------------------------------------------------------------------');

    if stop then break;
    end;


  self.BerechEnde;
end;




{-----------------------------------------------------------------------------
  Description:  Quadratische Formel für Primzahlen testen
  Procedure:    JvOutlookBar1Pages3Buttons5Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain4Button0(Sender: TObject);
var a,b,c,
    lauf,maxlauf:integer;
    anzprim,anzges:cardinal;
    btemp:boolean;
begin
  if not Uanderes.ADialog(a,'Gute Primzahlformel finden','Bitte Geben Sie das positive a (von ax^2+bx+c) an'
                        ,1,0,1000000000) then  exit;

  if not Uanderes.ADialog(b,'Gute Primzahlformel finden','Bitte Geben Sie das b (von ax^2+bx+c) an'
                        ,-1,-1000000000,1000000000) then  exit;

  if not Uanderes.ADialog(c,'Gute Primzahlformel finden','Bitte Geben Sie das c (von ax^2+bx+c) an'
                        ,41,-1000000000,1000000000) then  exit;

  if not Uanderes.ADialog(maxlauf,'Gute Primzahlformel finden','Bitte Geben Sie die Anzahl von Werten an die geprüft werden sollen'
                        ,10000,2,1000000000) then  exit;

  if self.BerechAnfang then exit;
  self.spaltengroesse(400,0,0,100);
  Uanderes.writeGrid(0,'x','','Fermatsche Pseudo Primzahl','Euler''sche Pseudo Primzahl');
  Uanderes.writeGrid('Die Formel lautet '+F2tostr(a,b,c));
  self.CheckDetail.Checked:=false;
  anzprim:=0;
  anzges:=0;

  for lauf := 0 to maxlauf do
    begin
    if lauf mod 1000=0 then
      begin
      application.ProcessMessages;
      if stop then break;
      label2.Caption:=inttostr(lauf);
      end;

    btemp:= primetest.Euler(    mathematik.QuadratischeFunktion(nint(lauf),nint(a),nint(b),nint(c))    ) ;
    if btemp then
      inc(anzprim);
    inc(anzges);

    if self.BCheckDetail then Uanderes.writeGrid(inttostr(lauf),'','',Uanderes.bootostr(btemp));
    end;

  Uanderes.writeGrid(inttostr(anzprim)+' von '+inttostr(anzges)+' sind Primzahlen');
  Uanderes.writeGrid('Das sind '+floattostr(roundto( anzprim/anzges*100 ,-2))+'%');

  self.BerechEnde;
end;





{-----------------------------------------------------------------------------
  Description:  Zufällige quadratische Formeln testen
  Procedure:    JvOutlookBar1Pages3Buttons6Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain4Button1(Sender: TObject);
var max:record
      a,b,c:Integer;
     end;
    best:record
      a,b,c:Integer;
      prozent:real;
     end;
    temp:record
      a,b,c:Integer;
     end;

    i,j,maxlauf,maxformel:integer;
    anzprim,anzges:cardinal;
begin
  if not Uanderes.ADialog(max.a,'Gute Primzahlformel finden','Bitte Geben Sie den Bereich für a (von ax^2+bx+c) an'
                        ,10,1,1000000000) then  exit;

  if not Uanderes.ADialog(max.b,'Gute Primzahlformel finden','Bitte Geben Sie den Bereich für +/-b (von ax^2+bx+c) an'

                        ,10,1,1000000000) then  exit;

  if not Uanderes.ADialog(max.c,'Gute Primzahlformel finden','Bitte Geben Sie den Bereich für +/-c (von ax^2+bx+c) an'
                        ,100,1,1000000000) then  exit;

  if not Uanderes.ADialog(maxlauf,'Gute Primzahlformel finden','Bitte Geben Sie die Anzahl von x-Werten an die geprüft werden sollen'
                        ,10000,2,1000000) then  exit;

  if not Uanderes.ADialog(maxformel,'Gute Primzahlformel finden','Bitte Geben Sie die Anzahl von Formeln an die geprüft werden sollen'
                        ,100,1,1000000) then  exit;

  if self.BerechAnfang then exit;
  self.spaltengroesse(300,100,0,0);
  Uanderes.writeGrid(0,'Zur Zeit beste Formel','% Primzahlen');
  self.CheckDetail.Checked:=false;
  best.prozent:=0;

  for i:= 0 to maxformel do
    begin
    anzprim:=0;
    anzges:=0;
    repeat
      temp.a:=random(max.a);
      temp.b:=-random(2*max.b)+max.b;
    until (temp.b<>0)or(temp.a<>0);
    temp.c:=-random(2*max.c)+max.c;

    for j := 0 to maxlauf do
      begin
      if  (ncmp(mathematik.QuadratischeFunktion(nint(j),nint(temp.a),nint(temp.b),nint(temp.c)),0)>0) and
          primetest.Euler(    mathematik.QuadratischeFunktion(nint(j),nint(temp.a),nint(temp.b),nint(temp.c))    )  then
        inc(anzprim);
      inc(anzges);
      end;

    //aussenwelt
    if (maxlauf>5000)or (i mod 10=0 ) then
      begin
      application.ProcessMessages;
      if stop then break;
      label2.Caption:=inttostr(maxformel-i);
      end;
    if self.bcheckdetail then
      begin
      schritte:=i;
      Uanderes.zfps(i);
      self.schreibeinfofenster;
      Uanderes.writeGrid(F2tostr(temp.a,temp.b,temp.c),floattostr(roundto( anzprim/anzges*100 ,-2))+'%');
      if (i>0) and(i mod 100 =0) then
        begin
        Uanderes.writeGrid('');
        Uanderes.writeGrid('Zurzeit beste Formel bei '+inttostr(i)+' Kombinationen:');
        Uanderes.writeGrid(F2tostr(best.a,best.b,best.c),floattostr(roundto( best.prozent ,-2))+'%');
        Uanderes.writeGrid('');
        end;
      end;

    if best.prozent<=anzprim/anzges*100 then
      begin
      best.prozent:=anzprim/anzges*100;
      best.a:=temp.a;
      best.b:=temp.b;
      best.c:=temp.c;
      Uanderes.writeGrid('Zurzeit beste Formel bei '+inttostr(i)+' Kombinationen:');
      Uanderes.writeGrid(F2tostr(best.a,best.b,best.c),floattostr(roundto( best.prozent ,-2))+'%');
      end;
    end;

  Uanderes.writeGrid('');
  Uanderes.writeGrid('Beste Formel bei '+inttostr(i)+' Kombinationen:');
  Uanderes.writeGrid(F2tostr(best.a,best.b,best.c),floattostr(roundto( best.prozent ,-2))+'%');

  self.BerechEnde;
end;






{-----------------------------------------------------------------------------
  Description:  Alle quadratische Formeln durchtesten
  Procedure:    JvOutlookBarMain4Button2
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvOutlookBarMain4Button2(Sender: TObject);
var max:record
      a,b,c:Integer;
     end;
    best:record
      a,b,c:Integer;
      prozent:real;
     end;

    j,la,lb,lc,maxlauf:integer;
    anzprim,anzges,update:cardinal;
    ErhoeheC:byte;
begin
  if not Uanderes.ADialog(max.a,'Gute Primzahlformel finden','Bitte Geben Sie den Bereich für a (von ax^2+bx+c) an'
                        ,10,1,1000000000) then  exit;

  if not Uanderes.ADialog(max.b,'Gute Primzahlformel finden','Bitte Geben Sie den Bereich für +/-b (von ax^2+bx+c) an'

                        ,10,1,1000000000) then  exit;

  if not Uanderes.ADialog(max.c,'Gute Primzahlformel finden','Bitte Geben Sie den Bereich für +/-c (von ax^2+bx+c) an'
                        ,100,1,1000000000) then  exit;

  if not Uanderes.ADialog(maxlauf,'Gute Primzahlformel finden','Bitte Geben Sie die Anzahl von x-Werten an die geprüft werden sollen'

                        ,1000,2,1000000) then  exit;

  if self.BerechAnfang then exit;

  self.spaltengroesse(300,100,0,0);
  Uanderes.writeGrid(0,'Zur Zeit beste Formel','% Primzahlen');
  best.prozent:=0;
  schritte:=0;

  for la:=0 to max.a do
    begin
    for lb:=-max.b to max.b do
      begin
      if (la=0)and(lb=0) then continue;   //damit er nicht constante funktionen prüft.
      for lc:= - max.c to max.c do
        begin
        inc(schritte);
        anzprim:=0;
        anzges:=0;
        for j := 0 to maxlauf do
          begin
          if  (ncmp(mathematik.QuadratischeFunktion(nint(j),nint(la),nint(lb),nint(lc)),0)>0) and
              primetest.Euler(    mathematik.QuadratischeFunktion(nint(j),nint(la),nint(lb),nint(lc))    )  then
            inc(anzprim);
          inc(anzges);
          end;

        //aussenwelt
        if (maxlauf>5000)or (schritte mod 50=0 ) then
          begin
          application.ProcessMessages;
          if stop then     break;
          label2.Caption:=inttostr(schritte);
          end;
        if self.bcheckdetail then
          begin
          Uanderes.zfps(schritte);
          self.schreibeinfofenster;
          Uanderes.writeGrid(F2tostr(la,lb,lc),floattostr(roundto( anzprim/anzges*100 ,-2))+'%');
          if (schritte>0) and(schritte mod 100 =0) then
            begin
            Uanderes.writeGrid('');
            Uanderes.writeGrid('Zurzeit beste Formel bei '+inttostr(schritte)+' Kombinationen:');
            Uanderes.writeGrid(F2tostr(best.a,best.b,best.c),floattostr(roundto( best.prozent ,-2))+'%');
            Uanderes.writeGrid('');
            end;
          end;

        if best.prozent<=anzprim/anzges*100 then
          begin
          best.prozent:=anzprim/anzges*100;
          best.a:=la;
          best.b:=lb;
          best.c:=lc;
          Uanderes.writeGrid('Zurzeit beste Formel bei '+inttostr(schritte)+' Kombinationen:');
          Uanderes.writeGrid(F2tostr(best.a,best.b,best.c),floattostr(roundto( best.prozent ,-2))+'%');
          end;
        end;
      if stop then    break;
      end;
    if stop then    break;
    end;

  Uanderes.writeGrid('');
  Uanderes.writeGrid('Beste Formel bei '+inttostr(schritte)+' Kombinationen:');
  Uanderes.writeGrid(F2tostr(best.a,best.b,best.c),floattostr(roundto( best.prozent ,-2))+'%');

  self.BerechEnde;
end;







end.
