# Uso del script de configuración de Windows

Este script de configuración de Windows se encarga de instalar y configurar las herramientas necesarias para mi entorno Windows.

## Requisitos

- Windows 10 o superior
- Windows PowerShell
- Configurar Windows PowerShell

![PowerShell](.img/image.png)

## Uso

Para ejecutar el script, simplemente ejecuta el siguiente comando en PowerShell:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
irm https://raw.githubusercontent.com/Xabierland/dotfiles/main/scripts/windows/setup.ps1 | iex

```

Para mantener todo al dia ejecuta los siguientes comandos:

```powershell
winget upgrade
choco upgrade all

```

Si quieres instalar un programa nuevo, en vez de ir a la web usa el siguiente comando:

```powershell
choco install <nombre_del_programa>

```

o

```powershell
winget install <nombre_del_programa>

```

## Acciones

1. Permisos y herramientas necesarias
2. ~~Debloat Windows~~
3. Instalación de programas

## Lista de programas

- Administración
  - WinGet
  - Chocolatey
  - PowerShell
  - PowerToys
  - Process Explorer
  - Process Monitor
  - Process Hacker
  - sysinternals
  - CPU-Z
  - GPU-Z
  - HWMonitor
  - Victoria
  - CrystalDiskMark
  - Rufus
  - 7-Zip
- Navegadores
  - Mozilla Firefox
  - LibreWolf
  - Tor Browser
- Ofimática
  - LibreOffice
  - Adobe Acrobat Reader DC
  - Obsidian
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
  - VB-CABLE
  - GIMP
  - Paint.NET
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
  - nano
  - gpg4win
  - tree
  - less
  - wget
- Otros
  - Everything
  - Transmission
