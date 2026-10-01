-- Active: 1780527032521@@127.0.0.1@5432@sqlb6
CREATE TABLE journey (
    point1 VARCHAR(1),
    point2 VARCHAR(2),
    cost integer
);

INSERT INTO journey VALUES ('a', 'b', 10);
INSERT INTO journey VALUES ('a', 'd', 20);
INSERT INTO journey VALUES ('a', 'c', 15);
INSERT INTO journey VALUES ('b', 'd', 25);
INSERT INTO journey VALUES ('b', 'c', 35);
INSERT INTO journey VALUES ('c', 'd', 30);

INSERT INTO journey VALUES ('b', 'a', 10);
INSERT INTO journey VALUES ('d', 'a', 20);
INSERT INTO journey VALUES ('c', 'a', 15);
INSERT INTO journey VALUES ('d', 'b', 25);
INSERT INTO journey VALUES ('c', 'b', 35);
INSERT INTO journey VALUES ('d', 'c', 30);

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
ORDER BY total_cost, tour;