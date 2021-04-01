# Librería para el manejo de archovos con formato csv
import csv

# cada elemento de una sub-lista es imprimido en una nueva línea y
# separado por comas
def printList(my_list):
    sep = ','
    for i in my_list:
        l = [str(j) for j in i]
        print(sep.join(l))

# la lista generada es de la forma:
# [['char', sum_col_2], [...], ...]
def searchList(my_list, char, val):
    # Bandera que indica si crear o no una nueva sub-lista
    create = True
    # a debe ser muy grande para que sea mayor al valor de la columna 2
    a = 100000
    if(len(my_list) == 0):
        # Se agrega una sublista con la llave y el valor mínimo y máximo
        my_list.append([char, val])
    else:
        for value in my_list:
            # Si se encuentra una coíncidencia, el segundo y tercer elemento
            # de la  sub-lista es incrementado dada las funciones "max" y"min"
            if(value[0] == char):
                value[1] += val
                create = False
        if create:
            # Se agrega una sublista con la llave y el valor mínimo y máximo
            my_list.append([char, val])
    return my_list

def main():
	# Se abre el archivo u su contenido es asignado a la variable "file"
	with open("data.csv", 'r') as file:
		# Se lee el archivo y se delimitan las columnas por tabulaciones "\t"
		# Esto genera una lista de listas, donde cada sub-lista es una fila
		fl = csv.reader(file, delimiter='\t')
		# Se declara una lista vacía
		result = list();
		for row in fl:
			# Se separa cada grupo caracteres y se genera una lista de estos
			items = row[3].split(',')
			for item in items:
				result = searchList(result, item, int(row[1]))
		# Se ordena la lista
		result.sort()
		# Se imprime la lista
		printList(result)

if __name__ == "__main__":
    main()