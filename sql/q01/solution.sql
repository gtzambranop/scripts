-- Se evalúa si la base de datos existe, si es así, se elimina.
-- Esto por si ha sido modificada
DROP DATABASE IF EXISTS q01;
-- Se crea la base de datos
CREATE DATABASE IF NOT EXISTS q01;
-- Se indica cuál base de datos se utilizará
USE q01;
-- Se crea la tabla, indicando las columnas que lo conformarán y su ipología
CREATE TABLE table1
(
	K0  TEXT,
	K1  INT,
	c12 FLOAT,
	c13 INT,
	c14 DATE,
	c15 FLOAT,
	c16 CHAR(4)
);

-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'data.csv'
INTO TABLE table1
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';

-- SUM(C12) calcula la suma entre los valores de la columna C12
-- ROUND limita a 2 la cantidad de decimales
SELECT ROUND(SUM(c12), 2) FROM table1;