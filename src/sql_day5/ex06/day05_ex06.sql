CREATE INDEX idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
       max(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
         JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;


-- удалить idx_1
-- DROP INDEX IF EXISTS idx_1;
