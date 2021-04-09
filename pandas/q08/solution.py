# Librería de pandas con sobrenombre 'pd'
import pandas as pd

def main():
    # leyendo los datos del archivo 'tbl0.tsv', columnas por '\t'
    data = pd.read_csv('tbl0.tsv', sep='\t')

    # Agrupar columna '_c2' por una específica, en este caso '_c1', luego
    # a la columna '_c2' se le aplica una función que transforma en una lista
    # los elementos relacionados de '_c2' con cada caracter de '_c1'
    data = data.groupby('_c1')['_c2'].apply(list).reset_index(name='lista')

    result = list()
    for my_list in data['lista']:
        separator = ':'
        # Se ordena la lista
        my_list.sort()
        # Se crea una nueva lista, donde cada valor de "my_list" es pasado a string
        # Esto es para poder operarlo con el método "join"
        l = [str(i) for i in my_list]
        # Se retorna un string, donde están los valores de la lista "l"
        # separados por ':'
        result.append(separator.join(l))

    data['lista'] = result
    # Se renombra la columna '_c1'
    data.rename(columns = {'_c1':'_c0'}, inplace=True)
    print(data)

if __name__ == "__main__":
    main()