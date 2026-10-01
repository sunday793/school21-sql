SELECT 
    MENU.pizza_name, 
    PIZZERIA.name AS pizzeria_name, 
    MENU.price
FROM menu MENU
LEFT JOIN pizzeria PIZZERIA
ON MENU.pizzeria_id = PIZZERIA.id
WHERE pizza_name LIKE 'mushroom%' OR pizza_name LIKE 'pepperoni%'
ORDER BY pizza_name, pizzeria_name;