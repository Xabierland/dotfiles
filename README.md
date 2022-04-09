# arch-config

```Este repositorio se encuentra bajo construccion ;)```

## INDEX

## INSTALACION DE ARCH LINUX
<ol>
<li>Definir particiones</li>
<ol>

```root@archiso ~ # cfdisk```
</ol>
<li>Mira los nombres de las particiones</li>
<ol>

```root@archiso ~ # lsblk```
</ol>
<li>Formatear particiones (Minimo una boot y otra main)</li>
<ol>
<li>Formatear boot</li>
<ol>

```root@archiso ~ # mkfs.vfat -F 32 /dev/sda1```
</ol>
<li>Formatear main</li>
<ol>

```root@archiso ~ # mkfs.ext4 /dev/sda2```
</ol>
<li>Formatear swap (EN CASO DE QUERERLA)</li>
<ol>

```root@archiso ~ # mkfswap /dev/sda3```
</ol>
<li>Aplicar swap</li>
<ol>

```root@archiso ~ # swapon```
</ol>
</ol>
<li> Montar particiones</li>
<ol>
<li> Montar boot</li>
<ol>

```root@archiso ~ # mkdir /mnt/boot```

```root@archiso ~ # mount /dev/sda1 /mnt/boot```
</ol>
<li> Montar main</li>
<ol>

```root@archiso ~ # mount /dev/sda1 /mnt```
</ol>
</ol>
<li>Instalamos el kernel y otros complementos</li>
<ol>

```root@archiso ~ # pacstrap /mnt linux linux-firmware networkmanager grub wpa_supplicant base base-devel ```
</ol>
<li>Generamos el fstab</li>
<ol>

```root@archiso ~ # genfstab -U /mnt > /mnt/etc/fstab```
</ol>
<li>Entramos al sistema</li>
<ol>

```root@archiso ~ # arch-chroot /mnt```
</ol>
<li>Configurar contraseña para root</li>
<ol>

```[root@archiso /]# passwd```
</ol>
<li>Configurar usuario</li>
<ol>

```[root@archiso /]# useradd -m user```

```[root@archiso /]# passwd user```

```[root@archiso /]# usermod -aG wheel user```
</ol>
<li>Configurar sudo</li>
<ol>

```[root@archiso /]# pacman -S sudo```

```[root@archiso /]# nano /etc/sudoers```

```BASH
##Uncoment to allow members of group wheel to execute any command
#%wheel ALL=(ALL:ALL) ALL
||
\/
%wheel ALL=(ALL:ALL) ALL
```
</ol>
<li>Configurar regiones</li>
<ol>

```[root@archiso /]# nano /etc/locale.gen```
</ol>
</ol>


## INSTALACION DE PAQUETES

## CONFIGURACION DEL ENTORNO
