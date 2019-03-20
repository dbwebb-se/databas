--
-- SQL to create a funktion user_status for the table in user_timestamp.sql.
-- https://dbwebb.se/coachen/anvand-timestamp-for-status-i-databastabellen
--

--
-- Step 1, just a function that returns something
--
DROP FUNCTION IF EXISTS user_status;
DELIMITER ;;

CREATE FUNCTION user_status()
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
    RETURN 'mumintroll';
END
;;

DELIMITER ;

SELECT
    CONCAT(`name`, ' (', `acronym`, ')') AS User,
    user_status() AS Status
FROM user;



--
-- Step 2, take all timestamps as parameters and return "created" or "updated".
--
DROP FUNCTION IF EXISTS user_status;
DELIMITER ;;

CREATE FUNCTION user_status(
    a_created TIMESTAMP,
    a_updated TIMESTAMP,
    a_activated TIMESTAMP,
    a_deleted TIMESTAMP
)
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
    IF a_updated IS NOT NULL THEN
        RETURN 'updated';
    ELSEIF a_created IS NOT NULL THEN
        RETURN 'created';
    END IF;
    RETURN 'unknown';
END
;;

DELIMITER ;

SELECT
    CONCAT(`name`, ' (', `acronym`, ')') AS User,
    user_status(created, updated, activated, deleted) AS Status
FROM user;
