WITH fav_visits AS (
    SELECT pizzeria.name,
            COUNT(person_visits.id) AS count,
            'visit' AS action_type
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
),
fav_orders AS(
    SELECT pizzeria.name,
        COUNT(person_order.id) AS count,
        'order' AS action_type
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
)

SELECT name, count, action_type
FROM fav_orders
UNION ALL
SELECT name, count, action_type
FROM fav_visits
ORDER BY action_type, count DESC;