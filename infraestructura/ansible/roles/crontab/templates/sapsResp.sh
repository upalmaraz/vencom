#!/bin/bash

#Obtiene fecha y hora de respaldo
fecha=$(date +%Y-%m-%d -d '1 days ago')

# Ruta donde se guardan los respaldos online
destino="/vencom/vencom_backup"

# Ruta donde se guardan los respaldos online
destino_glacier="/vencom/vencom_glacier"

#Direccion del origen
origen="/vencom/vencom"

# Realiza el respaldo de todo
rsync -abvz --backup-dir=$destino_glacier/$fecha --delete --exclude='*~' --exclude='*.m4a' --exclude='*.mp3' --exclude='*.wma' $origen $destino/ven
tar czvf $destino_glacier/$fecha.tar $destino_glacier/$fecha
rm -rf $destino_glacier/$fecha
