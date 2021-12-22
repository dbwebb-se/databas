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
    User IN ('root', 'dbadm', 'user')
ORDER BY User
;

SHOW VARIABLES LIKE '%version%';

-- https://dbwebb.se/guide/kom-igang-med-sql-i-mysql/importera-fran-excel-till-tabell#fixserver
SELECT 1 AS 'Expected', @@local_infile;
