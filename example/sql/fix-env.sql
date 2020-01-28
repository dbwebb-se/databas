--
-- Fix some common issues.
--

-- https://dbwebb.se/guide/kom-igang-med-sql-i-mysql/importera-fran-excel-till-tabell#fixserver
SET GLOBAL local_infile = 1;
SELECT 1 AS 'Expected', @@local_infile;

-- https://dbwebb.se/forum/viewtopic.php?f=73&t=8419
SET GLOBAL log_bin_trust_function_creators = 0;
SELECT 0 AS 'Expected', @@log_bin_trust_function_creators;

-- https://dbwebb.se/forum/viewtopic.php?f=73&t=8420
SET @@GLOBAL.sql_mode=(SELECT CONCAT(@@sql_mode,',ONLY_FULL_GROUP_BY'));
SELECT 'ONLY_FULL_GROUP_BY' AS 'Expected', @@GLOBAL.sql_mode;
