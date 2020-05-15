@echo off&echo:Remember create variable options that	&ECHO:WONT RUN WHEN SET simply by quoting them	&ECHO:&echo:IF YOU SET UNQUOTED VARS WITH ^& THEY RUN
set "newLine=&CALL ECHO:&^"
set "newLine0=CALL ECHO:&^"
set "newLine1=CALL ECHO:&^echo:%%i"
set "newLine2=CALL ECHO:&^SET INNER=%%i"
set "5%%%%=&ECHO:&^^"
call:gapMe 
echo:%newline%
goto:eof
goto:eof


echo:NewLine%newLine%timeout 13%newLine%ECHO/	%newLine%ECHO	NEWLINEX3
echo:TRYsingle&%5 pause


set "4%%%%=&ECHO:a&^^"
%4CALL:WORKS&%4TIMEOUT 4
GOTO:EOF
:WORKS
ECHO%0&ECHO:HELLO%4HI 4%5 AND HI 5
ECHO%0&ECHO:HELLO%NEWLINE%HI %NEWLINE%%4%5 AND HI 5
GOTO:EOF

ECHO:end of road
GOTO:EOF

::::QUOTES SO WONT RUN WHEN SET
::set "newLine=&ECHO:&^"	:::::::::::::::::::
::THIS I JUST FOUND OUT MAKES LIKE CLI
::CAN CALL THE VAR FOR NEWLINE WITH %5
:::::::	set "5%%%%=&ECHO:a&^"	:::::::::::::::::::
::	echo:NewLine%newLine%timeout 5	:::::::::::
::	echo:TRYsingle&%5 pause	:::::::::::::::::::


::	After fucking with this for a min with various positions it hit me
::	I wonder if the var is now intertwined as I couldnt get the gapping / sapcing that I wanted

::	WELL GUESS WHAT MOTHER FUCKER IT DOES
::	IT WORKED ON BOTH LINES USING NEWLINE1
::	SO IM GUESSING ITS CALLING DOWN AND THEN BOUNCES BACK ETC
::	ONLY HIT ME WHEN I WAS GOING TO TRY ND ITERATE THOUROUGH NEWLINE 2-9....
:gapMe
for /L %%i in (1,1,9) do (color %%i%newline%ECHO:%%i)
for /L %%i in (9,-1,1) do (color %%i&%newline0%ECHO:%%i)
for /L %%i in (9,-1,1) do (color 7&%newline1%%%i)
for /L %%i in (13,-1,0) do (%newline1%%%i)

::	ALL BLANK BUT I THINK I FIGURED OUT SOMETHING MIGHT BE USEFUL
::	SEEMS LIKE ON ONE AFTER THIS THE NUMBERS COME FROM BOTH THE VAR AND ITERATION VAR I RIGHT BEFORE
for /L %%i in (13,-1,0) do (%newline2%%%i&ECHO:%INNER%)

SETLOCAL ENABLEDELAYEDEXPANSION
for /L %%i in (13,-1,0) do (%newline2%%%i&ECHO:!INNER!)
::	1. Looks like newline calls echo 
::	2. On a new line sets new VAR inner
::	3. New VAR INNER=%%i [this iteration var]
::	4. TOP VAR then gets coupled with true %%i
::	5. THEN it gets expanded right after
::	FUCKING TRUE PING PONG!!!
::	Gonna try an idea I just had PING is top

:: OKAY havent ran yet but this is how I think its going to go down
:: AND itll be refreshing since winders cant maths as found out earlier
:: WHERE its always all things like God. 
::	ITs greater than less than and equal too all at the same time
::
::	Anyways hs to nest the iteration so that I could have two vars floating
::	Since top guy inner is using baby i Hell be ping
::	Right after I set PONG to I and then continue with same formula as earlier
::	Now since hes set, and it doesnt hit a new line, its almost like key/value pairs
::	Im guessing, and hoping, that ill get a pingPONG!!!!
::	LETS SEE IT IS WINDERS THOUGH SO IM DOWN ALREADY
::	SEE NOTES BEATH A LIL BUT IT WORKED AS INTENDED
::	didnt expect the return to the top var though where it runs all again
::
::
::
::
::
::	Another new discovery -- the OG original testing  is now space sensitive
::	Kept getting error and WTF cause there was a trailing space errors
::	Guessing that means the carret is also a run NOW type deal if thats how I set it up
::	Well its ampersand and then carret so well look above
::	I was going to eascape it, which started this whole thing, but thats more for displaying on screen
::	Thats not needed but you get the idea
::
::
::	TO TEST THE SPACE SNESITIVITY ADD A SPACE TRAILING THE NEWLINE
::	GUESSING THAT ITS WITHIN THE QUOTE SO IT ITSELF IS BECOMING PART OF THE VAR MAYBE
::
::	YUP THATS IT -- CAUSE IT TO RUN SO INVOKE THE SPACE CAUSE IT WASNT WITHIN THE QUOTES
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::		Thu 05/14/2020|20:17:18.71 $^
::			' ' is not recognized as an internal or external command,
::					operable program or batch file.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	Getting my pingpong action on
::	All spacing in the block is by the vars and newline carrets
::________________________________________________________________________________________________________
::========================================================================================================
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	pingPONG
::	OUTSIDE
::	Press any key to continue . . .
::
::
::
::	Thu 05/14/2020|20:19:20.39 $
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::


for %%i in (ping) do (for %%I in (PONG) do (%newline2%%%I&ECHO:!INNER!) )

echo:OUTSIDE
pause

GOTO:EOF
GOTO:EOF




prompt immedietly below to setup date time for logging
beaneath that is the original console log
time for some PING PONG NAGGA!

fuck yeah!
pingPONG

One thing I didnt account for is  that it ends up back in the top var so runs through the rest
that might be good though to create a loop persay


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


PROMPT $D$B$T$S$$ 
	==	date|time $
		==	Thu 05/14/2020|20:07:51.92 $

PROMPT [text]

  text    Specifies a new command prompt.

Prompt can be made up of normal characters and the following special codes:

  $A   & (Ampersand)
  $B   | (pipe)
  $C   ( (Left parenthesis)
  $D   Current date
  $E   Escape code (ASCII code 27)
  $F   ) (Right parenthesis)
  $G   > (greater-than sign)
  $H   Backspace (erases previous character)
  $L   < (less-than sign)
  $N   Current drive
  $P   Current drive and path
  $Q   = (equal sign)
  $S     (space)
  $T   Current time
  $V   Windows version number
  $_   Carriage return and linefeed
  $$   $ (dollar sign)

If Command Extensions are enabled the PROMPT command supports
the following additional formatting characters:

  $+   zero or more plus sign (+) characters depending upon the
       depth of the PUSHD directory stack, one character for each
       level pushed.

  $M   Displays the remote name associated with the current drive
       letter or the empty string if current drive is not a network
       drive.






Microsoft Windows [Version 10.0.17763.805]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Users\Administrator>set
$=rundll32 sysdm.cpl,EditEnvironmentVariables
0=rclone copy "\\Veeam4b\a\OVFTOOL\ova" "0:0a/vm/ova" --progress --use-mmap --fast-list --drive-team-drive "0AL2seSBaUoaQUk9PVA" --drive-service-account-file "C:\Users\Administrator\Downloads\scaleout-54e1696d56fc.json" --log-file "D:\.vm\rclone.log" --log-level "INFO" --backup-dir "0:0a/vm/dupes"
ALLUSERSPROFILE=C:\ProgramData
APPDATA=C:\Users\Administrator\AppData\Roaming
asl.log=Destination=file
ChocolateyInstall=C:\ProgramData\chocolatey
ChocolateyLastPathUpdate=132158810414192015
ChocolateyToolsLocation=C:\tools
CommonProgramFiles=C:\Program Files\Common Files
CommonProgramFiles(x86)=C:\Program Files (x86)\Common Files
CommonProgramW6432=C:\Program Files\Common Files
COMPUTERNAME=HQ
ComSpec=C:\Windows\system32\cmd.exe
copy= copy  --progress --fast-list --use-mmap --log-file D:\logs\rclone.copy.log --log-level INFO
copyFlags= --progress --fast-list --use-mmap --log-file D:\logs\rclone.copy.log --log-level INFO
DriverData=C:\Windows\System32\Drivers\DriverData
ENV=rundll32 sysdm.cpl,EditEnvironmentVariables
flags= --progress --fast-list --use-mmap --no-update-modtime --log-file "D:\logs\%~n1.rclone.log" --log-level INFO
FPS_BROWSER_APP_PROFILE_STRING=Internet Explorer
FPS_BROWSER_USER_PROFILE_STRING=Default
GOPATH=C:\Users\Administrator\go
HOMEDRIVE=C:
HOMEPATH=\Users\Administrator
HUBOT_ADAPTER=Campfire
LOCALAPPDATA=C:\Users\Administrator\AppData\Local
logging=--log-file C:\logs\rclone.log --log-level "INFO"
LOGONSERVER=\\HQ
move= move --checksum  --progress --fast-list --use-mmap --log-file D:\logs\rclone.move.log --log-level INFO
moveFlags= --checksum --progress --fast-list --use-mmap --log-file D:\logs\rclone.move.log --log-level INFO
NUMBER_OF_PROCESSORS=8
OS=Windows_NT
Path=C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\Python27YouAintFuckinnumber1Bitch;C:\Python27YouAintFuckinnumber1Bitch\Scripts;C:\tools\ruby26\bin;C:\Program Files\Python37\Scripts\;C:\Program Files\Python37\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files\PuTTY\;C:\Program Files (x86)\WinSCP\;C:\Program Files\7-Zip\;C:\Program Files\VMware\VMware OVF Tool;C:\Program Files\dotnet\;C:\Program Files\Microsoft VS Code\bin;C:\Go\bin;C:\ProgramData\chocolatey\bin;C:\Program Files (x86)\Yarn\bin\;C:\Program Files\nodejs\;C:\Program Files\Microsoft SQL Server\130\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\Microsoft\Web Platform Installer\;C:\Program Files (x86)\Intel\OpenCL SDK\2.0\bin\x86;C:\Program Files (x86)\Intel\OpenCL SDK\2.0\bin\x64;C:\bin\dontUse;C:\Program Files\IrfanView;C:\Program Files\Calibre2\;C:\Program Files (x86)\Duplicate Cleaner Pro;C:\Program Files\Git\cmd;C:\Users\Administrator\scoop\shims;C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps;C:\Users\Administrator\go\bin;C:\Users\Administrator\AppData\Local\Yarn\bin;C:\Users\Administrator\AppData\Roaming\npm;C:\Users\Administrator\spicetify-cli;C:\Program Files\heroku\bin;C:\Users\Administrator\AppData\Local\GitHubDesktop\bin
PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW;.RB;.RBW;.kai
PERL5LIB=C:\Program Files (x86)\VMware\VMware vSphere CLI\Perl\lib
PROCESSOR_ARCHITECTURE=AMD64
PROCESSOR_IDENTIFIER=Intel64 Family 6 Model 42 Stepping 7, GenuineIntel
PROCESSOR_LEVEL=6
PROCESSOR_REVISION=2a07
ProgramData=C:\ProgramData
ProgramFiles=C:\Program Files
ProgramFiles(x86)=C:\Program Files (x86)
ProgramW6432=C:\Program Files
PROMPT=$P$G
PSModulePath=C:\Program Files (x86)\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules;;C:\Program Files\Intel\Wired Networking\
PUBLIC=C:\Users\Public
sdgsdf=asfasf
SESSIONNAME=Console
SystemDrive=C:
SystemRoot=C:\Windows
TEMP=C:\Users\ADMINI~1\AppData\Local\Temp\USERPR~1\1
TMP=C:\Users\ADMINI~1\AppData\Local\Temp\USERPR~1\1
USERDOMAIN=HQ
USERDOMAIN_ROAMINGPROFILE=HQ
USERNAME=Administrator
USERPROFILE=C:\Users\Administrator
VBOX_MSI_INSTALL_PATH=C:\Program Files\Oracle\VirtualBox\
windir=C:\Windows

C:\Users\Administrator>for /f "tokens=* delims=" %i in (Desktop\skipList.txt) do @(echo:&ECHO:%~i)

%userprofile%/.android

%userprofile%/.vscode

%userprofile%/Evernote

%programfiles%

%ProgramFiles(x86)%

%appdata%

%localappdata%

%windir%

C:\Users\Administrator>for /f "tokens=* delims=" %i in (Desktop\skipList.txt) do @(echo:&ECHO:%~i)

C:\Users\Administrator>n Desktop\useList.bat

C:\Users\Administrator>Desktop\useList.bat
Press any key to continue . . .
Terminate batch job (Y/N)?
^CThe system cannot open the device or file specified.
C:\Users\Administrator>Desktop\useList.bat
Press any key to continue . . .

C:\Users\Administrator>Desktop\useList.bat
Press any key to continue . . .

C:\Users\Administrator>%remote$
'%remote$' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>%remote%
& was unexpected at this time.

C:\Users\Administrator>set "remote=&rclone listremotes"

C:\Users\Administrator>set remote=&rclone listremotes
0:
123:
3:
home:
hq:
impersonate:
impersonate2HQ:
iso:
kaijay:
kj-rmdirs:
kjtest:
me:
me2:
me3:
myhome:
setup:
three:
torrents:
veeam:
veeamOLD:
vm:
vsphere67:
vsphere7:
webpages:

C:\Users\Administrator>set "remote=&rclone listremotes"

C:\Users\Administrator>set remote=&rclone listremotes
0:
123:
3:
home:
hq:
impersonate:
impersonate2HQ:
iso:
kaijay:
kj-rmdirs:
kjtest:
me:
me2:
me3:
myhome:
setup:
three:
torrents:
veeam:
veeamOLD:
vm:
vsphere67:
vsphere7:
webpages:

C:\Users\Administrator>n \getOptions.bat

C:\Users\Administrator>\getOptions.bat
Remember create variable options that WONT RUN WHEN SET by quoting them
IF YOU SET UNQUOTED VARS WITH AND THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them
IF YOU SET UNQUOTED VARS WITH AND THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH AND THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH &AND THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH &AND THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine{ECHO:
'}Please' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine{ECHO:
'}' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine{ECHO:
'}' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine{ECHO:
'}' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine{

'}' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

'&ECHO:' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

some more
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

 Volume in drive C has no label.
 Volume Serial Number is 88C0-AAE5

 Directory of C:\Users\Administrator

05/14/2020  06:32 PM    <DIR>          .
05/14/2020  06:32 PM    <DIR>          ..
04/22/2020  08:04 PM    <DIR>          .android
03/13/2020  04:43 PM    <DIR>          .config
05/05/2020  06:20 AM    <DIR>          .everything
05/07/2020  06:53 PM               162 .gitconfig
05/10/2020  10:53 PM    <DIR>          .ssh
01/30/2020  10:41 AM    <DIR>          .vscode
05/08/2020  02:13 PM    <DIR>          3D Objects
05/08/2020  05:18 PM             1,116 backupC.bat
01/11/2020  06:06 PM    <DIR>          Calibre Library
02/25/2020  04:46 PM    <DIR>          CloudStation
11/08/2019  10:32 PM    <DIR>          Contacts
05/14/2020  06:36 PM    <DIR>          Desktop
05/14/2020  04:03 PM    <DIR>          Documents
04/01/2020  04:33 PM    <DIR>          Downloads
11/14/2019  07:08 PM    <DIR>          Dropbox
05/12/2020  09:35 AM       102,863,360 DS3617-6-disk1.vmdk
05/07/2020  08:13 PM               351 embyonekey.sh
11/07/2019  10:22 AM    <DIR>          Favorites
05/08/2020  02:17 AM             1,360 guomi.cer
01/19/2020  04:52 PM    <DIR>          Links
02/23/2020  11:45 AM    <DIR>          Music
05/08/2020  05:59 PM    <DIR>          Pictures
02/23/2020  05:17 AM       212,035,948 Sam Morril - I Got This - Full Special-4Xo3Fq7GGWk.mp4
11/14/2019  10:50 AM    <DIR>          Saved Games
11/14/2019  10:50 AM    <DIR>          Searches
05/06/2020  07:05 PM    <DIR>          thief
02/17/2020  04:49 PM    <DIR>          Videos
05/08/2020  07:48 PM                 9 ].cmd
               7 File(s)    314,902,306 bytes
              23 Dir(s)  66,819,653,632 bytes free
C:\Users\Administrator>
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 0 seconds, press a key to continue ...
TRYsingle%5pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsinglepause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsinglepause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle%5pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle%5pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle%5pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle%5pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsinglepause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle  pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle %5 pause
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
'%5' is not recognized as an internal or external command,
operable program or batch file.
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .

Waiting for 1^CTerminate batch job (Y/N)? Ynue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .

Waiting for 0 seconds, press a key to continue ...
end of road

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
The system cannot find the batch label specified - WORKSTIMEOUT

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 5 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5

Waiting for 3 seconds, press a key to continue ...

C:\Users\Administrator>
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 3 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5

Waiting for 2 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

'^timeout' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'^HI' is not recognized as an internal or external command,
operable program or batch file.

'^' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
&timeout 5
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
&HI
& AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
&timeout 5
TRYsingle
Press any key to continue . . .
'se' is not recognized as an internal or external command,
operable program or batch file.
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
&HI
& AND HI 5

Waiting for 3 seconds, press a key to continue ...

C:\Users\Administrator>
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
&ECHOtimeout 5
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
&HI
& AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
&ECHOtimeout 5
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
^
'ECHOtimeout' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
^
'HI' is not recognized as an internal or external command,
operable program or batch file.
^
'AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
&ECHO:ECHOtimeout 5
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
&ECHO:HI
&ECHO: AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
&ECHO:ECHOtimeout 5
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
&ECHO:HI
&ECHO: AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'^' is not recognized as an internal or external command,
operable program or batch file.
ECHOtimeout 5
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
The filename, directory name, or volume label syntax is incorrect.
TRYsingle
Press any key to continue . . .
The filename, directory name, or volume label syntax is incorrect.
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
The filename, directory name, or volume label syntax is incorrect.
'&ECHO:' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'&ECHOtimeout' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'&HI' is not recognized as an internal or external command,
operable program or batch file.
'&' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'&ECHOtimeout' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'&timeout' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'&HI' is not recognized as an internal or external command,
operable program or batch file.
'&' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...^CTerminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'^timeout' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'^HI' is not recognized as an internal or external command,
operable program or batch file.
'^' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

Waiting for 4 seconds, press a key to continue ...
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'HI' is not recognized as an internal or external command,
operable program or batch file.
' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

Waiting for 10^CTerminate batch job (Y/N)? Ynue ...

C:\Users\Administrator>Y
'Y' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

Waiting for 12 seconds, press a key to continue ...
NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'HI' is not recognized as an internal or external command,
operable program or batch file.
' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

Waiting for 13 seconds, press a key to continue ...
The filename, directory name, or volume label syntax is incorrect.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'HI' is not recognized as an internal or external command,
operable program or batch file.
' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 1 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

Waiting for 12 seconds, press a key to continue ...
The filename, directory name, or volume label syntax is incorrect.
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

Waiting for 13 seconds, press a key to continue ...
The filename, directory name, or volume label syntax is incorrect.
TRYsingle
Press any key to continue . . .
The filename, directory name, or volume label syntax is incorrect.
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'HI' is not recognized as an internal or external command,
operable program or batch file.
' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 3 seconds, press a key to continue ...

C:\Users\Administrator>

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'^timeout' is not recognized as an internal or external command,
operable program or batch file.
'^' is not recognized as an internal or external command,
operable program or batch file.
'^NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
'^HI' is not recognized as an internal or external command,
operable program or batch file.
'^' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
' timeout' is not recognized as an internal or external command,
operable program or batch file.
' & NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO
' HI' is not recognized as an internal or external command,
operable program or batch file.
'  AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...

C:\Users\Administrator>
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine&timeout 13&^
'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO&HI & AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine&timeout 13&&&NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO&HI & AND HI 5

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine
'&timeout' is not recognized as an internal or external command,
operable program or batch file.
'&&' is not recognized as an internal or external command,
operable program or batch file.
'&NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLineECHO:
'^' is not recognized as an internal or external command,
operable program or batch file.
ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.
'^' is not recognized as an internal or external command,
operable program or batch file.

'^' is not recognized as an internal or external command,
operable program or batch file.
'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

'^' is not recognized as an internal or external command,
operable program or batch file.

Waiting for  6^Ceconds, press a key to continue ...
'^' is not recognized as an internal or external command,
operable program or batch file.
'^' is not recognized as an internal or external command,
operable program or batch file.
'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

'^' is not recognized as an internal or external command,
operable program or batch file.

Waiting for  0 seconds, press a key to continue ...

'^' is not recognized as an internal or external command,
operable program or batch file.
'^' is not recognized as an internal or external command,
operable program or batch file.
'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
The filename, directory name, or volume label syntax is incorrect.
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine

'&timeout' is not recognized as an internal or external command,
operable program or batch file.

'&' is not recognized as an internal or external command,
operable program or batch file.

'&NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 12 seconds, press a key to continue ...

'&CALL' is not recognized as an internal or external command,
operable program or batch file.
'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 3 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLineCALL ECHO:
ERROR: Invalid syntax. Default option is not allowed more than '1' time(s).
Type "TIMEOUT /?" for usage.

'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLOCALL ECHO:
'HI' is not recognized as an internal or external command,
operable program or batch file.
' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLineCALL ECHO:
ERROR: Invalid syntax. Default option is not allowed more than '1' time(s).
Type "TIMEOUT /?" for usage.

'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLOCALL ECHO:
'HI' is not recognized as an internal or external command,
operable program or batch file.
' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 12 seconds, press a key to continue ...

ECHO is off.

'NEWLINEX3' is not recognized as an internal or external command,
operable program or batch file.
TRYsingle
Press any key to continue . . .
'use' is not recognized as an internal or external command,
operable program or batch file.
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 3^CTerminate batch job (Y/N)? Ynue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 12 seconds, press a key to continue ...

ECHO is off.

NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 0 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 12 seconds, press a key to continue ...



NEWLINEX3
TRYsingle
Press any key to continue . . .
& was unexpected at this time.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 11 seconds, press a key to continue ...



NEWLINEX3
TRYsingle
Press any key to continue . . .
& was unexpected at this time.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
NewLine


Waiting for 11 seconds, press a key to continue ...



NEWLINEX3
TRYsingle
Press any key to continue . . .
& was unexpected at this time.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
& was unexpected at this time.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
& was unexpected at this time.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
& was unexpected at this time.

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN


1


2


3


4


5


6


7


8


9


10


11


12


13
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN


'1' is not recognized as an internal or external command,
operable program or batch file.


'2' is not recognized as an internal or external command,
operable program or batch file.


'3' is not recognized as an internal or external command,
operable program or batch file.


'4' is not recognized as an internal or external command,
operable program or batch file.


'5' is not recognized as an internal or external command,
operable program or batch file.


'6' is not recognized as an internal or external command,
operable program or batch file.


'7' is not recognized as an internal or external command,
operable program or batch file.


'8' is not recognized as an internal or external command,
operable program or batch file.


'9' is not recognized as an internal or external command,
operable program or batch file.


'10' is not recognized as an internal or external command,
operable program or batch file.


'11' is not recognized as an internal or external command,
operable program or batch file.


'12' is not recognized as an internal or external command,
operable program or batch file.


'13' is not recognized as an internal or external command,
operable program or batch file.
OUTSIDE
Press any key to continue . . .
'use' is not recognized as an internal or external command,
operable program or batch file.

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 12 seconds, press a key to continue ...



NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...^CTerminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

1
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

2
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

3
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

4
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

5
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

6
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

7
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

8
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

9
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

10
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

11
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

12
ERROR: Invalid syntax.
Type "TIMEOUT /?" for usage.

13
OUTSIDE
Press any key to continue . . .

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 12^Ceconds, press a key to continue ...


NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...

C:\Users\Administrator>
C:\Users\Administrator>
C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

Waiting for 1 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for 0 seconds, press a key to continue ...



Waiting for  0 seconds, press a key to continue ...



Waiting for  0 seconds, press a key to continue ...



Waiting for  0 seconds, press a key to continue ...



Waiting for  0 seconds, press a key to continue ...


OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

10

11

12

13
OUTSIDE
Press any key to continue . . .
'e' is not recognized as an internal or external command,
operable program or batch file.

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 12^Ceconds, press a key to continue ...


NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

13

12

11

10

9

8

7

6

5

4

3

2

1
OUTSIDE
Press any key to continue . . .

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 12^Ceconds, press a key to continue ...


NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
Sets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

Example: "COLOR fc" produces light red on bright white
1
Sets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

Example: "COLOR fc" produces light red on bright white
2
Sets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

3
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
Sets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

1
Terminate batch job (Y/N)? \getOptions.bat
^CSets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

2
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN
Sets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

1
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9
OUTSIDE
Press any key to continue . . .
OUTSIDE
Press any key to continue . . .

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 13 seconds, press a key to continue ...^C


NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 3^CTerminate batch job (Y/N)? ynue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

9

8

7

6

5

4

3

2

1
OUTSIDE
Press any key to continue . . .

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 11^Ceconds, press a key to continue ...


NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 4 seconds, press a key to continue ...

C:\Users\Administrator>

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1
'9' is not recognized as an internal or external command,
operable program or batch file.

9
'8' is not recognized as an internal or external command,
operable program or batch file.

8
'7' is not recognized as an internal or external command,
operable program or batch file.

7
'6' is not recognized as an internal or external command,
operable program or batch file.

6
'5' is not recognized as an internal or external command,
operable program or batch file.

5
'4' is not recognized as an internal or external command,
operable program or batch file.

4
'3' is not recognized as an internal or external command,
operable program or batch file.

3
'2' is not recognized as an internal or external command,
operable program or batch file.

2
'1' is not recognized as an internal or external command,
operable program or batch file.

1
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

9

8

7

6

5

4

3

2

1
OUTSIDE
Press any key to continue . . .
'se' is not recognized as an internal or external command,
operable program or batch file.

The filename, directory name, or volume label syntax is incorrect.
NewLine


Waiting for 13 seconds, press a key to continue ...^C


NEWLINEX3
TRYsingle
Press any key to continue . . .
WORKS
HELLOHI 4 AND HI 5
WORKS
HELLO

'HI' is not recognized as an internal or external command,
operable program or batch file.

' AND' is not recognized as an internal or external command,
operable program or batch file.

Waiting for 3 seconds, press a key to continue ...

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1
Sets the default console foreground and background colors.

COLOR [attr]

  attr        Specifies color attribute of console output

Color attributes are specified by TWO hex digits -- the first
corresponds to the background; the second the foreground.  Each digit
can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

If no argument is given, this command restores the color to what it was
when CMD.EXE started.  This value either comes from the current console
window, the /T command line switch or from the DefaultColor registry
value.

The COLOR command sets ERRORLEVEL to 1 if an attempt is made to execute
the COLOR command with a foreground and background color that are the
same.

9
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1
CALL ECHO:
9
CALL ECHO:
8
CALL ECHO:
7
CALL ECHO:
6
CALL ECHO:
5
CALL ECHO:
4
CALL ECHO:
3
CALL ECHO:
2
CALL ECHO:
1
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

9

8

7

6

5

4

3

2

1
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

9

8

7

6

5

4

3

2

1

13

12

11

10

9

8

7

6

5

4

3

2

1

0
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

9

8

7

6

5

4

3

2

1

13

12

11

10

9

8

7

6

5

4

3

2

1

0
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

99

88

77

66

55

44

33

22

11

1313

1212

1111

1010

99

88

77

66

55

44

33

22

11

00
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? YU

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

99

88

77

66

55

44

33

22

11

1313

1212

1111

1010

99

88

77

66

55

44

33

22

11

00

'1313' is not recognized as an internal or external command,
operable program or batch file.

'1212' is not recognized as an internal or external command,
operable program or batch file.

'1111' is not recognized as an internal or external command,
operable program or batch file.

'1010' is not recognized as an internal or external command,
operable program or batch file.

'99' is not recognized as an internal or external command,
operable program or batch file.

'88' is not recognized as an internal or external command,
operable program or batch file.

'77' is not recognized as an internal or external command,
operable program or batch file.

'66' is not recognized as an internal or external command,
operable program or batch file.

'55' is not recognized as an internal or external command,
operable program or batch file.

'44' is not recognized as an internal or external command,
operable program or batch file.

'33' is not recognized as an internal or external command,
operable program or batch file.

'22' is not recognized as an internal or external command,
operable program or batch file.

'11' is not recognized as an internal or external command,
operable program or batch file.

'00' is not recognized as an internal or external command,
operable program or batch file.
OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

99

88

77

66

55

44

33

22

11

1313

1212

1111

1010

99

88

77

66

55

44

33

22

11

00




























OUTSIDE
Press any key to continue . . .
Terminate batch job (Y/N)? Y

C:\Users\Administrator>\getOptions.bat
Remember create variable options that
WONT RUN WHEN SET simply by quoting them

IF YOU SET UNQUOTED VARS WITH & THEY RUN

1

2

3

4

5

6

7

8

9

9

8

7

6

5

4

3

2

1

99

88

77

66

55

44

33

22

11

1313

1212

1111

1010

99

88

77

66

55

44

33

22

11

00

00

00

00

00

00

00

00

00

00

00

00

00

00

00

1313

1212

1111

1010

99

88

77

66

55

44

33

22

11

00
OUTSIDE
Press any key to continue . . .