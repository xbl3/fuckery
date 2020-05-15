
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

This allows you to do X, like arrays, but when done set the expansion globally  
this would go like so,  for blah blah set var=%%i!var! BUT at endlocal you would reset as  
  
> endlocal&set var=%var%  
  
so thats our global set from local, ***but were after global injecting local instead***    

## Trick 2 
### RUN when set

Theres nothing to this one really, and can do it straight from prompt without a batch file.  

bascially, when this gets set [set var=] then it gets ran.  

Can be great for long commands so that its ran a la doskey kinda.  

Pretty straight forward and simple to do with the use of the ampersand.  

>set var=&mycommand

This WILL RUN as soon as set. NO CALLING NEEDED. BUT today my dumb ass found out that if quoted it wont

>set "var=&mycommand"

That WILL NOT RUN unless called as a typical var  

This got me thinking and dedcided to add a coupe more tricks like expansion without local

## Trick 3
### DELAYEDEXPANSION WITHOUT !ANYWHERE!

This one again is kinda simple and straight forward, and can actually be coupled with the earlier trick  

Basically your chaining commands to strip off the outer layer in a sense so %%var%% is %var% [no !!]  

This can be accomplished simply by using call and directing the call towards echo [call echo]  

When this happends the wonders or math kick in for winders and if  your var was a var itself gets expanded  

    set one=%two%   
    set two=six   
    
now check
    echo %one%    
    echo %two%    

one == %TWO%  
two == six  
> call echo %one%  
one == six  

of course you can go even further by using earlier trick with nested vars 3+ calls away to expand, but....were injecting now  

itll look like so basically  
- global var is setup using aforementioned set var=&...  
- well use another trick with the caret for a new line set var=&^..  
- global will also be quoted so that it doesnt run when set "var=&^.."  

+ local will have delayed expansion ENABLED to use inline
+ local loop is a standard for %%i [barely bitches]
+ local could possibly work with steve jr but im sure would need useback
+ local will call a sub var "%%I"
+ local init var is standard %%i
+ local will come after global var

> of course Im sure this shit could be setup a million different ways with adjustments
> this is just how the hella messy file is setup
> same goies for the sub var as i just wanted to see vs having it concatanate both using %%i

### quick flow
1. gVAR=newline trick
2. local is called allowing expansion
3. local runs for %%i {ping} and lets global use
4. local runs for %%I {PONG} in nested loop
5. local executes the global var
6. global var has %%i as part of set/run
7. global expands the localy set var from loop

final "do" flow is like this:  
>   %gVAR%%%i%%I&echo:
gVAR=run Globally set VAR  
%%i=ping in outer loop  
%%I=PONG in inner loop  
echo is used cause just like this whole setup its as backwards as winders  

*without echo in loop it will not work properly*  

_echo in global var is used to execute_  

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


## SNIPPETS 
dont mind the names and shit was just fuckery  

TopMost:  

> set "newLine2=CALL ECHO:&^SET INNER=%%i"
> call:gapMe  

lowerLoop:  

> for %%i in (ping) do (for %%I in (PONG) do (%newline2%%%I&ECHO:!INNER!) )
  
> echo:OUTSIDE
  
results:  
pingPONG  
::	OUTSIDE  
::	Press any key to continue . . .    
::  
::  
::  
::	Thu 05/14/2020|20:19:20.39 $  
