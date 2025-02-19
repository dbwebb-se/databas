--
-- SQL DDL som skapar biblioteket
--

-- Steg 1 Tabeller med kolumner

utgivare
(
+ id
+ namn
+ land    
)

bok
(
+ id
+ isbn
+ titel
+ publiceringsar
#utgivare_id
)

bok2forfattare
(
#bok_id
#forfattare_id   
)

forfattare
(
+ id
+ namn
+ fodelsedatum
+ fodelseland   
)

bok2kategori
(
#bok_id
#kategori_id   
)

kategori
(
+ id
+ namn
+ beskrivning   
)

-- Steg 2 fixa CREATE TABLE och lägg till datatyper
CREATE TABLE utgivare
(
    id INTEGER,
    namn VARCHAR(120),
    land VARCHAR(120)  
);

CREATE TABLE bok
(
    id INTEGER,
    isbn VARCHAR(15),
    titel VARCHAR(120)
    publiceringsar INTEGER,
    utgivare_id INTEGER
);

CREATE TABLE bok2forfattare
(
    bok_id INTEGER,
    forfattare_id INTEGER 
);

CREATE TABLE forfattare
(
    id INTEGER,
    namn VARCHAR(120),
    fodelsedatum DATE,
    fodelseland VARCHAR(120)
);

CREATE TABLE bok2kategori
(
    bok_id INTEGER,
    kategori_id INTEGER
);

CREATE TABLE kategori
(
    id INTEGER,
    namn VARCHAR(40),
    beskrivning VARCHAR(255)
);

-- Steg 3 lägg till NOT NULL och defaultvärden
CREATE TABLE utgivare
(
    id INTEGER NOT NULL,
    namn VARCHAR(120) NOT NULL,
    land VARCHAR(120)  
);

CREATE TABLE bok
(
    id INTEGER NOT NULL,
    isbn VARCHAR(15),
    titel VARCHAR(120) NOT NULL,
    publiceringsar INTEGER DEFAULT YEAR(NOW()),
    utgivare_id INTEGER
);

CREATE TABLE bok2forfattare
(
    bok_id INTEGER NOT NULL,
    forfattare_id INTEGER NOT NULL   
);

CREATE TABLE forfattare
(
    id INTEGER NOT NULL,
    namn VARCHAR(120) NOT NULL,
    fodelsedatum DATE,
    fodelseland VARCHAR(120)
);

CREATE TABLE bok2kategori
(
    bok_id INTEGER NOT NULL,
    kategori_id INTEGER NOT NULL
);

CREATE TABLE kategori
(
    id INTEGER NOT NULL,
    namn VARCHAR(40) NOT NULL,
    beskrivning VARCHAR(255)
);

-- Steg 4 lägg till primära nycklar, främmande nycklar och specialbegränsningar
CREATE TABLE utgivare
(
    id INTEGER NOT NULL,
    namn VARCHAR(120) NOT NULL,
    land VARCHAR(120),

    PRIMARY KEY (id)  
);

CREATE TABLE bok
(
    id INTEGER NOT NULL,
    isbn VARCHAR(15),
    titel VARCHAR(120) NOT NULL,
    publiceringsar INTEGER DEFAULT YEAR(NOW()),
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

CREATE TABLE forfattare
(
    id INTEGER NOT NULL,
    namn VARCHAR(120) NOT NULL,
    fodelsedatum DATE,
    fodelseland VARCHAR(120),

    PRIMARY KEY (id)
);

CREATE TABLE bok2kategori
(
    bok_id INTEGER NOT NULL,
    kategori_id INTEGER NOT NULL,

    PRIMARY KEY (bok_id, kategori_id),
    FOREIGN KEY (bok_id) REFERENCES bok (id),
    FOREIGN KEY (kategori_id) REFERENCES kategori (id)
);

CREATE TABLE kategori
(
    id INTEGER NOT NULL,
    namn VARCHAR(40) NOT NULL,
    beskrivning VARCHAR(255),

    PRIMARY KEY (id),
    UNIQUE (namn)
);

-- Steg 5 lägg allt i ordning och lägg till DROP
DROP TABLE IF EXISTS utgivare;
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS forfattare;
DROP TABLE IF EXISTS bok;
DROP TABLE IF EXISTS bok2forfattare;
DROP TABLE IF EXISTS bok2kategori;

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
    beskrivning VARCHAR(255),

    PRIMARY KEY (id),
    UNIQUE (name)
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
    id INTEGER NOT NULL,
    isbn VARCHAR(15),
    titel VARCHAR(120) NOT NULL,
    publiceringsar INTEGER DEFAULT YEAR(NOW()),
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

-- Klar med steg 5 SQL DDL