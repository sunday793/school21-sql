SELECT 
    MENU.pizza_name,
    PIZZERIA.name AS pizzeria_name
FROM menu MENU
LEFT JOIN person_order PO 
    ON MENU.id = PO.menu_id
LEFT JOIN pizzeria PIZZERIA 
    ON MENU.pizzeria_id = PIZZERIA.id
LEFT JOIN person PERSON ON PO.person_id = PERSON.id
    WHERE PERSON.name LIKE 'Denis' OR PERSON.name LIKE 'Anna'
ORDER BY pizza_name, pizzeria_name;