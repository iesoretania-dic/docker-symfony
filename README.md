Despliegue de una aplicación Symfony 3 en Docker
================================================

Instrucciones:

1. Instalar `docker` y `docker-compose` en la máquina host
2. Clonar el repositorio de la aplicación que deseamos desplegar en la carpeta `app/`
3. Revisar el fichero `parameters.yml` para asegurarnos de que no falta ningún parámetro que necesite nuestra aplicación
4. Revisar el fichero `run.sh` para asegurarnos que la tabla que contiene los usuarios de nuestra aplicación es correcta (por defecto es `usuario`)
5. Revisar el fichero `docker-compose.yml` por si queremos cambiar el puerto 9999 que viene por defecto por otro
6. Ejecutar `docker-compose build` para construir las imágenes
7. Ejecutar `docker-compose up -d` para crear los contenedores y arrancar la aplicación (quitar el -d si quieres ver qué hace cada contenedor en primer plano, cuando termine usa Ctrl+C para pararlos)
8. Ejecutar `docker-compose start` para arrancar la aplicación si estaba parada
9. Ejecutar `docker-compose stop` para parar la aplicación si está en ejecución
10. Ejecutar `docker-compose rm` para eliminar los contenedores (la base de datos no se pierde porque se almacena en la máquina host)

