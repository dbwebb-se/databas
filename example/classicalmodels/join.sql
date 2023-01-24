SHOW DATABASES;
USE classicalmodels;
SHOW TABLES;

SHOW COLUMNS FROM customers;
SHOW COLUMNS FROM employees;
SHOW COLUMNS FROM offices;

-- Create a list of all employees at a specific office
SELECT * FROM employees;
SELECT * FROM offices;

SELECT
	o.city,
    o.country,
    e.employeeNumber,
    e.jobTitle,
    e.firstName,
    e.lastName
FROM offices AS o
	JOIN employees AS e
		ON o.officeCode = e.officeCode
;


-- Create a report of all employees and their boss
SELECT
	o.city,
    o.country,
    e.employeeNumber,
    e.jobTitle,
    e.firstName,
    e.lastName,
    e.reportsTo,
    CONCAT(boss.jobTitle, ' ', boss.firstName, ' ', boss.lastName) AS 'Boss'
FROM offices AS o
	JOIN employees AS e
		ON o.officeCode = e.officeCode
	JOIN employees AS boss
		ON e.reportsTo = boss.employeeNumber
;



-- Create a report showing how many customers each salesreps have
SELECT * FROM customers;

SELECT
	o.city,
    o.country,
    e.employeeNumber,
    e.jobTitle,
    e.firstName,
    e.lastName,
    COUNT(c.customerName) AS 'Customers'
FROM offices AS o
	JOIN employees AS e
		ON o.officeCode = e.officeCode
	JOIN customers As c
	 	ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY
	o.city -- e.employeeNumber
ORDER BY
	COUNT(c.customerName) DESC -- 'Customers'
;


-- Create a report showing which customer is connected to which office.
-- Which office have the most customers?

