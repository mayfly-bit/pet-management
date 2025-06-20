@echo off
echo 宠物管理系统 - Flutter环境检测
echo =====================================
echo.

echo 正在检测Flutter环境...
echo.

:: 检查Flutter是否安装
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] Flutter未安装或未添加到PATH环境变量
    echo.
    echo 请按以下步骤安装Flutter:
    echo 1. 访问: https://flutter.cn/docs/get-started/install/windows
    echo 2. 下载Flutter SDK并解压到 C:\src\flutter
    echo 3. 将 C:\src\flutter\bin 添加到PATH环境变量
    echo 4. 设置国内镜像环境变量：
    echo    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    echo    PUB_HOSTED_URL=https://pub.flutter-io.cn
    echo.
    pause
    exit /b 1
) else (
    echo [成功] Flutter已安装
    flutter --version
    echo.
)

:: 检查依赖
echo 正在检查项目依赖...
flutter pub get
if %errorlevel% neq 0 (
    echo [错误] 依赖安装失败
    pause
    exit /b 1
) else (
    echo [成功] 依赖安装完成
    echo.
)

:: 运行flutter doctor
echo 正在运行环境检测...
flutter doctor
echo.

:: 检查设备
echo 检查可用设备...
flutter devices
echo.

echo =====================================
echo 环境检测完成！
echo.
echo 如果看到错误，请根据上述信息进行修复。
echo 如果一切正常，可以运行: flutter run -d windows
echo.
pause 