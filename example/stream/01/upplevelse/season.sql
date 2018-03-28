-- 
-- mos file
--
DROP TABLE IF EXISTS season;
CREATE TABLE season
(
	seasonId CHAR(4),
	-- seasonDescription VARCHAR(40),
    episodeId CHAR(3),
    description VARCHAR(40),
    aired DATE
)
;

DROP TABLE IF EXISTS seasonDetails;
CREATE TABLE seasonDetails
(
	seasonId CHAR(4),
	seasonDescription VARCHAR(40)
)
;

INSERT INTO seasonDetails VALUES
("SE01", "Säsong 1: En stark resa"),
("SE02", "Säsong 2: En stark resa - igen")
;

SELECT * FROM seasonDetails;


-- Säsong 1: En stark resa

-- INSERT INTO season VALUES
-- ("SE01", "E01", "London, Storbritannien", STR_TO_DATE("2 april 2012", "%d %M %Y"))
-- ;

INSERT INTO season VALUES
("SE01", "E01", "London, Storbritannien", STR_TO_DATE("2 april 2012", "%d %M %Y")),
("SE01", "E02", "Gran Canaria, Spanien", STR_TO_DATE("9 april 2012", "%d %M %Y")),
("SE01", "E03", "Marrakech, Marocko", STR_TO_DATE("16 april 2012", "%d %M %Y")),
("SE01", "E04", "Paris, Frankrike", STR_TO_DATE("23 april 2012", "%d %M %Y")),
("SE01", "E05", "Polen", STR_TO_DATE("30 april 2012", "%d %M %Y")),
("SE01", "E06", "Tokyo, Japan", STR_TO_DATE("7 may 2012", "%d %M %Y")),
("SE01", "E07", "Tokyo & Sydafrika", STR_TO_DATE("14 may 2012", "%d %M %Y")),
("SE01", "E08", "Sydafrika", STR_TO_DATE("21 may 2012", "%d %M %Y"))
-- (NULL, "E00", "Säsong 1: En stark resa", NULL)
;

SELECT * FROM season;
SELECT * FROM seasonDetails;

SELECT
	*
FROM season AS s, seasonDetails AS sd
WHERE
	s.seasonId = sd.seasonId
;

SELECT
	CONCAT(sd.seasonDescription, " (", s.seasonId, ")") AS Titel,
    s.episodeId AS Avsnitt,
    s.description AS Beskrivning,
    s.aired AS "Sänd datum"
FROM season AS s
	INNER JOIN seasonDetails AS sd
		ON s.seasonId = sd.seasonId
;

