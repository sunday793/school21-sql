(SELECT PZR.name AS pizzeria_name FROM pizzeria PZR
    JOIN person_visits VISITS ON VISITS.pizzeria_id = PZR.id
    JOIN person PRS ON PRS.id = VISITS.person_id
    WHERE gender = 'female'
EXCEPT ALL
SELECT PZR.name AS pizzeria_name FROM pizzeria PZR
    JOIN person_visits VISITS ON VISITS.pizzeria_id = PZR.id
    JOIN person PRS ON PRS.id = VISITS.person_id
    WHERE gender = 'male')
UNION ALL
(SELECT PZR.name AS pizzeria_name FROM pizzeria PZR
    JOIN person_visits VISITS ON VISITS.pizzeria_id = PZR.id
    JOIN person PRS ON PRS.id = VISITS.person_id
    WHERE gender = 'male'
EXCEPT ALL
SELECT PZR.name AS pizzeria_name FROM pizzeria PZR
    JOIN person_visits VISITS ON VISITS.pizzeria_id = PZR.id
    JOIN person PRS ON PRS.id = VISITS.person_id
    WHERE gender = 'female')
ORDER BY pizzeria_name;