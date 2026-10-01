WITH RECURSIVE tsp_path AS (
    SELECT 
        point2 AS current_node,
        cost AS total_cost,
        ARRAY[point1, point2] AS visited,
        1 AS step_count
    FROM journey
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        journey.point2 AS current_node,
        (tsp_path.total_cost + journey.cost) AS total_cost,
        (tsp_path.visited || journey.point2) AS visited,
        (tsp_path.step_count + 1) AS step_count
    FROM journey
    JOIN tsp_path ON journey.point1 = tsp_path.current_node
    WHERE tsp_path.step_count < 3
        AND NOT (journey.point2 = ANY(tsp_path.visited))
),
all_tours AS (
    SELECT 
        (tsp_path.total_cost + journey.cost) AS total_cost,
        (tsp_path.visited || ARRAY['a'])::text AS tour 
    FROM tsp_path
    JOIN journey ON journey.point1 = tsp_path.current_node AND journey.point2 = 'a'
    WHERE tsp_path.step_count = 3
)
SELECT total_cost, tour
FROM all_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM all_tours)
    OR total_cost = (SELECT MAX(total_cost)FROM all_tours)
ORDER BY total_cost, tour;