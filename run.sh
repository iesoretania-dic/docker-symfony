#!/bin/bash

# Este script se ejecuta cada vez que arranca el
# contenedor

# Crear carpetas para los logs
mkdir -p app/cache app/logs
touch app/logs/prod.log
chgrp -R www-data .
chmod -R g+w app/cache app/logs

# Cargar variables de entorno de Apache2
source /etc/apache2/envvars

# Instalar componentes de composer
sudo -u www-data composer install

# Ejecutar migración
sudo -u www-data php bin/console --no-interaction d:m:m

# Comprobar si hay usuarios en la base de datos
# Si no es así, lanzar fixtures
RESULT=`MYSQL_PWD=symfony mysql -h db --user=symfony datos -N -s -r -e "SELECT COUNT(*) FROM usuario"`
if [ "$RESULT" == "0" ]; then
   sudo -u www-data php bin/console d:f:l -n
fi

# Arrancar Apache2
tail -F /var/log/apache2/* app/logs/prod.log &
exec apache2 -D FOREGROUND
