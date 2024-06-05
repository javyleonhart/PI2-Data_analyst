DROP DATABASE IF EXISTS accidentes;
CREATE DATABASE accidentes; -- creamos base de datos

USE accidentes; -- seleccionamos la BD

SET GLOBAL local_infile = 'ON'; -- cambiamos estas variables globales para poder cargar los datasets (previamente fueron convertidos en csv)


-- Creamos la tabla para cargar el primer csv
DROP TABLE IF EXISTS hechos; -- Borramos la tabla si existe
CREATE TABLE hechos(
	Id INT NOT NULL AUTO_INCREMENT,
    Id_hecho VARCHAR(20) NOT NULL,
    N_victimas INT NOT NULL,
    Fecha DATE NOT NULL,
    Año INT NOT NULL,
    Mes INT NOT NULL,
    Dia INT NOT NULL,
    Tiempo TIME,
    Hora INT,
    Lugar_hecho TINYTEXT NOT NULL,
    Tipo_calle VARCHAR(20),
    Calle TINYTEXT,
    Altura INT,
    Cruce TINYTEXT,
    Direccion_norm TINYTEXT,
    Comuna INT,
    Coord_caba VARCHAR(60),
    Longitud DOUBLE,
    Latitud DOUBLE,
    Participantes VARCHAR(30),
    Victima VARCHAR (20),
    Acusado VARCHAR (20),
    PRIMARY KEY (Id_hecho),
    KEY Id (Id));


-- Cargamos el csv a la tabla creada
LOAD DATA LOCAL INFILE "C://ProgramData//MySQL//MySQL Server 8.3//Uploads//hechos.csv"
                INTO TABLE hechos
                CHARACTER SET latin1
                FIELDS TERMINATED BY ';'
                LINES TERMINATED BY '\n'
                IGNORE 1 LINES
                (Id_hecho, N_victimas, Fecha, Año, Mes, Dia, Tiempo, Hora, Lugar_hecho, Tipo_calle, 
                Calle, Altura, Cruce, Direccion_norm, Comuna, Coord_caba, Longitud, Latitud, Participantes,
                Victima, Acusado);
                
-- repetimos procedimiento
DROP TABLE IF EXISTS victimas; 
CREATE TABLE victimas(
	Id INT NOT NULL AUTO_INCREMENT,
    Id_hecho VARCHAR(20) NOT NULL,
    Fecha DATE NOT NULL,
    Año INT NOT NULL,
    Mes INT NOT NULL,
    Dia INT NOT NULL,
    Rol VARCHAR(30),
    Victima VARCHAR(20),
    Sexo VARCHAR(20),
    Edad INT,
    Fecha_fallecimiento DATE,
    PRIMARY KEY (Id),
    KEY (Id_hecho));



LOAD DATA LOCAL INFILE "C://ProgramData//MySQL//MySQL Server 8.3//Uploads//victimas.csv"
                INTO TABLE victimas
                CHARACTER SET latin1
                FIELDS TERMINATED BY ';'
                LINES TERMINATED BY '\n'
                IGNORE 1 LINES
                (Id_hecho, Fecha, Año, Mes, Dia, Rol, Victima, Sexo, Edad, Fecha_fallecimiento);
                
-- Funcion para capitalizar los str
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS `UC_Words`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `UC_Words`( str VARCHAR(255) ) RETURNS varchar(255) CHARSET utf8
BEGIN  
  DECLARE c CHAR(1);  
  DECLARE s VARCHAR(255);  
  DECLARE i INT DEFAULT 1;  
  DECLARE bool INT DEFAULT 1;  
  DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';  
  SET s = LCASE( str );  
  WHILE i < LENGTH( str ) DO  
     BEGIN  
       SET c = SUBSTRING( s, i, 1 );  
       IF LOCATE( c, punct ) > 0 THEN  
        SET bool = 1;  
      ELSEIF bool=1 THEN  
        BEGIN  
          IF c >= 'a' AND c <= 'z' THEN  
             BEGIN  
               SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));  
               SET bool = 0;  
             END;  
           ELSEIF c >= '0' AND c <= '9' THEN  
            SET bool = 0;  
          END IF;  
        END;  
      END IF;  
      SET i = i+1;  
    END;  
  END WHILE;  
  RETURN s;  
END$$
DELIMITER ;                
                
                
                
-- ETL

UPDATE hechos
SET Acusado = trim(Acusado);

UPDATE victimas
SET Fecha_fallecimiento = NULL
WHERE Fecha_fallecimiento = 0000-00-00;

-- creamos tablas auxiliaries para no alterar la integridad de las tablas de origen al realizar el ETL con las transformaciones que necesitamos

CREATE TABLE aux_hechos LIKE hechos;
INSERT INTO aux_hechos SELECT * FROM hechos;

CREATE TABLE aux_victimas LIKE victimas;
INSERT INTO aux_victimas SELECT * FROM victimas;

-- Borramos la columna Tiempo y nos quedamos solo con la hora porque va a ser más eficiente a la hora de hacer analisis

ALTER TABLE aux_hechos
DROP COLUMN Tiempo;

-- Borramos la columna Coord_caba para quedarnos solamente con las coordenadas globales que nos son más utiles

ALTER TABLE aux_hechos
DROP COLUMN Coord_caba;

-- Borramos direccion normalizada y nos quedamos con el nombre del cruce y el desglose de las calles

ALTER TABLE aux_hechos
DROP COLUMN Direccion_norm;

-- Borramos la altura porque no es un dato que va a aportar a nuesto analisis

ALTER TABLE aux_hechos
DROP COLUMN Altura;

-- en tipo de calle, le asignamos av a las casillas donde está gral paz

UPDATE aux_hechos
SET Tipo_calle = 'AUTOPISTA'
WHERE Tipo_calle = 'GRAL PAZ';

-- Pasamo a letra capital los str

UPDATE aux_hechos SET Lugar_hecho = UC_Words(TRIM(Lugar_hecho)),
                    Tipo_calle = UC_Words(TRIM(Tipo_calle)),
                    Calle = UC_Words(TRIM(Calle)),
                    Cruce = UC_Words(TRIM(Cruce)),
                    Participantes = UC_Words(TRIM(Participantes)),
                    Victima = UC_Words(TRIM(Victima)),
                    Acusado = UC_Words(TRIM(Acusado));
                    
UPDATE aux_victimas SET Rol = UC_Words(TRIM(Rol)),
                    Sexo = UC_Words(TRIM(Sexo)),
                    Victima = UC_Words(TRIM(Victima));
                    
-- Llenamos coordenadas vacias con el promedio para el mapa de Power BI, de lo contrario puede dar ubicaciones no deseadas

UPDATE aux_hechos
SET Longitud = NULL
WHERE Longitud = 0;

UPDATE aux_hechos
SET Latitud = NULL
WHERE Latitud = 0;

SELECT AVG(Longitud) from aux_hechos;

UPDATE aux_hechos
SET Longitud = -58.44154523356112
WHERE Longitud IS NULL;

SELECT AVG(Latitud) from aux_hechos;

UPDATE aux_hechos
SET Latitud = -34.61963157034329
WHERE Latitud IS NULL;

-- Lo identificado en el EDA, lo corregimos acá. Es decir cambiamos la imputación de faltantes por nulos para que no alteren los analisis
-- Cambiamos los vacíos en cruce por "Sin Cruce"

UPDATE aux_victimas
SET Edad = NULL
WHERE Edad = 0;

SELECT AVG(Edad) FROM aux_victimas;

UPDATE aux_victimas
SET Edad = 42
WHERE Edad IS NULL;

UPDATE aux_hechos
SET Cruce = "Sin cruce"
WHERE Cruce = "";



