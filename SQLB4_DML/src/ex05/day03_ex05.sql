SELECT PZR.name AS pizzeria_name
FROM person_visits VIS 
LEFT JOIN person_order ORD ON ORD.order_date = VIS.visit_date
                            AND ORD.person_id = VIS.person_id
JOIN pizzeria PZR ON PZR.id = VIS.pizzeria_id
JOIN person PRS ON PRS.id = VIS.person_id
WHERE PRS.name = 'Andrey' AND ORD.id IS NULL
ORDER BY pizzeria_name;