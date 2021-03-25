# Librería para el manejo de archovos con formato csv
import csv

# cada elemento de una sub-lista es imprimido en una nueva línea y
# separado por comas
def printList(my_list):
    sep = ','
    for i in my_list:
        l = [str(j) for j in i]
        print(sep.join(l))


# Se abre el archivo u su contenido es asignado a la variable "file"
with open("data.csv", 'r') as file:
    # Se lee el archivo y se delimitan las columnas por tabulaciones "\t"
    # Esto genera una lista de listas, donde cada sub-lista es una fila
    fl = csv.reader(file, delimiter='\t')
    # Se declara una lista vacía
    result = list();
    for row in fl:
        # Se separa cada grupo de cada columna, delimitandolo por comas ','
        cl4 = row[3].split(',')
        cl5 = row[4].split(',')
        # se actualiza la lista agregando una sub-lista de la forma:
        # [['char', num_col_4, num_col_5]]
        result.append([row[0], len(cl4), len(cl5)])
    # Se imprime la lista
    printList(result)