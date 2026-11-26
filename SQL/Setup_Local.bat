@ECHO OFF

MKDIR c:\TUData
CALL DBInstall_Initial.CMD (local) master /E
CALL DBInstall.CMD (local) TU  /E

REM Run The GetStockSymbol.exe
.\GetStockSymbol\bin\Debug\GetStockSymbol.exe

 