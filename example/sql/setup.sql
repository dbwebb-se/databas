--
-- Create a sample database useful for testing.
--
CREATE DATABASE IF NOT EXISTS dbwebb;
GRANT ALL ON dbwebb.* TO user@localhos IDENTIFIED BY 'pass';

USE dbwebb;
SHOW DATABASES LIKE 'dbwebb';
SHOW TABLES;
