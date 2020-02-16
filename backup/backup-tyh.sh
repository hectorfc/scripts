#!/bin/bash
# Respaldo diario y mensual.

fecha=$(date +'%Y%m%d')
dia=$(date +'%d')
destino=/data/backup/$fecha
destino_mensual=/data/respaldo_mensual/$fecha
# Creamos los directorios del destino del Backup
mkdir -p $destino

rsync -a --exclude="hector" /home/ /data/backup/$fecha/home/
rsync -a /data/administracion /data/backup/$fecha/administracion


# El primero de cada mes conservamos un respaldo de los homes.
# Revisamos si el primero de cada mes.
if [[ $dia == 01 ]] ; then
    mkdir -p $destino_mensual
    rsync -a  --exclude="hector" /home/  /data/respaldo_mensual/$fecha/home/
    rsync -a /data/administracion/ /data/respaldo_mensual/$fecha/administracion/
else
    exit 0
fi
