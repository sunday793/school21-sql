CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (
    pizzeria_name VARCHAR
) AS $fnc_person_visits_and_eats_on_date$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pizzeria.name
    FROM person
    JOIN person_visits ON person_visits.person_id = person.id
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = pperson 
        AND person_visits.visit_date = pdate 
        AND menu.price < pprice;
END;
$fnc_person_visits_and_eats_on_date$ LANGUAGE plpgsql;


SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');