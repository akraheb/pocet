@echo off
	if !row4!==0	(
			set /a row5=!W:~18,1!
			) else (
			set /a row5=!W:~17,2!
			)
	set /a tik=!row3!*60+!row5!
	set /a test=!akt!-!tik!
	if !test! LSS 16 (
			set /a ten=!ten!+1 
			)
	if !test! LSS 6 (
			set /a five=!five!+1 
			)
	z:
	set num=!w:~38,12!
	set poc5=!w:~38,3!
	cd z:\!num!
	set file=c:\temp\temp\!num!.txt
	dir>!file!
	For %%G in ("!file!") do set size=%%~zG
	set file2=c:\temp\temp2\!size!+!num!.txt
	dir>!file2!
	if !size! == 346 (
		set /a first=!first!+1
		set /a control=!control!+1
			)
	if !size! == 350 (
		set /a first=!first!+1
		set /a control=!control!+1
			)
	if !size! == 282 (
		set /a empty=!empty!+1
		set /a control=!control!+1
			)
	if !size! GTR 1600 (
		set /a sezonka=!sezonka!+1
		set /a control=!control!+1
			)
	set /a numm=!numm!+1
	set !poc!=!poc!+1
	del !file!