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

# Se lee cada archivo con terminar "txt" y se almacena en la variable "f"
for f in *.txt
do
# Eliminar las comillas del archivo $f y almacenar el resultado en 'temp'
    awk '{gsub(/\"/,"")};1' $f > temp
    mv temp "$f"
done

max=0;
temp=0;
# Se lee cada archivo con terminar "txt" y se almacena en la variable "f"
for f in *.txt
do
# El archivo "$f" es separado en columnas delimitadas por comas entre comillas "-F'",""
    # obtine la cantidad de valores únicos de la primera columna
	((temp = $(awk -F, '!seen[$1]++{c++} END{print c}' $f)))
    # Si el valor obtenido es mayor al máximo almacenado, este último se actualiza
    if [[ temp -gt max ]]
    then
        ((max=temp));
    fi
done
echo $max;