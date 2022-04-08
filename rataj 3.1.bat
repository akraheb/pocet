@echo off
	SETLOCAL enabledelayedexpansion
	call C:\temp\test.bat
	set "File=C:\temp\test.txt"
	For %%G in ("%File%") do set size=%%~zG
	echo !size!B
	rmdir /s /q c:\temp\temp2
	mkdir c:\temp\temp2
	set /a count=0
	set /a test=10
        set /a poc=1000
	set /a pocet=0
	set /a mimo=0
	set /a empty=0
	set /a final=0
	set /a first=0
	set /a pocet5=0
	set /a sezonka=0
	set /a control=0
	set /a sum[]=0
        set hod=%time:~0,2%
	set /a ha=%time:~0,2%
	set /a ma=%time:~3,2%
	set /a akt=%ha%*60+%ma%
	set /a ht=0
	set /a mt=0
	echo %ha%:%ma% - %akt%
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
				call C:\temp\denny.bat
				set /a control2=!control2!+1
				) else (
				set /a mimo=!mimo!+1
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
	set /a modulo=!count!%%1000
	if !modulo!==0 	(
		echo !count!
			)
								)
	set today=%date:~3,2%.%date:~7,2%
	if not exist "c:\temp\%today%.txt"	(
						set old="    DATUM    |  CAS  | pocet | mimo | empty | first | sezonka | final |"
	        				@echo !old!>c:\temp\%today%.txt
						)
	set /a final=%pocet%-%empty%
	set new="!now! | %time:~0,5% | !pocet! | !mimo! | !empty! | !first! | !sezonka! | !final! |-|  !sum[8]! | !sum[9]! | !sum[10]! | !sum[11]! | !sum[12]! | !sum[13]! | !sum[14]! | !sum[15]! | !sum[16]!"
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
	echo prvovstupov pocet -  m.c. - empty - prvy - 20+ - final 
	echo prvovstupov %pocet%  -  %mimo%  -   %empty%   -  %first%  -  %sezonka% - "" %final% ""
	echo ------------------------------------ 
	echo ------------------------------------ 
	echo hodinovo 8  9  10   11   12   13   14   15   16
	echo hodinovo %sum[8]%  %sum[9]%  %sum[10]%  %sum[11]%  %sum[12]%  %sum[13]%  %sum[14]%  %sum[15]%  %sum[16]%
	echo kontrola %control% %control2%
timeout /t 20