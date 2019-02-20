--
-- Sample for working with a log table for transaction logs
--
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(100)
);

INSERT INTO `log`
    (`what`)
VALUES
    ("Moped 1"),
    ("Moped 2")
;

SELECT * FROM `log`;



--
-- Create a SP to get the results from the log
--
DROP PROCEDURE IF EXISTS get_log_entries;
DELIMITER ;;

CREATE PROCEDURE get_log_entries()
BEGIN
    SELECT * FROM `log`;
    SELECT COUNT(id) AS total FROM `log`;
END;;

DELIMITER ;

CALL get_log_entries();
