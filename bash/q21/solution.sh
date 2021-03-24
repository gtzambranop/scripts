# Algunos archivos terminaban con un salto de línea de la forma "\r" por lo que
# al hacer join se generaban conflictos. Por esta razón se procesan ambos archivos 
# y se elimina dicho caracter
sed 's/\r$//' person > temp
mv temp person
sed 's/\r$//' bank.csv > temp
mv temp bank.csv
# Eliminando las comillas de los archivos
awk '{gsub(/\"/,"")};1' person > temp
mv temp person
awk '{gsub(/\"/,"")};1' bank.csv > temp
mv temp bank.csv
# Se hace join entre los 2 archivos
# -t,: indica que la coma separa las columnas
# -1 2: se hace join con la segunda columna del primer archivo
# -2 1: se hace join con la primera columna del segundo archivo
# -o0,1.1,2.5: formato de impresión (archivo.columna)
# para hacer join se deben ordenar los archivos en primer lugar
# <(sort -t, -k1b person) -> -k1b: se ordena con base en la columna 1
# El resultado se almacena en el archivo temp
join -t, -1 2 -2 1 -o0,1.1,2.5 <(sort -t, -k2b bank.csv) <(sort -t, -k1b person) > temp
# Al 'temp' se le separan sus argumentos delimitandolos por coma "FS=','"
# Se filtra la segunda columna de 'temp' y si hay coíncidencias se imprime la
# tercera columna "$3"
awk -F "," '$2 == "3608-2181-4994-1181"{print $3;}' temp
# Se elimina el archivo temporal
rm temp