COMMENT ON TABLE person_discounts
IS 'This table stores discounts for each person in each pizzeria';

COMMENT ON COLUMN person_discounts.id
IS 'Primary Key - unique identifier for each discount record';

COMMENT ON COLUMN person_discounts.person_id
IS 'Foreign Key - reference to the person who receives the discount';

COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'Foreign Key - reference to the pizzeria where the discount applies';

COMMENT ON COLUMN person_discounts.discount
IS 'Discount percentage value, ranging from 0 to 100';

SELECT count(*) = 5 AS check
FROM pg_description
WHERE objoid = 'person_discounts'::regclass;