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

def main():
	# leyendo los datos del archivo 'tbl2.tsv', columnas por '\t'
	data = pd.read_csv('tbl2.tsv', sep='\t')

	# Se recorren 2 columnas y se crea una lista, donde el primer y segundo elemento
	# 'a' y 'b', pertenecientes a '_c5a' y '_c5b' respectivamente
	# son organizadas de la forma 'a:b'
	# esta lista es asignada a una nueva columna llamada 'temp'
	data['temp'] = ['{}:{}'.format(a,b) for a, b in zip(data['_c5a'], data['_c5b'])]

	# Agrupar columna 'temp' por una específica, en este caso '_c0', luego
	# a la columna 'temp' se le aplica una función que transforma en una lista
	# los elementos relacionados de 'temp' para cada número de '_c0'
	data = data.groupby('_c0')['temp'].apply(list).reset_index(name='lista')

	# La lista generada no está ordenada ni en el formato solicitado, por lo que
	# debe ser modificada usando la función "formatList()"
	data['lista'] = [formatList(l) for l in data['lista']]

	print(data)

if __name__ == "__main__":
    main()