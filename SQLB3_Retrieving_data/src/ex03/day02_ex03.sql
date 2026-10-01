WITH cte(missing_date) AS (
    SELECT DATE_INTERVAL.date
    FROM GENERATE_SERIES('2022-01-01', '2022-01-10', INTERVAL '1 day') AS DATE_INTERVAL
)
SELECT cte.missing_date FROM cte
LEFT JOIN
    (SELECT DISTINCT PV.visit_date
    FROM person_visits PV
    WHERE PV.person_id = 1 OR PV.person_id = 2) AS VISIT_ID_1_2
ON cte.missing_date = VISIT_ID_1_2.visit_date
WHERE VISIT_ID_1_2.visit_date IS NULL
ORDER BY cte.missing_date;