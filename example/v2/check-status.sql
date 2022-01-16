--
-- Check the status of the server, useful for debugging.
--

SHOW VARIABLES LIKE '%version%';



-- https://mariadb.com/kb/en/mysqluser-table/
-- https://mariadb.com/kb/en/mysqlglobal_priv-table/
SELECT User, Host FROM mysql.global_priv;

SELECT CONCAT(user, '@', host, ' => ', JSON_DETAILED(priv)) FROM mysql.global_priv;



-- https://dbwebb.se/guide/kom-igang-med-sql-i-mysql/importera-fran-excel-till-tabell#fixserver
SELECT 1 AS 'Expected', @@local_infile;
