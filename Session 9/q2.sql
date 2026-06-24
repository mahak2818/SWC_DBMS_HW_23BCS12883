WITH cte AS (
    SELECT
        searches,
        SUM(num_users) OVER (ORDER BY searches) AS cum_sum,
        SUM(num_users) OVER () AS total
    FROM search_frequency
)
SELECT ROUND(AVG(searches), 1) AS median
FROM cte
WHERE cum_sum BETWEEN total/2.0 AND total/2.0 + 1;
