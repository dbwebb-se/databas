--
-- Example on using various triggers for INSERT, UPDATE, DELETE - with
-- and without compound statements.
--
DROP TABLE IF EXISTS account;
CREATE TABLE account
(
    `id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

DELETE FROM account;
INSERT INTO account
VALUES
    ('1111', 'Adam', 10.0),
    ('2222', 'Eva', 7.0)
;

SELECT * FROM account;



--
-- Log table
--
DROP TABLE IF EXISTS account_log;
CREATE TABLE account_log
(
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2),
    `what` VARCHAR(100)
);

DELETE FROM account_log;
SELECT * FROM account_log;



--
-- Procedure move_money()
--
DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
    START TRANSACTION;
    UPDATE account SET balance = balance - amount WHERE id = from_account;
    UPDATE account SET balance = balance + amount WHERE id = to_account;
    COMMIT;
END
;;

DELIMITER ;

CALL move_money('1111', '2222', 1.5);
SELECT * FROM account;



--
-- Trigger AFTER UPDATE for logging updating balance
--
DROP TRIGGER IF EXISTS log_balance_update;

CREATE TRIGGER log_balance_update
AFTER UPDATE
ON account FOR EACH ROW
    INSERT INTO account_log
        (`what`, `account`, `balance`, `amount`)
    VALUES
        ('trigger after update account balance', NEW.id, NEW.balance, NEW.balance - OLD.balance)
    ;

CALL move_money('1111', '2222', 1.5);
SELECT * FROM account;
SELECT * FROM account_log;



--
-- Trigger BEFORE UPDATE, balance can not be < 0
--
DROP TRIGGER IF EXISTS balance_not_negative;
DELIMITER ;;

CREATE TRIGGER balance_not_negative
BEFORE UPDATE
ON account FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'USER ERROR: Update account to negative balance is not allowed.';
    END IF;
END
;;

DELIMITER ;

-- CALL move_money('1111', '2222', 99.5);
SELECT * FROM account;
SELECT * FROM account_log;



--
-- Trigger AFTER DELETE for logging removing accounts
--
DROP TRIGGER IF EXISTS log_remove_account;

CREATE TRIGGER log_remove_account
AFTER DELETE
ON account FOR EACH ROW
    INSERT INTO account_log
        (`what`, `account`, `balance`)
    VALUES
        ('trigger after delete account', OLD.id, OLD.balance)
    ;


INSERT INTO account
VALUES
    ('4242', 'Mumin', 42.0)
;

DELETE FROM account WHERE id = '4242';
SELECT * FROM account;
SELECT * FROM account_log;



--
-- Trigger with compound statement
--
DROP TRIGGER IF EXISTS trigger_test1;
DELIMITER ;;

CREATE TRIGGER trigger_test1
AFTER UPDATE
ON account FOR EACH ROW
BEGIN
    -- Some compound statements
END
;;

DELIMITER ;



--
-- Trigger BEFORE INSERT with compound statement and user defined errors
--
DROP TRIGGER IF EXISTS insert_account;
DELIMITER ;;

CREATE TRIGGER insert_account
BEFORE INSERT
ON account FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET message_text = 'USER ERROR: Insert account with negative balance is not allowed.';
    END IF;

    INSERT INTO account_log
        (`what`, `account`, `balance`)
    VALUES
        ('trigger before insert', NEW.id, NEW.balance)
    ;
END
;;

DELIMITER ;

SELECT * FROM account;
SELECT * FROM account_log;

INSERT INTO account
VALUES
    ('4242', 'Mumin', 42.0)
;

SELECT * FROM account;
SELECT * FROM account_log;

DELETE FROM account WHERE id = '4242';



--
-- Check triggers
--
SHOW TRIGGERS;

DROP TRIGGER IF EXISTS trigger_test1;

SHOW CREATE TRIGGER log_balance_update;

-- REVOKE TRIGGER ON *.* FROM 'user'@'%';
-- GRANT TRIGGER
-- ON *.*
-- TO 'user'@'%'
-- ;
