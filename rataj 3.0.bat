	For %%G in ("%File%") do set size=%%~zG
	echo !size!B

@echo off
	call C:\temp\test.bat
	timeout /t 1
	set "File=C:\temp\test.txt"
	set /a count=0
	set /a test=10
	set /a pocet=0
	set /a pocet2=0
	set /a sum[]=0
        set hod=%time:~0,2%
	set /a today=0
	set now=%date:~3,12%
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
				) else (
				set /a pocet2=!pocet2!+1
				)
		if !row3!==8 (set /a sum[8]=!sum[8]!+1)
		if !row3!==9 (set /a sum[9]=!sum[9]!+1)
		if !row3!==10 (set /a sum[10]=!sum[10]!+1)
		if !row3!==11 (set /a sum[11]=!sum[11]!+1)
		if !row3!==12 (set /a sum[12]=!sum[12]!+1)
		if !row3!==13 (set /a sum[13]=!sum[13]!+1)
		if !row3!==14 (set /a sum[14]=!sum[14]!+1)
		if !row3!==15 (set /a sum[15]=!sum[15]!+1)
		if !row3!==16 (set /a sum[16]=!sum[16]!+1)

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
	set new="!now! | %time:~0,5% | !pocet! | !pocet2! | !sum[8]! | !sum[9]! | !sum[10]! | !sum[11]! | !sum[12]! | !sum[13]! | !sum[14]! | !sum[15]! | !sum[16]!"
	@echo !new!>c:\temp\new.txt
	if exist "c:\temp\%today%.txt"	(
					@echo !new!>> c:\temp\%today%.txt
					)
set h=%time:~0,1%
	if !h!==1 (
			set hod=%time:~0,2%
	) else (
			set hod=%time:~1,1%
	)
	set sum[%hod%]=""!sum[%hod%]!""
	echo prvovstupov %pocet%
	echo hodinovo  8  9  10   11   12   13   14   15   16
	echo hodinovo %sum[8]% %sum[9]% %sum[10]% %sum[11]% %sum[12]% %sum[13]% %sum[14]% %sum[15]% %sum[16]%
timeout /t 5