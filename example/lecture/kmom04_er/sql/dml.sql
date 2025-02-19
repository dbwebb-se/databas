--
-- DML rapporter
--

--
-- Visa alla författare med dess ålder och födelseland
--
SELECT
    namn AS 'Namn',
    TIMESTAMPDIFF(YEAR, fodelsedatum, CURDATE()) AS 'Ålder',
    fodelseland AS 'Födelseland'
FROM
    forfattare
WHERE
    fodelseland = 'Sverige'
;

-- 
-- Visa alla författare födda i Sverige
--
SELECT
    *
FROM
    forfattare
WHERE
    fodelseland = 'Sverige'
;

--
-- Visa de böcker som ett förlag har gett ut
--
SELECT 
    u.*,
    GROUP_CONCAT(b.id) AS 'Böcker',
    GROUP_CONCAT(b.titel) AS 'Titlar'
FROM utgivare AS u
    LEFT OUTER JOIN bok AS b
        ON u.id = b.utgivare_id
GROUP BY
    u.id
;

--
-- Visa böckerna och hur de är kategoriserade
--
SELECT 
    b.*,
    GROUP_CONCAT(k.namn) AS 'Kategori' 
FROM bok AS b
    LEFT OUTER JOIN bok2kategori AS b2k
        ON b.id = b2k.bok_id
    LEFT OUTER JOIN kategori AS k
        ON b2k.kategori_id = k.id
GROUP BY
    b.id
;

--
-- Visa böckerna en författare har skrivit
--
SELECT 
    f.*,
    GROUP_CONCAT(b.titel) AS 'Böcker' 
FROM forfattare AS f
    LEFT OUTER JOIN bok2forfattare AS b2f
        ON f.id = b2f.forfattare_id
    LEFT OUTER JOIN bok AS b
        ON b2f.bok_id = b.id
GROUP BY
    f.id
;
