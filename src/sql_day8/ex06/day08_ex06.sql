-- Session #1
BEGIN; 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 

SELECT SUM(rating) AS total_rating FROM pizzeria;

SELECT SUM(rating) AS total_rating FROM pizzeria;
COMMIT;
SELECT sum(rating)
FROM pizzeria;

-- Session #2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 

INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

SELECT sum(rating)
FROM pizzeria;  