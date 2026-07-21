$ErrorActionPreference = "Stop"
$manifestJson = Get-Content -LiteralPath "manifest.json" -Raw
$manifest = ConvertFrom-Json -InputObject $manifestJson
$outFile = $manifest.original_file
if (Test-Path -LiteralPath $outFile) { throw "Output already exists: $outFile" }
$dest = [System.IO.File]::Create($outFile)
try { foreach ($chunk in $manifest.chunks) { $src = [System.IO.File]::OpenRead($chunk.file); try { $src.CopyTo($dest) } finally { $src.Dispose() } } } finally { $dest.Dispose() }
$actual = (Get-FileHash -LiteralPath $outFile -Algorithm SHA256).Hash
if ($actual -ne $manifest.original_sha256) { throw "SHA256 mismatch after join" }
Write-Host "Rebuilt $outFile OK: $actual"
