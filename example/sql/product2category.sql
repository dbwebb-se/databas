--
-- Examples how to deal with product2category
--
-- product
-- 
-- | id | name  | price |
-- |----|-------|-------|
-- | p1 | Apple |  42.0 |
-- | p2 | Pear  |  39.0 |
-- 
-- category
-- 
-- | id    |
-- |-------|
-- | green |
-- | red   |
-- | fruit |
-- 
-- product2category
-- 
-- | pid   | cid   |
-- |-------|-------|
-- | p1    | red   |
-- | p1    | fruit |
-- | p2    | green |
-- | p2    | fruit |
-- 


--
-- CASE 1 without AUTO_INCREMENT
--
DROP TABLE product2category;
DROP TABLE category;
DROP TABLE product;

CREATE TABLE product (
    id CHAR(2) PRIMARY KEY,
    name CHAR(5),
    price DECIMAL(3,1)
);

CREATE TABLE category (
    id CHAR(5) PRIMARY KEY
);

CREATE TABLE product2category (
    pid CHAR(2),
    cid CHAR(5),

    PRIMARY KEY (pid, cid),

    FOREIGN KEY (pid) REFERENCES product(id),
    FOREIGN KEY (cid) REFERENCES category(id)
);

-- LOAD DATA
INSERT INTO product VALUES
    ('p1', 'Apple', 42.0),
    ('p2', 'Pear', 39.0)
;

INSERT INTO category VALUES
    ('green'), ('red'), ('fruit')
;

INSERT INTO product2category VALUES
    ('p1', 'red'),
    ('p1', 'fruit'),
    ('p2', 'green'),
    ('p2', 'fruit')
;

-- JOIN
SELECT
    p.*,
    c.id
FROM product AS p
    JOIN product2category AS p2c
        ON p.id = p2c.pid
    JOIN category AS c
        ON c.id = p2c.cid
;

SELECT
    p.*,
    GROUP_CONCAT(c.id) AS 'category' 
FROM product AS p
    JOIN product2category AS p2c
        ON p.id = p2c.pid
    JOIN category AS c
        ON c.id = p2c.cid
GROUP BY
    p.id
;



--
-- CASE 2 with AUTO_INCREMENT
--
-- product
-- 
-- | id | name  | price |
-- |----|-------|-------|
-- | 1  | Apple |  42.0 |
-- | 2  | Pear  |  39.0 |
-- 
-- category
-- 
-- | id    | label |
-- |-------|-------|
-- | 1     | green |
-- | 2     | red   |
-- | 3     | fruit |
-- 
-- product2category
-- 
-- | pid   | cid   |
-- |-------|-------|
-- | 1     | 2     |
-- | 1     | 3     |
-- | 2     | 1     |
-- | 2     | 3     |


DROP TABLE product2category;
DROP TABLE category;
DROP TABLE product;

CREATE TABLE product (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name CHAR(5),
    price DECIMAL(3,1)
);

CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    label CHAR(5)
);

CREATE TABLE product2category (
    pid INTEGER,
    cid INTEGER,

    PRIMARY KEY (pid, cid),

    FOREIGN KEY (pid) REFERENCES product(id),
    FOREIGN KEY (cid) REFERENCES category(id)
);

-- LOAD DATA
INSERT INTO product VALUES
    (1, 'Apple', 42.0),
    (2, 'Pear', 39.0)
;

INSERT INTO category VALUES
    (1, 'green'),
    (2, 'red'),
    (3, 'fruit')
;

INSERT INTO product2category VALUES
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3)
;

-- JOIN
SELECT
    p.*,
    c.label AS category
FROM product AS p
    JOIN product2category AS p2c
        ON p.id = p2c.pid
    JOIN category AS c
        ON c.id = p2c.cid
;

SELECT
    p.*,
    GROUP_CONCAT(c.label) AS 'category' 
FROM product AS p
    JOIN product2category AS p2c
        ON p.id = p2c.pid
    JOIN category AS c
        ON c.id = p2c.cid
GROUP BY
    p.id
;


--
-- TEST USE LOAD DATA LOCAL INFILE with AUTO_INCREMENT
--
DELETE FROM product2category;
DELETE FROM category;
DELETE FROM product;

LOAD DATA LOCAL INFILE 'product_with_id.csv'
INTO TABLE product
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM product;
