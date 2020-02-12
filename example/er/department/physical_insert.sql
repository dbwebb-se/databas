--
-- Insert
--
USE er_department;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Delete from all tables, order matters
--
DELETE FROM manager;
DELETE FROM employee;
DELETE FROM department;



--
--
--
INSERT INTO department
    (nick, name)
VALUES
    ("DEPA", "Department A"),
    ("DEPB", "Department B"),
    ("DEPC", "Department C")
;



--
--
--
INSERT INTO employee
    (id, dep_nick, name)
VALUES
    (1, "DEPA", "Name A"),
    (2, "DEPA", "Name B"),
    (3, "DEPA", "Name C"),
    (4, "DEPB", "Name D")
;



--
--
--
INSERT INTO manager
    (emp_id, dep_nick)
VALUES
    (3, "DEPA"),
    (4, "DEPB"),
    (3, "DEPC")
;
