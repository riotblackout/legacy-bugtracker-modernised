-- 002_add_queries_qu_columns.sql
-- Add missing column required by code: qu_columns

IF COL_LENGTH('queries', 'qu_columns') IS NULL
BEGIN
    ALTER TABLE queries ADD qu_columns NVARCHAR(MAX) NULL;
END
