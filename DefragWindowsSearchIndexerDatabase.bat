@echo Off
set LogPath="C:\Temp\DefragWindowsSearchIndexerDatabase.log"
Echo -----------------------------START----------------------------------- >> %logpath%
Echo Going to run offline Defrag of the Windows.edb (Windows Search Indexer Database) >> %logpath%
FORFILES  /P %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\ /M Windows.EDB /C "cmd /c echo Pre Defrag Size @fsize KB" >> %logpath%
Sc config wsearch start=disabled
Net stop wsearch
echo Started defrag at %date% %time% >> %logpath%
esentutl.exe /d %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\Windows.edb /t X:\tempdfrg.edb >> %logpath%
echo Completed defrag at %date% %time% >> %logpath%
FORFILES  /P %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\ /M Windows.EDB /C "cmd /c echo Post Defrag Size @fsize KB" >> %logpath%
Sc config wsearch start=delayed-auto
Net start wsearch
Echo -----------------------------END----------------------------------- >> %logpath%