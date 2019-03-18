'	Adobe Reader Update Script
'	February 29, 2012
'	Jesse Wheeler

'	This script simply checks the public FTP for a newer version of Adobe Reader

'	If for whatever reason they decide to change the structure of the directories
'	and you can't figure out how to change the way it checks, feel free to e-mail
'	me.
'	E-mail: worldofderonis@gmail.com

'Declarations...
Set WshShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
strComputer = "."
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Dim PossibleURL()

if objFSO.FileExists("temp.html") Then
	WshShell.Run"cmd /C del temp.html",1,true
End If

'First stage, checks /win/ dir for Adobe Reader versions
stage = WshShell.Run("update\wget ftp://ftp.adobe.com:21/pub/adobe/reader/win/ --output-document=temp.html --connect-timeout=10 --tries=3 --waitretry=2",1,true)
Set objFile = objFSO.GetFile("temp.html")
tempHTML = fileEmpty()
getURLS "links",tempHTML

highestNum = 0
for urlArrPos=1 to UBound(PossibleURL)
	if InStr(40, PossibleURL(urlArrPos), "x") then
		endTextPos = InStr(45, PossibleURL(urlArrPos), "x")
		possHighest = Mid(PossibleURL(urlArrPos), 45, (endTextPos - 45))
	else
		possHighest = 0
	end if
	if InStr(40, PossibleURL(urlArrPos), ".x") then
		endTextPos = InStr(45, PossibleURL(urlArrPos), ".x")
		possHighest = Mid(PossibleURL(urlArrPos), 45, (endTextPos - 45))
	end if
	
	if Int(possHighest) > Int(highestNum) then
		highestNum = possHighest
		highestPos = urlArrPos
	end if
Next

'Second stage, checks for the highest release for version
WshShell.Run"cmd /C del temp.html",1,true
stage = WshShell.Run("update\wget " & PossibleURL(highestPos) & "/ --output-document=temp.html --connect-timeout=10 --tries=3 --waitretry=2",1,true)
tempHTML = fileEmpty()
getURLS "links",tempHTML

for urlArrPos=1 to UBound(PossibleURL)
	if InStr(PossibleURL(urlArrPos), "x/") then
		startTextPos = InStr(PossibleURL(urlArrPos), "x/")
		possHighest = Mid(PossibleURL(urlArrPos), (startTextPos + 2), Len(PossibleURL(urlArrPos)))
		possHighest = Replace(possHighest, ".", "")
	else
		possHighest = 0
	end if
	
	if Int(possHighest) > Int(highestNum) then
		highestNum = possHighest
		highestPos = urlArrPos
	end if
Next

'Third stage, checks the latest versions directory for all .exe extensions
WshShell.Run"cmd /C del temp.html",1,true
stage = WshShell.Run("update\wget " & PossibleURL(highestPos) & "/en_US/ --output-document=temp.html --connect-timeout=10 --tries=3 --waitretry=2",1,true)
Set objFile = objFSO.GetFile("temp.html")
tempHTML = fileEmpty()
getURLS "exe",tempHTML

for urlArrPos=1 to UBound(PossibleURL)
	if InStr(PossibleURL(urlArrPos), "exe") then
		downloadURL = PossibleURL(urlArrPos)
	end if
Next

'Final stage, actually download the update
WshShell.Run"cmd /C del temp.html"
readerUpdate = WshShell.run("update\wget " & downloadURL & " --directory-prefix=files --no-clobber --connect-timeout=10 --tries=3 --waitretry=2",1,true)

totalFiles = 0
Set objFolder = objFSO.GetFolder("files")
set objFiles = objFolder.Files
For Each file In objFiles
	if InStr(file, "AdbeRdr") then
		totalFiles = totalFiles + 1
	end if
Next

if totalFiles > 1 then
	WshShell.CurrentDirectory = "files\"
	objFSO.CreateTextFile("dummy.txt")
	oldestFile = objFSO.GetFile("dummy.txt").Name
	For Each file In objFiles
		if InStr(file, "AdbeRdr") then
			if DateDiff("s", objFSO.GetFile(oldestFile).DateCreated, objFSO.GetFile(file).DateCreated) < 0 then
				oldestFile = objFSO.GetFile(file).Name
			end if
		end if
	Next
	WshShell.Run"cmd /C del dummy.txt && del " & oldestFile,1,true
	readerUpdate = 45
end if

Wscript.Quit(readerUpdate)

'Function:	fileEmpty
'Purpose:	Checks to see if temp.html is empty, if not store data in variable strContents
Function fileEmpty
	Set objFile = objFSO.GetFile("temp.html")

	If objFile.Size > 0 Then
		Set objReadFile = objFSO.OpenTextFile("temp.html", 1)
		fileEmpty = objReadFile.ReadAll
		objReadFile.Close
	Else
		Wscript.Quit(stage)
	End If
End Function

'Function:	getURLS(URLType)
'Purpose:	Loops through all the URLs in the temp.html file and re-initalizes the array accordingly
Function getURLS(URLType, strContents)
	ReDim PossibleURL(1)
	strNum = 1
	endTextPos = 1

	if URLType = "links" then
		for htmlTextPos=1 to len(strContents)
			if InStr(endTextPos, strContents, "=") then
				ReDim Preserve PossibleURL(strNum)
				htmlTextPos = InStr(endTextPos, strContents, "=")
				endTextPos = InStr(htmlTextPos, strContents, ">")
				PossibleURL(strNum) = Mid(strContents, (htmlTextPos + 2), (endTextPos - htmlTextPos - 4))
				strNum = strNum + 1
			end if
		Next
	end if

	if URLType = "exe" then
		for htmlTextPos=1 to len(strContents)
			if InStr(endTextPos, strContents, "=") then
				ReDim Preserve PossibleURL(strNum)
				htmlTextPos = InStr(endTextPos, strContents, "=")
				endTextPos = InStr(htmlTextPos, strContents, ">")
				PossibleURL(strNum) = Mid(strContents, (htmlTextPos + 2), (endTextPos - htmlTextPos - 3))
				strNum = strNum + 1
			end if
		Next
	end if
End Function