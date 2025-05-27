SELECT
	pizzeria.name,
	(
		(
			SELECT COUNT(*)
			FROM person_visits
			WHERE person_visits.pizzeria_id = pizzeria.id
		)
		+
		(
			SELECT COUNT(*)
			FROM person_order
			JOIN menu ON menu.id = person_order.menu_id
			WHERE menu.pizzeria_id = pizzeria.id
		)
	) as total_count
FROM pizzeria
ORDER BY total_count DESC