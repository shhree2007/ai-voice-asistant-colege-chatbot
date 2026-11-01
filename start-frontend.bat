@echo off
title Orchivoice - Frontend Web App
echo ========================================================
echo   Starting Orchivoice Frontend Web Interface
echo ========================================================
cd /d "%~dp0frontend"
call pnpm dev
pause
