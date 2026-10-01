(SELECT PZR.name AS pizzeria_name
    FROM menu MENU
        JOIN person_order ORDERS ON ORDERS.menu_id = MENU.id
        JOIN pizzeria PZR ON PZR.id = MENU.pizzeria_id
        JOIN person PRS ON PRS.id = ORDERS.person_id
    WHERE gender = 'female'
    EXCEPT
    SELECT PZR.name AS pizzeria_name
    FROM menu MENU
        JOIN person_order ORDERS ON ORDERS.menu_id = MENU.id
        JOIN pizzeria PZR ON PZR.id = MENU.pizzeria_id
        JOIN person PRS ON PRS.id = ORDERS.person_id
    WHERE gender = 'male')
UNION
(SELECT PZR.name AS pizzeria_name
    FROM menu MENU
        JOIN person_order ORDERS ON ORDERS.menu_id = MENU.id
        JOIN pizzeria PZR ON PZR.id = MENU.pizzeria_id
        JOIN person PRS ON PRS.id = ORDERS.person_id
    WHERE gender = 'male'
    EXCEPT
    SELECT PZR.name AS pizzeria_name
    FROM menu MENU
        JOIN person_order ORDERS ON ORDERS.menu_id = MENU.id
        JOIN pizzeria PZR ON PZR.id = MENU.pizzeria_id
        JOIN person PRS ON PRS.id = ORDERS.person_id
    WHERE gender = 'female')
ORDER BY pizzeria_name;