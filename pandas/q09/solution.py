# Librería de pandas con sobrenombre 'pd'
import pandas as pd

# Organiza cada lista en el formato solicitado
def formatList(my_list):
    separator = ','
    # Se ordena la lista
    my_list.sort()
    # Se retorna un string, donde están los valores de la lista "l"
    # separados por ':'
    return separator.join(my_list)

# leyendo los datos del archivo 'tbl1.tsv', columnas por '\t'
data = pd.read_csv('tbl1.tsv', sep='\t')

# Agrupar columna '_c2' por una específica, en este caso '_c1', luego
# a la columna '_c2' se le aplica una función que transforma en una lista
# los elementos relacionados de '_c2' con cada caracter de '_c1'
data = data.groupby('_c0')['_c4'].apply(list).reset_index(name='lista')

# La lista generada no está ordenada ni en el formato solicitado, por lo que
# debe ser modificada usando la función "formatList()"
data['lista'] = [formatList(l) for l in data['lista']]

print(data)