@echo off
chcp 65001 >nul
title 本地服务器 - 手势交互系统
color 0A

echo.
echo ========================================
echo   启动本地服务器
echo ========================================
echo.

REM 设置端口
set PORT=8000

REM 优先使用 py 命令（Windows Python启动器）
echo [1/3] 检测 Python...
py --version >nul 2>&1
if %errorlevel% == 0 (
    echo [成功] 找到 Python
    py --version
    echo.
    echo ========================================
    echo   服务器启动中...
    echo ========================================
    echo.
    echo 访问地址: http://localhost:%PORT%/gesture.html
    echo.
    echo 按 Ctrl+C 停止服务器
    echo ========================================
    echo.
    py -m http.server %PORT%
    if %errorlevel% neq 0 (
        echo.
        echo [错误] 启动失败！错误代码: %errorlevel%
        pause
    )
    goto :end
)

REM 尝试 node
echo [2/3] 检测 Node.js...
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo [成功] 找到 Node.js
    node --version
    echo.
    echo ========================================
    echo   服务器启动中...
    echo ========================================
    echo.
    echo 访问地址: http://localhost:%PORT%/gesture.html
    echo.
    echo 首次运行可能需要下载依赖，请稍候...
    echo 按 Ctrl+C 停止服务器
    echo ========================================
    echo.
    npx --yes serve -p %PORT% -s .
    if %errorlevel% neq 0 (
        echo.
        echo [错误] 启动失败！错误代码: %errorlevel%
        pause
    )
    goto :end
)

REM 错误提示
echo [3/3] 未找到 Python 或 Node.js
echo.
echo ========================================
echo   [错误] 无法启动服务器
echo ========================================
echo.
echo 系统未检测到 Python 或 Node.js
echo.
echo 快速解决方案:
echo   1. 确保已安装 Python (推荐)
echo      下载: https://www.python.org/downloads/
echo.
echo   2. 或安装 Node.js
echo      下载: https://nodejs.org/
echo.
echo   3. 或使用 VS Code 的 Live Server 扩展
echo.
echo ========================================
echo.
pause

:end

