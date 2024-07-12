WITH counted_data as (
    SELECT
        c.customer_id,
        count(distinct(c.product_key)) as cn_product
    FROM product p
    LEFT JOIN customer c
        ON p.product_key = c.product_key
    GROUP BY c.customer_id
)

SELECT
    customer_id
FROM counted_data
where cn_product = (select count(product_key) from product)