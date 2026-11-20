@echo off
title Upload to GitHub

cd /d "%~dp0"

echo =================================
echo       Uploading to GitHub
echo =================================

git add .

git commit -m "Automatic upload"

git push

echo.
echo Upload process finished.
pause
