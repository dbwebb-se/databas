--
-- Start investigate the world database.
--
SHOW TABLES;
SHOW CREATE TABLE country \G;



--
-- Show countries ordered by highest life expectancy.
--
SELECT
    Code,
    Name,
    Population,
    LifeExpectancy
FROM country
ORDER BY
    LifeExpectancy DESC
LIMIT 10
;



--
-- Show countries ordered by lowest life expectancy.
--
SELECT
    Code,
    Name,
    Population,
    Region,
    LifeExpectancy
FROM country
WHERE
    Population > 10000
    AND LifeExpectancy IS NOT NULL
ORDER BY
    LifeExpectancy ASC
LIMIT 10
;



--
-- What is the capital of the countrys having the country code 'SW%'?
-- Make a report showing the name of the country and the name of the capital.
--
SELECT
    Code,
    Name,
    Continent,
    Region,
    Capital
FROM country
WHERE
    Code LIKE 'SW%'
;

SELECT
    ID,
    Name,
    CountryCode
FROM city
WHERE
    CountryCode LIKE 'SW%'
;

SELECT
    co.Code AS 'Country code',
    co.Name AS 'Country',
    ci.Name AS 'Capital'
FROM country AS co
INNER JOIN city AS ci
    ON co.Capital = ci.ID
WHERE
    co.Code LIKE 'SW%'
;