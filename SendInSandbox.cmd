@echo off
title=Web sandbox : Octanium (octanium91@gmail.com)
rem [FILE INFO]
rem  Author: Octanium (octanium91@gmail.com)
rem  Version: 1.0
rem  Date: 09/05/2019
rem [FILE INFO]
rem [SETTINGS]
set "domain="
set "sandboxlocalf=D:\site"
set "sandboxf=_sandbox"
set "startup_clean_sandbox=1"
rem [SETTINGS]


if "%~1"=="" goto install

if %1 == CLEAN_SENDBOX goto _clean
if exist %1 goto _send

:install
echo.
echo.
echo  Install web sandbox for folders?
pause
cls
echo.
echo  - Installing... -
reg add "HKEY_CLASSES_ROOT\Folder\shell\WebSendInSandbox" /t REG_SZ /v "MUIVerb" /d "Send in Sandbox..." /f
if not %errorlevel% == 0 goto install_error
reg add "HKEY_CLASSES_ROOT\Folder\shell\WebSendInSandbox" /t REG_SZ /v "Icon" /d "shell32.dll,17" /f
if not %errorlevel% == 0 goto install_error
reg add "HKEY_CLASSES_ROOT\Folder\shell\WebSendInSandbox\command" /d "\"%0\" \"%%1\"" /f
if not %errorlevel% == 0 goto install_error
if %startup_clean_sandbox% == 1 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /t REG_SZ /v "websendinsandbox_clean" /d "\"%0\" CLEAN_SENDBOX" /f&if not %errorlevel% == 0 goto install_error
color 02
echo  - Installation successfully completed -
pause
exit 0

:install_error
color 04
echo.
echo  -_- c'not install...
echo  Run script as Administrator!
echo.
echo  - Failed to install! -
echo.
pause
exit 1

:_send
color 03
echo.
echo.
echo  Sending...
echo.
set "rndkey=%random%%random%%random%%random%%random%%random%%random%%random%"
if exist "%sandboxlocalf%\%sandboxf%\%rndkey%" set "rndkey=%random%%random%%random%%random%%random%%random%%random%%random%"
if exist "%sandboxlocalf%\%sandboxf%\%rndkey%" set "rndkey=%random%%random%%random%%random%%random%%random%%random%%random%"
if exist "%sandboxlocalf%\%sandboxf%\%rndkey%" set "rndkey=%random%%random%%random%%random%%random%%random%%random%%random%"
if not exist "%sandboxlocalf%\%sandboxf%\%rndkey%" mkdir "%sandboxlocalf%\%sandboxf%\%rndkey%
xcopy /e /c /q /h /y  %1 "%sandboxlocalf%\%sandboxf%\%rndkey%"
cls
echo.
echo %domain%/%sandboxf%/%rndkey%|clip
echo  url: %domain%/%sandboxf%/%rndkey%
echo.
echo  Done!
timeout 6
exit 0

:_clean
color 02
echo.
echo.
echo  Clean sendbox...
if exist "%sandboxlocalf%\%sandboxf%" rmdir /s /q "%sandboxlocalf%\%sandboxf%"
echo.
echo  Done!
timeout 3
exit 0