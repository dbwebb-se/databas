SHOW DATABASES;
USE classicmodels;
SHOW TABLES;

SHOW COLUMNS FROM customers;
SHOW COLUMNS FROM orders;
SHOW COLUMNS FROM orderdetails;
SHOW COLUMNS FROM products;

-- Count number of orders from each customer
-- Include the customers that have zero orders (OUTER)
SELECT * FROM customers;
SELECT * FROM orders;
SELECT
	c.customerNumber,
    c.customerName,
    c.city,
    o.orderNumber,
    o.orderDate,
    o.status,
    COUNT(o.status)
FROM customers AS c
	LEFT OUTER JOIN orders AS o
		ON c.customerNumber = o.customerNumber
GROUP BY 
	c.customerNumber, o.status
ORDER BY
	COUNT(o.status) ASC, c.customerName
;



--
-- Show all products in a specific order
-- Sum the cost on each order row
-- Sum the total order
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;
SELECT
	o.orderNumber,
    o.orderDate,
    o.status,
    o.customerNumber,
    d.productCode,
    p.productName,
	d.priceEach,
    d.quantityOrdered,
	ROUND(d.priceEach * d.quantityOrdered, 2) AS 'Sum',
    SUM(d.priceEach * d.quantityOrdered) AS TOTAL

FROM orders AS o
	JOIN orderdetails AS d
		ON o.orderNumber = d.orderNumber
	JOIN products AS p
		ON d.productCode = p.productCode
WHERE
	-- o.orderNumber IN (10100, 10101, 10223)
    -- o.customerNumber IN (198, 204, 379)
    o.customerNumber IN (SELECT customerNumber FROM customers WHERE city = 'Brickhaven')
    
GROUP BY
	o.orderNumber
;

SELECT customerNumber FROM customers WHERE city = 'Brickhaven';
