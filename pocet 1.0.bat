@echo off
echo 0,%time%
z:
dir > c:\temp\test.txt
echo 1,%time%
set "File=C:\temp\test.txt"
set /a count=0
set /a pocet=0
set now=%date:~3,12%
SETLOCAL enabledelayedexpansion
echo 2,%time%
for /F "tokens=* delims=" %%a in ('Type "%File%"') do (
         Set /a count+=1
         Set "output[!count!]=%%a"     
)
echo 3,%time%
For /L %%i in (1,1,%Count%) Do (
	set row=!output[%%i]:~0,12!
	set row2=!output[%%i]:~14,1!
	if !now!==!row! (
			if !row2!==0	(
					set /a row3=!output[%%i]:~15,1!
					) else (
					set /a row3=!output[%%i]:~14,2!
					)
			if !row3! GEQ 8 (
					set /a pocet=!pocet!+1
					)
			)
)

echo final !pocet!
pause
Exit



