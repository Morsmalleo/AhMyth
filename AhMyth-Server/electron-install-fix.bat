@echo off
setlocal EnableExtensions EnableDelayedExpansion

title AhMyth Electron Installation Repair

REM ==================================================
REM AhMyth Electron Installation Repair
REM Required Electron version: 29.2.0
REM ==================================================

set "REQUIRED_ELECTRON_VERSION=29.2.0"

echo.
echo ==========================================
echo   AhMyth Electron Installation Repair
echo ==========================================
echo.
echo Working directory:
echo   %CD%
echo.
echo Required Electron version:
echo   %REQUIRED_ELECTRON_VERSION%
echo.

REM ==================================================
REM STEP 0 - Verify working directory
REM ==================================================

echo [STEP 0/6] Checking AhMyth-Server directory...
echo.

if not exist "package.json" (
    echo [ERROR] package.json was not found.
    echo.
    echo This script must be run from:
    echo   AhMyth-Server
    echo.
    goto FAIL
)

echo [PASS] package.json found.
echo.

REM ==================================================
REM STEP 1 - Check Node.js
REM ==================================================

echo [STEP 1/6] Checking Node.js...
echo.

where.exe node

if errorlevel 1 (
    echo.
    echo [ERROR] Node.js could not be found in PATH.
    echo.
    goto FAIL
)

echo.
echo [INFO] Node version:
node --version

if errorlevel 1 (
    echo.
    echo [ERROR] Node.js was found but could not execute.
    echo.
    goto FAIL
)

echo.
echo [PASS] Node.js is available.
echo.

REM ==================================================
REM STEP 2 - Check npm
REM ==================================================

echo [STEP 2/6] Checking npm...
echo.

where.exe npm

if errorlevel 1 (
    echo.
    echo [ERROR] npm could not be found in PATH.
    echo.
    goto FAIL
)

echo.
echo [INFO] npm version:
call npm --version

if errorlevel 1 (
    echo.
    echo [ERROR] npm was found but could not execute.
    echo.
    goto FAIL
)

echo.
echo [PASS] npm is available.
echo.

REM ==================================================
REM STEP 3 - Install project dependencies
REM ==================================================

echo [STEP 3/6] Installing project dependencies...
echo.

call npm install

if errorlevel 1 (
    echo.
    echo [WARNING] npm install returned an error.
    echo [INFO] Continuing with Electron recovery.
    echo.
)

REM ==================================================
REM Determine installed Electron version
REM ==================================================

set "ELECTRON_VERSION="

if exist "node_modules\electron\package.json" (
    for /f "delims=" %%V in (
        'node -p "require("./node_modules/electron/package.json").version" 2^>nul'
    ) do (
        set "ELECTRON_VERSION=%%V"
    )
)

if not defined ELECTRON_VERSION (
    echo [INFO] Electron is not currently installed.
    echo.
    echo [INFO] Installing required Electron version:
    echo   %REQUIRED_ELECTRON_VERSION%
    echo.

    call npm install --save-dev electron@%REQUIRED_ELECTRON_VERSION% --save-exact

    if errorlevel 1 (
        echo.
        echo [ERROR] Could not install Electron %REQUIRED_ELECTRON_VERSION%.
        echo.
        goto FAIL
    )

    set "ELECTRON_VERSION=%REQUIRED_ELECTRON_VERSION%"
)

echo [INFO] Electron version:
echo   %ELECTRON_VERSION%
echo.

REM ==================================================
REM Ensure required Electron version
REM ==================================================

if /I not "%ELECTRON_VERSION%"=="%REQUIRED_ELECTRON_VERSION%" (
    echo [WARNING] Incorrect Electron version detected.
    echo.
    echo Required:
    echo   %REQUIRED_ELECTRON_VERSION%
    echo.
    echo Found:
    echo   %ELECTRON_VERSION%
    echo.
    echo [INFO] Installing required Electron version...
    echo.

    call npm install --save-dev electron@%REQUIRED_ELECTRON_VERSION% --save-exact

    if errorlevel 1 (
        echo.
        echo [ERROR] Could not install Electron %REQUIRED_ELECTRON_VERSION%.
        echo.
        goto FAIL
    )

    set "ELECTRON_VERSION="

    for /f "delims=" %%V in (
        'node -p "require("./node_modules/electron/package.json").version" 2^>nul'
    ) do (
        set "ELECTRON_VERSION=%%V"
    )

    if /I not "%ELECTRON_VERSION%"=="%REQUIRED_ELECTRON_VERSION%" (
        echo.
        echo [ERROR] Electron version is still incorrect.
        echo.
        echo Required:
        echo   %REQUIRED_ELECTRON_VERSION%
        echo.
        echo Found:
        echo   %ELECTRON_VERSION%
        echo.
        goto FAIL
    )
)

REM ==================================================
REM Determine architecture
REM ==================================================

for /f "delims=" %%A in (
    'node -p "process.arch" 2^>nul'
) do (
    set "NODE_ARCH=%%A"
)

if /I "%NODE_ARCH%"=="x64" (
    set "ELECTRON_ARCH=x64"
) else if /I "%NODE_ARCH%"=="arm64" (
    set "ELECTRON_ARCH=arm64"
) else (
    echo [ERROR] Unsupported Node architecture:
    echo   %NODE_ARCH%
    echo.
    goto FAIL
)

echo [INFO] Architecture:
echo   %ELECTRON_ARCH%
echo.

REM ==================================================
REM Electron paths
REM ==================================================

set "ELECTRON_DIR=%CD%\node_modules\electron"
set "DIST_DIR=%ELECTRON_DIR%\dist"
set "PATH_FILE=%ELECTRON_DIR%\path.txt"
set "VERSION_FILE=%DIST_DIR%\version"
set "ELECTRON_EXE=%DIST_DIR%\electron.exe"

echo [INFO] Electron directory:
echo   %ELECTRON_DIR%
echo.

REM ==================================================
REM STEP 4 - Run normal Electron installer
REM ==================================================

echo [STEP 4/6] Running Electron installer...
echo.

if not exist "%ELECTRON_DIR%\install.js" (
    echo [WARNING] Electron install.js was not found.
    echo [INFO] Continuing with cache recovery.
    echo.
) else (
    call node "%ELECTRON_DIR%\install.js"

    if errorlevel 1 (
        echo.
        echo [WARNING] Electron installer returned an error.
        echo [INFO] Continuing with cache recovery.
        echo.
    ) else (
        echo.
        echo [PASS] Electron installer completed.
        echo.
    )
)

REM ==================================================
REM Check whether Electron is already complete
REM ==================================================

echo [INFO] Checking Electron installation...
echo.

set "INSTALL_OK=1"

if not exist "%VERSION_FILE%" (
    echo [CHECK] dist/version .............. MISSING
    set "INSTALL_OK=0"
) else (
    echo [CHECK] dist/version .............. OK
)

if not exist "%PATH_FILE%" (
    echo [CHECK] path.txt .................. MISSING
    set "INSTALL_OK=0"
) else (
    echo [CHECK] path.txt .................. OK
)

if not exist "%ELECTRON_EXE%" (
    echo [CHECK] dist/electron.exe ......... MISSING
    set "INSTALL_OK=0"
) else (
    echo [CHECK] dist/electron.exe ......... OK
)

echo.

if "%INSTALL_OK%"=="1" (
    echo [PASS] Electron distribution files already exist.
    goto VERIFY
)

REM ==================================================
REM STEP 5 - Locate cached Electron ZIP
REM ==================================================

echo [STEP 5/6] Searching Electron cache...
echo.

if defined electron_config_cache (
    set "CACHE_ROOT=%electron_config_cache%"
    echo [INFO] Using custom Electron cache:
) else (
    set "CACHE_ROOT=%LOCALAPPDATA%\electron\Cache"
    echo [INFO] Using default Windows Electron cache:
)

echo   %CACHE_ROOT%
echo.

if not exist "%CACHE_ROOT%" (
    echo [ERROR] Electron cache directory was not found:
    echo   %CACHE_ROOT%
    echo.
    goto FAIL
)

set "ZIP_FILE="
set "ZIP_NAME=electron-v%REQUIRED_ELECTRON_VERSION%-win32-%ELECTRON_ARCH%.zip"
set "ZIP_RESULT=%TEMP%\ahmyth-electron-zip.txt"

if exist "%ZIP_RESULT%" (
    del "%ZIP_RESULT%" >nul 2>&1
)

echo [INFO] Searching recursively for:
echo   %ZIP_NAME%
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$root = $env:CACHE_ROOT; $name = $env:ZIP_NAME; $out = $env:ZIP_RESULT; $file = Get-ChildItem -LiteralPath $root -Filter $name -File -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1; if ($null -eq $file) { exit 1 }; Set-Content -LiteralPath $out -Value $file.FullName -NoNewline"

if errorlevel 1 (
    echo.
    echo [ERROR] Cached Electron ZIP could not be found.
    echo.
    echo Expected:
    echo   %ZIP_NAME%
    echo.
    echo Search location:
    echo   %CACHE_ROOT%
    echo.
    goto FAIL
)

if not exist "%ZIP_RESULT%" (
    echo.
    echo [ERROR] Cache search did not return a ZIP path.
    echo.
    goto FAIL
)

set /p ZIP_FILE=<"%ZIP_RESULT%"

del "%ZIP_RESULT%" >nul 2>&1

if not defined ZIP_FILE (
    echo.
    echo [ERROR] Cached Electron ZIP path was empty.
    echo.
    goto FAIL
)

echo [FOUND] Cached Electron ZIP:
echo   %ZIP_FILE%
echo.

REM ==================================================
REM Extract Electron distribution
REM ==================================================

echo [INFO] Preparing Electron distribution directory...
echo.

if not exist "%DIST_DIR%" (
    mkdir "%DIST_DIR%"

    if errorlevel 1 (
        echo [ERROR] Could not create:
        echo   %DIST_DIR%
        echo.
        goto FAIL
    )
)

echo [INFO] Extracting Electron distribution...
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$zip = $env:ZIP_FILE; $dest = $env:DIST_DIR; Expand-Archive -LiteralPath $zip -DestinationPath $dest -Force"

if errorlevel 1 (
    echo.
    echo [ERROR] Electron ZIP extraction failed.
    echo.
    goto FAIL
)

echo.
echo [PASS] Electron distribution extracted.
echo.

REM ==================================================
REM Create path.txt
REM ==================================================

echo [INFO] Creating path.txt...
echo.

REM IMPORTANT:
REM Do not use "echo electron.exe" here.
REM path.txt must not contain a trailing CRLF.

> "%PATH_FILE%" <nul set /p "=electron.exe"

if not exist "%PATH_FILE%" (
    echo [ERROR] Could not create path.txt.
    echo.
    goto FAIL
)

echo [PASS] path.txt created.
echo [INFO] Contents:
type "%PATH_FILE%"
echo.
echo.

REM ==================================================
REM STEP 6 - Final verification
REM ==================================================

:VERIFY

echo [STEP 6/6] Final Electron verification...
echo.

set "VERIFY_OK=1"

REM --------------------------------------------------
REM Verify dist/version
REM --------------------------------------------------

if not exist "%VERSION_FILE%" (
    echo [FAIL] dist/version is missing.
    set "VERIFY_OK=0"
) else (
    set "ELECTRON_DIST_VERSION="
    set /p ELECTRON_DIST_VERSION=<"%VERSION_FILE%"

    if /I not "!ELECTRON_DIST_VERSION!"=="%REQUIRED_ELECTRON_VERSION%" (
        echo [FAIL] dist/version = !ELECTRON_DIST_VERSION!
        echo [FAIL] Expected %REQUIRED_ELECTRON_VERSION%.
        set "VERIFY_OK=0"
    ) else (
        echo [PASS] dist/version = !ELECTRON_DIST_VERSION!
    )
)

REM --------------------------------------------------
REM Verify path.txt
REM --------------------------------------------------

if not exist "%PATH_FILE%" (
    echo [FAIL] path.txt is missing.
    set "VERIFY_OK=0"
) else (
    set "ELECTRON_PATH="
    set /p ELECTRON_PATH=<"%PATH_FILE%"

    echo [PASS] path.txt = !ELECTRON_PATH!

    if /I not "!ELECTRON_PATH!"=="electron.exe" (
        echo [FAIL] path.txt contains an unexpected path.
        set "VERIFY_OK=0"
    )
)

REM --------------------------------------------------
REM Verify electron.exe
REM --------------------------------------------------

if not exist "%ELECTRON_EXE%" (
    echo [FAIL] electron.exe is missing.
    set "VERIFY_OK=0"
) else (
    echo [PASS] electron.exe exists.
)

echo.

if "%VERIFY_OK%"=="0" (
    echo ==========================================
    echo   ELECTRON REPAIR FAILED
    echo ==========================================
    echo.
    goto FAIL
)

REM ==================================================
REM Test Electron executable
REM ==================================================

echo [INFO] Testing Electron executable...
echo.

"%ELECTRON_EXE%" --version

if errorlevel 1 (
    echo.
    echo [ERROR] electron.exe exists but could not be executed.
    echo.
    goto FAIL
)

echo.
echo ==========================================
echo   ELECTRON REPAIR SUCCESSFUL
echo ==========================================
echo.
echo Electron %REQUIRED_ELECTRON_VERSION% is installed correctly.
echo.
echo Distribution:
echo   %DIST_DIR%
echo.
echo Version file:
echo   %VERSION_FILE%
echo.
echo Path file:
echo   %PATH_FILE%
echo.
echo Executable:
echo   %ELECTRON_EXE%
echo.

choice /C YN /N /M "Start AhMyth now? [Y/N]: "

if errorlevel 2 (
    echo.
    echo [INFO] Repair complete. Not starting AhMyth.
    echo.
    pause
    exit /b 0
)

echo.
echo [INFO] Starting AhMyth...
echo.

call npm start

set "START_RESULT=%ERRORLEVEL%"

echo.
echo npm start exited with code %START_RESULT%.
echo.

pause
exit /b %START_RESULT%


REM ==================================================
REM FAILURE HANDLER
REM ==================================================

:FAIL

echo.
echo ==========================================
echo   ELECTRON REPAIR STOPPED
echo ==========================================
echo.
echo The script encountered a problem.
echo.
echo The command window will remain open so the
echo error above can be read.
echo.

pause

exit /b 1