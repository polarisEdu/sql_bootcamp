-- Session #1
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Повторное чтение после изменений в Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
BEGIN;

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
