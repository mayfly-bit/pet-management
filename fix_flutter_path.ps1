# 修复Flutter环境变量
Write-Host "修复Flutter环境变量" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green

# 获取当前用户环境变量
$currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User')

# 检查是否包含错误路径
if ($currentPath -match 'C:\\flutter\\bin') {
    Write-Host "发现错误的Flutter路径: C:\flutter\bin" -ForegroundColor Yellow
    
    # 替换为正确路径
    $newPath = $currentPath -replace 'C:\\flutter\\bin', 'C:\flutter_windows_3.32.4-stable\flutter\bin'
    
    # 更新用户环境变量
    [Environment]::SetEnvironmentVariable('PATH', $newPath, 'User')
    
    Write-Host "已更新为正确路径: C:\flutter_windows_3.32.4-stable\flutter\bin" -ForegroundColor Green
} else {
    Write-Host "用户环境变量中未发现错误的Flutter路径" -ForegroundColor Yellow
}

# 检查系统环境变量
Write-Host ""
Write-Host "检查系统环境变量..." -ForegroundColor Cyan
$systemPath = [Environment]::GetEnvironmentVariable('PATH', 'Machine')

if ($systemPath -match 'C:\\flutter\\bin') {
    Write-Host "警告: 系统环境变量中也包含错误的Flutter路径" -ForegroundColor Red
    Write-Host "需要管理员权限修复系统环境变量" -ForegroundColor Red
} else {
    Write-Host "系统环境变量检查通过" -ForegroundColor Green
}

Write-Host ""
Write-Host "=====================================" -ForegroundColor Green
Write-Host "修复完成!" -ForegroundColor Green
Write-Host ""
Write-Host "请重新启动PowerShell窗口或重启电脑让修改生效" -ForegroundColor Yellow
Write-Host "之后您可以直接使用 flutter 命令" -ForegroundColor Yellow

# 验证修复结果
Write-Host ""
Write-Host "验证修复结果:" -ForegroundColor Cyan
$updatedPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
if ($updatedPath -match 'C:\\flutter_windows_3\.32\.4-stable\\flutter\\bin') {
    Write-Host "✓ PATH环境变量已正确设置" -ForegroundColor Green
} else {
    Write-Host "✗ PATH环境变量修复可能失败" -ForegroundColor Red
} 