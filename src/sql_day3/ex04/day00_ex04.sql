(
  SELECT pizz.name AS pizzeria_name
  FROM person per 
  JOIN person_order pv ON per.id = pv.person_id
  JOIN menu ON menu.id = pv.menu_id
  JOIN pizzeria pizz ON pizz.id = menu.pizzeria_id
  WHERE per.gender = 'female'
  EXCEPT
  SELECT pizz.name
  FROM person per 
  JOIN person_order pv ON per.id = pv.person_id
  JOIN menu ON menu.id = pv.menu_id
  JOIN pizzeria pizz ON pizz.id = menu.pizzeria_id
  WHERE per.gender = 'male'
)
UNION
(
  SELECT pizz.name
  FROM person per 
  JOIN person_order pv ON per.id = pv.person_id
  JOIN menu ON menu.id = pv.menu_id
  JOIN pizzeria pizz ON pizz.id = menu.pizzeria_id
  WHERE per.gender = 'male'
  EXCEPT
  SELECT pizz.name
  FROM person per 
  JOIN person_order pv ON per.id = pv.person_id
  JOIN menu ON menu.id = pv.menu_id
  JOIN pizzeria pizz ON pizz.id = menu.pizzeria_id
  WHERE per.gender = 'female'
)
ORDER BY 1;