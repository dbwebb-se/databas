-- Insert data for skolan version 2.
-- By mos for course "XXX".
-- 2017-12-27
--

--
-- Insert teacher staff 
--
DELETE FROM larare2;
INSERT INTO larare2 VALUES
    ("sna", "DIPT", "Severus", "Snape", "M", 40000, "1951-05-01"),
    ("dum", "ADM", "Albus", "Dumbledore", "M", 80000, "1941-04-01"),
    ("min", "DIDD", "Minerva", "McGonagall", "K", 40000, "1955-05-05"),
    ("hag", "ADM", "Hagrid", "Rubeus", "M", 25000, "1986-05-06"),
    ("fil", "ADM", "Argus", "Filch", "M", 25000, "1986-04-06"),
    ("hoc", "DIDD", "Madam", "Hooch", "K", 35000, "1998-04-08"),
    ("gyl", "DIPT", "Gyllenroy", "Lockman", "M", 30000, "1992-05-02"),
    ("ala", "DIPT", "Alastor", "Moody", "M", 30000, "1943-04-03")
;

SELECT * FROM larare2;



--
-- Insert courses
--
DELETE FROM kurs2;
INSERT INTO kurs2 VALUES
    ("AST101", "Astronomi", 5, "G1N"),
    ("SVT101", "Försvar mot svartkonster", 8, "G1N"),
    ("SVT201", "Försvar mot svartkonster", 6, "G1F"),
    ("SVT202", "Försvar mot svartkonster", 6, "G1F"),
    ("SVT401", "Försvar mot svartkonster", 6, "G2F"),
    ("KVA101", "Kvastflygning", 4, "G1N"),
    ("DJU101", "Skötsel och vård av magiska djur", 4, "G1F"),
    ("DRY101", "Trolldryckslära", 6, "G1N"),
    ("DRY102", "Trolldryckslära", 6, "G1F"),
    ("VAN101", "Förvandlingskonst", 5, "G1F"),
    ("MUG101", "Mugglarstudier", 6, "G1F")
;

SELECT * FROM kurs2;



--
-- Insert program
--
-- DELETE FROM program2;
-- INSERT INTO program2
-- SELECT * FROM program2;



--
-- Insert programtillfalle
--
-- CALL nyProgramAntagning('SNÄLL', "2027");
-- SELECT * FROM programtillfalle2;


--
-- Order new courses for the programtillfalle
--
-- CALL nyKursbestallning('SNÄLL2028', 'KVA101', 1);

-- SELECT
-- 	kurskod, lasperiod, status, created
-- FROM kurstillfalle2
-- WHERE programtillfalle = 'SNÄLL2028';



--
-- Approve kurstillfalle and assign kursansvarig
-- 
-- CALL godkannKurstillfalle(1, "mos");
-- SELECT * FROM kurstillfalle2;
