SELECT pizz.name
FROM person_visits 
JOIN person per ON per.id = person_visits.person_id
JOIN pizzeria pizz ON pizz.id = person_visits.pizzeria_id
WHERE per.name = 'Andrey'
EXCEPT
SELECT pizz.name
FROM person_order 
JOIN person per ON per.id = person_order.person_id
JOIN menu m ON m.id = person_order.menu_id
JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
WHERE per.name = 'Andrey'
ORDER BY 1;