--
-- Check the status for users root, dbwebb and user.
--
SELECT
    User,
    Host,
    Grant_priv,
    Super_priv,
    Trigger_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root', 'dbwebb', 'user')
ORDER BY User
;

SHOW VARIABLES LIKE '%version%';

-- https://dbwebb.se/guide/kom-igang-med-sql-i-mysql/importera-fran-excel-till-tabell#fixserver
SELECT 1 AS 'Expected', @@local_infile;

-- https://dbwebb.se/forum/viewtopic.php?f=73&t=8419
SELECT 0 AS 'Expected', @@log_bin_trust_function_creators;

-- https://dbwebb.se/forum/viewtopic.php?f=73&t=8420
SELECT 'ONLY_FULL_GROUP_BY' AS 'Expected', @@GLOBAL.sql_mode;
