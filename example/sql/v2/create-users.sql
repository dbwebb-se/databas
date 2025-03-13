--
-- Create a dbwebb-user as an alternate root user with
-- backward compatible login.
--
DROP USER IF EXISTS 'dbadm'@'localhost';
DROP USER IF EXISTS 'dbadm'@'%';

CREATE USER 'dbadm'@'localhost'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'dbadm'@'localhost'
WITH GRANT OPTION
;


-- Create the user with access from any host
CREATE USER 'dbadm'@'%'
IDENTIFIED BY 'P@ssw0rd'
;

-- Grant it privileges
GRANT ALL PRIVILEGES
ON *.* TO 'dbadm'@'%'
WITH GRANT OPTION
;

-- Also create user maria
DROP USER IF EXISTS 'maria'@'localhost';
DROP USER IF EXISTS 'maria'@'%';

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


-- Flush the settings so it can be used directly
FLUSH PRIVILEGES;

-- Show users
SELECT User, Host FROM mysql.global_priv ORDER BY host;

