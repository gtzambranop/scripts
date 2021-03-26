# Librería de pandas con sobrenombre 'pd'
import pandas as pd

# leyendo los datos del archivo 'tbl0.tsv', columnas por '\t'
df_0 = pd.read_csv('tbl0.tsv', sep='\t')

# leyendo los datos del archivo 'tbl2.tsv', columnas por '\t'
df_2 = pd.read_csv('tbl2.tsv', sep='\t')

# Se define '_c0' como índices en las 2 tablas, esto para que al hacer join se
# realice a partir de esta columna en común
# El método join creará un nuevo dataframe donde se combinen las columnas de
# los dataframes operados con base en el índice de ambos
data = df_0.set_index('_c0').join(df_2.set_index('_c0'))

# Se agrupa la tabla con base en la columna '_c1' que corresponde a las letras
# para cada letra se toma la columa '_c5b' y se suman los valores de estos
# usando el método 'apply(sum)'
data = data.groupby('_c1')['_c5b'].apply(sum)

print(data)