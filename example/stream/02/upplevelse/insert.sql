--
-- Fill scheme with values.
--

--
-- Delete all in a sequence
--
DELETE FROM `episode`;
DELETE FROM `season`;
DELETE FROM `show`;



--
-- Insert shows
--
INSERT INTO `show` (title, description)
VALUES
    ("En stark resa med Morgan & Ola-Conny", "En svensk dokumentärserie som hade premiär på Kanal 5 våren 2012. I serien får man följa Morgan Karlsson och Ola-Conny Wallgren, kända från TV-serien Ullared, på deras resor runt jorden. Serien produceras av Bada Bing.")
;

SET @showId = LAST_INSERT_ID();
SELECT @showId;
SELECT * FROM `show`;


--
-- Insert seasons
--
INSERT INTO `season` (id, title, `show`)
VALUES
	("SE01", "Säsong 1: En stark resa", @showId),
	("SE02", "Säsong 2: En stark resa - igen", @showId)
;

SELECT * FROM `season`;



--
-- Insert episodes
--
SET @seasonId = (SELECT id FROM season WHERE title = "Säsong 1: En stark resa");
SELECT @seasonId;

INSERT INTO episode (season, id, title, aired)
VALUES
	(@seasonId, "E01", "London, Storbritannien", STR_TO_DATE("2 april 2012", "%d %M %Y")),
	(@seasonId, "E02", "Gran Canaria, Spanien", STR_TO_DATE("9 april 2012", "%d %M %Y")),
	(@seasonId, "E03", "Marrakech, Marocko", STR_TO_DATE("16 april 2012", "%d %M %Y")),
	(@seasonId, "E04", "Paris, Frankrike", STR_TO_DATE("23 april 2012", "%d %M %Y")),
	(@seasonId, "E05", "Polen", STR_TO_DATE("30 april 2012", "%d %M %Y")),
	(@seasonId, "E06", "Tokyo, Japan", STR_TO_DATE("7 may 2012", "%d %M %Y")),
	(@seasonId, "E07", "Tokyo & Sydafrika", STR_TO_DATE("14 may 2012", "%d %M %Y")),
	(@seasonId, "E08", "Sydafrika", STR_TO_DATE("21 may 2012", "%d %M %Y"))
;

SELECT * FROM episode;

