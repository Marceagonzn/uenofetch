# ==============================
# MARCELO FETCH - CROSS PLATFORM
# ==============================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

# ASCII PERSONALIZADO
$ascii = @'
$$\   $$\ $$$$$$$$\ $$\   $$\  $$$$$$\        $$$$$$$\   $$$$$$\  $$\   $$\ $$\   $$\
$$ |  $$ |$$  _____|$$$\  $$ |$$  __$$\       $$  __$$\ $$  __$$\ $$$\  $$ |$$ | $$  |
$$ |  $$ |$$ |      $$$$\ $$ |$$ /  $$ |      $$ |  $$ |$$ /  $$ |$$$$\ $$ |$$ |$$  /
$$ |  $$ |$$$$$\    $$ $$\$$ |$$ |  $$ |      $$$$$$$\ |$$$$$$$$ |$$ $$\$$ |$$$$$  /
$$ |  $$ |$$  __|   $$ \$$$$ |$$ |  $$ |      $$  __$$\ $$  __$$ |$$ \$$$$ |$$  $$<
$$ |  $$ |$$ |      $$ |\$$$ |$$ |  $$ |      $$ |  $$ |$$ |  $$ |$$ |\$$$ |$$ |\$$\
\$$$$$$  |$$$$$$$$\ $$ | \$$ | $$$$$$  |      $$$$$$$  |$$ |  $$ |$$ | \$$ |$$ | \$$\
 \______/ \________|\__|  \__| \______/       \_______/ \__|  \__|\__|  \__|\__|  \__|
'@

# ==============================
# DETECCIÓN UNIVERSAL
# ==============================

$platform = $PSVersionTable.PSEdition

if ($env:OS -eq "Windows_NT") {
    $isWindows = $true
} else {
    $isWindows = $false
}

if ($isWindows) {

    $os = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor
    $gpu = Get-CimInstance Win32_VideoController
    $disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

    $osName = $os.Caption
    $cpuName = $cpu.Name
    $gpuName = $gpu.Name

    $ramTotalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
    $ramUsedGB = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / 1MB, 2)
    $ramUsedPercent = [math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100)

    $diskUsed = [math]::Round(($disk.Size - $disk.FreeSpace) / 1GB, 2)
    $diskTotal = [math]::Round($disk.Size / 1GB, 2)
    $diskUsedPercent = [math]::Round((($disk.Size - $disk.FreeSpace) / $disk.Size) * 100)

    $uptime = (Get-Date) - $os.LastBootUpTime
    $uptimeText = "$([int]$uptime.TotalHours) horas"

}
else {

    # Linux / Unix
    $osName = (Get-Content /etc/os-release | Select-String PRETTY_NAME).ToString().Split("=")[1].Replace('"','')
    $cpuName = (lscpu | Select-String "Model name").ToString().Split(":")[1].Trim()
    $gpuName = "N/A"

    $memInfo = Get-Content /proc/meminfo
    $memTotalKB = ($memInfo | Select-String "MemTotal").ToString().Split(":")[1].Trim().Split(" ")[0]
    $memFreeKB = ($memInfo | Select-String "MemAvailable").ToString().Split(":")[1].Trim().Split(" ")[0]

    $ramTotalGB = [math]::Round($memTotalKB / 1MB, 2)
    $ramUsedGB = [math]::Round(($memTotalKB - $memFreeKB) / 1MB, 2)
    $ramUsedPercent = [math]::Round((($memTotalKB - $memFreeKB) / $memTotalKB) * 100)

    $diskInfo = df -h / | Select-Object -Last 1
    $diskSplit = $diskInfo -split "\s+"
    $diskUsed = $diskSplit[2]
    $diskTotal = $diskSplit[1]
    $diskUsedPercent = $diskSplit[4]

    $uptimeText = (uptime -p)
}
# ==============================
# OUTPUT
# ==============================

Write-Host ""
Write-Host $ascii -ForegroundColor Magenta

Write-Host "$env:USERNAME@$env:COMPUTERNAME" -ForegroundColor Green
Write-Host ("-" * 40) -ForegroundColor DarkCyan

Write-Host " OS:     " -NoNewline -ForegroundColor Yellow
Write-Host "$osName"

Write-Host " CPU:    " -NoNewline -ForegroundColor Yellow
Write-Host "$cpuName"

Write-Host " RAM:    " -NoNewline -ForegroundColor Yellow
Write-Host "$ramUsedGB GB / $ramTotalGB GB ($ramUsedPercent% usado)"

Write-Host " GPU:    " -NoNewline -ForegroundColor Yellow
Write-Host "$gpuName"

Write-Host " DISK:   " -NoNewline -ForegroundColor Yellow
Write-Host "$diskUsed / $diskTotal ($diskUsedPercent)"

Write-Host " UPTIME: " -NoNewline -ForegroundColor Yellow
Write-Host "$uptimeText"

Write-Host ""
Write-Host ("=" * 40) -ForegroundColor Cyan
Write-Host ""