# Librería de pandas con sobrenombre 'pd'
import pandas as pd

def main():
	# leyendo los datos del archivo 'tbl0.tsv', columnas por '\t'
	data = pd.read_csv('tbl0.tsv', sep='\t')
	# Agrupar columnas por una específica, en este caso '_c1', luego
	# el método 'mean' calcula el promedio de los valores para cada columna
	data = data.groupby('_c1').mean()
	# imprimir solo la primera columna del dataframe
	print(data[data.columns[1]])

if __name__ == "__main__":
    main()