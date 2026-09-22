#define MyAppName "HADES"
#ifndef MyAppVersion
  #define MyAppVersion "0.9.1"
#endif
#define MyPublisher "ATLAS TECNOLOGIA"
#define MyExeName "HADES.exe"

[Setup]
AppId={{9D10A77A-CC6D-4B72-AE4F-9A7A5D3F0901}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyPublisher}
DefaultDirName={autopf}\Atlas Tecnologia\HADES
DefaultGroupName=Atlas Tecnologia\HADES
DisableProgramGroupPage=yes
OutputBaseFilename=HADES-Setup-{#MyAppVersion}-windows-x64
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
CloseApplications=yes
RestartApplications=no
UninstallDisplayIcon={app}\{#MyExeName}
LicenseFile=TERMOS_INSTALACAO_HADES.txt
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Files]
Source: "HADES.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace

[Icons]
Name: "{autoprograms}\Atlas Tecnologia\HADES"; Filename: "{app}\{#MyExeName}"; WorkingDir: "{app}"

[Run]
Filename: "{app}\{#MyExeName}"; Description: "Abrir HADES"; Flags: nowait postinstall skipifsilent
