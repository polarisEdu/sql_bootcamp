SELECT pizza_name, price, pizz.name AS pizzeria_name, pv.visit_date
FROM menu 
JOIN pizzeria pizz ON pizz.id = menu.pizzeria_id
JOIN person_visits pv ON pizz.id = pv.pizzeria_id
JOIN person per ON per.id = pv.person_id
WHERE price BETWEEN 800 AND 1000 
  AND per.name = 'Kate'
ORDER BY 1, 2, 3;
