SELECT
    product_name,
    sum(unit) as unit
FROM products p
join orders o
    on p.product_id = o.product_id
where extract(year from o.order_date) = 2020
    and extract(month from o.order_date) = 2
group by p.product_id
having unit >= 100