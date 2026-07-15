Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Dang ghep noi file gpt_agent.exe" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$part1 = "gpt_agent.exe.part1"
$part2 = "gpt_agent.exe.part2"
$output = "gpt_agent.exe"

if (-not (Test-Path $part1)) {
    Write-Host "[LOI] Khong tim thay $part1!" -ForegroundColor Red
    Read-Host "Nhan Enter de thoat"
    exit
}

if (-not (Test-Path $part2)) {
    Write-Host "[LOI] Khong tim thay $part2!" -ForegroundColor Red
    Read-Host "Nhan Enter de thoat"
    exit
}

Write-Host "Dang ghep file... Vui long doi..." -ForegroundColor Yellow

try {
    # Su dung cmd copy /b ben trong powershell de ghep file nhi phan nhanh nhat
    cmd.exe /c "copy /b $part1 + $part2 $output >nul"
    
    if (Test-Path $output) {
        Write-Host "`n[THANH CONG] Da tao xong file $output!" -ForegroundColor Green
        Write-Host "Ban co the chay file gpt_agent.exe bay gio." -ForegroundColor Green
    } else {
        Write-Host "`n[LOI] Ghep file that bai!" -ForegroundColor Red
    }
} catch {
    Write-Host "`n[LOI] Co loi xay ra: $_" -ForegroundColor Red
}

Write-Host ""
Read-Host "Nhan Enter de thoat"