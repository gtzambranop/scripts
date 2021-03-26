# Librería de pandas con sobrenombre 'pd'
import pandas as pd

# leyendo los datos del archivo 'tbl0.tsv', columnas por '\t'
data = pd.read_csv('tbl0.tsv', sep='\t')
# Se define una nueva columna
# esta columna contiene los valores de la lista, donde cada elemento es
# resultado de la lectura de la columna '_c3' y cada dato es separado por '-'
# finalmente solo se recoge el primer elemento del mismo
data['ano'] = [d.split('-')[0] for d in data['_c3']]
print(data)