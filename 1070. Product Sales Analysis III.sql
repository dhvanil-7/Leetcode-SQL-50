WITH ranked_data as (
    SELECT
        *,
        rank() over(partition by product_id order by year) as rn
    FROM sales
)

SELECT
    product_id,
    year as first_year,
    quantity,
    price
FROM ranked_data
WHERE
    rn = 1