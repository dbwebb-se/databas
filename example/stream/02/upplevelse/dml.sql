--
-- DML for reports and manipulating data
--

SELECT * FROM `show`;
SELECT * FROM `season`;
SELECT * FROM `episode`;

--
-- Join two tables
--
SELECT
	*
FROM `show` AS s
	JOIN `season`AS se
		ON s.id = se.`show`
;



--
-- Join the other two tables
--
SELECT
	*
FROM `season` AS se
	JOIN `episode`AS e
		ON se.id = e.season
;



--
-- Join all three tables
--
SELECT
	*
FROM `show` AS s
	JOIN `season`AS se
		ON s.id = se.`show`
	JOIN `episode`AS e
		ON se.id = e.season
;



--
-- Search all three tables
--
SET @search = "%may%";

SELECT
	*
FROM `show` AS s
	JOIN `season`AS se
		ON s.id = se.`show`
	JOIN `episode`AS e
		ON se.id = e.season
WHERE
	0
    OR e.id LIKE @search
	OR e.title LIKE @search
	OR DATE_FORMAT(e.aired, "%Y %M %d") LIKE @search
;
