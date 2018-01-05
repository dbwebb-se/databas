use oophp;
--
-- https://dbwebb.se/kunskap/transaktioner-i-databas
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
