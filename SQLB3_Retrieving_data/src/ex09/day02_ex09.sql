SELECT DISTINCT PRS.name FROM person PRS
LEFT JOIN person_order ORD ON PRS.id = ORD.person_id
LEFT JOIN menu MENU ON ORD.menu_id = MENU.id
WHERE PRS.gender = 'female' 
    AND (MENU.pizza_name LIKE 'pepperoni%' 
        OR MENU.pizza_name LIKE 'cheese%')
GROUP BY PRS.name
    HAVING SUM(CASE WHEN MENU.pizza_name LIKE 'cheese%' THEN 1 ELSE 0 END) > 0
        AND SUM(CASE WHEN MENU.pizza_name LIKE 'pepperoni%' THEN 1 ELSE 0 END) > 0
ORDER BY PRS.name;