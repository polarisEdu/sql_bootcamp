SELECT pizza_name, price, pizz.name
FROM (
  SELECT id AS menu_id
  FROM menu
  EXCEPT
  SELECT menu_id
  FROM person_order
) AS t1 
JOIN menu ON t1.menu_id = menu.id
JOIN pizzeria pizz ON pizz.id = menu.pizzeria_id
ORDER BY 1, 2;