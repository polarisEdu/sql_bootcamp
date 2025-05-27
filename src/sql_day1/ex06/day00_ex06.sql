  SELECT action_date, person.name AS person_name
  FROM
    (SELECT order_date AS action_date, person_id
    FROM person_order INTERSECT ALL SELECT visit_date, person_id
    FROM person_visits) AS tab
  INNER JOIN person ON tab.person_id = person.id
  ORDER BY 1, 2 DESC