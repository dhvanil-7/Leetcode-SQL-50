SELECT 
    p.product_id,
    COALESCE(round(sum(p.price * u.units)/sum(u.units), 2), 0) as average_price
FROM prices p
LEFT JOIN unitssold u
    ON p.product_id = u.product_id
    AND u.purchase_date between p.start_date and p.end_date
GROUP BY p.product_id
