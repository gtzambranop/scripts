-- Se evalúa si la base de datos existe, si es así, se elimina.
-- Esto por si ha sido modificada
DROP DATABASE IF EXISTS q04;
-- Se crea la base de datos
CREATE DATABASE IF NOT EXISTS q04;
-- Se indica cuál base de datos se utilizará
USE q04;

/*
-- Comento la tabla ya que no es requerida para la consulta y poblarla consume tiempo
-- Puede descomentar y no afectar el resultado
CREATE TABLE tbl0
(
	K0  TEXT,
	c01 INT,
	c02 INT,
	c03 CHAR(4),
	c04 FLOAT
);
*/

-- Se crea la tabla, indicando las columnas que lo conformarán y su ipología
CREATE TABLE tbl1
(
	K0 TEXT,
	K1  INT,
	c12 FLOAT,
	c13 INT,
	c14 DATE,
	c15 FLOAT,
	c16 CHAR(4)
);


/*
-- Comento la tabla ya que no es requerida para la consulta y poblarla consume tiempo
-- Puede descomentar y no afectar el resultado
CREATE TABLE tbl2
(
	K1  INT,
	c21 FLOAT,
	c22 INT,
	c23 DATE,
	c24 FLOAT,
	c25 CHAR(5)
);
*/

/*
-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'tbl0.csv'
INTO TABLE tbl0
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';
*/

-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'tbl1.csv'
INTO TABLE tbl1
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';

/*
-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'tbl2.csv'
INTO TABLE tbl2
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';
*/

-- SELECT K0, c16 FROM tbl1: tome las columnas K0 y c16 de la tabla tbl1
-- WHERE: Siempre y cuando se cumpla la siguiente condición:
-- SUBSTRING(c16, 1, 1) = K0: la primera letra de c16 sea igual al valor de K0
-- SUBSTRING(a, b, c) tomar un string 'a', va a la posición 'b' y toma 'c' caracteres
SELECT K0, c16 FROM tbl1 WHERE SUBSTRING(c16, 1, 1) = K0;