--
-- https://dbwebb.se/kunskap/triggers-i-databas
-- Example
-- 
DROP TABLE IF EXISTS Account;
CREATE TABLE Account
(
	`id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

DELETE FROM Account;
INSERT INTO Account
VALUES
	("1111", "Adam", 10.0),
    ("2222", "Eva", 7.0)
;

SELECT * FROM Account;



--
-- Procedure moveMoney()
--
DROP PROCEDURE IF EXISTS moveMoney;

DELIMITER //

CREATE PROCEDURE moveMoney(
	fromAccount CHAR(4),
    toAccount CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
	DECLARE currentBalance NUMERIC(4, 2);
    
    START TRANSACTION;

	SET currentBalance = (SELECT balance FROM Account WHERE id = fromAccount);
    SELECT currentBalance;

	IF currentBalance - amount < 0 THEN
		ROLLBACK;
        SELECT "Amount on the account is not enough to make transaction.";

	ELSE

		UPDATE Account 
		SET
			balance = balance + amount
		WHERE
			id = toAccount;

		UPDATE Account 
		SET
			balance = balance - amount
		WHERE
			id = fromAccount;
			
		COMMIT;

    END IF;

    SELECT * FROM Account;
END
//

DELIMITER ;

CALL moveMoney("1111", "2222", 1.5);
SELECT * FROM Account;


--
-- Log table
--
DROP TABLE IF EXISTS AccountLog;
CREATE TABLE AccountLog
(
	`id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(20),
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2)
);

DELETE FROM AccountLog;
SELECT * FROM AccountLog;



--
-- Procedure moveMoney()
--
DROP PROCEDURE IF EXISTS moveMoney;

DELIMITER //

CREATE PROCEDURE moveMoney(
	fromAccount CHAR(4),
    toAccount CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
	DECLARE currentBalance NUMERIC(4, 2);
    
    START TRANSACTION;

	SET currentBalance = (SELECT balance FROM Account WHERE id = fromAccount);
    SELECT currentBalance;

	IF currentBalance - amount < 0 THEN
		ROLLBACK;
        SELECT "Amount on the account is not enough to make transaction.";

	ELSE

		UPDATE Account 
		SET
			balance = balance + amount
		WHERE
			id = toAccount;

		UPDATE Account 
		SET
			balance = balance - amount
		WHERE
			id = fromAccount;
		
        INSERT INTO AccountLog (what, account, amount)
		VALUES
            ("moveMoney from", fromAccount, -amount),
            ("moveMoney to", toAccount, amount);
        
		COMMIT;

    END IF;

    SELECT * FROM Account;
    SELECT * FROM AccountLog;
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
ON Account FOR EACH ROW
	INSERT INTO AccountLog (`what`, `account`, `balance`, `amount`)
		VALUES ("trigger", NEW.id, NEW.balance, NEW.balance - OLD.balance);

CALL moveMoney("1111", "2222", 1.5);

SHOW TRIGGERS;
