SELECT
    COALESCE(PERSON.name, '-') AS person_name,
    VISIT.visit_date,
    COALESCE(PIZZERIA.name, '-') AS pizzeria_name
FROM
    (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS VISIT
FULL JOIN person PERSON ON VISIT.person_id = PERSON.id
FULL JOIN pizzeria PIZZERIA ON VISIT.pizzeria_id = PIZZERIA.id
ORDER BY person_name, visit_date, pizzeria_name;