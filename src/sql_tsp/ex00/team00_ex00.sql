DROP TABLE IF EXISTS tsp_edges;
CREATE TABLE tsp_edges
(
    point1 CHAR NOT NULL,
    point2 CHAR NOT NULL,
    cost   INT  NOT NULL,
    CONSTRAINT cost_check CHECK (cost > 0)
);

INSERT INTO tsp_edges (point1, point2, cost)
VALUES 
    ('a', 'b', 10),
    ('a', 'c', 15),
    ('a', 'd', 20),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('b', 'd', 25),
    ('c', 'a', 15),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'a', 20),
    ('d', 'b', 25),
    ('d', 'c', 30);


DROP FUNCTION IF EXISTS tsp_solution;
CREATE OR REPLACE FUNCTION tsp_solution(start_point CHAR)
    RETURNS TABLE
            (
                total_cost INT,
                tour       TEXT
            )
    LANGUAGE plpgsql
    VOLATILE
AS
$$
BEGIN
    RETURN QUERY
        WITH RECURSIVE tsp_result AS (
            SELECT 
                point1::bpchar AS path,
                point2 AS next_point,
                cost
            FROM tsp_edges
            WHERE point1 = start_point
            
            UNION ALL
            
            SELECT 
                prev.path || ',' || cur.point1 AS path,
                cur.point2                     AS next_point,
                prev.cost + cur.cost           AS cost
            FROM tsp_edges cur
            JOIN tsp_result prev 
            ON cur.point1 = prev.next_point
            WHERE prev.path NOT ILIKE '%' || cur.point1 || '%'
        )
        SELECT 
            r.cost AS total_cost,
            '{' || path || ',' || next_point || '}' AS tour
        FROM tsp_result r
        WHERE r.next_point = start_point
          AND LENGTH(path) > (SELECT COUNT(DISTINCT point1) + 1 FROM tsp_edges)
        ORDER BY total_cost, tour;
END;
$$;


select * from tsp_solution('a')
where total_cost = (select MIN(total_cost) from tsp_solution('a'))
order by 1, 2;