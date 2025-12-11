@echo off
chcp 65001 >nul
echo ========================================
echo   环境诊断工具
echo ========================================
echo.

echo [检查1] Python 检测
echo ----------------------------------------
python --version 2>nul
if %errorlevel% == 0 (
    echo [OK] python 命令可用
) else (
    echo [X] python 命令不可用
)

python3 --version 2>nul
if %errorlevel% == 0 (
    echo [OK] python3 命令可用
) else (
    echo [X] python3 命令不可用
)

py --version 2>nul
if %errorlevel% == 0 (
    echo [OK] py 命令可用
    py --version
) else (
    echo [X] py 命令不可用
)
echo.

echo [检查2] Node.js 检测
echo ----------------------------------------
node --version 2>nul
if %errorlevel% == 0 (
    echo [OK] node 命令可用
    node --version
) else (
    echo [X] node 命令不可用
)
echo.

echo [检查3] 端口占用检测
echo ----------------------------------------
netstat -an | findstr ":8000 " >nul 2>&1
if %errorlevel% == 0 (
    echo [警告] 端口 8000 已被占用
    netstat -an | findstr ":8000 "
) else (
    echo [OK] 端口 8000 可用
)
echo.

echo [检查4] 当前目录文件
echo ----------------------------------------
dir /b *.html *.bat 2>nul
echo.

echo ========================================
echo   诊断完成
echo ========================================
echo.
pause

