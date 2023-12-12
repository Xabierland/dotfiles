# Instalacion de Artix Linux

## Instalacion manual

## Instalacion automatica

1. Descarga una ISO de Artix Linux con un entorno de escritorio a tu eleccion
2. Inicia la ISO en tu maquina virtual o en tu ordenador
3. Sigue los pasos de la instalacion con Calamares
4. Configura el gestor de paquetes
```bash	
# Activar los repositorios de Arch
sudo pacman -S artix-archlinux-support
sudo pacman-key --populate archlinux
# Modificar pacman.conf
sudo nano /etc/pacman.conf
# Este es el resultado
```
```conf
# Artix
[system]
Include = /etc/pacman.d/mirrorlist

[world]
Include = /etc/pacman.d/mirrorlist

[galaxy]
Include = /etc/pacman.d/mirrorlist

[lib32]
Include = /etc/pacman.d/mirrorlist

# Arch
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch
```
5. Configurar el sistema a tu gusto