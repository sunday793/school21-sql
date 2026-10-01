CREATE VIEW v_price_with_discount AS (
    SELECT 
        person.name, 
        pizza_name, 
        price, 
        ROUND(price - price*0.1) AS discount_price
    FROM person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
)
ORDER BY person.name, pizza_name;

SELECT *
FROM v_price_with_discount;