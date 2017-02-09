@ECHO OFF
REM REM Out the following lines if you want to manually set (in scripted enviro)
REM -----------------------------------------------------------------------------
SET OutputDir=C:\temp\ping\Google.txt
SET Host=google.co.uk
SET timeout=2
SET numberofruns=60
REM -----------------------------------------------------------------------------

SET timesrun=0
SET nslook=0

:loop
echo|set /p=%date% %time% >> %OutputDir%

REM Ping host then filter out so just one line
ping %Host% -a -n 1 | findstr /v Pinging | findstr /v statistics | findstr /v Packets: | findstr /v Approximate | findstr /v Minimum | findstr "." >> %OutputDir%

cls
echo Times run: %timesrun%


IF %nslook%==%numberofruns% goto nslookup


SET /A nslook = %nslook% + 1

REM Timeout to slow down number of runs
@timeout /t %timeout% /nobreak > nul

goto loop

:NSlookup
echo Running traceroute...
tracert %Host% >> %OutputDir%
echo. >> %OutputDir%
SET nslook=0
SET /A timesrun = %timesrun% + 1
goto loop