# Librería de pandas con sobrenombre 'pd'
import pandas as pd

def main():
	# leyendo los datos del archivo 'tbl1.tsv', columnas por '\t'
	data = pd.read_csv('tbl1.tsv', sep='\t')
	# se selecciona una columna espec+ifica. en este caso '_c4', luego
	# el método 'unique' obtiene los valores únicos para cada columna
	result = data['_c4'].unique()
	# Se recorre el array 'result' y cada letra se pasa a mayúscula
	# es almacenado en una lista y a su vez asignado a la variable "result"
	result = [i.upper() for i in result]
	# La lista es ordenada
	result.sort()
	print(result)

if __name__ == "__main__":
    main()