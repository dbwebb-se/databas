--
-- Create views (v_proc v_trig), on the current database, to show a list
-- of the procedures, functions and triggers that are connected to the
-- database.
--
-- Use as:
-- SELECT * FROM v_proc;
-- SELECT * FROM v_trig;
--
DROP VIEW IF EXISTS v_proc;
CREATE VIEW v_proc
AS
SELECT
    ROUTINE_NAME AS Name,
    ROUTINE_TYPE AS Type,
    ROUTINE_SCHEMA AS Db
FROM information_schema.ROUTINES
WHERE
    ROUTINE_SCHEMA = DATABASE()
ORDER BY
    ROUTINE_TYPE, ROUTINE_NAME;

DROP VIEW IF EXISTS v_trig;
CREATE VIEW v_trig
AS
SELECT
    TRIGGER_SCHEMA AS 'Db',
    EVENT_OBJECT_TABLE AS 'Table',
    ACTION_TIMING AS 'When',
    EVENT_MANIPULATION AS 'Event',
    TRIGGER_NAME AS 'Name'
FROM information_schema.TRIGGERS
WHERE
    TRIGGER_SCHEMA = DATABASE()
ORDER BY
    EVENT_OBJECT_TABLE, TRIGGER_NAME, ACTION_TIMING, EVENT_MANIPULATION;
