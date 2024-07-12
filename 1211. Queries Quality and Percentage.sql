SELECT
    query_name,
    round(avg(rating / position), 2) as quality,
    round(avg(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100.0, 2) as poor_query_percentage
FROM queries
WHERE query_name is not null
GROUP BY query_name