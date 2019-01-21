--
-- Create a user user:pass with backward compatible login.
--
DROP USER IF EXISTS 'user'@'%';

CREATE USER 'user'@'%'
IDENTIFIED
-- WITH mysql_native_password -- Only MySQL > 8.0.4
BY 'pass'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'user'@'%'
;
