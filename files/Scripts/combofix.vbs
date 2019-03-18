'	ComboFix Update Script
'	February 29, 2012
'	Jesse Wheeler

'	This script downloads the latest version of ComboFix
'	E-mail: worldofderonis@gmail.com

Set WshShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

if objFSO.FileExists("files\ComboFix.exe") = 0 then
	cfDownload = WshShell.Run("update\wget http://69.6.236.82/sUBs/ComboFix.exe/IEXPLORE.EXE --output-document=ComboFix.exe --directory-prefix=.\files --connect-timeout=10 --tries=3 --waitretry=2",1,true)
	cfDownload = 45
else
	dayDiff = DateDiff("d", objFSO.GetFile("files\ComboFix.exe").DateLastModified, Date)
end if

if dayDiff > 0 then
	objFSO.DeleteFile "files\ComboFix.exe",True
	cfDownload = WshShell.Run("update\wget http://69.6.236.82/sUBs/ComboFix.exe/IEXPLORE.EXE --output-document=.\files\ComboFix.exe --connect-timeout=10 --tries=3 --waitretry=2",1,true)
	cfDownload = 45
else
	cfDownload = 0
end if
Wscript.Quit(cfDownload)