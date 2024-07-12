WITH max_date AS (
    SELECT
        product_id,
        max(change_date) as max_date
    FROM products
    WHERE change_date <= "2019-08-16"
    GROUP BY product_id
)

SELECT
    product_id,
    new_price as price
FROM products
WHERE (product_id, change_date) in (select * from max_date)
UNION
SELECT
    product_id,
    10 as price
FROM products
WHERE (product_id) not in (select product_id from max_date)