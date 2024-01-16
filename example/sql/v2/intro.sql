--
-- Intro to SQL
--

-- 
-- Create a course database where we can store and work with courses.
-- 


--
-- CREATE/DROP database
--
DROP DATABASE IF EXISTS ladok;
CREATE DATABASE IF NOT EXISTS ladok;

USE ladok;



--
-- CREATE/DROP table
--
DROP TABLE IF EXISTS course;
CREATE TABLE course (
    code CHAR(6) NOT NULL,
    name VARCHAR(80) NOT NULL,
    hp DECIMAL(3,1) NOT NULL DEFAULT 7.5,

    PRIMARY KEY (code)
);



--
-- INSERT rows into the table
--
INSERT INTO course VALUES
    ('DV1605', 'Databasteknologier för webben', 10),
    ('DV1606', 'Databasteknologier för webben', 7.5),
    ('DV1531', 'Programmering och Problemlösning i Python', 7.5)
;



--
-- SELECT to show reports
--
SELECT * FROM course;

SELECT
    * 
FROM course
WHERE 
    hp > 7.5
    OR code = 'DV1531'
    OR name LIKE 'Data%'
ORDER BY code
;

--
-- UPDATE data in the rows
--
UPDATE course SET
    code = 'DV1670'
WHERE
    code = 'DV1531'
;
SELECT * FROM course;



--
-- DELETE rows from table
--
DELETE FROM course WHERE code = 'DV1670';
SELECT * FROM course;

DELETE FROM course;
SELECT * FROM course;



--
-- DROP database
--
DROP DATABASE ladok;
