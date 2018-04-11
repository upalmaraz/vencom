#Obtiene fecha y hora de respaldo
fecha=$(date +%Y-%m-%d -d '1 days ago')
# Ruta donde se guardan los respaldos
destino="/vencom/vencom_backup"
destino_glacier="/vencom/vencom_glacier"
#Direccion del origen
origen="/vencom/vencom/"

# Se realiza el respaldo (todo)
rsync -avz --delete --backup --backup-dir=$destino/$fecha --exclude="*~" --exclude="*.m4a" --exclude='*.mp3' --exclude='*.wma' $origen $destino/ven
tar czvf $destino_glacier/$fecha.tar $destino/$fecha/*
rm -rf $destino/$fecha
