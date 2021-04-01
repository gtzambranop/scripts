# Librería de pandas con sobrenombre 'pd'
import pandas as pd

def main():
	# leyendo los datos del archivo 'tbl0.tsv', columnas por '\t'
	data = pd.read_csv('tbl0.tsv', sep='\t')
	# Se define una nueva columna 'suma' y cada valor de esta es el resultado de la
	# suma entre cada valor de '_c0' y '_c2
	data['suma'] = data['_c0'] + data['_c2']
	print(data)

if __name__ == "__main__":
    main()