SHOW DATABASES;
USE world;
SHOW TABLES;

SELECT * FROM city;
SELECT * FROM country;

--
SELECT
	Name,
    Code,
    Continent,
    Population,
    LifeExpectancy,
    Capital
FROM country
WHERE
	Name LIKE 'Sw%'
ORDER BY
	LifeExpectancy DESC, Population DESC
;

--
SELECT
	*
FROM city
WHERE 
	-- CountryCode LIKE 'SW%'
	ID IN (3048, 3248, 3244)
;

-- JOIN
SELECT
	co.`Code`,
    co.`Name`,
    co.Continent,
    co.Population,
    co.LifeExpectancy,
    -- co.Capital,
    -- ci.ID,
    ci.Name,
    ci.Population
FROM country AS co
INNER JOIN city AS ci
	ON co.Capital = ci.ID
WHERE
	co.Name LIKE 'Sw%'
;
