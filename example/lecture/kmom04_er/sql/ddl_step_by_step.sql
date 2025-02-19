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



-- Steg 3 lägg till NOT NULL och defaultvärden




-- Steg 4 lägg till primära nycklar, främmande nycklar och specialbegränsningar



-- Steg 5 lägg allt i ordning och lägg till DROP



-- Klar med steg 5 SQL DDL