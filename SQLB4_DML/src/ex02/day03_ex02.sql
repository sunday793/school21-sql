SELECT 
    pizza_name, 
    price,
    pizzeria.name AS pizzeria_name
FROM 
    menu MENU,
    pizzeria
WHERE 
    pizzeria.id = MENU.pizzeria_id
    AND NOT EXISTS 
        (SELECT 1 FROM person_order
        WHERE menu_id = MENU.id)
ORDER BY pizza_name, price;