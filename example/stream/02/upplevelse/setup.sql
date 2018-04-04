--
-- Create the database for the example.
--

DROP DATABASE IF EXISTS imdb;
CREATE DATABASE imdb;

GRANT ALL ON imdb.* TO user@localhost IDENTIFIED BY "pass";
