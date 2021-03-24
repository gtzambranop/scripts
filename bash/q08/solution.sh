# Eliminar las comillas del archivo 'data' y almacenar el resultado en 'temp'
awk '{gsub(/\"/,"")};1' data.csv > temp.csv
# Al 'temp' se le separan sus argumentos delimitandolos por coma "FS=','"
# Se imprime la quinta columna "$5" pero solo de la última fila "tail -1"
cat temp.csv | awk -v FS=',' '{print $5}' | tail -1
# Se elimina el archivo 'temp'
rm temp.csv