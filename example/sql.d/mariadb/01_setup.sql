--
-- Setup a user, create a database and grant access for the user
-- to the database.
--

-- Create databases if they do not exists
CREATE DATABASE IF NOT EXISTS eshop;
CREATE DATABASE IF NOT EXISTS skolan;
CREATE DATABASE IF NOT EXISTS dbwebb;

-- Create the users
CREATE USER IF NOT EXISTS 'user'@'%'           IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'user'@'localhost'   IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'dbwebb'@'%'         IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'dbwebb'@'localhost' IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'maria'@'%'          IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'maria'@'localhost'  IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'dbadm'@'%'          IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'dbadm'@'localhost'  IDENTIFIED BY 'pass';

-- Grant the user all privilegies on the database.
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'dbwebb'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'dbwebb'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'maria'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'maria'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'dbadm'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'dbadm'@'localhost';
