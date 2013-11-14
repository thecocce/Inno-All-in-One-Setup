; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "My Program"
#define MyAppVerName "My Program 1.5"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "MyProg.exe"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
;Source: C:\Program Files\Inno Setup 5\Examples\MyProg.exe; DestDir: {app}; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: logo.bmp; DestDir: {app}; Flags: dontcopy

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon

[Run]
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#MyAppName}}; Flags: nowait postinstall skipifsilent


[Code]
var
 g_waitform:TForm;
 g_iconimg:TBitmapImage;
 g_frame:TBevel ;

procedure ShowForm(IconFile,title:string);
var
  Label_title:TLabel;
begin

  g_waitform:=TForm.create(WizardForm);

  ExtractTemporaryFile(IconFile);
	g_iconimg := TBitmapImage.Create(g_waitform);
	g_frame:=TBevel.create(g_waitform);
	Label_title:=TLabel.create(g_waitform);

  g_waitform.width:=200;
  g_waitform.height:=78;

  with g_iconimg do
	begin
  	Bitmap.LoadFromFile(expandconstant('{tmp}\'+IconFile));
  	Stretch := false;
  	//Align := alClient;
  	parent:=g_waitform;
  	left:=20;
  	height:=Bitmap.height;
  	width:=bitmap.width;
  	top:= (g_waitform.Height - Height) / 2;
	end;

  with g_frame do
  begin
  	parent:=g_waitform;
  	Shape:=bsBox;
  	left:=1;
  	top:=1;
  	width:=parent.width-2;
  	height:=parent.height-2;
  	Style:=bsRaised;
  end;


  with Label_title do
  begin
  	parent:=g_waitform;
  	left:=g_iconimg.Left + g_iconimg.Width + 20;
  	top:=parent.height/2-10;
  	width:=parent.width-left;

  	caption:=title;
  end;
  
  with g_waitform do
  begin
    BORDERSTYLE:= bsNone;
    Position := poScreenCenter;
//    parent:=wizardform;
    show();
    Repaint;
  end;
end;

procedure KillForm();
begin
  g_waitform.hide();
  g_waitform.close();
  g_waitform.free();
end;


function NextButtonClick(CurPageID: Integer): Boolean;
begin
  result:=true;
  ShowForm('logo.bmp','hahahahh');
  WizardForm.Hide;
  sleep(2000);
  WizardForm.Show;
  KillForm();
end;
