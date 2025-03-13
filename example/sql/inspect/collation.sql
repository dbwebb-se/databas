--
-- Alter the collation and reload the database backup for eshop
--

ALTER DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci
;

ALTER DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci
;

ALTER DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_uca1400_ai_ci
;

SOURCE me/kmom05/eshop1/sql/eshop/backup.sql
SOURCE me/kmom06/eshop1/sql/eshop/backup.sql

SHOW VARIABLES LIKE 'collation_database';
SOURCE example/sql/list_proc_func_trig.sql
SHOW TABLES;
SELECT * FROM v_proc;
SELECT * FROM v_trig;
