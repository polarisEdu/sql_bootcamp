CREATE TABLE person_discounts (
    id SERIAL PRIMARY KEY,
    person_id INT NOT NULL,
    pizzeria_id INT NOT NULL,
    discount NUMERIC(5, 2) NOT NULL,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);

SELECT 
    pd.id AS discount_id,
    p.name AS person_name,
    pz.name AS pizzeria_name,
    pd.discount AS discount_percentage
FROM 
    person_discounts pd
JOIN 
    person p ON pd.person_id = p.id
JOIN 
    pizzeria pz ON pd.pizzeria_id = pz.id;
