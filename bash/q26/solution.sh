# El archivo 'person' es leido y sus columnas se delimitan por comas '-F","'
# Se lee la columna 6 "$6" que corresponde a la fecha, se utiliza la función
# "split" para separar la cadena usando como delimitador un guión "-"
# El resultado queda almacenado en "d" como array
# d[2] contiente el valor del mes, por lo que es este el que es evaluado
# si se cumple con al menos una de las comparaciones, un contador se incrementa en 1
# Al finalizar la lectura del archivo se imprime el valor del contador
awk -F "," 'split($6, d, "[- ]"){}; (d[2]=="01" || d[2]=="02" || d[2]=="03"){count++;}; END{ print count;}' person