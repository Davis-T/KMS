@ECHO OFF&PUSHD %~DP0
setlocal EnableDelayedExpansion&color 3e & cd /d "%~dp0"
title Windows10 Activation
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
slmgr.vbs -xpr
:WH
cls
set /p tsk="Replace the key or not?(y/n):"
if not defined tsk goto:err
if %tsk%==y goto:1
if %tsk%==n goto:2
:err
goto:WH
:1
set /p key="Please input the activation key and press Enter to confirm:"
slmgr.vbs /ipk %key%
:2
set /p ip="Please input the IP of KMS and press Enter to confirm:"
slmgr.vbs /skms %ip%
slmgr.vbs /ato
:e
echo.
slmgr.vbs /dlv
echo Activation completed, press any key to exit!
pause >nul
exit