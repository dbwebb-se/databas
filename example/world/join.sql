SHOW DATABASES;
USE world;
SHOW TABLES;
-- SHOW CREATE TABLE city \G;
SHOW COLUMNS FROM city;
SHOW COLUMNS FROM country;
SHOW COLUMNS FROM countrylanguage;

SELECT * FROM city LIMIT 10;
SELECT * FROM country LIMIT 10;
SELECT * FROM countrylanguage LIMIT 10;

-- What are the languages spoken in Sweden?
SELECT * FROM countrylanguage WHERE CountryCode = 'SWE' ORDER BY Percentage DESC;

-- Which are the largest cities in Sweden, by population?
SELECT * FROM city WHERE CountryCode = 'SWE';

-- What is the details on Sweden?
SELECT * FROM country WHERE Code = 'SWE';

-- What is the capital of Sweden?
SELECT Code, Name, Capital FROM country WHERE Code = 'SWE';

-- Make a report with the countries and capitals for the nordic countries.
SELECT
	co.Name,
    ci.Name
FROM country AS co
	INNER JOIN city AS ci
		ON co.Capital = ci.ID
WHERE
	-- Code = 'SWE',
    -- Code IN ('SWE', 'FIN')
    Region LIKE 'Nordic%'
;

-- Include the spoken languages in each country
-- Count how many they are, GROUP
-- Include only official languages
-- Use GROUP_CONCAT
SELECT
	co.Name,
    ci.Name,
	COUNT(lang.language),
    GROUP_CONCAT(lang.language)
FROM country AS co
	INNER JOIN city AS ci
		ON co.Capital = ci.ID
	INNER JOIN countrylanguage AS lang
		ON lang.CountryCode = co.Code
WHERE
	-- Code = 'SWE',
    -- Code IN ('SWE', 'FIN')
    Region LIKE 'Nordic%'
    AND lang.IsOfficial = 'T' -- 'T' 'F'
GROUP BY
	co.Name
;

-- Create a view of the tripple join
DROP VIEW v_country;
CREATE VIEW v_country AS
SELECT
	co.Name AS 'Country',
    ci.Name AS 'City',
	COUNT(lang.language),
    GROUP_CONCAT(lang.language)
FROM country AS co
	INNER JOIN city AS ci
		ON co.Capital = ci.ID
	INNER JOIN countrylanguage AS lang
		ON lang.CountryCode = co.Code
WHERE
	-- Code = 'SWE',
    -- Code IN ('SWE', 'FIN')
    Region LIKE 'Nordic%'
    AND lang.IsOfficial = 'T' -- 'T' 'F'
GROUP BY
	co.Name
;

SELECT * FROM v_country;

-- BUILT IN FUNCTIONS
-- HAVING
-- UNION
