# sql

## Ejecución

### Localmente

**Requisitos:** mysql

1. Ubíquese en la carpeta del ejercio (qxx) y ejecute:

	```bash
	mysql -u name_user -p < solution.sql
	```
	reemplace `name_user` por su usuario.
2. Luego le solicitará su contraseña para ejecutar el escript

### Docker

**Requisitos:** Docker

1. Descargue la imagen

	```bash
	docker pull gtzambranop/sql_scripts
	```
	La descarga puede tardar ya que está basada en una imagen de `mysql`.

2. Crear un contenedor llamado `sql` a partir de la imagen descargada. El usuario será `root` y la contraseña de este `secret`

	```bash
	docker run --name sql -e MYSQL_ROOT_PASSWORD=secret -d gtzambranop/sql_scripts
	```
3. Ejecute el contenedor en bash

	```bash
	docker exec -it sql bash
	```
	Esto le permitirá interactual con la terminal del contenedor.
4. Ubíquese en la carpeta del ejercio (qxx) y ejecute:

	```bash
	mysql -u root -p < solution.sql
	```
5. Luego le solicitará la contraseña para ejecutar el escript, ppor lo que debe ingresar `secret`.


## Estado de los ejercicios

| Ejercicio | Descripción | Estado |
| :---: | :---: | :---: |
|01|	Convertir csv, a tabla SQL. Calcular la suma de un campo|[Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q01/solution.sql\) |
|02|	Convertir csv, a tabla SQL. Retornar cantidad de registros | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q02/solution.sql\) |
|03|	Convertir csv, a tabla SQL. Retornar 5 primeros registros ordenados por fecha | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q03/solution.sql\) |
|04|	Convertir 3 archivos csv a tablas sql. Retornar 2 campos para registros que cumplan que 2 columnas inicien con la misma letra | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q04/solution.sql\) |
|05|	Convertir 3 archivos csv a tablas sql. Retornar todos los campos para registros con campo igual a 100 o 600 | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q05/solution.sql\) |
|06|	Convertir 3 archivos csv a tablas sql. Retornar registros ordenados por fecha filtrado por 3 condiciones | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q06/solution.sql\) |
|07|	Convertir 3 archivos csv a tablas sql. Retornar año y promedio de registros filtrando por fecha | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q07/solution.sql\) |
|08|	Convertir 3 archivos csv a tablas sql. Retornar registro con menor valor de columna | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q08/solution.sql\) |
|09|	Convertir 3 archivos csv a tablas sql. Retornar registros con mayor o igual valor (300) de columna | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q09/solution.sql\) |
|10|	Convertir 3 archivos csv a tablas sql. Retornar registro con menor valor de columna | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q10/solution.sql\) |
|11|	Convertir 3 archivos csv a tablas sql. Retornar año y cantidad de registros filtrando por fecha | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q11/solution.sql\) |
|12|	Convertir 3 archivos csv a tablas sql. Retornar max y min por registro, filtrando por 2 columnas | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q12/solution.sql\) |
|13|	Convertir 3 archivos csv a tablas sql. Agrupar por campo y calcular promedio de campo A, filtrando por campo B | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q13/solution.sql\) |
|14|	Convertir 3 archivos csv a tablas sql. Agrupar por campo y calcular promedio de campo A, filtrando por campo B | [Realizado](https://github.com/gtzambranop/scripts/blob/develop/sql/q14/solution.sql) |