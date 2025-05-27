SELECT
	person.name,
	COUNT(person_id) as count_of_visits
FROM person_visits
JOIN person ON person.id = person_id
GROUP BY person.name
HAVING COUNT(person_id) > 3