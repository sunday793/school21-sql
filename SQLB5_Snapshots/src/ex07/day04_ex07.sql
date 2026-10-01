SELECT * FROM public.mv_dmitriy_visits_and_eats

INSERT INTO 
    person_visits (id, person_id, pizzeria_id, visit_date) 
VALUES
(
    (SELECT MAX(id) FROM person_visits) + 1,
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT DISTINCT PZ.id FROM pizzeria PZ
        JOIN mv_dmitriy_visits_and_eats DV ON DV.pizzeria_name != PZ.name
        JOIN menu MN ON MN.pizzeria_id = PZ.id
    WHERE MN.price < 800 LIMIT 1),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT *
FROM mv_dmitriy_visits_and_eats;