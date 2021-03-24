# Eliminar las comillas del archivo 'data' y almacenar el resultado en 'temp'
awk '{gsub(/\"/,"")};1' data.csv > temp.csv
# Al 'temp' se le separan sus argumentos delimitandolos por coma "FS=','"
# Se imprime la tercera columna "$3" pero solo de la fila 4 "head -4| tail -n 1"
cat data.csv | awk -v FS=',' '{print $3}' | head -4| tail -n 1
# Se elimina el archivo 'temp'
rm temp.csv