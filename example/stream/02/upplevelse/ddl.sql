-- 
-- Step two of displaying an example of an exam task for the course.
-- DDL to create scheme.
--

-- USE imdb;

--
-- Dropp all tables in correct order
--
DROP TABLE IF EXISTS episode;
DROP TABLE IF EXISTS season;
DROP TABLE IF EXISTS `show`;


--
-- Table show, general details of an tv show or serie.
--
CREATE TABLE `show`
(
	id INT AUTO_INCREMENT,
	title VARCHAR(40),
	description TEXT,
    
    PRIMARY KEY (id)
)
;

-- 1 "En stark resa med Morgan & Ola-Conny" "En svensk dokumentärserie som hade premiär på Kanal 5 våren 2012. I serien får man följa Morgan Karlsson och Ola-Conny Wallgren, kända från TV-serien Ullared, på deras resor runt jorden. Serien produceras av Bada Bing."



--
-- Create table for seasons of an show.
--
CREATE TABLE season
(
	id CHAR(4),
	title VARCHAR(40),
    `show` INT,

	PRIMARY KEY (id),
    FOREIGN KEY (`show`) REFERENCES `show`(id)
)
;

-- ("SE01", "Säsong 1: En stark resa", 1),
-- ("SE02", "Säsong 2: En stark resa - igen", 1)



--
-- Create table for episodes
--
CREATE TABLE episode
(
	id CHAR(3),
	title VARCHAR(40),
    aired DATE,
    season CHAR(4),
    
    PRIMARY KEY (id),
    FOREIGN KEY (season) REFERENCES season(id)
)
;
