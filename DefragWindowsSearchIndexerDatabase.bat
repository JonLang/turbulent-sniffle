@echo Off
Echo -----------------------------START----------------------------------- >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
Echo Going to run offline Defrag of the Windows.edb (Windows Search Indexer Database) >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
FORFILES  /P %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\ /M Windows.EDB /C "cmd /c echo Pre Defrag Size @fsize KB" >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
Sc config wsearch start=disabled
Net stop wsearch
echo Started defrag at %date% %time% >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
esentutl.exe /d %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\Windows.edb /t X:\tempdfrg.edb >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
echo Completed defrag at %date% %time% >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
FORFILES  /P %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\ /M Windows.EDB /C "cmd /c echo Post Defrag Size @fsize KB" >> C:\Temp\DefragWindowsSearchIndexerDatabase.log
Sc config wsearch start=delayed-auto
Net start wsearch
Echo -----------------------------END----------------------------------- >> C:\Temp\DefragWindowsSearchIndexerDatabase.log