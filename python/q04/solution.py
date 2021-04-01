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
# [['month', repetitions], [...], ...]
def searchList(my_list, date):
    # Bandera que indica si crear o no una nueva sub-lista
    create = True
    # Se separa la fecha, separador '-'
    date = date.split("-")
    if(len(my_list) == 0):
        # se agrega una sublista con el mes y 1
        my_list.append([date[1], 1])
    else:
        for value in my_list:
            # Si se encuentra una coíncidencia el segundo elemento de la
            # sub-lista es incrementado en 1
            if(value[0] == date[1]):
                value[1] += 1
                # Se indica que no es necesario crear una sub-lista puesto
                # que ya existe una para ese caracter
                create = False
        if create:
            # se agrega una sublista con el mes y 1
            my_list.append([date[1], 1])
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
			# La lista es actualizada en cada iteración
			result = searchList(result, row[2])
		# Se ordena la lista
		result.sort()
		# Se imprime la lista
		printList(result)

if __name__ == "__main__":
    main()