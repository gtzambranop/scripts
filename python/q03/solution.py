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
# [['character', total], [...], ...]
def searchList(my_list, cl1, cl2):
    # Bandera que indica si crear o no una nueva sub-lista
    create = True
    if(len(my_list) == 0):
        # se agrega una sublista con el caracter y el valor de la columna 2
        my_list.append([cl1, cl2])
    else:
        for value in my_list:
            # Si se encuentra una coíncidencia el segundo elemento de la
            # sub-lista es incrementado en el valor de la columna 2
            if(value[0] == cl1):
                value[1] += cl2
                create = False
        # se agrega una sublista con el caracter y el valor de la columna 2
        if create:
            my_list.append([cl1, cl2])
    return my_list

# Se abre el archivo u su contenido es asignado a la variable "file"
with open("data.csv", 'r') as file:
    # Se lee el archivo y se delimitan las columnas por tabulaciones "\t"
    # Esto genera una lista de listas, donde cada sub-lista es una fila
    fl = csv.reader(file, delimiter='\t')
    # Se declara una lista vacía
    result = list();
    for row in fl:
        # La lista es actualizada en cada iteración
        result = searchList(result, row[0], int(row[1]))
    # Se ordena la lista
    result.sort()
    # Se imprime la lista
    printList(result)