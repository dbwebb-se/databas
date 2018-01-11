--
-- https://dbwebb.se/kunskap/lagrade-procedurer-i-databas
-- Example transactions
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
-- Move the money
--
UPDATE account 
SET
	balance = balance + 1.5
WHERE
	id = "2222";

UPDATE account 
SET
	balance = balance - 1.5
WHERE
	id = "1111";
    
SELECT * FROM account;


--
-- Move the money, within a transaction
--
START TRANSACTION;

UPDATE account 
SET
	balance = balance + 1.5
WHERE
	id = "2222";

UPDATE account 
SET
	balance = balance - 1.5
WHERE
	id = "1111";
    
COMMIT;

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
	SELECT fromaccount, toaccount, amount;
	-- DECLARE currentAmount NUMERIC(4, 2);
    
    -- START TRANSACTION;
 
	-- Start by checking the available amount
	-- SET currentAmount = (SELECT balance FROM account WHERE id = from);
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
	fromaccount CHAR(4),
    toaccount CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
    START TRANSACTION;

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

    SELECT * FROM account;
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
-- Try OUT variables from SP
--
DROP PROCEDURE IF EXISTS getMoney;

DELIMITER //

CREATE PROCEDURE getMoney(
	IN account CHAR(4),
    OUT total NUMERIC(4, 2)
)
BEGIN
	SELECT balance INTO total FROM account WHERE id = account;
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
