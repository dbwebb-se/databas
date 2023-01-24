SHOW DATABASES;
USE world;
SHOW TABLES;

SHOW COLUMNS FROM city;
SHOW COLUMNS FROM country;
SHOW COLUMNS FROM countrylanguage;

SELECT * FROM city LIMIT 10;
SELECT * FROM country LIMIT 10;
SELECT * FROM countrylanguage LIMIT 10;

-- Detaljer om Sverige
SELECT * FROM country WHERE Name = 'Sweden';
SELECT * FROM country WHERE LocalName = 'Sverige';
SELECT * FROM country WHERE Code = 'SWE';

-- Vilka städer ligger i Sverige
SELECT * FROM city WHERE CountryCode = 'SWE';

-- Vilka språk pratar man i Sverige
SELECT * FROM countrylanguage WHERE CountryCode = 'SWE';
SELECT * FROM countrylanguage WHERE CountryCode = 'SWE' ORDER BY Percentage DESC;

-- Vilken är Sveriges huvudstad?
SELECT
	co.Name AS 'Country',
    ci.Name AS 'Capital'
FROM country AS co
	JOIN city AS ci
		ON ci.ID = co.Capital
WHERE
	-- co.Code = 'SWE'
	-- co.Code IN ('SWE', 'FIN')
    co.Region LIKE 'Nordic%'
;

-- Visa alla nordiska länder med deras huvudstäder samt vilka officiella språk som talas i dessa länder.
SELECT * FROM countrylanguage WHERE CountryCode = 'SWE' ORDER BY Percentage DESC;

SELECT
	co.Name AS 'Country',
    co.LocalName 'Local name',
    ci.Name AS 'Capital',
    COUNT(lang.Language) AS 'Antal språk',
    GROUP_CONCAT(
		CONCAT(lang.Language, ' (', lang.Percentage, ')')
        ORDER BY lang.Percentage DESC
        SEPARATOR ' : '
	) AS 'Language'
FROM country AS co
	JOIN city AS ci
		ON ci.ID = co.Capital
	JOIN countrylanguage AS lang
		ON lang.CountryCode = co.Code
WHERE
	-- co.Code = 'SWE'
	-- Code IN ('SWE', 'FIN')
    co.Region LIKE 'Nordic%'
    -- AND lang.IsOfficial = 'T'
GROUP BY
	co.Name
;
