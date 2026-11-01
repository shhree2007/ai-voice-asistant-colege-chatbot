@echo off
title Orchivoice - Backend Voice Agent (Sarvam AI)
echo ========================================================
echo   Starting Orchivoice Backend Voice Agent (LiveKit + Sarvam AI)
echo ========================================================
cd /d "%~dp0backend"
if not exist ".venv\Scripts\python.exe" (
    echo Error: Python virtual environment not found in backend\.venv
    pause
    exit /b 1
)
.venv\Scripts\python.exe -u src\agent.py dev
pause
