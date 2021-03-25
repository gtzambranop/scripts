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
# [['character', max, min], [...], ...]
def searchList(my_list, cl1, cl2):
    # Bandera que indica si crear o no una nueva sub-lista
    create = True
    # a debe ser muy grande para que sea mayor al valor de la columna 2
    a = 100000
    if(len(my_list) == 0):
        # se agrega una sublista con el caracter y el valor máximo y mínimo
        my_list.append([cl1, max(cl2, 0), min(cl2, a)])
    else:
        for value in my_list:
            # Si se encuentra una coíncidencia, el segundo y tercer elemento
            # de la  sub-lista es incrementado dada las funciones "max" y"min"
            if(value[0] == cl1):
                value[1] = max(value[1], cl2)
                value[2] = min(value[2], cl2)
                create = False
        if create:
            # se agrega una sublista con el caracter y el valor máximo y mínimo
            my_list.append([cl1, max(cl2, 0), min(cl2, a)])
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