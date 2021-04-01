# Librería para el manejo de archovos con formato csv
import csv

# cada elemento de una sub-lista es imprimido en una nueva línea y
# separado por comas
def printList(my_list):
    sep = ','
    for i in my_list:
        l = [str(j) for j in i]
        print(sep.join(l))

def main():
	# Se abre el archivo u su contenido es asignado a la variable "file"
	with open("data.csv", 'r') as file:
		# Se lee el archivo y se delimitan las columnas por tabulaciones "\t"
		# Esto genera una lista de listas, donde cada sub-lista es una fila
		fl = csv.reader(file, delimiter='\t')
		# Se declara una lista vacía
		result = list();
		for row in fl:
			# Se separa cada grupo "key:value" y se genera una lista de estos
			# por línea ["key:value", ...]
			items = row[4].split(',')
			total = 0
			for item in items:
				# Cada elemento de la lista es separado por ":"
				key = item.split(':')
				# se calcula la suma total de valores de la columna 5
				total += int(key[1])
			result.append([row[0], total])
		# Se imprime la lista
		printList(result)

if __name__ == "__main__":
    main()