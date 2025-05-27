CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
    WHERE order_date = '2022-01-01';

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT person_id
FROM person_order
WHERE menu_id = 1
  AND order_date = '2022-01-01';


-- удалить idx_person_order_order_date
-- DROP INDEX IF EXISTS idx_person_order_order_date;



