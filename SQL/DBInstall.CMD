
@ECHO OFF
GOTO BatchStart
===========================================================
DbInstall.cmd by Darbod LLC. WWW.Darbod.COM (All Right Reserved)

Deploys a MS SQL server script files and directories.

Note:	Easy DB Installer uses the Microsoft OSQL utility 
to deploy SQL scripts.  The OSQL utility is installed when 
different versions of Microsoft SQL Server or SQL client 
tools are installed.  Easy DB Installer can only be used on
computers with OSQL tool available.  For more information on
OSQL utility please refer at you MS SQL server documentation.

DbInstall.cmd Calls RunSQLDir.cmd.

Syntax: DbInstall.CMD Server Database [[/E]|[User Password]]

Arguments:
1.  Server
2.  Database
3.  UserName or /E for trusted connection
4.  Password or nothing in case of trusted connection
===========================================================

:BatchStart

REM	--Argument Check
IF '%1' == '' GOTO ErrorArgument
IF '%2' == '' GOTO ErrorArgument
IF /I '%3' == '/E' GOTO TrustedConnection
IF '%3' == '' GOTO ErrorArgument
IF '%4' == '' GOTO ErrorArgument

:TrustedConnection

REM ====================================================
REM SET drive and directory to the current drive and directory
REM ====================================================
%~d0
CD %~p0

REM Clear Screen
CLS

REM ====================================================
REM Get ISO8601 UTC time to use for log file name (postfix).
REM EXample of SetRunTime.cmd is 'SET RunTime = 2006_10_12T20_21_55_567'
REM ====================================================

SET RunTime=
IF EXIST SetRunTime.cmd DEL SetRunTime.cmd 
IF /I '%3' == '/E' GOTO TrustedConnectionTimeSetting

OSQL /b /n /w1000 /S %1 /d %2 /U %3 /P %4 /i SetRunTime.SQL > SetRunTime.cmd
IF ERRORLEVEL 1 GOTO ErrorOsql

GOTO PassTrustedConnectionTimeSetting

:TrustedConnectionTimeSetting
OSQL /b /n /w1000 /S %1 /d %2 /E /i SetRunTime.SQL > SetRunTime.cmd
IF ERRORLEVEL 1 GOTO ErrorOsql

:PassTrustedConnectionTimeSetting

CALL SetRunTime.cmd
IF EXIST SetRunTime.cmd DEL SetRunTime.cmd 

REM ====================================================
REM Create DBInstallLogs if it does not exists. Used for Logging.
REM ====================================================

IF NOT EXIST DBInstallLogs MKDIR DBInstallLogs


REM ====================================================
REM Set Variables used for Log file names.
REM ====================================================


SET sAllLog=DBInstallLogs\%RunTime%_local_%2_All.txt
SET sErrorLog=DBInstallLogs\%RunTime%_local_%2_Error.txt 
SET TempLog=DBInstallLogs\local_%2_TempLog.txt



REM ====================================================
REM Delete old file Logs if they exist
REM ====================================================

IF EXIST %sAllLog% DEL %sAllLog%
IF EXIST %sErrorLog% DEL %sErrorLog%
IF EXIST %TempLog% DEL %TempLog%

@ECHO. 
ECHO ====================================================
ECHO =============      Starting build...     ===========
IF NOT '%RunTime%' == '' ECHO ============= %RunTime%	 ===========
ECHO ====================================================
@ECHO. 

REM ====================================================
REM Deploys the scripts by runing scripts form Direcotries using RunSQLDir.CMD.
REM ====================================================


REM CALL RunSQLDir.cmd %1 %2 %3 %4 ".\Database"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\Tables"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\Constraints"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\DataLoad1"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\DataLoad2"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\DataLoad3"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\Sprocs"
CALL RunSQLDir.cmd %1 %2 %3 %4 ".\Views"



@ECHO. 
ECHO ====================================================
ECHO =============      Ending build...       ===========
IF NOT '%RunTime%' == '' ECHO ============= %RunTime%	 ===========
ECHO ====================================================
@ECHO. 

GOTO BatchEnd


:ErrorArgument
REM ====================================================
REM Missing or bad arguments.
REM ====================================================
@ECHO. 
ECHO ====================================================
ECHO === DbInstall.cmd ERROR: missing or bad argument(s). 
ECHO === Syntax: DbInstall.CMD Server Database [[/E]|[User Password]]
ECHO ==================================================== 
@ECHO. 
GOTO BatchEnd

REM ====================================================
REM Osql Error Exit
REM ====================================================
:ErrorOsql

@ECHO. 
ECHO OSQL error. Check parameters.
@ECHO.

:BatchEnd
REM ====================================================
REM Clear Environmental Variables
REM ====================================================

SET sAllLog	=
SET sErrorLog	=
SET TempLog	=
SET RunTime	=
    