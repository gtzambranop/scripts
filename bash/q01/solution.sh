# Algunos archivos terminaban con un salto de línea de la forma "\r" por lo que
# al hacer join se generaban conflictos. Por esta razón se procesan ambos archivos
# y se elimina dicho caracter
sed 's/\r$//' data.csv > del
mv del data.csv

# Opciones:
# -E: Use sed con exptesiones regulares extendidas
# -e: indica que se realizará una expresión corriente de sed.

# Buscar y reemplazar:
# 's,expresión_a_buscar,expresión_a_reemplazar,'
# 's/expresión_a_buscar/expresión_a_reemplazar/g'

# Este comando formatea la última línea, ya que no sigue el patrón de las demás
# ^([0-9]+)/([0-9]+)/([20]{2})([0-9]{2})
# ^ busca al inicio de la línea
# [0-9]+ seguido de uno o más dígitos
# ([0-9]+) coloquelo en un grupo de captura ()
# Cada grupo está separado por /
# El último grupo es: ([20]{2})([0-9]{2})
# ([20]{2}) se capturan 2 números que pueden ser 0 o 2 y se almacena en un grupo de captura
# ([0-9]{2})se capturan 2 dígitos de 0 a 9 y se almacena en un grupo de captura ()
# 0\1/0\2/\4
# Cada grupo de captura se enumera desde 1, de izquierda a derecha, a medida que se toman los datos
# Se indica el grupo usando \#
# por lo que se posiciona en el órden original, pero se le agrega ceros al día
# y al mes. Y en el año es omitido el grupo 3 de captura
sed -E 's,^([0-9]+)/([0-9]+)/([20]{2})([0-9]{2}),0\1/0\2/\4,' data.csv > del
mv del data.csv

# Este comando divide la fecha en 3 grupos de captura y los reordena al final
# en el formato solicitado
sed -E 's,^([0-9]+)/([0-9]+)/([0-9]+),\3/\2/\1,' data.csv > del
mv del data.csv

# Cambia todas las letras a mayúsculas con \U
sed -e 's/\(.*\)/\U\1/' data.csv > del
mv del data.csv

# Formateo de los valores nulos, el símbolo | es equivalente a OR
sed -E 's/;;|;N;/;\\N;/g' data.csv > del
mv del data.csv

# Formateo de los valores nulos al final de la línea, | == OR
sed -E 's/;$|;N$/;\\N/g' data.csv > del
mv del data.csv

# Reemplazando las comas por puntos ,->.
sed -e 's/,/./g' data.csv > del
mv del data.csv

# Reemplazando los punto y coma por comas ;->,
sed -e 's/;/,/g' data.csv > del
mv del data.csv