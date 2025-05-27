
COMMENT ON TABLE person_discounts IS 
'Эта таблица хранит персональные скидки для клиентов в определенных пиццериях для повышения лояльности. 
Она связывает клиента с пиццерией и назначает процент скидки.';

COMMENT ON COLUMN person_discounts.id IS 
'Первичный ключ: уникальный идентификатор для каждой записи о скидке.';

COMMENT ON COLUMN person_discounts.person_id IS 
'Внешний ключ: ссылается на клиента, которому предоставлена скидка.';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 
'Внешний ключ: ссылается на пиццерию, в которой действует скидка.';

COMMENT ON COLUMN person_discounts.discount IS 
'Процент скидки, предоставленной клиенту в указанной пиццерии. 
Диапазон: от 0 до 100, значение по умолчанию: 0.';





SELECT obj_description(oid) AS table_comment
FROM pg_class
WHERE relname = 'person_discounts';

SELECT col_description('person_discounts'::regclass, ordinal_position) AS column_comment, column_name
FROM information_schema.columns
WHERE table_name = 'person_discounts';
