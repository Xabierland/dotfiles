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
  - CrystalDiskMark
  - Victoria
  - GNU Wget
  - Rufus
  - 7-Zip
  - sed
  - netcat
- Fuentes
  - Hack Font
- Navegadores
  - Mozilla Firefox
  - LibreWolf
  - Tor Browser
- Audio y vídeo
  - VLC
  - Audacity
  - FFmpeg
  - OBS Studio
  - HandBrake
  - Spotify
  - Reaper
  - Voicemeeter Banana
  - VB-CABLE Virtual Audio Device
- IDE
  - Visual Studio Code
  - IntelliJ IDEA
- Programacion
  - Git
  - Anaconda (Python)
  - Node.js
  - Ruby
  - Go
  - Rust
  - OpenJDK
  - MikTeX
- 