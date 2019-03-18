'	Malware Bytes' Script
'	February 29, 2012
'	Jesse Wheeler

'	This script downloads the latest version of Malware Bytes'
'	E-mail: worldofderonis@gmail.com

Set WshShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

mbamDownload = WshShell.Run("update\wget http://www.malwarebytes.org/mbam-download-exe.php --directory-prefix=files --connect-timeout=10 --tries=3 --waitretry=2 --no-clobber",1,true)

totalFiles = 0
Set objFolder = objFSO.GetFolder("files")
set objFiles = objFolder.Files
For Each file In objFiles
	if InStr(file, "mbam") then
		totalFiles = totalFiles + 1
	end if
Next

if totalFiles > 1 then
	WshShell.CurrentDirectory = "files\"
	objFSO.CreateTextFile("dummy.txt")
	oldestFile = objFSO.GetFile("dummy.txt").Name
	For Each file In objFiles
		if InStr(file, "mbam") then
			if DateDiff("s", objFSO.GetFile(oldestFile).DateCreated, objFSO.GetFile(file).DateCreated) < 0 then
				oldestFile = objFSO.GetFile(file).Name
			end if
		end if
	Next
	WshShell.Run"cmd /C del dummy.txt && del " & oldestFile,1,true
	mbamDownload = 45
end if

Wscript.Quit(mbamDownload)