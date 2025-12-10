@echo off
chcp 65001 >nul
cd /d %~dp0
echo ========================================
echo   手势交互 3D 粒子系统 - 服务器启动
echo ========================================
echo.
echo 正在启动服务器...
echo.

python -m http.server 8000 2>nul
if %errorlevel% neq 0 (
    py -m http.server 8000 2>nul
    if %errorlevel% neq 0 (
        echo [错误] 未找到 Python，请尝试以下方法：
        echo.
        echo 方法1: 安装 Python 3.x
        echo 方法2: 使用 VS Code Live Server 扩展
        echo 方法3: 使用 Node.js: npx http-server -p 8000
        echo.
        pause
        exit
    )
)


