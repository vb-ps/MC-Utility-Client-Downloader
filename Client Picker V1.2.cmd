@echo off
setlocal enabledelayedexpansion

:: Get the Downloads folder path
for /f "tokens=2,*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B}') do set "downloads=%%B"

:: === Main Menu ===
:mainmenu
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

:::                    .___       ___.                 ___. /\
:::  _____ _____     __| _/____   \_ |__ ___.__. ___  _\_ |_)/______  ______
::: /     \\__  \   / __ |/ __ \   | __ <   |  | \  \/ /| __ \\____ \/  ___/
:::|  Y Y  \/ __ \_/ /_/ \  ___/   | \_\ \___  |  \   / | \_\ \  |_> >___ \ 
:::|__|_|  (____  /\____ |\___  >  |___  / ____|   \_/  |___  /   __/____  >
:::      \/     \/      \/    \/       \/\/                 \/|__|       \/
echo "I am not spending no money on a minecraft client" - Me 5/4/25

echo ================================
echo       Choose a Client Menu
echo ================================
echo 1. Cracked Hacked Client Menu
echo 2. Free Hacked Client Menu
echo 3. Pre 1.9 Cracked Hacked Clients
echo.
set /p menuChoice=Select an option (1-3): 

if "%menuChoice%"=="1" goto crackedMenu
if "%menuChoice%"=="2" goto freeMenu
if "%menuChoice%"=="3" goto pre19crackedmenu
goto mainmenu

:: === Cracked Clients Menu ===
:crackedMenu
cls
set "choice="
echo === Cracked Hacked Clients Menu ===
echo 1. Download Mio [Unchecked For Virus FABRIC 1.21.1]
echo 2. Download Rusher [Clean FABRIC 1.21.1]
echo 3. Download Future [1.12.2 FORGE]
echo 4. Download Rusher [Old IDFK]
echo 5. Download Boze 1.2 [OLD 1.20.1 FABRIC]
echo 6. Download Boze v61 [NEW 1.21.1 OR 1.21 FABRIC]
echo.
set /p choice=Select an option (1-6): 

if "%choice%"=="1" goto Mio
if "%choice%"=="2" goto Rusher
if "%choice%"=="3" goto Future
if "%choice%"=="4" goto Rusherold
if "%choice%"=="5" goto Bozeold
if "%choice%"=="6" goto Bozenew
goto mainmenu

:: === Free Client Menu ===
:freeMenu
cls
set "freeChoice="
echo === Free Hacked Clients Menu ===
echo 1. Download Meteor [Checked Safe FABRIC 1.21.5]
echo 2. Download LiquidBounce [Safe FABRIC 1.21.4]
echo 3. Download 3arthh4ck [Safe FABRIC 1.12.2]
echo 4. Download Catlean [Safe FABRICC 1.21.4]
echo.
set /p freeChoice=Select an option (1-2): 

if "%freeChoice%"=="1" goto Meteor
if "%freeChoice%"=="2" goto Liquidb
if "%freeChoice%"=="3" goto earthax
if "%freeChoice%"=="4" goto catlean
goto mainmenu

:: === Pre 1.9 Cracked Client Menu ===
:pre19crackedmenu
cls
set "pre19choice="
echo === Pre 1.9 Cracked Client Menu ===
echo 1. Download Rise 6.5.1 [Unchecked an I'm not going to either 1.8.9]
echo.
set /p pre19choice=Select an option (1-1):

if "%pre19choice%"=="1" goto rise
goto mainmenu

:: === Downloads ===
:Mio
call :download "https://github.com/TwoNick/mio/releases/download/v2.1.7-patch2/mio-loader.jar"
call :download "https://github.com/TwoNick/mio/releases/download/v2.1.7-patch2/mio.jar"
goto mainmenu

:Rusher
call :download "https://crystalpvp.ru/rusherhack/rushercrack-2.0.jar"
goto mainmenu

:Future
call :download "https://crystalpvp.ru/future/Installer.jar"
goto mainmenu

:Rusherold
call :download "https://crystalpvp.ru/rusherhack/rushercrack.jar"
goto mainmenu

:Bozeold
call :download "https://crystalpvp.ru/bozeupdate/bozecrack.zip"
goto mainmenu

:Bozenew
call :download "https://crystalpvp.ru/boze/finalboze.zip"
goto mainmenu

:Meteor
call :download "https://meteorclient.com/api/download" "meteor.jar"
goto mainmenu

:Liquidb
call :download "https://github.com/CCBlueX/LiquidLauncher/releases/download/v0.4.3/LiquidLauncher_0.4.3_x64_en-US.msi"
goto mainmenu

:earthax
call :download "https://github.com/3arthqu4ke/3arthh4ck/releases/download/1.8.5/3arthh4ck-1.8.5-release.jar"
goto mainmenu

:catlean
call :download "https://github.com/vb-ps/CLDL/releases/download/Clpicker/catlean.jar"
goto mainmenu

:rise
call :download "https://github.com/vb-ps/RiseCrack/releases/download/rise/RISE.CRSCK.rar"
goto mainmenu

:download
set "url=%~1"
set "filename=%~2"

:: Extract filename from URL if not provided
if not defined filename (
    for %%f in ("%url%") do (
        set "filename=%%~nxf"
    )
)

set "filepath=%downloads%\!filename!"

:: Check if the file already exists
if exist "!filepath!" (
    echo Skipping download: !filename! already exists in Downloads.
) else (
    echo Downloading !filename! to %downloads%...
    
    curl -L -o "!filepath!" "!url!"

    if exist "!filepath!" (
        echo Download complete: !filename!
    ) else (
        echo ERROR: Download failed for !filename!
    )
)

timeout /t 2 >nul
goto :eof


