-- Session #1
BEGIN; 

SELECT SUM(rating) AS total_rating FROM pizzeria;


SELECT SUM(rating) AS total_rating FROM pizzeria;
COMMIT;
SELECT sum(rating)
FROM pizzeria;

-- Session #2
BEGIN; 

INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;

SELECT sum(rating)
FROM pizzeria;