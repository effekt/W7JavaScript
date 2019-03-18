@ECHO OFF

:main
cls
title Update Tool
echo.
echo     ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo     บ                             Update Tool                             บ
echo     บ ################################################################### บ
echo     บ #####    MAKE SURE YOU HAVE AN ACTIVE INTERNET CONNECTION!    ##### บ
echo     บ ################################################################### บ
echo     วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ
echo     บ 0.  Exit                                                            บ
echo     บ 1.  All                                                             บ
echo     บ 2.  ComboFix                                                        บ
echo     บ 3.  Malware Bytes' Executable                                       บ
echo     บ 4.  Adobe Reader                                                    บ
echo     บ 5.  CCleaner                                                        บ
echo     ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.

set scriptroot=%~dp0
set upAll=0
set NEXTUPD=1

set /P choice=Enter choice: %=%

if %choice% LSS 6 (
	echo.
	goto up%choice%
) else (
	goto main
)

:up1
set upAll=1
goto end

:up2
call "%scriptroot%/update/combofix.vbs"
if %ERRORLEVEL% EQU 0 echo ComboFix is already up to date.
if %ERRORLEVEL% EQU 45 echo ComboFix was successfully updated.
if %ERRORLEVEL% GTR 0 (
	if %ERRORLEVEL% LSS 45 (
		echo There was an error while updating ComboFix. Return Code: %ERRORLEVEL%
	)
)
goto end

:up3
call "%scriptroot%/update/mbam.vbs"
if %ERRORLEVEL% EQU 0 echo Malware Bytes' is already up to date.
if %ERRORLEVEL% EQU 45 echo Malware Bytes' was successfully updated.
if %ERRORLEVEL% GTR 0 (
	if %ERRORLEVEL% LSS 45 (
		echo There was an error while updating Malware Bytes'. Return Code: %ERRORLEVEL%
	)
)
goto end

:up4
call "%scriptroot%/update/reader.vbs"
if %ERRORLEVEL% EQU 0 echo Adobe Reader is already up to date.
if %ERRORLEVEL% EQU 45 echo Adobe Reader was successfully updated.
if %ERRORLEVEL% GTR 0 (
	if %ERRORLEVEL% LSS 45 (
		echo There was an error while updating Adobe Reader. Return Code: %ERRORLEVEL%
	)
)
goto end

:up5
call "%scriptroot%/update/ccleaner.vbs"
if %ERRORLEVEL% EQU 0 echo CCleaner is already up to date.
if %ERRORLEVEL% EQU 45 echo CCleaner was successfully updated.
if %ERRORLEVEL% GTR 0 (
	if %ERRORLEVEL% LSS 45 (
		echo There was an error while updating CCleaner. Return Code: %ERRORLEVEL%
	)
)
goto end

:end
if %upAll% EQU 1 (
		if %NEXTUPD% NEQ 6 (
		set /a NEXTUPD=%NEXTUPD% + 1
		goto up%NEXTUPD%
	)
)

echo.

set /P copyFiles=Copy downloads to new folder? [Y/N]: %=%
if /I %copyFiles% EQU Y (
	call "%scriptroot%/update/getFolder.vbs"
)

goto main

:0
exit