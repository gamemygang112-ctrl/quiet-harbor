@echo off
setlocal

echo ============================================================
echo   WuWa Moonlight - Generate Visual Studio Solution (.sln)
echo ============================================================

set "CMAKE_BIN="
where cmake >nul 2>&1
if %ERRORLEVEL% equ 0 (
    set "CMAKE_BIN=cmake"
    goto :found_cmake
)

if exist "C:\Program Files\Microsoft Visual Studio\18\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" (
    set "CMAKE_BIN=C:\Program Files\Microsoft Visual Studio\18\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
    goto :found_cmake
)

if exist "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" (
    set "CMAKE_BIN=C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
    goto :found_cmake
)

if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" (
    set "CMAKE_BIN=C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
    goto :found_cmake
)

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" (
    set "CMAKE_BIN=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
    goto :found_cmake
)

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" (
    set "CMAKE_BIN=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
    goto :found_cmake
)

:found_cmake
if "%CMAKE_BIN%"=="" (
    echo [ERROR] CMake not found.
    pause
    exit /b 1
)

echo [INFO] Using CMake: "%CMAKE_BIN%"

if not exist "wuwa-moonlight\ext\CppSDK\SDK" mkdir "wuwa-moonlight\ext\CppSDK\SDK"
if not exist "wuwa-moonlight\ext\CppSDK\SDK\Basic.cpp" type nul > "wuwa-moonlight\ext\CppSDK\SDK\Basic.cpp"
if not exist "wuwa-moonlight\ext\CppSDK\SDK\Engine_functions.cpp" type nul > "wuwa-moonlight\ext\CppSDK\SDK\Engine_functions.cpp"
if not exist "wuwa-moonlight\ext\CppSDK\SDK\CoreUObject_functions.cpp" type nul > "wuwa-moonlight\ext\CppSDK\SDK\CoreUObject_functions.cpp"
if not exist "wuwa-moonlight\ext\CppSDK\SDK\KuroUtility_functions.cpp" type nul > "wuwa-moonlight\ext\CppSDK\SDK\KuroUtility_functions.cpp"

echo.
echo Generating Visual Studio Solution...
"%CMAKE_BIN%" -G "Visual Studio 16 2019" -A x64 -B build_vs2019

echo.
echo ============================================================
echo   Done!
echo   Solution file created at: build_vs2019\wuwa-moonlight.sln
echo ============================================================
pause
