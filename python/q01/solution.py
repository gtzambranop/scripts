# Librería para el manejo de archovos con formato csv
import csv

def main():
	# Se abre el a5yyrchivo u su contenido es asignado a la variable "file"
	with open("temp.csv", 'r') as file:
		# Se lee el archivo y se delimitan las columnas por tabulaciones "\t"
		# Esto genera una lista de listas, donde cada sub-lista es una fila
		fl = csv.reader(file, delimiter='\t')
		# variable que almacenará la suma de los valores
		sum = 0
		# Se recorre cada fila del archivo fl
		for row in fl:
			# Se accede al segundo campo, se convierte a entero el valor leído
			# la variable "sum" agrega el valor leído
			sum = sum + int(row[1])
		# Se imprime la suma total obtenida
		print(sum)


if __name__ == "__main__":
    main()