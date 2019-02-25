--
-- Showing off timestamps.
--
DROP TABLE IF EXISTS t1;

CREATE TABLE t1 (
    id CHAR(2) PRIMARY KEY,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                             ON UPDATE CURRENT_TIMESTAMP,
    deleted TIMESTAMP DEFAULT NULL
);

--
-- Add some rows
--
INSERT INTO t1 (id) VALUES
    (1), (2), (3);

SELECT * FROM t1;

--
-- Show off how ON UPDATE works
--
UPDATE t1 SET id = 11 WHERE id = 1;
SELECT * FROM t1;

--
-- Show the concept of "soft delete".
--
UPDATE t1 SET deleted = NOW() WHERE id = 11;
SELECT * FROM t1;
SELECT * FROM t1 WHERE deleted IS NULL;
