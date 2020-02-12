--
-- DDL
--

--
-- Create the database
--
DROP DATABASE IF EXISTS er_library;
CREATE DATABASE er_library;
USE er_library;
SELECT "Database is 'er_library'" AS Message;



--
-- Drop all tables, order matters
--
DROP TABLE IF EXISTS book2word;
DROP TABLE IF EXISTS book2author;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS fine;
DROP TABLE IF EXISTS loan;

-- leafs
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS headword;



--
--
--
CREATE TABLE book (
    id INT AUTO_INCREMENT,
    isbn CHAR(10),
    publisher VARCHAR(40),

    PRIMARY KEY (id)
);

--
--
--
CREATE TABLE headword (
    id INT AUTO_INCREMENT,
    word VARCHAR(20),
    
    PRIMARY KEY (id)
);



--
--
--
CREATE TABLE book2word (
    book_id INT,
    word_id INT,
    
    PRIMARY KEY (book_id, word_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (word_id) REFERENCES headword(id)
);



--
--
--
CREATE TABLE author (
    id INT,
    name VARCHAR(20),
    country VARCHAR(20),
    
    PRIMARY KEY (id)
);



--
--
--
CREATE TABLE book2author (
    book_id INT,
    author_id INT,

    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);



--
--
--
CREATE TABLE reservation (
    name VARCHAR(20),
    phone VARCHAR(20),
    book_id INT,
    
    PRIMARY KEY (book_id, phone)
);



--
--
--
CREATE TABLE loan (
    id INT AUTO_INCREMENT,
    book_id INT,
    customer_id INT,
    start_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_ts TIMESTAMP DEFAULT NULL,
    
    PRIMARY KEY (id)
    -- PRIMARY KEY (book_id, customer_id),
    -- FOREIGN KEY book_id REFERENCES book(id),
    -- FOREIGN KEY customer_id REFERENCES customer(id)
);



--
--
--
CREATE TABLE customer (
    id INT,
    name VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(20),
    
    PRIMARY KEY (id)
);



--
--
--
CREATE TABLE fine (
    id INT AUTO_INCREMENT,
    loan_id INT,
    amount INT,
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id)
);
