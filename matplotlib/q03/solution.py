# Librería de pandas con sobrenombre 'pd'
import pandas as pd
# se importa matplotlib y se le da el sobrenombre 'plt'
import matplotlib.pyplot as plt

# leyendo los datos del archivo 'data.csv'
data = pd.read_csv('data.csv')

# Se toman los datos de la primera columna para definir los elementos del eje x
cnts = list(data["Region"])

# descripción de la figura con
# 3 sub-figuras (len(data))
# tamaño 12x5
# sharex, sharey indican que las subfiguras comparten los ejes
fig, axs = plt.subplots(3, 1, figsize=(6, 7), sharex=True, sharey=False)
# Lista de los colores para cada sub-figura
colors = ['orange', 'blue', 'green']
# contador que iterará entre las sub-figuras
i = 0
# iteritems retorna una tupla con el nombre de la columna y sus datos
for (columnName, columnData) in data.iteritems():
    # evitamos la primera columna
    if(columnName != "Region"):
        # Creamos la gráfica de barras
        # eje x -> países
        # eje y -> población
        # color, itera en la lista definida previamente
        axs[i].bar(cnts, columnData, color=colors[i])
        # Definimos el nombre del eje y como el nombre de la columna
        plt.setp(axs[i], ylabel=columnName)

        # Se eliminan las líneas: derecha, izquierda y superior
        axs[i].spines['right'].set_visible(False)
        axs[i].spines['left'].set_visible(False)
        axs[i].spines['top'].set_visible(False)

        # inclinación de las palabras en el eje x
        for tick in axs[i].get_xticklabels():
            tick.set_rotation(90)
        i+=1

# ajusta figura
plt.tight_layout()
# guardar figura
plt.savefig('generada.png')