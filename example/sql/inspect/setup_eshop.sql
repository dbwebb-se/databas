--
-- dangerous area, ask mos
-- Add collations in 11.7 to be more backward compatible with older backups.
--
DROP DATABASE IF EXISTS eshop;
CREATE DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci
;
