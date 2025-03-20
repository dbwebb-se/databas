--
-- dangerous area, ask mos
-- Add collations in 11.7 to be more backward compatible with older backups.
--
DROP DATABASE IF EXISTS eshop;
CREATE DATABASE eshop
--    CHARACTER SET utf8mb4
--    COLLATE utf8mb4_unicode_ci
;

-- NOT FIXED

-- FIXED
-- 11.6.2 utf8mb4_general_ci osx10.20 (arm64)
--                           osx10.19 (arm64)

-- 10.6.18 utf8mb4_general_ci debian-linux-gnu
-- 10.11.8 utf8mb4_general_ci debian-linux-gnu
-- 11.4.0  utf8mb4_general_ci debian-linux-gnu
-- 11.6.2 works
