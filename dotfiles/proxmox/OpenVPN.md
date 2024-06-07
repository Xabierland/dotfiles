# OpenVPN

## Crear Contenedor LXC

### Descargar LXCTemplate

```bash
pveam update
pveam download local debian-12-standard_12.2-1_amd64.tar.zst
```

### Crear Contenedor

```bash
pct create 200 local:vztmpl/debian-12-standard_10.7-1_amd64.tar.zst
```

### Configurar Contenedor

```bash
nano /etc/pve/lxc/200.conf
```

```200.conf
arch: amd64
cores: 1
features: nesting=1
hostname: OpenVPN
memory: 512
nameserver: 1.1.1.1
net0: name=eth0,bridge=vmbr0,firewall=1,gw=192.168.1.1,hwaddr=BC:24:11:7D:5C:11,ip=192.168.1.2/24,type=veth
onboot: 1
ostype: debian
rootfs: local-lvm:vm-200-disk-0,size=4G
searchdomain: com
swap: 512
tags: seguridad
unprivileged: 1
lxc.cgroup2.devices.allow: c 10:200 rwm
lxc.mount.entry: /dev/net dev/net none bind,create=dir
```

```bash
chown 100000:100000 /dev/net/tun
pct start 200
```

## Configurar OpenVPN

### Entrar al Contenedor

```bash
pct enter 200
```

### Actualizar Sistema

```bash
apt update && apt dist-upgrade -y
```

### Instalar OpenVPN

```bash
apt install openvpn git -y
```

### Crear archivo .ovpn

```bash
git clone https://github.com/Nyr/openvpn-install
cd openvpn-install
bash openvpn-install.sh
```

### Configurar Servidor OpenVPN

```bash
nano /etc/openvpn/server/server.conf
```

```server.conf
local 192.168.1.2
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
auth SHA512
tls-crypt tc.key
topology subnet
server 192.168.0.0 255.255.255.0
push "redirect-gateway def1 bypass-dhcp"
push "route 192.168.1.0 255.255.255.0"
push "dhcp-option DNS 192.168.0.1"
ifconfig-pool-persist ipp.txt
keepalive 10 120
user nobody
group nogroup
persist-key
persist-tun
verb 3
crl-verify crl.pem
explicit-exit-notify
```

## Configurar Firewall

### Crear Regla

```bash
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE
```

### Instalar iptables-persistent

```bash
apt install iptables-persistent -y
```
