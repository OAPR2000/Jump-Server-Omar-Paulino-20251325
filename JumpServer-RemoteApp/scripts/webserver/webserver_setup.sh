#!/bin/bash
# Web Server "Sistema de Caja" (10.13.25.130/29) - Ubuntu Cloud 24.04
set -e

# 1. Red /29 (copiar 50-cloud-init.yaml en /etc/netplan/)
sudo netplan apply
ip -br a

# 2. Pagina del Sistema de Caja (Apache con SSL ya instalado)
echo '<h1>Sistema de Caja - Web Server - Omar Paulino 20251325</h1>' | sudo tee /var/www/html/index.html
curl -k https://localhost

# 3. SSH con contrasena
echo 'PasswordAuthentication yes' | sudo tee /etc/ssh/sshd_config.d/01-lab.conf
sudo systemctl restart ssh

# 4. RDP con xrdp (version ligera, sin escritorio, por el poco disco)
sudo apt clean
sudo journalctl --vacuum-size=20M
sudo apt update
sudo apt install -y --no-install-recommends xrdp
sudo adduser xrdp ssl-cert
sudo systemctl enable --now xrdp
sudo apt clean

# 5. Comprobar los tres servicios que permite la politica JUMP-A-WEB
sudo ss -tlnp | grep -E ':22 |:443 |:3389 '
