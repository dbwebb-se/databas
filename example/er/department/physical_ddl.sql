--
-- DDL
--

--
-- Create the database
--
DROP DATABASE IF EXISTS er_department;
CREATE DATABASE er_department;
USE er_department;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Drop all tables, order matters
--
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;



--
--
--
CREATE TABLE department (
    name VARCHAR(20),
    nick CHAR(4) NOT NULL,
    
    PRIMARY KEY (nick)
);



--
--
--
CREATE TABLE employee (
    id INT NOT NULL,
    name VARCHAR(20),
    dep_nick CHAR(4),
    
    PRIMARY KEY (id),
    FOREIGN KEY (dep_nick) REFERENCES department(nick)
);



--
--
--
CREATE TABLE manager (
    emp_id INT,
    dep_nick CHAR(4),
    
    PRIMARY KEY (dep_nick),
    FOREIGN KEY (emp_id) REFERENCES employee(id),
    FOREIGN KEY (dep_nick) REFERENCES department(nick) 
);
