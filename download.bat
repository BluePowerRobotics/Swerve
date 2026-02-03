@echo off
setlocal enabledelayedexpansion

:: 检查 Git 是否安装
where git >nul 2>nul
if errorlevel 1 (
    echo 错误: 未找到 Git，请先安装 Git!
    start "" "https://git-scm.com/download/win"
    pause
    exit /b 1
)

set "CLONED_FAILED=false"

echo Cloning ftc-dashboard repository...
git clone https://bgithub.xyz/BluePowerRobotics/ftc-dashboard.git
if %errorlevel% equ 0 (
    if exist "ftc-dashboard\" (
        echo ftc-dashboard cloned, setting remote...
        cd ftc-dashboard
        git remote set-url --push origin https://github.com/BluePowerRobotics/ftc-dashboard.git
        cd ..
        echo succeed.
    ) else (
        echo Error: Directory ftc-dashboard not created.
        set "CLONED_FAILED=true"
    )
) else (
    echo Error: Failed to clone ftc-dashboard repository. Retry later please.
    if exist "ftc-dashboard\" rd /s /q ftc-dashboard
    set "CLONED_FAILED=true"
)

echo Cloning road-runner-ftc repository...
git clone https://bgithub.xyz/BluePowerRobotics/road-runner-ftc.git
if %errorlevel% equ 0 (
    if exist "road-runner-ftc\" (
        echo road-runner-ftc cloned, setting remote...
        cd road-runner-ftc
        git remote set-url --push origin https://github.com/BluePowerRobotics/road-runner-ftc.git
        cd ..
        echo succeed.
    ) else (
        echo Error: Directory road-runner-ftc not created.
        set "CLONED_FAILED=true"
    )
) else (
    echo Error: Failed to clone road-runner-ftc repository. Retry later please.
    if exist "road-runner-ftc\" rd /s /q road-runner-ftc
    set "CLONED_FAILED=true"
)

echo Cloning road-runner repository...
git clone https://bgithub.xyz/BluePowerRobotics/road-runner.git
if %errorlevel% equ 0 (
    if exist "road-runner\" (
        echo road-runner cloned, setting remote...
        cd road-runner
        git remote set-url --push origin https://github.com/BluePowerRobotics/road-runner.git
        cd ..
        echo succeed.
    ) else (
        echo Error: Directory road-runner not created.
        set "CLONED_FAILED=true"
    )
) else (
    echo Error: Failed to clone road-runner repository. Retry later please.
    if exist "road-runner\" rd /s /q road-runner
    set "CLONED_FAILED=true"
)

echo Cloning SwerveDrive repository...
git clone https://bgithub.xyz/BluePowerRobotics/SwerveDrive.git
if %errorlevel% equ 0 (
    if exist "SwerveDrive\" (
        echo SwerveDrive cloned, setting remote...
        cd SwerveDrive
        git remote set-url --push origin https://github.com/BluePowerRobotics/SwerveDrive.git
        echo succeed.
        echo creating link...

        rem 注意：批处理中布尔值比较
        if "!CLONED_FAILED!"=="false" (
            echo Running link script...
            call link.bat
        ) else (
            echo Skipping link script because previous clones failed.
        )

        cd ..
    ) else (
        echo Error: Directory SwerveDrive not created.
        if exist "SwerveDrive\" rd /s /q SwerveDrive
    )
) else (
    echo Error: Failed to clone SwerveDrive repository. Retry later please.
    if exist "SwerveDrive\" rd /s /q SwerveDrive
)

echo All operations completed.
echo CLONED_FAILED: !CLONED_FAILED!
pause