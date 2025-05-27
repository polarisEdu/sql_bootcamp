insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH cte_last_rate AS (
    SELECT 
        C.id AS currency_id,
        C.name AS currency_name,
        COALESCE(C.rate_to_usd, 1) AS last_rate,
        ROW_NUMBER() OVER (PARTITION BY C.id ORDER BY C.updated DESC) AS rnk
    FROM currency C
)
SELECT
    COALESCE(U.name, 'not defined') AS name, 
    COALESCE(U.lastname, 'not defined') AS lastname,  
    C.name AS currency_name, 
    TRIM(TRAILING '0' FROM TO_CHAR(
        ROUND(
            B.money * nearest_rate(B.currency_id, B.updated),
            2
        ), 
        'FM999999999.99'
    ))::NUMERIC AS currency_in_usd  
FROM balance B
    LEFT JOIN "user" U ON B.user_id = U.id  
    LEFT JOIN cte_last_rate LR ON B.currency_id = LR.currency_id AND LR.rnk = 1  -- Присоединение курса валюты
    LEFT JOIN (
        SELECT DISTINCT
            id, name
        FROM currency
    ) C ON C.id = B.currency_id  
WHERE
    C.name IS NOT NULL  
ORDER BY 
    COALESCE(U.name, 'not defined') DESC,  
    COALESCE(U.lastname, 'not defined') ASC,  
    C.name ASC;  
