#define MyAppName "HADES"
#ifndef MyAppVersion
  #define MyAppVersion "0.0.0"
#endif
#ifndef MyVersionInfo
  #define MyVersionInfo "0.0.0.0"
#endif
#define MyPublisher "ATLAS TECNOLOGIA"
#define MyExeName "HADES.exe"

; Este arquivo é o espelho público da definição oficial usada no pacote-fonte do HADES.
; O build oficial passa MyAppVersion/MyVersionInfo pela linha de comando do ISCC.

[Setup]
AppId={{9D10A77A-CC6D-4B72-AE4F-9A7A5D3F0901}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyVersionInfo}
AppPublisher={#MyPublisher}
AppPublisherURL=https://github.com/tullilind/Atlas-Hub/tree/main/HADES
AppSupportURL=https://github.com/tullilind/Atlas-Hub/tree/main/HADES
DefaultDirName={autopf}\Atlas Tecnologia\HADES
DefaultGroupName=Atlas Tecnologia\HADES
DisableProgramGroupPage=yes
DisableDirPage=auto
UsePreviousAppDir=yes
OutputBaseFilename=HADES-Setup-{#MyAppVersion}-windows-x64
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
CloseApplications=yes
CloseApplicationsFilter=HADES.exe
RestartApplications=no
SetupLogging=yes
UninstallDisplayIcon={app}\{#MyExeName}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0
Uninstallable=yes

[Files]
Source: "HADES.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace
Source: "HADES_VERSION.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "TERMOS_INSTALACAO_HADES.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\Atlas Tecnologia\HADES"; Filename: "{app}\{#MyExeName}"; WorkingDir: "{app}"
Name: "{autodesktop}\HADES"; Filename: "{app}\{#MyExeName}"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na Área de Trabalho"; GroupDescription: "Atalhos:"; Flags: unchecked

[Run]
Filename: "{app}\{#MyExeName}"; Description: "Abrir HADES"; Flags: nowait postinstall skipifsilent
