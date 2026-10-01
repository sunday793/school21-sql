WITH last_currency_rates AS (
    SELECT DISTINCT ON (id) 
        id,
        name,
        rate_to_usd,
        updated
    FROM currency
    ORDER BY id, updated DESC
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    SUM(b.money) AS volume,
    COALESCE(lcr.name, 'not defined') AS currency_name,
    COALESCE(lcr.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(b.money * COALESCE(lcr.rate_to_usd, 1)) AS total_volume_in_usd
FROM "user" u
FULL JOIN balance b ON b.user_id = u.id
LEFT JOIN last_currency_rates lcr ON lcr.id = b.currency_id
GROUP BY 
    u.id,
    u.name,
    u.lastname,
    b.type,
    lcr.name,
    lcr.rate_to_usd
ORDER BY
    name DESC,
    lastname ASC,
    b.type ASC;