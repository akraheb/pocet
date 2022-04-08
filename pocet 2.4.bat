@echo off
z:
dir > c:\temp\test.txt
set "File=C:\temp\test.txt"
set /a count=0
set /a pocet=0
set /a today=0
set now=%date:~3,12%
SETLOCAL enabledelayedexpansion
for /F "tokens=* delims=" %%a in ('Type "%File%"') do	(
        set /a count+=1
	set w=%%a
	set row=!w:~0,12!
	set row2=!w:~14,1!
	if !now!==!row!	(
		if !row2!==0	(
				set /a row3=!w:~15,1!
				) else (
				set /a row3=!w:~14,2!
				)
		if !row3! GEQ 8 (
				set /a pocet=!pocet!+1
				)
			)
	set /a modulo=!count!%%5000
	if !modulo!==0 	(
		echo !count!
			)
							)
set today=%date:~3,2%.%date:~7,2%
if not exist "c:\temp\%today%.txt"	(
					set old="    DATUM    |  CAS  | POCET"
        				@echo !old!>c:\temp\%today%.txt
					)
set new="!now! | %time:~0,5% | !pocet!"
@echo !new!>c:\temp\new.txt
if exist "c:\temp\%today%.txt"	(
				@echo !new!>> c:\temp\%today%.txt
				)
Exit