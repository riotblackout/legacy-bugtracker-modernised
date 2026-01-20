-- 001_fix_user_salt.sql
-- Fix users with NULL/short salt that causes PBKDF2 crash ("Salt is not at least eight bytes")

UPDATE users
SET us_salt = '1234'
WHERE us_salt IS NULL OR LEN(us_salt) < 4;
