
Don't mind the messy shit. Just testing etc. cause not a dev.  

Sure most learned this crap in preSchool, or are smarter than that and don't fuck with winders!
# GLOBAL VAR INJECTION in local loop  

## basic breakdown cause kinda cool

if you're not familiar with the local to global techniques  
basically this allows you to run local expansion without affecting everything  

ie run the delay at the called label/child and not at the parent level  

In the wild this can be seen even in the GCP python scripts on your system if installed  
.. Its nothing fancy just warning about setting local blah blah at the global level  

If you check out ss64.com they have the following tidbit as well with regards to expanding  

> endlocal&set var=%var%  

This allows you to do X, like arrays, but when done set the expansion globally  

Make your array:  
>for blah blah set var=%%i !var! {inverse array [z->a]}  
> Or not backwards= var=!var! %%i {proper array [a->z]} 

make array var global:  
> endlocal ***&*** set var=%var%  

returning to global *then* setting var is akin to setting your path to %path%;  
Well we have global set from local   

  
**Were after the reverse, and instead want global**   ***inside of local***   
___Global is visiting local, so why not play tickle the var while spooning___

## Trick 2 
### RUN when set

Theres nothing to this one really, and can do it straight from prompt without a batch file.  
Bascially, when this gets set [set var=&$DO] then it gets ran.  

Pretty straight forward, simple, and a true set it and forget it.   
  
>set var=&mycommand   
Again, this **WILL RUN** ***as soon as set*** **WITHOUT ECHO**    
   
BUT today my dumb ass found out that if quoted it wont   
>set "var=&mycommand"  
That **WILL NOT RUN** unless requested [%var%]   

## Trick 3
### DELAYEDEXPANSION WITHOUT USING BANG !!

This too is simple and straight forward, works without local/delayedExpansion, and can be coupled with the earlier trick  
You esentially strip off the outer declaration(?) turning nested vars [%%var%%] into a single %var% [no !!]   

This can be accomplished by using call as a proxy/relay.   
instead of call $VAR$, or echo %VAR%, link them togher [call echo]     
Your var's var gets expanded at level 2 [%foo%=%%bar%%|-->|foo=%bar%]



    set one=%two%   
    set two=six   
    
now check    
    
    echo %one%    
    echo %two%    

> one == %TWO%  
> two == six  
     
     call echo %one%  
     
> one == six  

of course you can go even further, but....were injecting now    


## Shit overview
### High Level View
itll look like so basically  
- global var is setup using aforementioned $set var=&...  
- well use another trick with the caret for a new line $set var=&^..  
- global will also be quoted so that it doesnt run initially $set "var=&^.."  

### General Process Flow 
+ local loop needs expand ENABLED
+ local loop is a standard $for %%i   
+ local loop $ /f might need useback
+ local loop skips outer var1 "%%i"
+ local loop uses inside var2 "%%I"
+ local loop phase starts do()  
+ local loop do(%VAR%) is global
+ local loop becomes global %%i
+ global had %%i preset inline
+ global uses %%i for responses
+ local runs the loop for %%i
+ local loop %%I now uses both

### General spitballin
This was just ran as a test. Theres potential though.   
If doing %* I would probably run it from inner loop      
1:1 parity rarely works as intended when nested    
Since bang will work the skys the limit   
You now have local, global, and time all for you   
Nothing will proceed until your loop completes  
Once inner loop is done it gets sent to outer  
More outer inputs to %%i means return to %%I   
Gain more control with for /L ran as %%I   
Use new var ie %%a and can control iterations   
Could see this setup being great in evaluations   
Even for verification of key value pairs and more    
Even maintain control by escaping to subRoutine  
Once all loops complete control returns to top

> Use this a million different ways with adjustments  
> The file is hella messy from console outputs etc  
> Same for the sub var area as i just wanted to see  
> Earlier runs I would concatanate both using %%i  

### Simpler flow
1. gVAR=newline trick
2. local is called allowing expansion  
3. local runs for %%i {ping} and lets global use  
4. local runs for %%I {PONG} in nested loop  
5. local executes the global var  
6. global var has %%i as part of set/run  
7. global expands the localy set var from loop  

### Runtime breakdown
***loop2/innerloop/%%I***   
4%%i in()do(4%%Iin()do(***$***))  

__echo for outputs__  
>   %gVAR%%%i%%I&echo:  
### %%%% Breakdown %%%%  
    gVAR=use in start this   
    %%i=ping in outer loop    
    %%I=PONG in inner loop    
        

## SNIPPETS 
> dont mind the names and shit was just fuckery   
_echo in global var is used to execute_   
   
runMain:     
     
       set "newLine2=CALL ECHO:&^SET INNER=%%i"    
       call:gapMe    
     
getLoop:  

     for %%i in (ping) do (for %%I in (PONG) do (%newline2%%%I&ECHO:!INNER!) )
  
     echo:OUTSIDE
  
results:  
%%i  %%I   
pingPONG  
::	OUTSIDE  
::	Press any key to continue . . .    
::  
::  
::  
::	Thu 05/14/2020|20:19:20.39 $  






## Closing thoughts unedited
Why did I do all this? Well fucking winders and its whatever. Plus there could be great benefit from this.  
youre not only injecting a "static" global var into a local nested loop, but youre doing it without bullshit    
No if exist /if not == /call:bob sdfg /if defined/errormynuts/goto:brothel  
NONE of that bullshit is getting used which could save on A LOT of shit  
More than likely, being local and expandable, you could set both outer and inner to other vars  
Hell im sure you could build an array, or two, before hand and pull some fuckery in the exection "do"  
ie... %i=!FOO!%I=!BAR! if %VAR% & if "!FOO!" cantMATH "!BAR!" (suck a dick)  
not sure if the expansion could happen above or would have to be done before hand, but im sure it would expand  
only because again you have global literally all nested up in the ass crack of local  
and when it gets ran hes smelling the hair of local so hes just a local before the paly with eachothers balls  
