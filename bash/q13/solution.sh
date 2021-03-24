# Eliminar las comillas del archivo 'data' y almacenar el resultado en 'temp'
awk '{gsub(/\"/,"")};1' person > temp
# el método "sort" ordena el archivo person
# k1: indica que se ordena por la primera columna
# n: indica que se hará de forma numérica (ya que los valores e esta columna son numéricos)
# t,: indica el separador entre columnas
sort -k1 -n -t,  temp > person
# A 'person' se le separan sus argumentos delimitandolos por coma "FS=','"
# Se imprime la tercera columna "$3" pero solo de la fila 2 "head -2| tail -n 1"
cat person | awk -v FS="," '{print $3}' | head -2| tail -n 1
# Se elimina el archivo temporal
rm temp