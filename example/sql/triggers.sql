--
-- https://dbwebb.se/kunskap/triggers-i-databas
-- Example
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
	("1111", "Adam", 10.0),
    ("2222", "Eva", 7.0)
;

SELECT * FROM account;



--
-- Procedure moveMoney()
--
DROP PROCEDURE IF EXISTS moveMoney;

DELIMITER //

CREATE PROCEDURE moveMoney(
	fromaccount CHAR(4),
    toaccount CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
	DECLARE currentBalance NUMERIC(4, 2);
    
    START TRANSACTION;

	SET currentBalance = (SELECT balance FROM account WHERE id = fromaccount);
    SELECT currentBalance;

	IF currentBalance - amount < 0 THEN
		ROLLBACK;
        SELECT "Amount on the account is not enough to make transaction.";

	ELSE

		UPDATE account 
		SET
			balance = balance + amount
		WHERE
			id = toaccount;

		UPDATE account 
		SET
			balance = balance - amount
		WHERE
			id = fromaccount;
			
		COMMIT;

    END IF;

    SELECT * FROM account;
END
//

DELIMITER ;

CALL moveMoney("1111", "2222", 1.5);
SELECT * FROM account;


--
-- Log table
--
DROP TABLE IF EXISTS accountLog;
CREATE TABLE accountLog
(
	`id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(20),
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2)
);

DELETE FROM accountLog;
SELECT * FROM accountLog;



--
-- Procedure moveMoney()
--
DROP PROCEDURE IF EXISTS moveMoney;

DELIMITER //

CREATE PROCEDURE moveMoney(
	fromaccount CHAR(4),
    toaccount CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
	DECLARE currentBalance NUMERIC(4, 2);
    
    START TRANSACTION;

	SET currentBalance = (SELECT balance FROM account WHERE id = fromaccount);
    SELECT currentBalance;

	IF currentBalance - amount < 0 THEN
		ROLLBACK;
        SELECT "Amount on the account is not enough to make transaction.";

	ELSE

		UPDATE account 
		SET
			balance = balance + amount
		WHERE
			id = toaccount;

		UPDATE account 
		SET
			balance = balance - amount
		WHERE
			id = fromaccount;
		
        INSERT INTO accountLog (what, account, amount)
		VALUES
            ("moveMoney from", fromaccount, -amount),
            ("moveMoney to", toaccount, amount);
        
		COMMIT;

    END IF;

    SELECT * FROM account;
    SELECT * FROM accountLog;
END
//

DELIMITER ;

CALL moveMoney("1111", "2222", 1.5);



--
-- Trigger for logging updating balance
--
DROP TRIGGER IF EXISTS LogBalanceUpdate;

CREATE TRIGGER LogBalanceUpdate
AFTER UPDATE
ON account FOR EACH ROW
	INSERT INTO accountLog (`what`, `account`, `balance`, `amount`)
		VALUES ("trigger", NEW.id, NEW.balance, NEW.balance - OLD.balance);

CALL moveMoney("1111", "2222", 1.5);

SHOW TRIGGERS;
