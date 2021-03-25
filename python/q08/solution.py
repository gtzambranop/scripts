# Librería para el manejo de archovos con formato csv
import csv

# cada elemento de una sub-lista es imprimido en una nueva línea y
# separado por comas
def printList(my_list):
    for item in my_list:
        # Ordenar sublista
        item[1].sort()
        # Cada sub-lista se transforma en tupla
        print(tuple(item))

# Evitar repeticiones en la lista
def updateList(my_list, char):
    create = True
    for item in my_list:
        if(item == char):
            create = False
    if create:
        my_list.append(char)
    return my_list

# la lista generada es de la forma:
# [['digit', [char1, char2, ...]], [...], ...]
def searchList(my_list, cl1, cl2):
    # Bandera que indica si crear o no una nueva sub-lista
    create = True
    # a debe ser muy grande para que sea mayor al valor de la columna 2
    a = 100000
    if(len(my_list) == 0):
        # se agrega una sublista con el caracter y el valor máximo y mínimo
        my_list.append([cl2,[cl1]])
    else:
        for value in my_list:
            # Si se encuentra una coíncidencia, el segundo y tercer elemento
            # de la  sub-lista es incrementado dada las funciones "max" y"min"
            if(value[0] == cl2):
                value[1] = updateList(value[1], cl1)
                create = False
        if create:
            # se agrega una sublista con el caracter y el valor máximo y mínimo
            my_list.append([cl2,[cl1]])
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
        result = searchList(result, row[0], row[1])
    # Se ordena la lista
    result.sort()
    # Se imprime la lista
    printList(result)