--
-- Show off subquery, inner and outer join
--

USE dbwebb;

--
-- Show details from tables
--
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student2course;


--
-- Report, show grades from each course
--
SELECT
	s.acronym,
    s.name AS 'studname',
    c.*,
    sc.grade
FROM student as s
	JOIN student2course AS sc
		ON s.acronym = sc.acronym
	JOIN course as c
		ON c.code = sc.code
;

-- Make view to make it easier to make reports
DROP VIEW IF EXISTS v_report;

CREATE VIEW v_report
AS
SELECT
	s.acronym,
    s.name AS 'studname',
    c.*,
    sc.grade
FROM student as s
	JOIN student2course AS sc
		ON s.acronym = sc.acronym
	JOIN course as c
		ON c.code = sc.code
;

SELECT * FROM v_report;
SELECT * FROM v_report WHERE nick = 'databas';
SELECT * FROM v_report WHERE acronym = 'mos';



--
-- Why does mos have NULL on course design?
--
SELECT * FROM student2course WHERE acronym = 'mos';

UPDATE student2course SET 
	grade = 'C'
WHERE
	acronym = 'mos'
    AND code = 'PA1436'
;

UPDATE student2course SET 
	grade = NULL
WHERE
	acronym = 'mos'
    AND code = 'PA1436'
;



--
-- Subquery, en fråga i en fråga
--

-- Visa alla studenter som deltar i kursen databas
SELECT * FROM student2course;

-- Hur får jag tag på 'databas' och vilken kurskod det motsvarar?
SELECT * FROM course;
SELECT code FROM course WHERE nick = 'databas';

-- Hur slår jag ihop ovan två satser?
SELECT
	acronym
FROM student2course
WHERE
	code = (SELECT code FROM course WHERE nick = 'databas')
;

-- Om subqueryn returnerar ett resultset med fler än en träff?
SELECT DISTINCT
	acronym
FROM student2course
WHERE
	code IN (SELECT code FROM course WHERE nick LIKE 'd%')
;



--
-- OUTER JOIN, visa rader som inte matchar 
--
SELECT * FROM v_report;

SELECT
	s.acronym,
    s.name AS 'studname',
    c.*,
    sc.grade
FROM student as s
	JOIN student2course AS sc
		ON s.acronym = sc.acronym
	JOIN course as c
		ON c.code = sc.code
;

--
-- Finns det studenter som inte har något betyg?
-- Studenter som inte deltar i någon kurs?
--
SELECT
	s.*,
    sc.grade
FROM student as s
	JOIN student2course AS sc
		ON s.acronym = sc.acronym
;

SELECT
	s.*,
    sc.grade
FROM student as s
	LEFT OUTER JOIN student2course AS sc
		ON s.acronym = sc.acronym
;



--
-- Finns det kurser som inte har någon deltagande student?
--
SELECT
	c.*,
    sc.grade
FROM course AS c
	JOIN student2course AS sc
		ON c.code = sc.code
;

SELECT
	c.*,
    sc.grade
FROM course AS c
	LEFT OUTER JOIN student2course AS sc
		ON c.code = sc.code
;
