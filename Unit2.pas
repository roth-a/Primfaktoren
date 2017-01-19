{-----------------------------------------------------------------------------
 Unit Name: Unit2
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}
unit Unit2;

interface

uses
  Windows, Messages, SysUtils,  Classes, Forms,  Dialogs,
  shellapi, winInet,  IdHTTP, ComCtrls, Controls, StdCtrls;

type
  TForm2 = class(TForm)
    TabSheetControl: TPageControl;
    Information: TTabSheet;
    Memo1: TMemo;
    Links: TTabSheet;
    Homepage: TLabel;
    Label1: TLabel;
    EmailKontakt: TLabel;
    TabLIzenz: TTabSheet;
    Memo2: TMemo;
    Memo3: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    TabUpdate: TTabSheet;
    BCheckUpdate: TButton;
    LInternetState: TLabel;
    LHomepage: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure HomepageClick(Sender: TObject);
    procedure Memo3DblClick(Sender: TObject);
    procedure EmailKontaktClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure BCheckUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    IdHTTP1: TIdHTTP;
  end;

var
  Form2: TForm2;

implementation
uses unit1,uanderes;

{$R *.dfm}


procedure TForm2.HomepageClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', ('http://www.roth.us.ms'), nil, nil, SW_ShowNormal);
end;

procedure TForm2.Memo3DblClick(Sender: TObject);
begin
  close;
end;

procedure TForm2.EmailKontaktClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', ('mailto:roth-a@gmx.de'), nil, nil, SW_SHOWNA);
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  form1.FormKeyDown(sender,key,shift);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  form2.Caption:=form1.Caption+'                 Infos zum Programm';
  form2.TabSheetControl.ActivePage:=Information;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  self.IdHTTP1:=TIdHTTP.Create(self);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  IdHTTP1.Free;
  IdHTTP1:=nil;
end;

procedure TForm2.Label3Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', ('http://www.delphipraxis.net'), nil, nil, SW_ShowNormal);
end;



{==============================================================================
  Procedure:    VersionNewer	
  Belongs to:   None
  Result:       boolean
  Parameters:   
                  new : string  =   
                  old : string  =   
                    
  Description:
==============================================================================}
function  VersionNewer(new,old:string):boolean;
begin
  korrigiere(old,['0'..'9']);
  korrigiere(new,['0'..'9']);

  result:= comparestr(old,new)<0;
end;



{==============================================================================
  Procedure:    BCheckUpdateClick	
  Belongs to:   TForm2
  Result:       None
  Parameters:   
                  Sender : TObject  =   

  Description:  
==============================================================================}
procedure TForm2.BCheckUpdateClick(Sender: TObject);
var s:string;
begin
  If  InternetGetConnectedState(nil, 0) then
    try
      s:= IdHTTP1.Get('http://alexanderroth.my-place.us/MeineProgramme/VersionPrimfaktoren.txt');
      korrigiere(s,['.','0'..'9']);
      If VersionNewer(s,version) then
        begin
        form2.LInternetState.Caption:='Es ist eine neue Version '+s+' verfügbar. Bitte downloade sie doch';
        form2.LHomepage.Visible:=true;
        end
      else
        begin
        form2.LInternetState.Caption:='Du hast bereits die neuste Version';
        form2.LHomepage.Visible:=false;
        end;
    except
      form2.LInternetState.Caption:='Ich habe wohl etwas an meiner Homepage geändert. Bitte besuche sie doch und lade das neuste Programm runter';
      form2.LHomepage.Visible:=true;
    end
  else
    form2.LInternetState.Caption:='Verbinde dich bitte mit dem Internet, damit diese Update Prüfung gemacht werden kann.';
end;

end.
