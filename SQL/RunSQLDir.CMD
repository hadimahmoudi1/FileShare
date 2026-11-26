
@ECHO OFF
GOTO BatchStart
===========================================================
RunSQLDir.cmd by Darbod LLC. WWW.Darbod.COM (All Right Reserved)

This Batch file is called by DbInstall.cmd and runs all SQL script files 
from the given directory.

Note:	Easy DB Installer uses the Microsoft OSQL utility 
to deploy SQL scripts.  The OSQL utility is installed when 
different versions of Microsoft SQL Server or SQL client 
tools are installed.  Easy DB Installer can only be used on
computers with OSQL tool available.  For more information on
OSQL utility please refer at you MS SQL server documentation.

RunSQLDir.cmd calls RunSQLScript.cmd.

args:
1.  Server Name
2.  Database Name
3.  User Name or /E for trusted connection
4.  Password or nothing in case of trusted connection
5.  Directory name
===========================================================

:BatchStart

REM	--Argument Check
IF '%1' == '' GOTO ErrorArgument
IF '%2' == '' GOTO ErrorArgument
IF /I '%3' == '/E' GOTO TrustedConnection
IF '%3' == '' GOTO ErrorArgument
IF '%4' == '' GOTO ErrorArgument

:TrustedConnection

ECHO. >>%sAllLog%
ECHO =========================================================== >>%sAllLog%
ECHO =========================================================== >>%sAllLog%
ECHO Folder: %5 >> %sAllLog%

IF /I '%3' == '/E' GOTO TrustedConnectionLogHeader
osql /b /n /S %1 /d %2 /U %3 /P %4 /i GetLogHeader.sql >>%sAllLog%

GOTO PassTrustedConnectionLogHeader

:TrustedConnectionLogHeader
osql /b /n /S %1 /d %2 /E /i GetLogHeader.sql >>%sAllLog%

:PassTrustedConnectionLogHeader

ECHO =========================================================== >>%sAllLog%
ECHO =========================================================== >>%sAllLog%

ECHO. >>%sAllLog%

IF /I '%3' == '/E' GOTO TrustedConnectionCall
FOR %%F IN (%5\*.sql) DO CALL RunSQLScript.cmd %1 %2 %3 %4 "%%F"

GOTO PassTrustedConnectionCall

:TrustedConnectionCall
FOR %%F IN (%4\*.sql) DO CALL RunSQLScript.cmd %1 %2 %3 "%%F"

:PassTrustedConnectionCall
