{-----------------------------------------------------------------------------
 Unit Name: Utxt
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}
unit Utxt;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles, Shellapi, Gauges, ExtCtrls, StdCtrls, ComCtrls, Menus,dateutils;

type TTxt=class
  public
    procedure intxtschreiben(text:string;  pfad:string='';  const endung:string='.txt'; vorherloschen:boolean=true);
  end;


var  txt:TTxt;


implementation



{-----------------------------------------------------------------------------
  Description:  Schreibt in eine TXT rein
  Procedure:    intxtschreiben
  Arguments:    text:string; pfad:string=''; vorherloschen:boolean=true
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TTxt.intxtschreiben(text:string;  pfad:string='';  const endung:string='.txt'; vorherloschen:boolean=true);
var txt:textfile;
    index:integer;
begin
  if  pfad='' then pfad:=ExtractFilePath(Application.ExeName)+dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten'+endung
  else
    begin     //macht doppelte endungen weg
      index:=pos(  endung  , pfad  );
      while index>0  do
        begin
        delete(pfad,index,4);
        index:=pos(  endung  , pfad  );
        end;
      pfad:=pfad+endung;
    end;

  try
    assignfile(txt,pfad);
    if (fileexists(pfad))and(not vorherloschen) then append(txt) else rewrite(txt);
    writeln(txt,text);
    closefile(txt);
  except
    showmessage('Es konnte keine Datei erstellt werden!'+chr(13)+
          'Falls Sie das Programm von CD Starten kopieren Sie bitte die *.exe auf ihre Festplatte und starten Sie erneut!');
  end;
end;


end.
