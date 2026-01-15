# merge.ps1 - Ghép lại file gpt_agent.exe từ các part

$baseName = "gpt_agent.exe"
$parts = Get-ChildItem -Filter "$baseName.part*" | Sort-Object Name
$outFile = Join-Path (Get-Location) $baseName

if ($parts.Count -eq 0) {
    Write-Error "❌ Không tìm thấy part nào ($baseName.part*)"
    exit 1
}

$fsOut = [System.IO.File]::Create($outFile)
foreach ($p in $parts) {
    Write-Host "🔗 Merging $($p.Name)..."
    $bytes = [System.IO.File]::ReadAllBytes($p.FullName)
    $fsOut.Write($bytes, 0, $bytes.Length)
}
$fsOut.Close()

Write-Host "✅ Merge complete: $baseName (${((Get-Item $outFile).Length / 1MB).ToString('0.00')} MB)"