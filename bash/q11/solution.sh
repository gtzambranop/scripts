# Al 'person' se le separan sus argumentos delimitandolos por comas "FS=','"
# La tercera columna "$3" de cada línea es comparada y al encontrar coincidencias
# un contador incrementa su valor en 1
# Al finalizar la lectura de las líneas se imprime el contador
awk -F "," '$3 == "\"Los Angeles (California)\""{ count++ }; END{ print count; }' person