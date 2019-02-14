--
-- Create users for inspect
--
ALTER USER 'dbwebb'@'%'
IDENTIFIED
WITH mysql_native_password
BY 'password'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'dbwebb'@'%'
WITH GRANT OPTION
;

ALTER USER 'user'@'%'
IDENTIFIED
WITH mysql_native_password
BY 'pass'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'user'@'%'
;
