{-----------------------------------------------------------------------------
 Unit Name: UstopTime
 Author:    Alexander Roth
 This unit is licensed unter the GPL3
 This license note and the original author (Alexander Roth) must not be altered.
-----------------------------------------------------------------------------}

unit UstopTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;



type
      Tstoptime= class
        private
          storedtime:longint;
        public
          procedure start;
          function  sec:double;
          function  msec:longint;
      end;




procedure Test;


var    stoptime:Tstoptime;


implementation






procedure  Tstoptime.start;
begin
  storedtime := gettickcount;
end;



function  Tstoptime.msec:longint;
begin
  result := gettickcount - storedtime;
end;



function  Tstoptime.sec:double;
begin
  result := msec / 1000;
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    Test
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure Test;
const wartezeit=100;
var mystop:Tstoptime;
begin
  mystop:=Tstoptime.Create;

  mystop.start;
  while mystop.msec < wartezeit do application.ProcessMessages;

  showmessage(floattostr(mystop.msec));
end;









end.












{unit UstopTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,
  nints, Ufaktoren;



type
      Tstoptime= class
        private
            function RDTSC: Int64; // sollte UInt64 sein
            function IsRDTSCPresent: Boolean;
            function CalcCPUFrequency(Rounds: Cardinal = 1): Int64;
            function CPUFrequency: Int64;

            function Secs(Cycles: Int64): Double;
        public
            procedure Test;
            procedure start;
            function  sec:double;
            function  msec:double;
      end;




var    stoptime:Tstoptime;

      storedtime:int64;

implementation




function Tstoptime.RDTSC: Int64; // sollte UInt64 sein
// Liest den Time Stamp Counter der CPU
asm
       DW    0310Fh    // RDTSC Opcode, hier als DW für D3-D4
end;



function Tstoptime.IsRDTSCPresent: Boolean;
// Überprüft ob der Time Stamp Counter durch die CPU unterstützt wird.
// Extrahiert aus meinem Delphi Encryption Compendium. Es gelten die
// Copyright aus dem DEC, Public Domain.
  function HasRDTSC: Boolean; assembler;
  asm
       PUSH    EBX
       PUSHFD
       PUSHFD
       POP     EAX
       MOV     EDX,EAX
       XOR     EAX,0040000h
       PUSH    EAX
       POPFD
       PUSHFD
       POP     EAX
       XOR     EAX,EDX
       JZ      @@1
       PUSHFD
       POP     EAX
       MOV     EDX,EAX
       XOR     EAX,0200000h
       PUSH    EAX
       POPFD
       PUSHFD
       POP     EAX
       XOR     EAX,EDX
@@1:   POPFD
       TEST    EAX,EAX
       JZ      @@2
       MOV     EAX,1
       DW      0A20Fh     // CPUID
       TEST    EDX,010h   // test RDTSC flag in Features
       SETNZ   AL
@@2:   POP     EBX
  end;
begin
// dieser Try Except Block ist absolut nötig.
// RDTSC kann eine privilegierte Instruktion sein, d.h. das OS kann jederzeit
// so konfiguriert sein das es die CPU anweisst das RDTSC eine priviligierte
// Instruktion ist.
  try
    Result := HasRDTSC;
    if Result then RDTSC;
  except
    Result := False;
  end;
end;




function Tstoptime.CalcCPUFrequency(Rounds: Cardinal = 1): Int64;
var
  C,F,S,E,D,T: Int64;
begin
  if IsRDTSCPresent and QueryPerformanceFrequency(F) and QueryPerformanceCounter(S) then
  begin
    C := F * (Rounds +1);
    QueryPerformanceCounter(S);
    D := RDTSC;
    while C > 0 do Dec(C);
    QueryPerformanceCounter(E);
    T := RDTSC;
    Result := Round((T - D) * F / (E - S));
  end else Result := 0;
end;




// gibt die Takzyklen pro Sekunde zurück
function Tstoptime.CPUFrequency: Int64;
var
  Frequency: Int64 ;
begin
  Frequency := CalcCPUFrequency;
  if Frequency = 0 then
    raise Exception.Create('Kann CPU Frequenz nicht berechnen');
  Result := Frequency;
end;




function Tstoptime.Secs(Cycles: Int64): Double;
// rechnet Taktzyklen in Sekunden um
begin
  Result := Cycles / CPUFrequency;
end;






procedure Tstoptime.Test;
var
  Start,Stop: Int64;
  Tick: DWord;
begin
//  WriteLn('CPU Taktfrequenz ist ', CPUFrequency/1000000.0:6:1, ' MHz');

  Tick := GetTickCount + 100;
  Start := RDTSC;
  while GetTickCount < Tick do ;
  Stop := RDTSC;
//  WriteLn;
  //WriteLn('Testschleife dauerte: ');
//  WriteLn('Taktzyklen    : ', Stop - Start:10);
//  WriteLn('Millisekunden : ', Ticks(Stop - Start):10:2);
//  WriteLn('Sekunden      : ', Secs(Stop - Start):10:2);
end;



procedure  Tstoptime.start;
begin
storedtime := RDTSC;
end;



function  Tstoptime.sec:double;
begin
result := Secs(RDTSC - storedtime);
end;



function  Tstoptime.msec:double;
begin
result := Secs(RDTSC - storedtime)*1000;
end;




end.}





















{unit UstopTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,
  nints, Ufaktoren;



type
      Tstoptime= class
        private
            function RDTSC: Int64; // sollte UInt64 sein
            function Secs(Cycles: Int64): Double;
        public
            procedure start;
            function sec:Double;
            function msec:Double;
      end;




var    stoptime:Tstoptime;

        storedtime:int64;

implementation




// Liest den Time Stamp Counter der CPU
function Tstoptime.RDTSC: Int64;
asm
       DW    0310Fh
end;



// rechnet Taktzyklen in Sekunden um
function Tstoptime.Secs(Cycles: Int64): Double;
var a:int64;
begin
  windows.QueryPerformanceFrequency(a);
  Result := Cycles / a;
end;




procedure Tstoptime.start;
begin
storedtime:=RDTSC;
end;


function Tstoptime.sec:Double;
begin
result:=secs(RDTSC - storedtime);
end;



function Tstoptime.msec:Double;
begin
result:=secs(RDTSC - storedtime)*1000;
end;




end.      }
