SELECT 
    PERSON_T.name AS person_name,
    MENU_T.pizza_name,
    PIZZERIA_T.name AS pizzeria_name
FROM person_order ORDERS_T
    JOIN person PERSON_T ON PERSON_T.id = ORDERS_T.person_id
    JOIN menu MENU_T ON MENU_T.id = ORDERS_T.menu_id
    JOIN pizzeria PIZZERIA_T ON MENU_T.pizzeria_id = PIZZERIA_T.id
ORDER BY person_name, pizza_name, pizzeria_name;