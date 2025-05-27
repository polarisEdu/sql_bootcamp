SELECT
	person.name,
	(
		SELECT COUNT(*)
		FROM person_visits
		WHERE person_visits.person_id = person.id
	) as count_of_visits
FROM person
ORDER BY 2 DESC, 1 ASC
LIMIT 4