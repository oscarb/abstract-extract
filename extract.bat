@ECHO OFF
setlocal EnableExtensions EnableDelayedExpansion

ECHO Checking if '%~1' exists
IF NOT EXIST "%~1" EXIT /b

ECHO Extracting file to '%~dp1%~n1'
7zG x "%~1" -o"%~dp1*"

SET outputdir="%~dp1%~n1"

ECHO Checking if extracted path contains a single directory
REM Get number of files in extracted directory
FOR /F "delims=" %%A IN ('dir "%~dp1%~n1" /B ^| find /c /v ""') DO SET "files=%%A"
REM Get number of directories in extracted directory
FOR /F "delims=" %%A IN ('dir "%~dp1%~n1" /B /Ad ^| find /c /v ""') DO SET "dirs=%%A"

FOR /F "delims=" %%A IN ('dir "%~dp1%~n1" /B /Ad') DO SET "folder=%%A"

REM Check if there is only one single directory
SET /A condition=%files%*%dirs%

IF %condition% EQU 1 (

  ECHO Moving folder...
  robocopy "%~dp1%~n1\!folder!" "%~dp1!folder!" /move /e

  ECHO Removing folder...
  rmdir "%~dp1%~n1"
  SET outputdir="%~dp1!folder!"
)

ECHO Opening %outputdir% in explorer
explorer %outputdir%

ECHO Deleting original compressed file '%~1'
del "%~1"

ECHO All operations executed succesfully
