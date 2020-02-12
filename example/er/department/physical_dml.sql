--
-- Insert
--
USE er_department;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Show all
--
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM manager;



--
-- Show all employee and their department
-- inner join
--
SELECT
    d.name AS "Department",
    d.nick AS "Dep nick",
    e.name AS "Name",
    e.id AS "Id"
FROM employee AS e
JOIN department AS d
    ON e.dep_nick = d.nick
;

-- outer join
SELECT
    d.name AS "Department",
    d.nick AS "Dep nick",
    e.name AS "Name",
    e.id AS "Id"
FROM employee AS e
RIGHT OUTER JOIN department AS d
    ON e.dep_nick = d.nick
;



--
-- Show manager id
--
SELECT
    d.name AS "Department",
    d.nick AS "Dep nick",
    m.emp_id AS "Manager",
    e.name AS "Name",
    e.id AS "Id"
FROM employee AS e
RIGHT OUTER JOIN department AS d
    ON e.dep_nick = d.nick
JOIN manager AS m
    ON m.dep_nick = d.nick
;



--
-- Show manager id, name
--

-- as subquery
SELECT
    d.name AS "Department",
    d.nick AS "Dep nick",
    m.emp_id AS "Manager",
    (SELECT name FROM employee WHERE id = m.emp_id) AS "Manager",
    e.name AS "Name",
    e.id AS "Id"
FROM employee AS e
RIGHT OUTER JOIN department AS d
    ON e.dep_nick = d.nick
JOIN manager AS m
    ON m.dep_nick = d.nick
;

-- as join
SELECT
    d.name AS "Department",
    d.nick AS "Dep nick",
    m.emp_id AS "Manager",
    e2.name AS "Manager",
    e.name AS "Name",
    e.id AS "Id"
FROM employee AS e
RIGHT OUTER JOIN department AS d
    ON e.dep_nick = d.nick
JOIN manager AS m
    ON m.dep_nick = d.nick
JOIN employee As e2
    ON e2.id = m.emp_id
;
