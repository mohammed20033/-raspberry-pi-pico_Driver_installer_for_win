@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo 						_________________
echo 						BY MOHAMED REFAAY
echo 						-----------------
echo.
echo 1.office 2010
echo 2.office 2016
echo.


set /p a=
IF %a%==1 (start "" "X:\OFFICE\M_O2010Pr_E\Microsoft Office 2010 Professional English\setup.exe")
IF %a%==2 (start "" "X:\OFFICE\Office 2016 - 2019 Multilanguage\Office_2016–19_C2R_x64_AR_DE_EN_FR_RU_TR_16.0.12527.20988\OInstall.exe")

echo starting 64bit ...
timeout 3
start "" "X:SNAPPY DRIVER\SDI_x64_R2111.exe"
start /w "" "X:\NEW PROGRAMS\aimp_latest_version_Downloadly.ir" /S
echo 25
start /w "" "X:\NEW PROGRAMS\Mozilla.Firefox.92.0.1.EN.x64" /S
start /w "" "X:\NEW PROGRAMS\wrar590" /S
start /w "" "X:\NEW PROGRAMS\VLC.Media.Player.3.0.16.x64" /S
echo 50
start /w "" "X:\NEW PROGRAMS\IDM.6.38.Build.1.Final.Retail\IDM.6.38.Build.1.Final.Retail_Startcrack.com" /S
echo 75
start "" "X:\NEW PROGRAMS\IDM.6.38.Build.1.Final.Retail\Patch4\Patch4\IDMan v6.37.15 Patcher (No Update).exe"
start /w "" "X:\NEW PROGRAMS\Google.Chrome.99.0.4844.51.Final.x64" /S
start /w "" "X:\NEW PROGRAMS\Adobe.Acrobat.Reader.DC.2021.005.20060" /S
start /w "" "X:\NEW PROGRAMS\H:\NEW PROGRAMS\KMSAuto_Lite_Portable_v1.5.6_password_2019\KMSAuto Lite Portable v1.5.6 password 2019\KMSAuto x64" /S
cls
echo .
echo 				              by MOHAMMED REFAAY :)
echo .
echo *********************************DONE**************************************
PAUSE