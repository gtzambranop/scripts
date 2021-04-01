-- Se evalúa si la base de datos existe, si es así, se elimina.
-- Esto por si ha sido modificada
DROP DATABASE IF EXISTS q14;
-- Se crea la base de datos
CREATE DATABASE IF NOT EXISTS q14;
-- Se indica cuál base de datos se utilizará
USE q14;

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

-- Se crea la tabla, indicando las columnas que lo conformarán y su ipología
CREATE TABLE tbl2
(
	K1  INT,
	c21 FLOAT,
	c22 INT,
	c23 DATE,
	c24 FLOAT,
	c25 CHAR(5)
);


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

-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'tbl2.csv'
INTO TABLE tbl2
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';


-- Imprime K0 de la tabla 1
SELECT t1.K0,
	-- Imprime el promedio de c21 de la tabla tbl2
	-- Se calcula sumando los datos y dividiendolo por la cantidad de registros
	-- No se usó avg porque no es peciso en los decimales
	ROUND(sum(t2.c21), 2)/COUNT(t2.c21) AS 'avg(c21)'
-- Indica que los datos se toman de tbl1 y esta tabla es renombrada t1
FROM tbl1 AS t1
	-- INNER JOIN: Toma los datos que están entre la intersección de las tablas
	-- Indica que se hace JOIN con tbl2 y a esta se le asigna el nombre t2
	INNER JOIN tbl2 AS t2
	-- Cndición de unión, solo admite los datos que cumplan esta
	ON t1.K1 = t2.K1
-- A los datos resultantes del JOIN los filtra usando c13 de tbl1
WHERE t1.c13 > 400
-- A los datos resultantes del JOIN los agrupa usando K0 de tbl1
GROUP BY t1.K0;