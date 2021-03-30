# Librería de pandas con sobrenombre 'pd'
import pandas as pd
# se importa matplotlib y se le da el sobrenombre 'plt'
import matplotlib.pyplot as plt

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
fig, axs = plt.subplots(1, len(data), figsize=(12, 5), sharex=True, sharey=True)

# enumerate retorna el índice y el valor de vals
for i, cnt in enumerate(vals):
    # Creo una sub-figura
    # x[1::] indica que se toma desde el segundo valor hasta el final de la lista
    # color = lista de colores para cada elemento de la lista cnt[1::]
    axs[i].bar(cols[1::], cnt[1::], color=['orange', 'blue', 'green'])
    # Definición del título de la sub-figura
    axs[i].set_title(cnt[0])

    # inclinación de las palabras en el eje x
    for tick in axs[i].get_xticklabels():
        tick.set_rotation(90)

# Nombre del eje y común para todas las figuras
fig.text(0.003, 0.5, 'Población', va='center', rotation='vertical')
# ajusta figura
plt.tight_layout()
# guardar figura
plt.savefig('generada.png')