-- Session 1
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 2
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session 1
UPDATE pizzeria SET rating = 2 WHERE id = 1;
-- Session 2
UPDATE pizzeria SET rating = 3 WHERE id = 2;
-- Session 1
UPDATE pizzeria SET rating = 4 WHERE id = 2;
-- Session 2
UPDATE pizzeria SET rating = 3.7 WHERE id = 1;
-- Session 1
COMMIT;
-- Session 2
COMMIT;