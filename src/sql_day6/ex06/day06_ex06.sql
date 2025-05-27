CREATE INDEX idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
       max(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
         JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;



INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (1, 6, 10);

SELECT * FROM person_discounts
ORDER BY id DESC;

SELECT last_value FROM seq_person_discounts;

