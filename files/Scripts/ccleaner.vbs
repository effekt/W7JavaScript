'	CCleaner Update Script
'	February 29, 2012
'	Jesse Wheeler

'	This script downloads the latest version of CCleaner
'	E-mail: worldofderonis@gmail.com

Set WshShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

ccDownload = WshShell.Run("update\wget http://www.piriform.com/ccleaner/download/standard --output-document=temp.html --connect-timeout=10 --tries=3 --waitretry=2",1,true)
Set objFile = objFSO.GetFile("temp.html")

If objFile.Size > 0 Then
	Set objReadFile = objFSO.OpenTextFile("temp.html", 1)
	htmlContents = objReadFile.ReadAll
	objReadFile.Close
Else
	Wscript.Quit(stage)
End If

WshShell.Run"cmd /C del temp.html",1,true

endTextPos = 1
If InStr(endTextPos, htmlContents, "location.href=") then
	htmlTextPos = InStr(endTextPos, htmlContents, "location.href=")
	endTextPos = InStr(htmlTextPos, htmlContents, "',2000")
	ccURL = Mid(htmlContents, (htmlTextPos + 15), (endTextPos - htmlTextPos - 16))
End If

ccDownload = WshShell.run("update\wget " & ccURL & " --directory-prefix=files --no-clobber --connect-timeout=10 --tries=3 --waitretry=2",1,true)

totalFiles = 0
Set objFolder = objFSO.GetFolder("files")
set objFiles = objFolder.Files
For Each file In objFiles
	if InStr(file, "ccsetup") then
		totalFiles = totalFiles + 1
	end if
Next

if totalFiles > 1 then
	WshShell.CurrentDirectory = "files\"
	objFSO.CreateTextFile("dummy.txt")
	oldestFile = objFSO.GetFile("dummy.txt").Name
	For Each file In objFiles
		if InStr(file, "ccsetup") then
			if DateDiff("s", objFSO.GetFile(oldestFile).DateCreated, objFSO.GetFile(file).DateCreated) < 0 then
				oldestFile = objFSO.GetFile(file).Name
			end if
		end if
	Next
	WshShell.Run"cmd /C del dummy.txt && del " & oldestFile,1,true
	ccDownload = 45
end if

Wscript.Quit(ccDownload)