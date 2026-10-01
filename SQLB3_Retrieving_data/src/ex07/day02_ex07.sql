SELECT PIZZERIA.name AS pizzeria_name
FROM pizzeria PIZZERIA
LEFT JOIN person_visits VISITS 
    ON PIZZERIA.id = VISITS.pizzeria_id
LEFT JOIN person PERSON 
    ON VISITS.person_id = PERSON.id
LEFT JOIN menu MENU 
    ON PIZZERIA.id = MENU.pizzeria_id
WHERE PERSON.name = 'Dmitriy' AND MENU.price < 800 
    AND VISITS.visit_date = '2022-01-08';