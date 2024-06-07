Set-ExecutionPolicy Bypass -Scope Process -Force

# Verificar si el script tiene privilegios de administrador
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    # Obtener la ruta del script actual
    $scriptPath = $MyInvocation.MyCommand.Definition

    # Iniciar una nueva instancia de PowerShell como administrador
    Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs

    # Salir del script actual
    exit
}

# Comprobando si winget está instalado
if (-not(Get-Command 'winget' -ErrorAction SilentlyContinue)) {
    # Instalar winget
    $progressPreference = 'silentlyContinue'
    Write-Information "Downloading WinGet and its dependencies..."
    Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
    Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
    Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
    Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
    Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
}

# Comprobando si chocolatey está instalado
if (-not(Get-Command 'choco' -ErrorAction SilentlyContinue)) {
    # Instalar Chocolatey
    $chocoInstallScript = "https://chocolatey.org/install.ps1"
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($chocoInstallScript))
}

# Instalar programas

## Winget

### PowerShell
winget install --id=Microsoft.PowerShell -e

### PowerToys
winget install --id=Microsoft.Powertoys -e

### Process Explorer
winget install --id=Microsoft.Sysinternals.ProcessExplorer  -e

## Chocolatey

### Chocolatey complements
choco install chocolatey-core.extension -y
choco install chocolatey-compatibility.extension -y
choco install chocolateygui -y

### Firefox
choco install firefox -y

### 7zip
choco install 7zip.install -y

### VLC
choco install vlc -y

### Git
choco install git.install -y

### Paint.NET
choco install paint.net -y

### Visual Studio Code
choco install vscode -y

### Everything
choco install everything -y

### Obsidian
choco install obsidian -y

### Java
choco install openjdk -y

### Python
choco install python -y

### Node.js
choco install nodejs -y

