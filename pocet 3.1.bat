@echo off
SETLOCAL enabledelayedexpansion
set /a hod=%time:~0,2%
if %hod% GTR 1 (
	if %hod% LSS 23	(
		call C:\temp\rataj.bat
			) else	(
				echo zly cas
				timeout /t 2			
				)
) else (
timeout /t 2
)
Exit