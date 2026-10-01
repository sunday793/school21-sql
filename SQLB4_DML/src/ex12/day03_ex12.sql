INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    GENERATE_SERIES(
        (SELECT MAX(id) FROM person_order) + 1,
        (SELECT MAX(id) FROM person_order) + (SELECT COUNT(id) FROM person),
        1
    ),
    GENERATE_SERIES(
        (SELECT MIN(id) FROM person),
        (SELECT MAX(id) FROM person),
        1
    ),
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25';