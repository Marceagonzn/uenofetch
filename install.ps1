# Descargar uenofetch
$repo = "https://raw.githubusercontent.com/Marceagonzn/uenofetch/main/uenofetch.ps1"

$installPath = ""

if ($env:OS -eq "Windows_NT") {
    $installPath = "$HOME\bin"
    if (!(Test-Path $installPath)) {
        New-Item -ItemType Directory -Path $installPath | Out-Null
    }
    Invoke-WebRequest $repo -OutFile "$installPath\uenofetch.ps1"

    # Crear wrapper sin extensión
    Set-Content -Path "$installPath\uenofetch.ps1.cmd" -Value "@echo off`npwsh `"$installPath\uenofetch.ps1`" %*"

    Write-Host "Instalado en $installPath"
    Write-Host "Agregá $installPath al PATH si no está."
}
else {
    $installPath = "/usr/local/bin/uenofetch"
    Invoke-WebRequest $repo -OutFile "uenofetch"
    chmod +x uenofetch
    sudo mv uenofetch $installPath
    Write-Host "Instalado en /usr/local/bin"
}