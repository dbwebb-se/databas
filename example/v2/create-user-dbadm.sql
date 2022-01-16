--
-- Create a dbwebb-user as an alternate root user with
-- backward compatible login.
--
DROP USER IF EXISTS 'dbadm'@'localhost';

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

-- Flush the settings so it can be used directly
FLUSH PRIVILEGES;
