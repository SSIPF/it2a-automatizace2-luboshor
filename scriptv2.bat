 
set file=
set passwrd=123
setlocal enabledelayedexpansion
 
:parameters
if /I %~1 == -file SET file=%2& SHIFT
if /I %~1 == -pswd SET passwrd=%2& SHIFT
if /I %~1 == -help goto help
SHIFT
 
if not (%1)==() goto parameters
 
set /a count=0
 
:uzivatel
set /p "input=Uživatel: "
if "%input%"=="" goto uzivatel
set /a count+=1
 
if %count% lss 4 goto uzivatel
goto menu
 
:menu
echo jmeno heslo: admin (2-3 uživ)
echo 1) nacist opravneni
echo 2) vytvorit skupiny
echo 3) nacist uzivatele
echo 4) vytvorit uzivatele --uziv
echo 5) priradit uzivatele do skupiny
set /p "choice=Vyberte možnost: "
goto option%choice%
 
:option1
goto menu
 
:option2
goto menu
 
:option3
goto menu
 
:option4
set /p "newuser=Zadejte nového uživatele: "
net user !newuser! /fullname:"!newuser! admin" %passwrd% /add
goto menu
 
:option5
set /p "username=Zadejte uživatele: "
set /p "groupname=Zadejte skupinu: "
net localgroup !groupname! !username! /add
goto menu
 
:help
echo help:
echo -file --cesta k souboru
echo -pswd --heslo k uctu
goto END
 
:END