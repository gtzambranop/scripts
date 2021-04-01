-- Se evalúa si la base de datos existe, si es así, se elimina.
-- Esto por si ha sido modificada
DROP DATABASE IF EXISTS q08;
-- Se crea la base de datos
CREATE DATABASE IF NOT EXISTS q08;
-- Se indica cuál base de datos se utilizará
USE q08;

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

/*
-- Comento la tabla ya que no es requerida para la consulta y poblarla consume tiempo
-- Puede descomentar y no afectar el resultado
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
*/

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

/*
-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'tbl1.csv'
INTO TABLE tbl1
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';
*/

-- Se le indica de dónde obtener los datos para poblar la base de datos
LOAD DATA LOCAL INFILE 'tbl2.csv'
INTO TABLE tbl2
-- Se especifica cuál es el símbolo que separa los datos
FIELDS TERMINATED BY ','
-- Se especifica el símbolo que indica el final de un registro
LINES TERMINATED BY '\n';

-- Se crea una nueva columna YEAR
ALTER TABLE tbl2 ADD YEAR INT NOT NULL;
-- Se llena la columna con el año de la columna c23
UPDATE tbl2 SET YEAR = YEAR(c23);


SELECT YEAR,
	-- Se suman los datos (limitando la cantidad de decimales a 2)
	-- luego se dividen por la cantidad de los mismos
	-- finalmente se renombra la operación como 'avg(c21)'
	ROUND(sum(c21),2)/COUNT(c21) AS 'avg(c21)'
FROM tbl2
-- Los datos se agrupan por año
GROUP BY YEAR;

-- Hay una función que calcula el promedio, sin embargo su resultado en decimales
-- no es exacto, por lo que se prosedió a hacerlo manualmente

-- SELECT YEAR(c23) AS 'YEAR', ROUND(avg(c21), 6) FROM tbl2 GROUP BY YEAR(c23);