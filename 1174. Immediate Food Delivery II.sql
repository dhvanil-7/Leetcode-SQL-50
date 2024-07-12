WITH ranked_data as (
    SELECT *,
    rank() over(partition by customer_id order by order_date) as rn
    FROM delivery
)

SELECT
    round(avg(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0, 2) as immediate_percentage
FROM ranked_data
WHERE rn = 1
