@echo off
setlocal enabledelayedexpansion

:: This script should be run from the project root: scripts\build.bat
:: Usage: scripts\build.bat [OUTPUT_NAME] [--xe]

set OUTPUT_NAME=%~1
if "%OUTPUT_NAME%"=="" set OUTPUT_NAME=TungBuiThanh_CV
set PDF_DIR=scripts\pdf
set USE_XE=false

:: Check for --xe flag
if "%~2"=="--xe" set USE_XE=true
if "%~1"=="--xe" (
    set USE_XE=true
    set OUTPUT_NAME=TungBuiThanh_CV
)

:: Ensure PDF directory exists
if not exist "%PDF_DIR%" mkdir "%PDF_DIR%"

:: Detect main LaTeX file
set MAIN_FILE=
if exist main.tex (
    set MAIN_FILE=main.tex
) else if exist resume.tex (
    set MAIN_FILE=resume.tex
) else (
    for %%f in (*.tex) do (
        set MAIN_FILE=%%f
        goto :found
    )
)

:found
if "%MAIN_FILE%"=="" (
    echo ❌ Error: Could not find a main LaTeX file (main.tex or resume.tex).
    exit /b 1
)

:: Determine engine
set ENGINE=-pdf
if "%USE_XE%"=="true" (
    set ENGINE=-xelatex
    echo ⚙️ Using XeLaTeX engine...
) else (
    findstr /C:"fontspec" "%MAIN_FILE%" >nul
    if !errorlevel! equ 0 (
        set ENGINE=-xelatex
        echo ⚙️ Using XeLaTeX engine (detected fontspec)...
    ) else (
        echo ⚙️ Using pdfLaTeX engine...
    )
)

echo 🚀 Building CV using %MAIN_FILE% as: %OUTPUT_NAME%.pdf in %PDF_DIR%\...

:: Build the PDF
latexmk %ENGINE% -jobname="%OUTPUT_NAME%" -outdir="%PDF_DIR%" -interaction=nonstopmode %MAIN_FILE%

:: Clean up
latexmk -c -jobname="%OUTPUT_NAME%" -outdir="%PDF_DIR%" %MAIN_FILE%
del /q "%PDF_DIR%\%OUTPUT_NAME%.xdv" "%PDF_DIR%\%OUTPUT_NAME%.bcf" "%PDF_DIR%\%OUTPUT_NAME%.run.xml" 2>nul

if exist "%PDF_DIR%\%OUTPUT_NAME%.pdf" (
    echo ✨ Build complete! Your file is ready at %PDF_DIR%\%OUTPUT_NAME%.pdf
) else (
    echo ❌ Build failed. Please check the logs in %PDF_DIR%\
)
