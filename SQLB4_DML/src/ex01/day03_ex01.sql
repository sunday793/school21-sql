SELECT MENU.id AS menu_id FROM menu MENU
WHERE NOT EXISTS 
    (SELECT menu_id FROM person_order 
    WHERE menu_id = MENU.id)
ORDER BY MENU.id;