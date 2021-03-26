# Librería de pandas con sobrenombre 'pd'
import pandas as pd

# leyendo los datos del archivo 'data.tsv', columnas por '\t'
data = pd.read_csv('data.tsv', sep='\t')
# Agrupar columnas por una específica, en este caso '_c1', luego contar
# la cantidad de registros de esta
data = data.groupby('_c1').count()
# imprimir solo la primera columna del dataframe
print(data[data.columns[1]])