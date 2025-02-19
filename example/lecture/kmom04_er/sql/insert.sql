--
-- DDL bibliotek, lägg in data
--
USE bibliotek;

--
-- Rensa bort gammal data
--
DELETE FROM  bok2forfattare;
DELETE FROM  bok2kategori;
DELETE FROM  bok;
DELETE FROM  utgivare;
DELETE FROM  kategori;
DELETE FROM  forfattare;

--
-- Lägg in ny data
--

INSERT INTO forfattare 
VALUES
    (1, 'Astrid Lindgren', '1907-11-14', 'Sverige'),
    (2, 'Stieg Larsson', '1954-08-15', 'Sverige'),
    (3, 'Selma Lagerlöf', '1858-11-20', 'Sverige')
;

INSERT INTO utgivare 
VALUES
    (1, 'Raben & Sjögren', 'Sverige'),
    (2, 'Norstedts förlag', 'Sverige'),
    (3, 'Bonnier', 'Sverige')
;

-- Eftersom beskrivning saknas måste vi ange de andra kolumnerna
INSERT INTO kategori 
    (id, namn)
VALUES
    (1, 'Barn'),
    (2, 'Thriller'),
    (3, 'Klassiker'),
    (4, 'Roman')
;

-- Sätt en räknare att börja på 1
ALTER TABLE bok AUTO_INCREMENT=1;

INSERT INTO bok 
    (isbn , titel , publiceringsar, utgivare_id)
VALUES
    ('9789124310143', 'Pippi Långstrump', 1945, 1),
    ('9789124310150', 'Emil i Lönneberga', 1963, 1),
    ('9789113019021', 'Män som hatar kvinnor', 2005, 2),
    ('9789120025683', 'Gösta Berlings saga', 1891, 3)
;

INSERT INTO bok2forfattare 
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3)
;

INSERT INTO bok2kategori 
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (4, 4)
;


