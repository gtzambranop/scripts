# Al 'person' se le separan sus argumentos delimitandolos por comas "FS=','"
# La tercera columna "$3" de cada línea es comparada y al encontrar coincidencias
# un contador incrementa su valor en 1
# Al finalizar la lectura de las líneas se imprime el resultado del residuo entre:
# la cantidad total de registros (NR-1), NR = número de líneas, se resta 1 por el encabezado.
# El contador queindica la cantidad de coíncidencias
awk -F "," '$3 == "\"Anaheim (California)\""{ count++ }; END{ print ((NR - 1) - count); }' person
