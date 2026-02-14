Instalación pila LAMP
Scripts en bash para instalar lamp (linux, apache, mysql, php) en Linux de forma automática.

Al principio tenía miedo de hacer scripts en bash y automatizar instalaciones, no sabía si iba a romper algo o si funcionaría bien. Así que empecé probando todo en un entorno de laboratorio con máquinas virtuales. Después de varias pruebas y ajustes, estos scripts se convirtieron en parte de mi día a día para montar servidores web rápidamente

El script principal (instalacion_pila_lamp.sh) instala automáticamente:

apache 2.4
mysql 8.0
php 8.1 con módulos básicos (mysql, curl, gd, mbstring, xml, zip)

Si quieres clonarlo
git clone https://github.com/JulioEguis/Install_pila_LAMP.git

cd Install_pila_LAMP
chmod +x Install_pila_LAMP
