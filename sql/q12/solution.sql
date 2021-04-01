-- Se evalúa si la base de datos existe, si es así, se elimina.
-- Esto por si ha sido modificada
DROP DATABASE IF EXISTS q12;
-- Se crea la base de datos
CREATE DATABASE IF NOT EXISTS q12;
-- Se indica cuál base de datos se utilizará
USE q12;

/*
-- Comento la tabla ya que no es requerida para la consulta y poblarla consume tiempo
-- Puede descomentar y no afectar el resultado
CREATE TABLE tbl0
(
	-- lo cambié a TEXT ya que con CHAR no me leía el valor 'A'
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
	-- lo cambio a TEXT ya que con CHAR no me leía 'A'
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

-- Imprimo la columna K0
SELECT K0,
	-- Se toma el valor máximo y se formatean sus decimales a 2, se renombra 'MAX(c12)
	ROUND(MAX(c12), 2) AS 'MAX(c12)',
	-- Se toma el valor mínimo y se formatean sus decimales a 2, se renombra 'min(c12)
	ROUND(min(c12), 2) AS 'min(c12)'
-- Indica que los datos se toman de tbl1 y se agrupan por K0
FROM tbl1 GROUP BY k0;