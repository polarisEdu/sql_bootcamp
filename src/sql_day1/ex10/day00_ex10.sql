SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pi.name AS pizzeria_name
FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria pi ON menu.pizzeria_id = pi.id
ORDER BY 1, 2, 3 ASC