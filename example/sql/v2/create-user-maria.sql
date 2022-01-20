--
-- Create a user with full grants.
--
DROP USER IF EXISTS 'maria'@'localhost';

CREATE USER 'maria'@'localhost'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'maria'@'localhost'
WITH GRANT OPTION
;

CREATE USER 'maria'@'%'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'maria'@'%'
WITH GRANT OPTION
;

FLUSH PRIVILEGES;

SELECT USER();

SHOW GRANTS;
