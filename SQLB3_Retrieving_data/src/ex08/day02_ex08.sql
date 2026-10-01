SELECT PRS.name FROM person PRS
LEFT JOIN person_order ORD ON PRS.id = ORD.person_id
LEFT JOIN menu MENU ON ORD.menu_id = MENU.id
WHERE PRS.gender = 'male' 
    AND (PRS.address = 'Moscow' OR PRS.address = 'Samara')
    AND (MENU.pizza_name LIKE 'pepperoni%' OR MENU.pizza_name LIKE 'mushroom%')
ORDER BY PRS.name DESC; 