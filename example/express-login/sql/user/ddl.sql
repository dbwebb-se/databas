--
-- Basic user table with password created in the database.
--

--
-- User table
--
DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    akronym CHAR(8),
    password CHAR(32),

    PRIMARY KEY (akronym)
);

INSERT INTO user VALUES
	("doe", MD5("doe")),
	("admin", MD5("admin"))
;


--
-- SP to login
--
DROP PROCEDURE IF EXISTS loginUser;
DELIMITER //
CREATE PROCEDURE loginUser(
	aUsername CHAR(8),
    aPassword CHAR(32)
)
BEGIN
    SELECT
		akronym AS acronym
    FROM user
    WHERE
		akronym = aUsername
        AND password = MD5(aPassword)
    ;
END
//
DELIMITER ;

CALL loginUser("doe", "doe");
