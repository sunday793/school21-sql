SELECT 
    pizza_name, 
    price,
    PZR.name AS pizzeria_name,
    visit_date
FROM menu MENU
JOIN pizzeria PZR ON MENU.pizzeria_id = PZR.id
JOIN person_visits VISITS ON PZR.id = VISITS.pizzeria_id
JOIN person PRS ON VISITS.person_id = PRS.id
WHERE PRS.name = 'Kate' 
    AND MENU.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;