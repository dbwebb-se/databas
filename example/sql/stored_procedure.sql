--
-- https://dbwebb.se/kunskap/lagrade-procedurer-i-databas
-- Example transactions
-- 
DROP TABLE IF EXISTS Account;
CREATE TABLE Account
(
	`id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

-- DELETE FROM Account;
INSERT INTO Account
VALUES
	("1111", "Adam", 10.0),
    ("2222", "Eva", 7.0)
;

SELECT * FROM Account;


--
-- Move the money
--
UPDATE Account 
SET
	balance = balance + 1.5
WHERE
	id = "2222";

UPDATE Account 
SET
	balance = balance - 1.5
WHERE
	id = "1111";
    
SELECT * FROM Account;


--
-- Move the money, within a transaction
--
START TRANSACTION;

UPDATE Account 
SET
	balance = balance + 1.5
WHERE
	id = "2222";

UPDATE Account 
SET
	balance = balance - 1.5
WHERE
	id = "1111";
    
COMMIT;

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
	SELECT fromAccount, toAccount, amount;
	-- DECLARE currentAmount NUMERIC(4, 2);
    
    -- START TRANSACTION;
 
	-- Start by checking the available amount
	-- SET currentAmount = (SELECT balance FROM Account WHERE id = from);
    -- SELECT currentAmount;
    -- COMMIT;
END
//

DELIMITER ;

CALL moveMoney("1111", "2222", 1.5);



--
-- Procedure moveMoney()
--
DROP PROCEDURE moveMoney;

DELIMITER //

CREATE PROCEDURE moveMoney(
	fromAccount CHAR(4),
    toAccount CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
    START TRANSACTION;

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

    SELECT * FROM Account;
END
//

DELIMITER ;

CALL moveMoney("1111", "2222", 1.5);



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
-- Try OUT variables from SP
--
DROP PROCEDURE IF EXISTS getMoney;

DELIMITER //

CREATE PROCEDURE getMoney(
	IN account CHAR(4),
    OUT total NUMERIC(4, 2)
)
BEGIN
	SELECT balance INTO total FROM Account WHERE id = account;
END
//

DELIMITER ;

CALL getMoney("1111", @sum);
SELECT @sum;



--
-- Select mutiple into variables
--
SELECT 1, 2 INTO @a, @b;
SELECT @a, @b;



--
-- Admin on SP
--
SHOW PROCEDURE STATUS;
SHOW CREATE PROCEDURE moveMoney;
