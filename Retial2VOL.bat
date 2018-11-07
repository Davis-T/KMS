@ECHO OFF&PUSHD %~DP0
setlocal EnableDelayedExpansion&color 3e & cd /d "%~dp0"
title office2016 retail tansfer to vol
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
:WH
cls
echo.
echo            Select the office version number that needs to be converted
echo.
echo --------------------------------------------------------------------------------                                                          
echo        1. Retail version of Office Pro Plus 2016 converted to VOL
echo.
echo        2. Retail version of Office Visio Pro 2016 converted to VOL
echo.
echo        3. Retail version of Office Project Pro 2016 converted to VOL
echo.
echo. --------------------------------------------------------------------------------

set /p tsk="Please enter the office version number to be converted [Enter] to confirm (1-3): "
if not defined tsk goto:err
if %tsk%==1 goto:1
if %tsk%==2 goto:2
if %tsk%==3 goto:3
:err
goto:WH
:1
cls
echo Installing KMS license...
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
echo Installing MAK license...
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
set /p y=Please enter the activation key and press Enter to confirm:
cscript ospp.vbs /inpkey:%y%
goto :e
:2
cls
echo Installing KMS license...
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
echo Installing MAK license...
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
set /p y=Please enter the activation key and press Enter to confirm:
cscript ospp.vbs /inpkey:%y%
goto :e
:3
cls
echo Installing KMS license...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
echo Installing MAK license...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
set /p y=Please enter the activation key and press Enter to confirm:
cscript ospp.vbs /inpkey:%y%
goto :e
:e
echo.
echo Conversion completed, press any key to exit!
pause >nul
exit