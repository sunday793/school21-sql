CREATE VIEW v_generated_dates AS
SELECT dates::DATE AS generated_date
FROM GENERATE_SERIES('2022-01-01'::DATE,
                    '2022-01-31'::DATE,
                    INTERVAL '1 day') AS dates
ORDER BY generated_date;

SELECT count(*) = 31 AS CHECK,
      min(generated_date) AS check1,
      max(generated_date) AS check2
FROM v_generated_dates;