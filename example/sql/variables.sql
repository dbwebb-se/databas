--
-- Move money using variables
--
DROP TABLE IF EXISTS account;
CREATE TABLE account
(
    `id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

INSERT INTO account
VALUES
    ('1111', 'Adam', 10.0),
    ('2222', 'Eva', 7.0)
;

SELECT * FROM account;



--
-- Move using variables
--
SET @amount = 1.5;
SET @from   = '1111';
SET @to     = '2222';

START TRANSACTION;

SET @balance = (SELECT balance FROM account WHERE id = @from);
-- IF @balance < @amount THEN ROLLBACK;

UPDATE account SET balance = balance + @amount WHERE id = @to;
UPDATE account SET balance = balance - @amount WHERE id = @from;

COMMIT;

SELECT * FROM account;
