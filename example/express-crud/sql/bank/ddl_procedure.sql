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
DROP PROCEDURE IF EXISTS showBalance;
DELIMITER //
CREATE PROCEDURE showBalance()
BEGIN
    SELECT * FROM account;
END
//
DELIMITER ;

CALL showBalance();

--
-- Create procedure for insert into account
--
DROP PROCEDURE IF EXISTS createAccount;
DELIMITER //
CREATE PROCEDURE createAccount(
	aId CHAR(4),
    aName VARCHAR(8),
    aBalance DECIMAL(4, 2)
)
BEGIN
    INSERT INTO account VALUES (aId, aName, aBalance);
END
//
DELIMITER ;

-- CALL createAccount("1337", "Mega", 37.0);
-- SHOW WARNINGS;

--
-- Create procedure for show account details
--
DROP PROCEDURE IF EXISTS showAccount;
DELIMITER //
CREATE PROCEDURE showAccount(
	aId CHAR(4)
)
BEGIN
    SELECT * FROM account WHERE id = aId;
END
//
DELIMITER ;

CALL showAccount("1111");


--
-- Create procedure for edit account details
--
DROP PROCEDURE IF EXISTS editAccount;
DELIMITER //
CREATE PROCEDURE editAccount(
	aId CHAR(4),
    aName VARCHAR(8),
    aBalance DECIMAL(4, 2)
)
BEGIN
    UPDATE account SET
		`name` = aName,
        `balance` = aBalance
	WHERE
		`id` = aId;
END
//
DELIMITER ;

-- CALL editAccount("1111", "Mega", 37.0);
-- SHOW WARNINGS;


--
-- Create procedure for delete account
--
DROP PROCEDURE IF EXISTS deleteAccount;
DELIMITER //
CREATE PROCEDURE deleteAccount(
	aId CHAR(4)
)
BEGIN
    DELETE FROM account
	WHERE
		`id` = aId;
END
//
DELIMITER ;

-- CALL deleteAccount("1111");
-- SHOW WARNINGS;
