@echo off
echo 修复Flutter环境变量
echo =====================================
echo.

echo 当前检测到的Flutter路径:
echo 错误路径: C:\flutter\bin
echo 正确路径: C:\flutter_windows_3.32.4-stable\flutter\bin
echo.

echo 正在修复系统环境变量...
echo.

:: 使用PowerShell修复用户环境变量
powershell -Command ^
"$currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User'); ^
$newPath = $currentPath -replace 'C:\\flutter\\bin', 'C:\\flutter_windows_3.32.4-stable\\flutter\\bin'; ^
[Environment]::SetEnvironmentVariable('PATH', $newPath, 'User'); ^
Write-Host '用户环境变量已更新'"

echo.

:: 检查系统环境变量
powershell -Command ^
"$systemPath = [Environment]::GetEnvironmentVariable('PATH', 'Machine'); ^
if ($systemPath -match 'C:\\flutter\\bin') { ^
    Write-Host '检测到系统环境变量中也有错误的Flutter路径'; ^
    Write-Host '需要管理员权限修复，请以管理员身份运行此脚本'; ^
} else { ^
    Write-Host '系统环境变量检查通过'; ^
}"

echo.
echo =====================================
echo 修复完成！
echo.
echo 请关闭所有终端窗口并重新打开，或者重启电脑让修改生效。
echo 之后您就可以直接使用 flutter 命令了。
echo.
pause 