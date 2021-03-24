# El archivo 'person' es leido y sus columnas se delimitan por comas '-F","'
# Se lee la columna 6 "$5" que corresponde al nombre, se utiliza la función
# "split" para separar la cadena usando como delimitador un espacio " "
# El resultado queda almacenado en "d" como array
# d[1] y d[2] contienten el valor del nombre y apellido, respectivamente
# por lo que es este el que es evaluado
# si se cumple con las dos comparaciones, un contador se incrementa en 1
# Al finalizar la lectura del archivo se imprime el valor del contador
awk -F "\",\"" 'split($5, d, "[  ]"){}; (substr(d[1],1,1)=="A" && substr(d[2],1,1)=="A"){ count++ }; END{ print count }' person