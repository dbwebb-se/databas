--
-- Insert content into the database.
--
USE dbwebb;



--
-- Delete from all tables.
--
DELETE FROM student2course; 
DELETE FROM student; 
DELETE FROM course; 



--
-- Add some students.
--
INSERT INTO student
    (acronym, name)
VALUES
    ('mos', 'Mikael Roos'),
    ('lew', 'Kenneth Lewenhagen'),
    ('zeldah', 'Andreas Arnesson'),
    ('efo', 'Emil Folino'),
    ('doe', 'John/Jane Doe')
;



--
-- Add some courses.
--
INSERT INTO course 
    (code, name, nick, points)
VALUES
    ('PA1439', 'Webbteknologier', 'htmlphp', 7.5),
    ('PA1436', 'Teknisk webbdesign', 'design', 7.5),
    ('DV1606', 'Databasteknologier', 'databas', 7.5),
    ('DV1608', 'Objektorienterade webbteknologier', 'oophp', 7.5)
;



--
-- Adding students to courses, with grades if there exists such.
--
INSERT INTO student2course
    (acronym, code, grade)
VALUES
    ('mos', 'PA1439', 'F'),
    ('mos', 'PA1436', NULL),
    ('mos', 'DV1606', 'F'),
    ('lew', 'PA1439', 'A'),
    ('lew', 'DV1606', 'E'),
    ('zeldah', 'PA1439', 'B'),
    ('zeldah', 'PA1436', 'D'),
    ('efo', 'PA1436', 'C'),
    ('efo', 'DV1606', 'C')
;
