
@ECHO OFF
GOTO BatchStart
===========================================================
RunSQLScript.cmd by Darbod LLC. WWW.Darbod.COM (All Right Reserved)

RunSQLScript.cmd is called by RunSQLDir.cmd and it deploys
the SQL script in Argument 5.

Note:	Easy DB Installer uses the Microsoft OSQL utility 
to deploy SQL scripts.  The OSQL utility is installed when 
different versions of Microsoft SQL Server or SQL client 
tools are installed.  Easy DB Installer can only be used on
computers with OSQL tool available.  For more information on
OSQL utility please refer at you MS SQL server documentation.


args:
1.  Server Name
2.  Database Name
3.  User Name or /E for trusted connection
4.  Password or nothing in case of trusted connection
5.  Script Name
===========================================================
===========================================================

:BatchStart

IF '%1' == '' GOTO ErrorArgument
IF '%2' == '' GOTO ErrorArgument
IF /I '%3' == '/E' GOTO TrustedConnection
IF '%3' == '' GOTO ErrorArgument
IF '%4' == '' GOTO ErrorArgument
IF '%5' == '' GOTO ErrorArgument
IF NOT EXIST %5 GOTO ErrorScript


:TrustedConnection

REM ====================================================
REM Script Call
REM ====================================================

IF /I '%3' == '/E' GOTO TrustedConnectionLogHeader
@ECHO. >>%TempLog%
ECHO ---------------------------------------------------------------------- >>%TempLog%
ECHO Script: %5 >>%TempLog%
OSQL /b /n /S %1 /d %2 /U %3 /P %4 /i GetLogHeader.SQL >>%TempLog%

GOTO PassTrustedConnectionLogHeader

:TrustedConnectionLogHeader
@ECHO. >>%TempLog%
ECHO ---------------------------------------------------------------------- >>%TempLog%
ECHO Script: %4 >>%TempLog%
osql /b /n /S %1 /d %2 /E /i GetLogHeader.sql >>%TempLog%
:PassTrustedConnectionLogHeader

ECHO ---------------------------------------------------------------------- >>%TempLog%

IF /I '%3' == '/E' GOTO TrustedConnectionCall
OSQL /b /n /w1000 /S %1 /d %2 /U %3 /P %4 /i %5	 >>%TempLog%
IF ERRORLEVEL 1 GOTO ErrorOsql
ECHO ::::: Executed Successfully. >>%TempLog%

GOTO PassTrustedConnectionCall

:TrustedConnectionCall
OSQL /b /n /w1000 /S %1 /d %2 /E /i %4	 >>%TempLog%
IF ERRORLEVEL 1 GOTO ErrorOsql
ECHO ::::: Executed Successfully. >>%TempLog%


:PassTrustedConnectionCall


TYPE %TempLog%
TYPE %TempLog% >> %sAllLog%
DEL %TempLog%
GOTO :BatchEnd


REM ====================================================
REM No Param Error Exit
REM ====================================================
:ErrorArgument
@ECHO. >>%TempLog%
ECHO +++ >>%TempLog%
ECHO +++ RunSQLScript ERROR: Bad or missing argument >>%TempLog%
ECHO +++ Syntax: RunSQLScript Server Database [[/E]|[User Password]] Script >>%TempLog%
ECHO +++ Args were: 1. %1  2. %2  3. %3  4. %4  5. %5 >>%TempLog%
ECHO +++ >>%TempLog%
@ECHO. >>%TempLog%

TYPE %TempLog%
TYPE %TempLog% >> %sAllLog%
TYPE %TempLog% >> %sErrorLog%
DEL %TempLog%
GOTO :BatchEnd


REM ====================================================
REM No Script Exists
REM ====================================================
:ErrorScript
@ECHO. >>%TempLog%
ECHO +++ >>%TempLog%
IF /I '%3' == '/E' GOTO TrustedConnectionNoSQL
ECHO +++ RunSQLScript ERROR: %5 does not exist >>%TempLog%
GOTO PassTrustedConnectionNoSQL
:TrustedConnectionNoSQL
ECHO +++ RunSQLScript ERROR: %4 does not exist >>%TempLog%
:PassTrustedConnectionNoSQL
ECHO +++ >>%TempLog%
@ECHO. >>%TempLog%

TYPE %TempLog%
TYPE %TempLog% >> %sAllLog%
TYPE %TempLog% >> %sErrorLog%
DEL %TempLog%
GOTO :BatchEnd

REM ====================================================
REM Osql Error Exit
REM ====================================================
:ErrorOsql

@ECHO. >>%TempLog%
ECHO +++ >>%TempLog%
IF /I '%3' == '/E' GOTO TrustedConnectionSQLError
ECHO +++ OSQL ERROR: Script %5 returned an error. >>%TempLog%
GOTO PassTrustedConnectionSQLError
:TrustedConnectionSQLError
ECHO +++ OSQL ERROR: Script %4 returned an error. >>%TempLog%
:PassTrustedConnectionSQLError
ECHO +++ >>%TempLog%
@ECHO. >> %TempLog%

TYPE %TempLog%
TYPE %TempLog% >> %sAllLog%
TYPE %TempLog% >> %sErrorLog%

DEL %TempLog%

:BatchEnd
