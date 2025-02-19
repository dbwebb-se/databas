--
-- DDL for bibliotek
--

--
-- Skapa databasen, ta bort om den finns och skapa om
--
DROP DATABASE IF EXISTS bibliotek;
CREATE DATABASE bibliotek;
USE bibliotek;

-- 
-- Ta bort alla tabeller
--
DROP TABLE IF EXISTS utgivare;
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS forfattare;
DROP TABLE IF EXISTS bok;
DROP TABLE IF EXISTS bok2forfattare;
DROP TABLE IF EXISTS bok2kategori;

--
-- Skapa alla tabeller
--
CREATE TABLE utgivare
(
    id INTEGER NOT NULL,
    namn VARCHAR(120) NOT NULL,
    land VARCHAR(120),

    PRIMARY KEY (id)  
);

CREATE TABLE kategori
(
    id INTEGER NOT NULL,
    namn VARCHAR(40) NOT NULL,
    beskrivning VARCHAR(255) DEFAULT "Info saknas",

    PRIMARY KEY (id),
    UNIQUE (namn)
);

CREATE TABLE forfattare
(
    id INTEGER NOT NULL,
    namn VARCHAR(120) NOT NULL,
    fodelsedatum DATE,
    fodelseland VARCHAR(120),

    PRIMARY KEY (id)
);

CREATE TABLE bok
(
    id INTEGER AUTO_INCREMENT NOT NULL,
    isbn VARCHAR(15) NOT NULL,
    titel VARCHAR(120) NOT NULL,
    publiceringsar INTEGER, -- hade DEFAULT YEAR(NOW()) men då funkar inte RE i workbench
    utgivare_id INTEGER,

    PRIMARY KEY (id),
    FOREIGN KEY (utgivare_id) REFERENCES utgivare (id)
);

CREATE TABLE bok2forfattare
(
    bok_id INTEGER NOT NULL,
    forfattare_id INTEGER NOT NULL,

    PRIMARY KEY (bok_id, forfattare_id),
    FOREIGN KEY (bok_id) REFERENCES bok (id),
    FOREIGN KEY (forfattare_id) REFERENCES forfattare (id) 
);

CREATE TABLE bok2kategori
(
    bok_id INTEGER NOT NULL,
    kategori_id INTEGER NOT NULL,

    PRIMARY KEY (bok_id, kategori_id),
    FOREIGN KEY (bok_id) REFERENCES bok (id),
    FOREIGN KEY (kategori_id) REFERENCES kategori (id)
);
