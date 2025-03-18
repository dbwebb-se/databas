--
-- dangerous area, ask mos
-- Add default collation to support reading backupfiles from older versions of
--
DROP DATABASE IF EXISTS eshop;
CREATE DATABASE eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci
;
