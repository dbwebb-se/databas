--
-- Insert
--
USE er_lager;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Show all
--
SELECT * FROM produkt;
SELECT * FROM lager;
SELECT * FROM produkt2lager;



--
-- Show content of lager, where is the product
--
SELECT
    p.namn AS "Produkt",
    l.namn AS "Lagerhylla",
    p2l.antal AS "Antal"
FROM produkt AS p
JOIN produkt2lager AS p2l
    ON p.id = p2l.prod_id
JOIN lager AS l
    ON l.id = p2l.lager_id
;



--
-- How many products to we have in the lager (and where)?
--
SELECT
    p.namn AS "Produkt",
    l.namn AS "Lagerhylla",
    SUM(p2l.antal) AS "Antal"
FROM produkt AS p
JOIN produkt2lager AS p2l
    ON p.id = p2l.prod_id
JOIN lager AS l
    ON l.id = p2l.lager_id
GROUP BY
    p.namn, l.namn
;



--
-- How many products to we have in the lager, overall?
--
SELECT
    p.namn AS "Produkt",
    GROUP_CONCAT(DISTINCT l.namn) AS "Lagerhylla",
    SUM(p2l.antal) AS "Antal"
FROM produkt AS p
JOIN produkt2lager AS p2l
    ON p.id = p2l.prod_id
JOIN lager AS l
    ON l.id = p2l.lager_id
GROUP BY
    p.namn
;



--
-- Provide overview of the lager.
--
SELECT
    l.namn AS "Lagerhylla",
    p.namn AS "Produkt",
    p2l.antal AS "Antal"
FROM produkt AS p
JOIN produkt2lager AS p2l
    ON p.id = p2l.prod_id
RIGHT OUTER JOIN lager AS l
    ON l.id = p2l.lager_id
;



--
-- Provide overview of the lager.
--
SELECT
    l.namn AS "Lagerhylla",
    GROUP_CONCAT(DISTINCT p.namn) AS "Produkt",
    SUM(p2l.antal) AS "Antal"
FROM produkt AS p
JOIN produkt2lager AS p2l
    ON p.id = p2l.prod_id
RIGHT OUTER JOIN lager AS l
    ON l.id = p2l.lager_id
GROUP BY
    l.namn
;
