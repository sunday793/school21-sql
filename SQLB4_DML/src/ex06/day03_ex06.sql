SELECT DISTINCT
    MENU1.pizza_name,
    PZR1.name AS pizzeria_name_1,
    PZR2.name AS pizzeria_name_2,
    MENU1.price
FROM menu MENU1
    JOIN menu MENU2 ON MENU1.price = MENU2.price
    JOIN pizzeria PZR1 ON PZR1.id = MENU1.pizzeria_id
    JOIN pizzeria PZR2 ON PZR2.id = MENU2.pizzeria_id
WHERE MENU1.id > MENU2.id AND PZR1.name != PZR2.name
ORDER BY MENU1.pizza_name;
SELECT m1.pizza_name,
        p1.name AS pizzeria_name_1,
        p2.name AS pizzeria_name_2,
        m1.price
  FROM menu m1
  INNER JOIN menu m2 ON m1.id <> m2.id
  AND m1.price = m2.price
  AND m1.pizzeria_id > m2.pizzeria_id
  AND m1.pizza_name = m2.pizza_name
  INNER JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
  INNER JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
  ORDER BY 1