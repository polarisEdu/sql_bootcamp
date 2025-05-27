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
    B.type,
    SUM(COALESCE(B.money, 0)) AS volume,
    COALESCE(LR.currency_name, 'not defined') AS currency_name,
    COALESCE(LR.last_rate, 1) AS last_rate_to_usd,
    SUM(COALESCE(B.money, 0)) * COALESCE(LR.last_rate, 1) AS total_volume_in_usd
FROM balance B
    LEFT JOIN "user" U ON U.id = B.user_id
    LEFT JOIN cte_last_rate LR ON B.currency_id = LR.currency_id AND LR.rnk = 1
GROUP BY
    U.name,
    U.lastname,
    B.type,
    LR.currency_name,
    LR.last_rate
ORDER BY 
    COALESCE(U.name, 'not defined') DESC,
    COALESCE(U.lastname, 'not defined') ASC,
    B.type ASC;
