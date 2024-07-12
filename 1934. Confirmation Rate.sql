SELECT su.user_id,
    round(avg(CASE WHEN c.action = 'confirmed' then 1 ELSE 0 END), 2) as confirmation_rate
FROM signups su
LEFT JOIN confirmations c
    ON c.user_id = su.user_id
GROUP BY su.user_id