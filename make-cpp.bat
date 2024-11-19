@echo off
setlocal

REM Define project name and file paths
set "MAKEFILE=Makefile"
set "MAIN_CPP=main.cpp"
set "SFML_MAKEFILE_TEMPLATE=C:\Windows\System32\SFMLMakefileTemplate.txt"
set "MAKEFILE_TEMPLATE=C:\Windows\System32\MakefileTemplate.txt"

:menu
cls
echo.
echo ========================================
echo        *** Project Manager Menu ***
echo ========================================
echo.
echo [1] Compile Project
echo [2] Clean Project
echo [3] Create New Makefile
echo [4] Initialize New C++ Project
echo [5] Zip Project
echo.
echo ========================================
echo.
echo [6] Exit
echo.
echo ========================================
echo.
set /p choice=Choose an option (1-6) ^| exit: (6, e, q): 
if "%choice%"=="1" goto compile_project
if "%choice%"=="2" goto clean_project
if "%choice%"=="3" goto makefile
if "%choice%"=="4" goto init_project
if "%choice%"=="5" goto zip_project
if /I "%choice%"=="6" goto exit_program
if /I "%choice%"=="e" goto exit_program
if /I "%choice%"=="E" goto exit_program
if /I "%choice%"=="q" goto exit_program
if /I "%choice%"=="Q" goto exit_program
echo Invalid choice. Please enter a number between 1 and 6, or e/E/q/Q to exit.
pause
goto menu

:check_make
where make >nul 2>nul
if errorlevel 1 (
  echo 'make' is not recognized as an internal or external command, operable program or batch file.
  echo Please install 'make' and ensure it is added to your PATH.
  pause
  goto menu
)
goto %1

:compile_project
call :check_make compile_project_continue
:compile_project_continue
echo.
echo Compiling project...
make
if errorlevel 1 (
  echo Compilation failed.
) else (
  echo Compilation successful.
)
pause
goto menu

:clean_project
call :check_make clean_project_continue
:clean_project_continue
echo.
echo Cleaning project...
make clean
pause
goto menu

:makefile
set /p sfml="Is this an SFML project? (y/n): "
if /i "%sfml%"=="y" (
  type "%SFML_MAKEFILE_TEMPLATE%" > %MAKEFILE%
) else (
  type "%MAKEFILE_TEMPLATE%" > %MAKEFILE%
)
echo Makefile created using %MAKEFILE%.
pause
goto menu

:init_project
echo.
set /p confirm="Are you sure you want to initialize a new C++ project? (y/n): "
if /i "%confirm%" NEQ "y" (
  echo Project initialization canceled.
  pause
  goto menu
)

echo Initializing new C++ project...
set /p sfml="Is this an SFML project? (y/n): "
if /i "%sfml%"=="y" (
  type "%SFML_MAKEFILE_TEMPLATE%" > %MAKEFILE%
) else (
  type "%MAKEFILE_TEMPLATE%" > %MAKEFILE%
)
(
echo #include ^<iostream^> > %MAIN_CPP%
echo using namespace std; >> %MAIN_CPP%
echo int main^(^) { >> %MAIN_CPP%
echo     cout ^<^< "Hello, World!" ^<^< endl; >> %MAIN_CPP%
echo     return 0; >> %MAIN_CPP%
echo } >> %MAIN_CPP%
)
echo New C++ project initialized with %MAIN_CPP%.
pause
goto menu

:zip_project
call :check_make zip_project_continue
:zip_project_continue
for %%I in (.) do set folder=%%~nI%%~xI
REM make sure that the current directory contains a makefile file
if exist %MAKEFILE% (
  echo.
  echo Compiling project...
  make
) else (
  echo Makefile not found in current directory. Exiting...
  pause
  goto menu
)
echo.
echo Cleaning project...
make clean
if exist ..\Zip (
  echo Zipping project to..\Zip\...
  tar -a -c -f ../Zip/%folder%.zip *.*
  echo Project zipped successfully.
) else (
  mkdir ..\Zip
  echo Zipping project to..\Zip\...
  tar -a -c -f ../Zip/%folder%.zip *.*
  echo Project zipped successfully.
)
echo.
pause
goto menu

:exit_program
exit /b