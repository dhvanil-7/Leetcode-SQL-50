SELECT
    date_format(trans_date, "%Y-%m") as month,
    country,
    count(id) as trans_count,
    count(CASE WHEN state="approved" THEN id ELSE NULL END) as approved_count,
    sum(amount) as trans_total_amount,
    sum(CASE WHEN state="approved" THEN amount ELSE 0 END) as approved_total_amount
FROM transactions
GROUP BY month, country