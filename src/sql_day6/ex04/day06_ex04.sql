
ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id
CHECK (person_id IS NOT NULL);


ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_pizzeria_id
CHECK (pizzeria_id IS NOT NULL);


ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_discount
CHECK (discount IS NOT NULL);


ALTER TABLE person_discounts
ALTER COLUMN discount SET DEFAULT 0;


ALTER TABLE person_discounts
ADD CONSTRAINT ch_range_discount
CHECK (discount >= 0 AND discount <= 100);



-- Вставка корректных данных
INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (1, 1, 50);

-- Попытка вставки данных с нарушением ограничения (например, discount = 150)
INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (2, 2, 150);


-- Попытка вставки NULL в столбец person_id
INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (NULL, 1, 10);
