--
-- To test if LOAD LOCAL INFILE works as explained in the guide.
--
-- Execute as:
--  mysql --table --local-infile=1 -uuser -ppass skolan < insert_kurs_from_csv.sql

--
-- Allow local infile
--
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

--
-- Create table: kurs_temp
--
DROP TABLE IF EXISTS kurs_temp;
CREATE TABLE kurs_temp
(
    kod CHAR(6) NOT NULL,
    namn VARCHAR(40),
    poang FLOAT,
    niva CHAR(3),

    PRIMARY KEY (kod)
)
;

--
-- Insert into kurs_temp 
--
-- DELETE FROM kurs_temp;

LOAD DATA LOCAL INFILE 'kurs.csv'
INTO TABLE kurs_temp
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kurs_temp;
