-- Session #1
BEGIN;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Дождаться завершения действий Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
BEGIN;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
