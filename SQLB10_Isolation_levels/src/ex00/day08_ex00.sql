-- Session 1
-- updating the rating in a transaction mode
BEGIN;
UPDATE pizzeria
SET rating = 5
WHERE pizzeria.name = 'Pizza Hut';

-- checking if we can see the change in Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
-- checking that we can't see the change in Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 1
-- Publishing the change for all parallel sessions
COMMIT;

-- Session 2
-- checking that we can see the change in Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';