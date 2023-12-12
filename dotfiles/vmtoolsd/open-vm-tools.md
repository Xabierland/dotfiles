# Open VM Tools

## Installation

Instala el paquete `open-vm-tools` desde el gestor de paquetes de tu distribucion.

## Configuration

### OpenRC

> [!WARNING]
> Depende la distribucion, es posible, que tengas tu que crear el archivo del servicio, para ello, ejecuta el siguiente comando:

```bash
sudo wget -P /etc/init.d/ https://raw.githubusercontent.com/Xabierland/dotfiles/main/dotfiles/vmtoolsd/vmtoolsd
sudo chmodx a+x /etc/init.d/vmtoolsd
```

Añade el servicio al runlevel default

```bash
sudo rc-update add vmtoolsd default
```
