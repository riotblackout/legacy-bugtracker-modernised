-- 003_backfill_qu_columns.sql
-- Prevent null crash in Query.Columns logic

UPDATE queries
SET qu_columns = ''
WHERE qu_columns IS NULL;
