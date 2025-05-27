(
  SELECT pizz.name AS pizzeria_name
  FROM person per 
  JOIN person_visits pv ON per.id = pv.person_id
  JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
  WHERE per.gender = 'female'
  EXCEPT ALL
  SELECT pizz.name
  FROM person per 
  JOIN person_visits pv ON per.id = pv.person_id
  JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
  WHERE per.gender = 'male'
)
UNION ALL
(
  SELECT per.name
  FROM person per 
  JOIN person_visits pv ON per.id = pv.person_id
  JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
  WHERE per.gender = 'male'
  EXCEPT ALL
  SELECT pizz.name
  FROM person per 
  JOIN person_visits pv ON per.id = pv.person_id
  JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
  WHERE per.gender = 'female'
)
ORDER BY 1;