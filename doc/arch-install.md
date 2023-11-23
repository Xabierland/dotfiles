# Install Arch Linux

## INDEX

## INSTALACION DE ARCH LINUX
*¡¡No reiniciar hasta terminar todo el apartado!!*

En caso de teclado español:

```bash
loadkeys es
```

1. Definir particiones

```bash
cfdisk
```

2. Mira los nombres de las particiones

```bash
lsblk -e7
```

3. Formatear particiones (Minimo una boot y otra main)

```bash
mkfs.vfat -F 32 /dev/sda1

mkfs.ext4 /dev/sda2

mkfswap /dev/sda3

swapon
```

4. Montar particiones


```bash
mkdir /mnt/boot

mount /dev/sda1 /mnt/boot

mount /dev/sda1 /mnt
```

5. Instalamos el kernel y otros complementos

```bash
pacstrap /mnt linux linux-firmware networkmanager grub wpa_supplicant base base-devel
```

6. Generamos el fstab

```bash
genfstab -U /mnt > /mnt/etc/fstab
```

7. Entramos al sistema

```bash
arch-chroot /mnt
```

8. Configurar contraseña para root

```bash
passwd
```

9. Configurar usuario

```bash
useradd -m $user

passwd $user

usermod -aG wheel $user
```

10. Configurar sudo

```bash
pacman -S sudo
```

```bash
nano /etc/sudoers
```

```bash
##Uncoment to allow members of group wheel to execute any command
#%wheel ALL=(ALL:ALL) ALL
||
\/
##Uncoment to allow members of group wheel to execute any command
%wheel ALL=(ALL:ALL) ALL
```

11. Configurar regiones

```bash
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
```

```bash
echo "KEYMAP=es" >> /etc/vconsole.conf
```

12. Configurar bootloader


```bash
grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg
```

13. Configurar hostname

```bash
$hostname = "arch"
echo $hostname > /etc/hostname
```

```nano /etc/hosts```

```bash
# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1   localhost
::1         localhost
127.0.0.1   $name.localhost $name
```

14. Configurar daemons

```bash
systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service
```
