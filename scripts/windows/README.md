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
- Utilidades
  - sed
  - netcat
  - awk
  - cURL
  - vim
  - aws-cli
  - kubernetes-cli
  - minikube
  - gpg4win
  - tree
  - less
  - docker-desktop
- Fuentes
  - Hack Font
- Navegadores
  - Mozilla Firefox
  - LibreWolf
  - Tor Browser
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
- IDE
  - Visual Studio Code
  - IntelliJ IDEA
- Programacion
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
- Ofimática
  - LibreOffice
  - SumatraPDF
  - Typora
  - Calibre
- Contraseña
  - Bitwarden
  - KeePassXC
- Otros
  - Obsidian (Notas)
  - Everything (Buscador de archivos)
  - Transmission (Torrent)
