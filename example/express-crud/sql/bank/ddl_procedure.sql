--
-- SQL for article on CRUD with Express and MySQL using stored procedures.
-- functions and triggers.
--

--
-- Setup
--
DROP TABLE IF EXISTS account;
CREATE TABLE account
(
    `id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

-- DELETE FROM account;
INSERT INTO account
VALUES
    ("1111", "Adam", 10.0),
    ("2222", "Eva", 7.0)
;

SELECT * FROM account;


--
-- Create procedure for select * from account
--
DROP PROCEDURE IF EXISTS show_balance;
DELIMITER ;;
CREATE PROCEDURE show_balance()
BEGIN
    SELECT * FROM account;
END
;;
DELIMITER ;

CALL show_balance();

--
-- Create procedure for insert into account
--
DROP PROCEDURE IF EXISTS create_account;
DELIMITER ;;
CREATE PROCEDURE create_account(
    a_id CHAR(4),
    a_name VARCHAR(8),
    a_balance DECIMAL(4, 2)
)
BEGIN
    INSERT INTO account VALUES (a_id, a_name, a_balance);
END
;;
DELIMITER ;

-- CALL create_account("1337", "Mega", 37.0);
-- SHOW WARNINGS;

--
-- Create procedure for show account details
--
DROP PROCEDURE IF EXISTS show_account;
DELIMITER ;;
CREATE PROCEDURE show_account(
    a_id CHAR(4)
)
BEGIN
    SELECT * FROM account WHERE id = a_id;
END
;;
DELIMITER ;

CALL show_account("1111");


--
-- Create procedure for edit account details
--
DROP PROCEDURE IF EXISTS edit_account;
DELIMITER ;;
CREATE PROCEDURE edit_account(
    a_id CHAR(4),
    a_name VARCHAR(8),
    a_balance DECIMAL(4, 2)
)
BEGIN
    UPDATE account SET
        `name` = a_name,
        `balance` = a_balance
    WHERE
        `id` = a_id;
END
;;
DELIMITER ;

-- CALL edit_account("1111", "Mega", 37.0);
-- SHOW WARNINGS;


--
-- Create procedure for delete account
--
DROP PROCEDURE IF EXISTS delete_account;
DELIMITER ;;
CREATE PROCEDURE delete_account(
    a_id CHAR(4)
)
BEGIN
    DELETE FROM account
    WHERE
        `id` = a_id;
END
;;
DELIMITER ;

-- CALL delete_account("1111");
-- SHOW WARNINGS;
