Instalación pila LAMP
Scripts en bash para instalar LAMP (linux, apache, mysql, php) en Linux de forma automática.

Al principio tenía miedo de hacer scripts en bash y automatizar instalaciones, no sabía si iba a romper algo o si funcionaría bien. Así que empecé probando todo en un entorno de laboratorio con mv. Después de varias pruebas y corregir errores, este scripts se convirtieo en parte de mi día a día para montar un servidor web apache y tambien nginx

El script principal (instalacion_pila_lamp.sh) instala:
- apache 2.4
- mysql 8.0
- php 8.1 con módulos básicos (mysql, curl, gd, mbstring, xml, zip)

Si quieres clonarlo
git clone https://github.com/JulioEguis/Install_pila_LAMP.git

cd Install_pila_LAMP
chmod +x Install_pila_LAMP

Y luego para ejecutarlo

sudo ./instalacion_pila_lamp.sh

El script hace lo siguiente:

- actualizo paquetes
- instala apache y lo configura
- instala mysql
- instala php y sus módulos
- configura apache para que use php
- crea archivo de prueba en /var/www/html/info.php (Ojo con el archivo info.php muestra información sensible del servidor, ni de broma dejarlo, bórrarlo en producción)

Verificar la instalación

http://localhost - debería ver la página por defecto de apache
http://localhost/info.php - debería ver la info de php que hemos intalado

Ver las versiones instaladas
-> apache2 -v
-> mysql --version
-> php -v

Asegurar mysql, esto te permite poner contraseña al root de mysql y eliminar usuarios de prueba.
sudo mysql_secure_installation

Problema tipico de puerto 80 ocupado
Este fue unos de los primeros problemsa que me encontré. Si apache no arranca es porque algo ya está usando el puerto 80.
Ver qué ocupa el puerto -> sudo lsof -i :80
Liberar el puerto -> sudo fuser -k 80/tcp
Arrancar apache -> sudo systemctl start apache2

mysql se instala sin contraseña de root, ejecuta mysql_secure_installation
Y hay consideraar configurar el firewall para permitir solo los puertos necesarios

Lo que aprendí

Que siempre probar scripts en entornos de laboratorio primero
bash se puede entender y hacer muchas cosas, que ojala pueda seguir aprendiendo
automatizar tareas repetitivas quita muchas horas de raton y teclado y eres más productivo en el equipo
y saber que siempre nos podemos encontrar con errores



