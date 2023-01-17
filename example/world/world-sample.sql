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
