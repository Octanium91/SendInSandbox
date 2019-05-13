@echo off
if exist SendInSandbox.cmd (SendInSandbox.cmd CLEAN_SENDBOX&exit 0) else (color 0C&echo.&echo  ERROR: SendInSandbox.cmd not found!&timeout 5&exit 1)