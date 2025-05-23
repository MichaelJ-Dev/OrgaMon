;
; -- OrgaMon-update.iss --
;

[Languages]
Name: "de"; MessagesFile: "compiler:Languages\German.isl"

[Setup]
AppName=OrgaMon
AppVerName=OrgaMon 8.767
AppCopyright=Copyright (C) 1988-2023 Andreas Filsinger
DefaultDirName={pf}\OrgaMon
DefaultGroupName=OrgaMon
UninstallDisplayIcon={app}\OrgaMon.exe
LicenseFile=Distribution\Lizenz\gpl-3.0.txt
DisableStartupPrompt=yes
DisableReadyPage=yes
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=yes
OutputDir=..\..\CargoBay
OutputBaseFilename=Setup-OrgaMon-8767-Update
AppVersion=8.767
VersionInfoVersion=8.767.0.0
Compression=zip
WizardImageFile=compiler:WizModernImage.bmp
WizardSmallImageFile=compiler:WizModernSmallImage.bmp
PrivilegesRequired=none

[Files]
; Anwendung
Source: "C:\Program Files (x86)\\OrgaMon\OrgaMon.exe"; DestDir: "{app}"; DestName: "OrgaMon.exe"; BeforeInstall: WaitForExit; Flags: ignoreversion restartreplace

; Lizenz-Infos
Source: "..\..\CargoBay\OrgaMon_Info.html"; DestDir: "{app}"
Source: "Distribution\Lizenz\gpl-3.0.txt"; DestDir: "{app}"; DestName: "Lizenz.txt"; Flags: onlyifdoesntexist

; openssl
Source: "..\openssl\openssl-1.0.2u-i386-win32\libeay32.dll"; DestDir: "{app}"; Flags: 32bit restartreplace uninsneveruninstall
Source: "..\openssl\openssl-1.0.2u-i386-win32\ssleay32.dll"; DestDir: "{app}"; Flags: 32bit restartreplace uninsneveruninstall

; tgputtylib
Source: "..\TGPuttyLib\tgputtylib.dll"; DestDir: "{app}"; Flags: 32bit restartreplace uninsneveruninstall

; libxml2
Source: "..\libxml2\bin\iconv.dll"; DestDir: "{app}"; Flags: 32bit onlyifdoesntexist uninsneveruninstall
Source: "..\libxml2\bin\zlib1.dll"; DestDir: "{app}"; Flags: 32bit onlyifdoesntexist uninsneveruninstall
Source: "..\libxml2\bin\libxml2.dll"; DestDir: "{app}"; Flags: 32bit onlyifdoesntexist uninsneveruninstall

; neue und aktualisierte notwendige Files
Source: "Distribution\HTML Vorlagen\COR1.xml"; DestDir: "{userdocs}\OrgaMon\Daten\HTML Vorlagen"; Flags: onlyifdoesntexist
Source: "Distribution\HTML Vorlagen\+*"; DestDir: "{userdocs}\OrgaMon\Daten\HTML Vorlagen"; Flags: onlyifdoesntexist
Source: "Distribution\System\BLZ_*"; DestDir: "{userdocs}\OrgaMon\Daten\System"; Flags: onlyifdoesntexist

[Icons]
Name: "{group}\OrgaMon"; Filename: "{app}\OrgaMon.exe"
Name: "{group}\OrgaMon Info"; Filename: "{app}\OrgaMon_Info.html"
Name: "{group}\Direkthilfe"; Filename: "{app}\OrgaMon-VNC.exe"

[Run]
Filename: "{app}\OrgaMon.exe"; Description: "Starte OrgaMon"; Parameters: "{param:PostExec}"; Flags: postinstall nowait

[Code]
procedure WaitForExit;
var
 DestFName : string;
 n : integer;
begin
 DestFName := ExpandConstant(CurrentFileName);
 if FileExists(DestFName) then
 begin
  n := 0;
  repeat
   sleep(1000);
   DelayDeleteFile(DestFName,4);
   if not(FileExists(DestFName)) then
    break;
   n := n + 1;
   if (n=8) then
    break;
   beep;
  until false;
 end;
 if FileExists(DestFName) then
 begin
  MsgBox(DestFName + #13 +
   'kann nicht �berschrieben werden!'+ #13+#13+
   'Ursachen k�nnen sein:'+#13+
   '* Sie haben nicht ausreichende Benutzerrechte -> Fragen Sie den Administrator'+#13+
   '* OrgaMon l�uft noch -> Starten Sie den Taskmanager und beenden Sie alle OrgaMon Anwendungen.',mbError, MB_OK);
 end;
end;
