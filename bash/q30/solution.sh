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

for f in *.txt
do
# Eliminar las comillas del archivo $f y almacenar el resultado en 'temp'
    awk '{gsub(/\"/,"")};1' $f > temp
    mv temp "$f"
done
# Se inicializa un contador
temp=0;
# Se lee cada archivo con terminar "txt" y se almacena en la variable "f"
for f in *.txt
do
# El archivo "$f" es separado en columnas delimitadas por comas entre comillas "-F'",""
# se verifica que el valor en la columna 4 esté etre los valores solicitados
# si es así, el contador temp se incrementa en 1.
# Al final se retorna el contador y la variable "temp" suma a su valor actual este resultado
	((temp += $(awk -F ',' '$4>=980 && $4 <= 990 {count++}; END{print count;}' $f)))
done
# Se retorna la suma de los contadores, asignado a "temp"
echo $temp;