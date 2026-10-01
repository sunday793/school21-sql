SELECT DATE_INTERVAL.date AS missing_date
FROM GENERATE_SERIES('2022-01-01', '2022-01-10', INTERVAL '1 day') AS DATE_INTERVAL
LEFT JOIN 
    (SELECT DISTINCT visit_date FROM person_visits
    WHERE person_id = 1 OR person_id = 2) AS VISIT_ID_1_2
ON DATE_INTERVAL.date = VISIT_ID_1_2.visit_date
WHERE VISIT_ID_1_2.visit_date IS NULL
ORDER BY missing_date;
