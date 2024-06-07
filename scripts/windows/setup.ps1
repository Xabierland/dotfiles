Set-ExecutionPolicy Bypass -Scope Process -Force

## Administración
$wingetPackages = @(
    "Microsoft.PowerShell",
    "Microsoft.Powertoys"
)

$chocoPackages = @(
    "microsoft-windows-terminal",
    "autohotkey",
    "autoruns",
    "procexp",
    "procmon",
    "processhacker",
    "sysinternals",
    "cpu-z",
    "gpu-z",
    "hwmonitor",
    "victoria",
    "crystaldiskinfo",
    "crystaldiskmark",
    "rufus",
    "7zip"
)

## Utilidades
$chocoPackages += @(
    "wget",
    "sed",
    "netcat",
    "awk",
    "curl",
    "vim",
    "nano",
    "gpg4win",
    "tree",
    "less",
    "make",
    "exiftool",
    "grep"
)

## Navegadores
$chocoPackages += @(
    "firefox",
    "librewolf",
    "tor-browser"
)

## Ofimática
$chocoPackages += @(
    "libreoffice",
    "miktex --params '/Set:complete'",
    "adobereader",
    "obsidian"
)

## Audio, fotos y vídeo
$chocoPackages += @(
    "vlc",
    "stremio",
    "audacity",
    "obs-studio",
    "ffmpeg",
    "handbrake",
    "spotify",
    "reaper",
    "voicemeeter-banana",
    "vb-cable",
    "gimp",
    "paint.net",
    "inkscape"
)

## Contraseña
$chocoPackages += @(
    "bitwarden",
    "keepassxc"
)

## IDEs/Runtimes/Compiladores
$wingetPackages += @(
    "Microsoft.VisualStudioCode"
)

$chocoPackages += @(
    "intellijidea-community",
    "git",
    "github-desktop",
    "anaconda3 --params '/JustMe /AddToPath'",
    "nodejs",
    "ruby",
    "golang",
    "rust",
    "openjdk",
    "cmake --installargs 'ADD_CMAKE_TO_PATH=System' --apply-install-arguments-to-dependencies",
    "llvm",
    "php",
    "strawberryperl",
    "docker-desktop",
    "awscli",
    "azure-cli",
    "gcloudsdk",
    "minikube",
    "kubernetes-cli",
    "kubernetes-helm",
    "terraform"
)

## Otros
$chocoPackages += @(
    "everything --params '/client-service /run-on-system-startup'",
    "transmission",
    "discord",
    "telegram",
    "virtualbox",
    "oh-my-posh"
)

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

# Debloat Windows

# Instalar programas

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

# Instalar paquetes usando winget
foreach ($package in $wingetPackages) {
    Write-Output "Installing $package..."
    winget install --id=$package -e
}

# Instalar paquetes usando chocolatey
foreach ($package in $chocoPackages) {
    Write-Output "Installing $package..."
    choco install $package -y
}
