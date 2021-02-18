--
-- Example stored procedures, from slides
--

--
DROP PROCEDURE IF EXISTS small_proc;

DELIMITER ;;
CREATE PROCEDURE small_proc ()
BEGIN
    SELECT NOW() AS "Current time";
END;;
DELIMITER ;

CALL small_proc();



--
--
--
DROP PROCEDURE IF EXISTS test_proc;

DELIMITER ;;
CREATE PROCEDURE test_proc ()
BEGIN
    DECLARE a_balance INT DEFAULT 7;

    IF a_balance < 0 THEN
        SELECT 'A';
    ELSEIF a_balance < 3 THEN
        SELECT 'B';
    ELSE
        SELECT 'C';
    END IF;
END;;
DELIMITER ;

CALL test_proc(); -- Ger resultset med 'C'



--
--
--
DROP PROCEDURE IF EXISTS test_proc;

DELIMITER ;;
CREATE PROCEDURE test_proc (
    p_balance INT
)
BEGIN
    IF p_balance < 0 THEN
        SELECT 'A';
    ELSEIF p_balance < 3 THEN
        SELECT 'B';
    ELSE
        SELECT 'C';
    END IF;
END;;
DELIMITER ;

CALL test_proc(-1); -- 'A'
CALL test_proc(1);  -- 'B'
CALL test_proc(7);  -- 'C'



--
--
--
DROP PROCEDURE IF EXISTS test_proc;

DELIMITER ;;
CREATE PROCEDURE test_proc (
    INOUT p_balance INT
)
BEGIN
    SET p_balance = p_balance + 1;
END;;
DELIMITER ;

SET @val = 1;
CALL test_proc(@val);
SELECT @val; -- 2



--
--
--
DROP PROCEDURE IF EXISTS test_proc;

DELIMITER ;;
CREATE PROCEDURE test_proc (
	IN p_balance INT,
    OUT p_sum INT
)
BEGIN
	SET p_sum = p_balance + 1;
END;;
DELIMITER ;

SET @val = 0;
CALL test_proc(41, @val);
SELECT @val; -- 42



--
--
--
DROP PROCEDURE IF EXISTS test_proc;

DELIMITER ;;
CREATE PROCEDURE test_proc (
	IN p_id INT
)
BEGIN
	SELECT * FROM account;
    SELECT balance FROM account WHERE id = p_id;
END;;
DELIMITER ;

CALL test_proc(1111); -- 2 resultsets



--
--
--
SHOW PROCEDURE STATUS;
SHOW PROCEDURE STATUS LIKE '%money';

SHOW CREATE PROCEDURE move_money \G;
