--
-- Check the status for users root, dbwebb and user.
--
SELECT
    User,
    Host,
    Grant_priv,
    Super_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root', 'dbwebb', 'user')
ORDER BY User
;

SHOW VARIABLES LIKE '%version%';

SHOW VARIABLES LIKE 'local_infile';