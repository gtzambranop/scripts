# Librería de pandas con sobrenombre 'pd'
import pandas as pd
# se importa matplotlib y se le da el sobrenombre 'plt'
import matplotlib.pyplot as plt


SMALL_SIZE = 8

def main():
    # leyendo los datos del archivo 'data.csv'
    data = pd.read_csv('data.csv')

    # obtener una lista de listas, donde cada sublista corresponde a una fila
    vals = data.values.tolist()
    # Lista de columnas
    cols = list(data.columns)

    # descripción de la figura con
    # 6 sub-figuras (len(data))
    # tamaño 12x5
    # sharex, sharey indican que las subfiguras comparten los ejes
    fig, axs = plt.subplots(1, len(data), figsize=(10, 4.5), sharex=True, sharey=True)
	# enumerate retorna el índice y el valor de vals
    plt.rcParams.update({'font.size': 8})
    for i, cnt in enumerate(vals):
        # Creo una sub-figura
        # x[1::] indica que se toma desde el segundo valor hasta el final de la lista
        # s, tamaño del marcador
        # marcador = círculo
        # edgecolor= color del borde
        # linewith = grosor del borde
        # facecolor = color del círculo
        axs[i].scatter(cols[1::], cnt[1::], s=100, marker='o',
                       edgecolor=['orange', 'blue', 'green'],
                       linewidth=2, facecolor='white')
        # Definición del título de la sub-figura
        axs[i].set_title(cnt[0], fontsize=9)

        # inclinación de las palabras en el eje x
        for tick in axs[i].xaxis.get_major_ticks():
                tick.label.set_fontsize(8)
                tick.label.set_rotation('vertical')

        for tick in axs[i].yaxis.get_major_ticks():
                tick.label.set_fontsize(8)

    # Nombre del eje y común para todas las figuras
    fig.text(0.003, 0.5, 'Población', va='center', rotation='vertical')
    # ajusta figura
    plt.tight_layout()
    # guardar figura
    plt.savefig('generada.png',)

if __name__ == "__main__":
    main()