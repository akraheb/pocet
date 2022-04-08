@echo off
SETLOCAL enabledelayedexpansion
set /a hod=%time:~0,2%
set today=%date:~3,2%.%date:~7,2%
set /a ha=%time:~0,2%
set /a ma=%time:~3,2%
set /a akt=%ha%*60+%ma%
set /a aktt=450
set /a akty=970
set /a aktt5=%aktt%+5
set /a akty5=%akty%+5
echo !akt!
if %hod% GTR 7 (
	if %hod% LSS 16	(
		call C:\temp\rataj.bat
			) else	(
		echo neskoro
		if %akt% GTR %akty%	(
			if %akt% LSS %akty5%	(
	c:\temp\shortcut /a:c /f:"C:\Users\kasjer\AppData\Roaming\ClassicShell\Pinned\vcera.lnk" /t:"c:\temp\log\%today%.txt"
						)
					)			
				)
		) else (
		echo skoro
		if %akt% GTR %aktt%	(
			if %akt% LSS %aktt5%	(
	c:\temp\shortcut /a:c /f:"C:\Users\kasjer\AppData\Roaming\ClassicShell\Pinned\dneska.lnk" /t:"c:\temp\log\%today%.txt"
						)
					)
		if not exist "c:\temp\log\%today%.txt"	(
	set old="    DATUM    |  CAS  | pocet | 5m | 15m | mimo | empty | first | sezonka | final |"
	@echo !old!>c:\temp\log\%today%.txt
							)
			)
timeout /t 2
Exit