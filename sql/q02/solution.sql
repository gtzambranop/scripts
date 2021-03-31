-- Se evalúa si la base de datos existe, si es así, se elimina.
-- Esto por si ha sido modificada
DROP DATABASE IF EXISTS q02;
-- Se crea la base de datos
CREATE DATABASE IF NOT EXISTS q02;
-- Se indica cuál base de datos se utilizará
USE q02;
-- Se crea la tabla, indicando las columnas que lo conformarán y su ipología
CREATE TABLE table1
(
	-- solo admite 1 caracter
	K0  CHAR(1),
	K1  INT,
	C12 FLOAT,
	C13 INT,
	C14 DATE,
	C15 FLOAT,
	C16 CHAR(4)
);

-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'data.csv'
INTO TABLE table1
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';

-- COUNT(*) calcula la cantidad de registros para la tabla 1
SELECT COUNT(*) FROM table1;