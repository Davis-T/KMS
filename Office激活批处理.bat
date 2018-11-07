@ECHO OFF&PUSHD %~DP0
setlocal EnableDelayedExpansion&color 3e & cd /d "%~dp0"
title office2016 Activation
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /dstatus
set /p run=Start Office2016 Activation or not?(y/n):
if not defined run goto:e
if %run%==y goto:WH
if %run%==n goto:e
:WH
cls
set /p tsk=Replace the key or not?(y/n):
if not defined tsk goto:err
if %tsk%==y goto:1
if %tsk%==n goto:2
:err
goto:WH
:1
set /p key=Please input the activation key and press Enter to confirm:
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /inpkey:%key%
:2
set /p ip=Please input the IP of KMS and press Enter to confirm:
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /sethst:%ip%
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /act
:e
echo.
echo Activation completed, press any key to exit!
pause >nul
exit