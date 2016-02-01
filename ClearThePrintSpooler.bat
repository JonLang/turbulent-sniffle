@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Do you want to clear all jobs from the print sppoler (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

net stop spooler
del %SystemRoot%\system32\spool\PRINTERS\*.* /Q
net start spooler
Pause()

:END
endlocal