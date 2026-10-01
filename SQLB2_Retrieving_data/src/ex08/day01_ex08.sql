SELECT person_order.order_date,
    CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person
    NATURAL JOIN (SELECT person_id AS id, order_date FROM person_order) AS person_order
ORDER BY order_date, person_information;