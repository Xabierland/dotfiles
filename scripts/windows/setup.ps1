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
    Write-Output "Installing WinGet and its dependencies..."
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
    Write-Output "Installing Chocolatey..."
    $chocoInstallScript = "https://chocolatey.org/install.ps1"
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($chocoInstallScript))
}

# Instalar programas

## Administración
winget install --id=Microsoft.PowerShell -e
winget install --id=Microsoft.Powertoys -e
winget install --id=Microsoft.Sysinternals.ProcessExplorer  -e
winget install --id=Microsoft.Sysinternals.ProcessMonitor -e
choco install processhacker -y
choco install sysinternals -y
choco install cpu-z -y
choco install gpu-z -y
choco install hwmonitor -y
choco install victoria -y
choco install crystaldiskmark -y
choco install wget -y
choco install rufus -y
choco install 7zip -y

## Navegadores
choco install firefox -y
choco install librewolf -y
choco install tor-browser -y

## Ofimática
choco install libreoffice -y
choco install adobereader -y
choco install obsidian -y

## Audio, fotos y vídeo
choco install vlc -y
choco install stremio -y
choco install audacity -y
choco install obs-studio -y
choco install ffmpeg -y
choco install handbrake -y
choco install spotify -y
choco install reaper -y
choco install voicemeeter-banana -y
choco install vb-cable -y
choco install gimp -y
choco install paint.net -y
choco install inkscape -y

## Contraseña
choco install bitwarden -y
choco install keepassxc -y

## Fuentes
choco install hackfont -y
choco install firacode -y

## IDEs/Runtimes/Compiladores
winget install --id=Microsoft.VisualStudioCode -e
choco install intellijidea-community -y
choco install git -y
choco install github-desktop -y
choco install anaconda3 -y
choco install nodejs -y
choco install ruby -y
choco install golang -y
choco install rust -y
choco install openjdk -y
choco install miktex -y --params '"/Set:complete"'
choco install cmake -y
choco install php -y
choco install strawberryperl -y
choco install docker-desktop -y
choco install awscli -y
choco install kubernetes-cli -y
choco install minikube -y

## Utilidades
choco install sed -y
choco install netcat -y
choco install gawk -y
choco install curl -y
choco install vim -y
choco install nano -y
choco install gpg4win -y
choco install tree -y
choco install less -y

## Otros
choco install everything -y
choco install transmission -y