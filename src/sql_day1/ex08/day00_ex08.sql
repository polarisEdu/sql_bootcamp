SELECT order_date, name || ' (age:'||age||')' AS person_information
FROM person_order
NATURAL JOIN
  (SELECT per.id AS person_id, name, age FROM person per) AS per
ORDER BY 1, 2