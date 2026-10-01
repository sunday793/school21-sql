CREATE VIEW v_persons_female AS
SELECT id, name, age, gender, address 
FROM person
WHERE gender = 'female';

CREATE VIEW v_persons_male AS
SELECT id, name, age, gender, address 
FROM person
WHERE gender = 'male';

SELECT *
FROM v_persons_female
ORDER BY 1;

SELECT *
FROM v_persons_male
ORDER BY 1;