@echo off
title Download from GitHub

cd /d "%~dp0"

echo =================================
echo      Downloading from GitHub
echo =================================

git pull

echo.
echo Download process finished.
pause
