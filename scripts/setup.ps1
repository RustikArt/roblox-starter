# One-time setup for Windows (PowerShell).
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

if (-not (Get-Command rokit -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Rokit..."
    Invoke-RestMethod https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.ps1 | Invoke-Expression
    Write-Host "Rokit installed. Open a NEW terminal, then run this script again."
    exit 0
}

rokit install
if (-not (Test-Path .git)) { git init }
Write-Host "Done. Next: lune run check"
