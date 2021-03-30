sed -e 's,   ,\t,' data2.csv > temp
mv temp data2.csv

# Se lee cada archivo con terminar "csv" y se almacena en la variable "f"
for f in *.csv
do
    # Se eliminan las líneas vacías de cada archivo
    sed '/^[[:space:]]*$/d' $f > temp
    mv temp "$f"
done

# Se lee cada archivo con terminar "csv" y se almacena en la variable "f"
for f in *.csv
do
# El archivo "$f" es separado en columnas delimitadas por comas entre comillas "-F'",""
# Se separa la segunda columna, delimitando los terminos por comas "[, ]" y se
# almacena en el array d
# i++: incrementa el valor por cada línea leída
    awk -F'\t' 'split($2, d, "[, ]"){
        i++;
        for(j in d)
            print FILENAME, i, $1, d[j];
    };' $f
done