UPDATE menu
SET price = CAST(price - price*0.1 AS INT)
WHERE pizza_name = 'greek pizza';