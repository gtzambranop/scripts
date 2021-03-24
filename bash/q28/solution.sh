# Para evitar conflictos en la lectura de los archivos, todos se renomran
# Se cambia los espacios en blanco en el nombre por "_"
for f in *\ *
do
# Se comprueba si hay archivos que cumplan la condición
# si es de longitud de 3 o menor, significa que no hay archivos con nombres que contengan espacios.
# Esto porque solo recibiría la longitud de la cadena "txt"
	if [ ${#f} -gt 3 ]
		then
			mv "$f" "${f// /_}";
		fi
done
# Se inicializa un contador que acumulará el total de los arvhivos
temp=0;
for f in *.txt
do
# El archivo "$f" es separado en columnas delimitadas por comas entre comillas "-F'",""
# Se usa la función "split" para separar la segunda columna "$1" delimitado por "-" y el resultado se asigna a "d"
# d[2] contiene el campo de interés, por lo que es evaluado con el valor dado, si corresponde el contador se incrementa
# el "temp" se incrementa en el valor de "count".
	((temp += $(awk -F "\",\"" 'split($1, d, "[- ]"){}; d[2]=="1192" {count++;}; END{ print count;}' $f)))
done
# se retorna temp
echo $temp;