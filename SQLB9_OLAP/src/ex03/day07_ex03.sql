WITH fav_visits AS (
    SELECT pizzeria.name,
           COUNT(person_visits.id) AS count
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
),
fav_orders AS (
    SELECT pizzeria.name,
           COUNT(person_order.id) AS count
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    GROUP BY pizzeria.name
)

SELECT 
    COALESCE(v.name, o.name) AS name,
    COALESCE(v.count, 0) + COALESCE(o.count, 0) AS total_count
FROM fav_visits v
FULL OUTER JOIN fav_orders o ON v.name = o.name
ORDER BY total_count DESC, name ASC;