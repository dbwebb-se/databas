--
-- Showing off timestamps.
--
CREATE TABLE t1 (
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                             ON UPDATE CURRENT_TIMESTAMP
    deleted TIMESTAMP DEFAULT NULL,
);
