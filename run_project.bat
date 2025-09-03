@echo off
REM ملف تشغيل مشروع Node.js جاهز للعمل على سطح المكتب

SET PROJECT_DIR=C:\Users\nody-\Desktop\myproject

IF NOT EXIST "%PROJECT_DIR%" (
    echo المجلد "%PROJECT_DIR%" غير موجود على سطح المكتب!
    pause
    exit /b
)

cd /d "%PROJECT_DIR%"

IF NOT EXIST "package.json" (
    echo ملف package.json غير موجود في المجلد!
    pause
    exit /b
)

where node >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js غير موجود في PATH!
    pause
    exit /b
)

REM تشغيل المشروع وحفظ كود الخروج
npm start
SET EXITCODE=%ERRORLEVEL%

IF %EXITCODE% NEQ 0 (
    echo حدث خطأ أثناء تشغيل المشروع! كود الخطأ: %EXITCODE%
    pause