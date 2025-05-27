  CREATE materialized VIEW mv_dmitriy_visits_and_eats AS
  SELECT pi.name AS pizzeria_name
  FROM menu
  JOIN pizzeria pi ON pi.id = menu.pizzeria_id
  JOIN person_visits pv ON menu.pizzeria_id = pv.pizzeria_id
  JOIN person per ON per.id = pv.person_id
  WHERE price < 800 AND per.name = 'Dmitriy' AND visit_date = '2022-01-08'


SELECT *
FROM mv_dmitriy_visits_and_eats 