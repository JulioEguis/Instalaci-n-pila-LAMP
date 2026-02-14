#!/bin/bash

# Script de instalación de LAMP en Linux
echo "Instalador de LAMP para Ubuntu"

# Verificar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then 
    echo "ejecuta este script como root o usando sudo"
    exit 1
fi

# Actualizar sistema y que no pida la confirmación
echo "Actualizando el sistema..."
apt update && apt upgrade -y

# Instalar Apache
echo "Instalando Apache..."
apt install apache2 -y
systemctl enable apache2
systemctl start apache2

# Instalar MySQL
echo "Instalando MySQL..."
apt install mysql-server -y
systemctl enable mysql
systemctl start mysql

# Instalar PHP con la instalaciones basicas y con -y para que confirme todo
echo "Instalando PHP y módulos..."
apt install php libapache2-mod-php php-mysql php-cli php-curl php-gd php-mbstring php-xml php-zip -y

# Configurar Apache y que cargue el modulo de php que instalamos
echo "Configurando Apache..."
a2enmod php
systemctl restart apache2

# Crear archivo de prueba
cat > /var/www/html/info.php << 'EOF'
<?php
phpinfo();
?>
EOF





