;This file will be executed next to the application bundle image
;I.e. current directory will contain folder MapTool with application files
[Setup]
AppId={{net.rptools.maptool.client}}
AppName=MapTool
AppVersion=1.4.4.0
AppVerName=MapTool 1.4.4.0
AppPublisher=Nerps
AppComments=MapTool
AppCopyright=Copyright (C) 2017
;AppPublisherURL=http://java.com/
;AppSupportURL=http://java.com/
;AppUpdatesURL=http://java.com/
DefaultDirName={localappdata}\MapTool
DisableStartupPrompt=Yes
DisableDirPage=No
DisableProgramGroupPage=Yes
DisableReadyPage=Yes
DisableFinishedPage=Yes
DisableWelcomePage=Yes
DefaultGroupName=Nerps
;Optional License
LicenseFile=COPYING.AFFERO
;WinXP or above
MinVersion=0,5.1 
OutputBaseFilename=MapTool-1.4.4.0
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
SetupIconFile=MapTool\MapTool.ico
UninstallDisplayIcon={app}\MapTool.ico
UninstallDisplayName=MapTool
WizardImageStretch=No
WizardSmallImageFile=MapTool-setup-icon.bmp   
ArchitecturesInstallIn64BitMode=x64


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "MapTool\MapTool.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "MapTool\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "MapTool\app\MapTool.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs


[Icons]
Name: "{group}\MapTool"; Filename: "{app}\MapTool.exe"; IconFilename: "{app}\MapTool.ico"; Check: returnTrue()
Name: "{commondesktop}\MapTool"; Filename: "{app}\MapTool.exe";  IconFilename: "{app}\MapTool.ico"; Check: returnTrue()


[Run]
Filename: "{app}\MapTool.exe"; Parameters: "-Xappcds:generatecache"; Check: returnFalse()
Filename: "{app}\MapTool.exe"; Description: "{cm:LaunchProgram,MapTool}"; Flags: nowait postinstall skipifsilent; Check: returnTrue()
Filename: "{app}\MapTool.exe"; Parameters: "-install -svcName ""MapTool"" -svcDesc ""MapTool"" -mainExe ""MapTool.exe""  "; Check: returnFalse()

[UninstallRun]
Filename: "{app}\MapTool.exe "; Parameters: "-uninstall -svcName MapTool -stopOnUninstall"; Check: returnFalse()

[Code]
function returnTrue(): Boolean;
begin
  Result := True;
end;

function returnFalse(): Boolean;
begin
  Result := False;
end;

function InitializeSetup(): Boolean;
begin
// Possible future improvements:
//   if version less or same => just launch app
//   if upgrade => check if same app is running and wait for it to exit
//   Add pack200/unpack200 support? 
  Result := True;
end;  