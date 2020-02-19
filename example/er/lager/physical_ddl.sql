--
-- DDL
--

--
-- Create the database
--
DROP DATABASE IF EXISTS er_lager;
CREATE DATABASE er_lager;
USE er_lager;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Drop all tables, order matters
--
DROP TABLE IF EXISTS produkt2lager;
DROP TABLE IF EXISTS produkt;
DROP TABLE IF EXISTS lager;



--
--
--
CREATE TABLE produkt (
    id INT,
    namn VARCHAR(20),

    PRIMARY KEY (id)
);



--
--
--
CREATE TABLE lager (
    id INT NOT NULL,
    namn CHAR(6) UNIQUE, -- candidate key
    byggnad CHAR(10),
    
    PRIMARY KEY (id)
);



--
--
--
CREATE TABLE produkt2lager (
    id INT,
    prod_id INT,
    lager_id INT,
    antal INT,

    PRIMARY KEY (id),
    -- PRIMARY KEY (prod_id, lager_id),
    FOREIGN KEY (prod_id) REFERENCES produkt(id),
    FOREIGN KEY (lager_id) REFERENCES lager(id) 
);
