CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name, price
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';


-- удалить idx_menu_unique
-- DROP INDEX IF EXISTS idx_menu_unique;



