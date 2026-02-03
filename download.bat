@echo off
title SwerveDrive仓库设置工具
color 0A

:: 检查 Git 是否安装
where git >nul 2>nul
if errorlevel 1 (
    echo 错误: 未找到 Git，请先安装 Git!
    pause
    exit /b 1
)

:: 克隆第一个仓库
echo [1/4] 克隆 ftc-dashboard...
git clone https://bgithub.xyz/BluePowerRobotics/ftc-dashboard.git
cd ftc-dashboard
git remote set-url --push origin https://github.com/BluePowerRobotics/ftc-dashboard.git
cd ..
echo ✓ ftc-dashboard 完成
echo.

:: 克隆第二个仓库
echo [2/4] 克隆 road-runner-ftc...
git clone https://bgithub.xyz/BluePowerRobotics/road-runner-ftc.git
cd road-runner-ftc
git remote set-url --push origin https://github.com/BluePowerRobotics/road-runner-ftc.git
cd ..
echo ✓ road-runner-ftc 完成
echo.

:: 克隆第三个仓库
echo [3/4] 克隆 road-runner...
git clone https://bgithub.xyz/BluePowerRobotics/road-runner.git
cd road-runner
git remote set-url --push origin https://github.com/BluePowerRobotics/road-runner.git
cd ..
echo ✓ road-runner 完成
echo.

:: 克隆第四个仓库
echo [4/4] 克隆 SwerveDrive...
git clone https://bgithub.xyz/BluePowerRobotics/SwerveDrive.git
cd SwerveDrive
git remote set-url --push origin https://github.com/BluePowerRobotics/SwerveDrive.git

:: 执行 link 脚本
echo 执行 link 脚本...
echo 需要管理员权限来创建软链接
call link.bat
cd ..
echo ✓ SwerveDrive 完成
echo.