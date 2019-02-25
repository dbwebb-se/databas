--
-- Example on functions.
--
DROP TABLE IF EXISTS exam;
CREATE TABLE exam
(
    `acronym` CHAR(4) PRIMARY KEY,
    `score` INTEGER
);

INSERT INTO exam
VALUES
    ('adam', 77),
    ('ubbe', 52),
    ('june', 49),
    ('john', 63),
    ('meta', 97),
    ('siva', 88);

SELECT * FROM exam;



--
-- Function for grading an exam.
--
DROP FUNCTION IF EXISTS grade;
DELIMITER ;;

CREATE FUNCTION grade(
    score INTEGER
)
RETURNS INTEGER
DETERMINISTIC
BEGIN
    RETURN score;
END
;;

DELIMITER ;

SELECT 
    *,
    grade(score) AS 'grade'
FROM exam;



--
-- Function for grading an exam A-F, FX.
--
DROP FUNCTION IF EXISTS grade;
DELIMITER ;;

CREATE FUNCTION grade(
    score INTEGER
)
RETURNS CHAR(2)
DETERMINISTIC
BEGIN
    IF score >= 90 THEN
        RETURN 'A';
    ELSEIF score >= 80 THEN
        RETURN 'B';
    ELSEIF score >= 70 THEN
        RETURN 'C';
    ELSEIF score >= 60 THEN
        RETURN 'D';
    ELSEIF score >= 55 THEN
        RETURN 'E';
    ELSEIF score >= 50 THEN
        RETURN 'FX';
    END IF;
    RETURN 'F';
END
;;

DELIMITER ;

SELECT 
    *,
    grade(score) AS 'grade'
FROM exam
ORDER BY grade;


--
-- Function for grading an exam U, 3-5.
--
DROP FUNCTION IF EXISTS grade2;
DELIMITER ;;

CREATE FUNCTION grade2(
    score INTEGER
)
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
    IF score >= 90 THEN
        RETURN '5';
    ELSEIF score >= 70 THEN
        RETURN '4';
    ELSEIF score >= 55 THEN
        RETURN '3';
    END IF;
    RETURN 'U';
END
;;

DELIMITER ;

SELECT 
    *,
    grade(score) AS 'A-F, FX',
    grade2(score) AS 'U, 3-5'
FROM exam
ORDER BY score DESC;



--
-- Try out functions DETERMINISTIC and NOT DETERMINISTIC
--
DROP FUNCTION IF EXISTS combine;
DELIMITER ;;

CREATE FUNCTION combine (
    str1 VARCHAR(6),
    str2 VARCHAR(6)
)
RETURNS VARCHAR(12)
DETERMINISTIC
BEGIN
    RETURN CONCAT(str1, str2);
END
;;

DELIMITER ;

SELECT combine('Mumin', 'troll');



DROP FUNCTION IF EXISTS time_of_the_day;
DELIMITER ;;

CREATE FUNCTION time_of_the_day()
RETURNS DATETIME
NOT DETERMINISTIC NO SQL
BEGIN
    RETURN NOW();
END
;;

DELIMITER ;

SELECT time_of_the_day();



--
-- Admin
--
SHOW FUNCTION STATUS;
SHOW CREATE FUNCTION grade; 
