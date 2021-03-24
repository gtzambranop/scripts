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
# Se inicializa un contador
temp=0;
# Se lee cada archivo con terminar "txt" y se almacena en la variable "f"
for f in *.txt
do
# El archivo "$f" es separado en columnas delimitadas por comas entre comillas "-F'",""
# Se usa la función "split" para separar la segunda columna "$2" delimitado por "/" y el resultado se asigna a "d"
# d[1] contiene el mes, por lo que es evaluado entre los meses del trimestre, si coíncide con al menos uno
# el contador temp se incrementa en 1.
# Al final se retorna el contador y la variable "temp" suma a su valor actual este resultado
	((temp += $(awk -F "\",\"" 'split($2, d, "[/ ]"){}; d[1]=="Oct" || d[1]=="Nov" || d[1]=="Dec" {count++;}; END{ print count;}' $f)))
done
# Se retorna la suma de los contadores, asignado a "temp"
echo $temp;