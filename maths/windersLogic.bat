
@echo off


:https://stackoverflow.com/questions/47385508/symbol-equivalent-to-neq-lss-gtr-etc-in-windows-batch-files
echo:if "100" LSS "20" echo String "100" is less than string "20".
if "100" LSS "20" echo String "100" is less than string "20".
echo:&ECHO:FUCKING WINDOWS

:IT AINT JUST ME
:https://stackoverflow.com/questions/35769581/weird-results-with-if

@echo off
set a=333333333333
set b=444444444444
call :compare
set b=222222222222
call :compare
goto :eof

:compare
echo comparing %a% with %b%
if %a% geq %b% (echo a ^>= b) else (echo -)
if %b% geq %a% (echo b ^>= a) else (echo -)
if %a% leq %b% (echo a ^<= b) else (echo -)
if %b% leq %a% (echo b ^<= a) else (echo -)
if %a% equ %b% (echo a  = b) else (echo -)
if %a% == %b% (echo a == b) else (echo -)


ECHO:BITCH 
goto:eof

::____________________________________________________________________________________________________::
I'm sure most know this shit, but not a dev. Winders fucking maths skill drove me nutz, so said fuck it. 
Thought, who's getting worse every day, Google and probably cause of this idiot.
What's the worst that could happend right? QUcik example google "github desktop" then append whatever
results aint going to have shit to do with github desktop anymore. I went from near perfect match on 100
To fucking I think one/100 just by appending remove repos. Ah whatever enough ranting about these autobot morons

Below is just a straight dump with sources to the threads. It was just driving me nuts, and has many times in the past.
Wanted to try and resolve it...Which you cant...cause winders. No 10 IS NOT LESS THAN 9
NOR is 100<9, but to winders it is, but if you make it 9<100 you guessed it -- it resolves

When I ran the blow tidbit where the guy pointed out that winders is God somehow as it's all things
It's greater than, less than, and equal too all at the same time Oo
Good things came as now I know how to have a var set itself as callable injector into others
Calling started out with just newline fuckery you can call 
Helped me workout a GLOBAL VAR injecting itself into a local delayed var where both become concatanated


Anyways enjoy the grab em right in the pussy maths. Articvle above are a good read though

@echo off
set count=10&setlocal enabledelayedexpansion
::	echo:"!count!"&call:dumbCunt !count!
::for %%i in (!count!) do (if NOT "%%~i" LEQ "9" (ECHO:IM JUST A FUCKING WINDERS WHORE) ) ?? NEGATE SO 10 is GREATER THAN 9 >> DOESNT RESPOND
::for %%i in (!count!) do (if "%%~i" LEQ "9" (ECHO:IM JUST A FUCKING WINDERS WHORE) ) >> IF 10 LESS THAN OR == 9 >>> FUCKING RESPONDS
for %%i in (!count!) do (if "9" LEQ "%%~i" (ECHO:IM JUST A FUCKING WINDERS WHORE) )

goto:eof

echo:if "10||11" LEQ "1" (echo:WHAT THE FUCK) else (echo call me dumb cunt)
echo:&ECHO:&if "10||11" LEQ "1" (echo:WHAT THE FUCK) else (echo call me dumb cunt)
echo:&ECHO:&echo calling:dumbCunt with !count!&call:dumbCunt !count!

goto:eof



:dumbCunt
echo:&ECHO:&echo:if "%~1" LEQ "9" (ECHO %0--------FUCK!!!!!!!!! callin me with %1 which is LEQ 9) else (echo:IM A FUCKING %0 TWAT)
echo:&ECHO:&if "!!~1!" LEQ "9" (ECHO %0--------FUCK!!!!!!!!! callin me with %1 which is LEQ 9) else (echo:IM A FUCKING %0 TWAT)
goto:eof
if "%count%" LEQ "9" (ECHO:FUCK!!!!!!!!!)

goto:eof
::if set /a "100+110" LEQ "1" (echo:WHAT THE FUCK)
:countFucker
::set /a count=!count!+1&timeout !count!

set /a count+=1&echo:!count!&timeout !count!
color !count!
if "!count!" LEQ "9" (ECHO:FUCK!!!!!!!!!&call:countFucker&timeout 3) else (echo:!COUNT!&timeout 65535)
goto:eof


set count=3&set /a count+=1&echo:%count%&echo:!count!----&if "%count%" GEQ "9" ECHO:FUCK&if "!count!" GEQ "9" ECHO:FUCK!!!!!!!!!






















goto:eof
set count=3;&set /a count+=1&echo:%count%&call &set count=&call echo:%%count%%&if "%count%" GEQ "9" ECHO:FUCK
goto:eof
:counter
set /a count+=1&echo:%count%&if "%count%" GEQ "9" (echo:%count%&call:counter&goto:eof) else (echo:%count%&ECHO:FUCK&GOTO:EOF)
goto:eof
set /a count+=1&echo:%count%&if "%count%" LEQ "9" (echo:%count%&call:counter&goto:eof) else (echo:%count%&pause&goto:eof&goto:counter)
goto:eof
set /a count+=1&echo:%count%&if "%count%" LEQ "9" (echo:%count%&call:counter&goto:eof) else (echo:%count%&goto:counter&pause&goto:eof)
goto:eof
set count=3&if "%count%" GEQ "9" ECHO:FUCK
1
1
2
2
3
3
4
4
5
5
6
6
7
7
8
8
9
9
10
10
11
1



