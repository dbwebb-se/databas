--
-- https://dbwebb.se/kunskap/index-och-prestanda-i-mysql
-- Example
-- 

--
-- Drop tables in order.
--
DROP TABLE IF EXISTS `ProgramPlan`;
DROP TABLE IF EXISTS `Program`;



--
-- Program
--
CREATE TABLE `Program`
(
    `code` CHAR(5),
    `name` VARCHAR(60),
    
    PRIMARY KEY (`code`)
);

DELETE FROM Program;
INSERT INTO Program
VALUES
    ("PAGWE", "Webbprogrammering 180"),
    ("PAGWG", "Webbprogrammering 120"),
    ("PAGPT", "Software Engineering"),
    ("PAGIS", "International Software Engineering")
;

SELECT * FROM Program;



--
-- ProgramPlan
-- A Program can have many courses, a course can be on many programs.
--
CREATE TABLE `ProgramPlan`
(
    `codeProgram` CHAR(5),
    `codeCourse` CHAR(6),

    PRIMARY KEY (`codeProgram`, `codeCourse`),
    FOREIGN KEY `fk_codeProgram` (`codeProgram`) REFERENCES `Program` (`code`),
    FOREIGN KEY `fk_codeCourse` (`codeCourse`) REFERENCES `Course` (`code`)
);

DELETE FROM ProgramPlan;
INSERT INTO ProgramPlan
VALUES
    ("PAGPT", "PA1444"),
    ("PAGIS", "PA1444"),
    ("PAGWE", "DV1531"),
    ("PAGWE", "PA1439"),
    ("PAGWE", "DV1561"),
    ("PAGWE", "PA1436"),
    ("PAGWG", "DV1531"),
    ("PAGWG", "PA1439"),
    ("PAGWG", "DV1561"),
    ("PAGWG", "PA1436")
;


SELECT * FROM ProgramPlan;



--
-- Join
--
SELECT
    P.name AS Program,
    C.nick AS Nick,
    C.points AS Points
FROM Program AS P
    INNER JOIN ProgramPlan AS PP
        ON P.code = PP.codeProgram
    INNER JOIN Course AS C
        ON C.code = PP.codeCourse
;
