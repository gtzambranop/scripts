# Eliminar las comillas del archivo 'data' y almacenar el resultado en 'temp'
awk '{gsub(/\"/,"")};1' data.csv > temp.csv
# Al 'temp' se le separan sus argumentos delimitandolos por coma "FS=','"
# Se imprime la segunda columna "$2" pero solo de la fila 3 "head -3| tail -n 1"
cat temp.csv | awk -v FS=',' '{print $2}' | head -3| tail -n 1
# Se elimina el archivo 'temp'
rm temp.csv