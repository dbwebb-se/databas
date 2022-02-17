--
-- Showing off timestamps.
--
DROP TABLE IF EXISTS t1;

-- CREATE TABLE t1 (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     value CHAR(2),
--     created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated TIMESTAMP DEFAULT NULL
--                              ON UPDATE CURRENT_TIMESTAMP,
--     deleted TIMESTAMP DEFAULT NULL
-- );

CREATE TABLE t1 (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    value CHAR(2),
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    deleted TIMESTAMP NULL
);

--
-- Add some rows
--
INSERT INTO t1 (value) VALUES
    ('A'), ('B'), ('C');

SELECT * FROM t1;

--
-- Show off how ON UPDATE works
--
UPDATE t1 SET value = 'Bb' WHERE id = 2;
UPDATE t1 SET value = 'Cc' WHERE id = 3;

SELECT * FROM t1;

--
-- Show the concept of "soft delete".
--
UPDATE t1 SET deleted = NOW() WHERE id = 3;

SELECT * FROM t1;


--
-- Show rows depending on status
--
SELECT * FROM t1 WHERE created IS NOT NULL;
SELECT * FROM t1 WHERE updated IS NOT NULL;
SELECT * FROM t1 WHERE deleted IS NULL;
SELECT * FROM t1 WHERE deleted IS NOT NULL;

SELECT * FROM t1
WHERE
    deleted IS NULL
    AND updated IS NOT NULL
;
