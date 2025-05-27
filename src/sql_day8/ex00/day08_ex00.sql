-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;


-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- До COMMIT
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- После COMMIT