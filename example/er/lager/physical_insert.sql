--
-- Insert
--
USE er_lager;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Delete from all tables, order matters
--
DELETE FROM produkt2lager;
DELETE FROM produkt;
DELETE FROM lager;



--
--
--
INSERT INTO produkt
    (id, namn)
VALUES
    (1, "Produkt A"),
    (2, "Produkt B"),
    (3, "Produkt C")
;



--
--
--
INSERT INTO lager
    (id, namn, byggnad)
VALUES
    (1, "A101", "Byggnad A"),
    (2, "A102", "Byggnad A"),
    (3, "A201", "Byggnad A"),
    (4, "B101", "Byggnad B")
;



--
--
--
INSERT INTO produkt2lager
    (id, prod_id, lager_id, antal)
VALUES
    (1, 1, 1, 10),
    (2, 1, 1, 10),
    (3, 1, 1, 15),
    (4, 2, 1, 10),
    (5, 1, 2, 10),
    (6, 2, 4, 10),
    (7, 3, 4, 10)
;
