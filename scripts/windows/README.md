# Uso del script de configuración de Windows

> [!WARNING]
> Necesario Windows Pro, Enterprise o Education para ejecutar el script junto con permisos de administrador en PowerShell.

Este script de configuración de Windows se encarga de instalar y configurar las herramientas necesarias para mi entorno Windows.

## Uso

Para ejecutar el script, simplemente ejecuta el siguiente comando en PowerShell:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
.\setup.ps1
```

o

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
irm https://raw.githubusercontent.com/Xabierland/dotfiles/599eadfdfb3555585086248d7f2920d152640f95/scripts/windows/setup.ps1 | iex
```

Para mantener todo al dia ejecuta los siguientes comandos:

```powershell
winget upgrade
choco upgrade all
```

## Acciones

1. Permisos y herramientas necesarias
2. Instalación de programas
3. ~~Debloat Windows~~

## Lista de programas

- Administración
  - PowerShell
  - PowerToys
  - WinGet
  - Chocolatey
  - sysinternals
  - Process Explorer
  - Process Monitor
  - Process Hacker
  - CPU-Z
  - GPU-Z
  - HWMonitor
  - Victoria
  - CrystalDiskMark
  - GNU Wget
  - Rufus
  - 7-Zip
- Navegadores
  - Mozilla Firefox
  - LibreWolf
  - Tor Browser
- Ofimática
  - LibreOffice
  - SumatraPDF
  - Typora
  - Obsidian
  - Calibre
- Audio, fotos y vídeo
  - VLC
  - Stremio
  - Audacity
  - OBS Studio
  - FFmpeg
  - OBS Studio
  - HandBrake
  - Spotify
  - Reaper
  - Voicemeeter Banana
  - VB-CABLE Virtual Audio Device
  - GIMP
  - Inkscape
- Contraseña
  - Bitwarden
  - KeePassXC
- Fuentes
  - Hack Font
  - Firacode
- IDEs/Runtimes/Compiladores
  - Visual Studio Code
  - IntelliJ IDEA
  - Git
  - GitHub Desktop
  - Anaconda (Python)
  - Node.js (JavaScript)
  - Ruby
  - Go
  - Rust
  - OpenJDK (Java)
  - MikTeX (LaTeX)
  - CMake (C/C++)
  - PHP
  - Strawberry Perl (Perl)
  - docker-desktop
  - aws-cli
  - kubernetes-cli
  - minikube
- Utilidades
  - sed
  - netcat
  - awk
  - cURL
  - vim
  - gpg4win
  - tree
  - less
- Otros
  - Everything
  - Transmission
