@echo off
SETLOCAL enabledelayedexpansion
set /a hod=%time:~0,2%
if %hod% GTR 7 (
	if %hod% LSS 16	(
		call C:\temp\rataj.bat
			) else	(
			echo zly cas
				)
) else (
timeout /t 2
)
Exit