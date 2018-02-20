--
-- Create scheme for database skolan version 2.
-- By mos for course "XXX".
-- 2017-12-27
--

-- Drop tables in order to avoid FK constraint
DROP TABLE IF EXISTS logg2;
DROP TABLE IF EXISTS kurstillfalle2;
DROP TABLE IF EXISTS kurs2;
DROP TABLE IF EXISTS programtillfalle2;
DROP TABLE IF EXISTS program2;
DROP TABLE IF EXISTS larare2;



--
-- Create table: larare
--
-- DROP TABLE IF EXISTS larare2;
CREATE TABLE larare2
(
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,

    PRIMARY KEY (akronym) 
);



--
-- Table for program
--
-- DROP TABLE IF EXISTS program2;
-- CREATE TABLE program2



--
-- Table for programtillfalle
--
-- DROP TABLE IF EXISTS programtillfalle2;
-- CREATE TABLE programtillfalle2



--
-- Create table: kurs
--
-- DROP TABLE IF EXISTS kurs2;
CREATE TABLE kurs2
(
    kod CHAR(6) NOT NULL,
    namn VARCHAR(40),
    poang INT,
    niva CHAR(3),
 
    PRIMARY KEY (kod)
);



--
-- Create table: kurstillfalle
--
-- 
-- DROP TABLE IF EXISTS kurstillfalle2;
CREATE TABLE kurstillfalle2
(
	-- add attributes

	-- https://dev.mysql.com/doc/refman/5.7/en/timestamp-initialization.html
	created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

	-- add primary and foreign keys
)
;



--
-- Create SP nyProgramAntagning
--
DROP PROCEDURE IF EXISTS nyProgramAntagning;
DELIMITER ;;
CREATE PROCEDURE nyProgramAntagning
(
	-- add incoming arguments
)
BEGIN
	-- add body
END
;;
DELIMITER ;



--
-- Create SP nyKursbestallning
--
DROP PROCEDURE IF EXISTS nyKursbestallning;
DELIMITER ;;
-- CREATE PROCEDURE nyKursbestallning
-- add stored procedure
-- ;;
DELIMITER ;



--
-- Create SP godkannKurstillfalle
--
DROP PROCEDURE IF EXISTS godkannKurstillfalle;
-- add stored procedure


--
-- Create table: log
--
-- 
DROP TABLE IF EXISTS logg2;
-- CREATE TABLE logg2



--
-- Trigger for logging create kurstillfalle
--
DROP TRIGGER IF EXISTS loggInsertKurstillfalle;
-- CREATE TRIGGER loggInsertKurstillfalle



--
-- Trigger for logging update kurstillfalle
--
DROP TRIGGER IF EXISTS loggUpdateKurstillfalle;
-- CREATE TRIGGER loggUpdateKurstillfalle



--
-- UDF for formatting larareNamn
--
DROP FUNCTION IF EXISTS larareNamn;
DELIMITER ;;
CREATE FUNCTION larareNamn(
	-- add incoming agruments
)
RETURNS BOOLEAN -- add return type 
BEGIN
    RETURN TRUE; -- add what really should be returned
END
;;
DELIMITER ;



--
-- UDF for formatting arbetstid
--
DROP FUNCTION IF EXISTS arbetstid;
-- CREATE FUNCTION arbetstid(
