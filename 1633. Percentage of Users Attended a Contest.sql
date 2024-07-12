SELECT
    r.contest_id,
    round(count(r.user_id) * 100.0/(SELECT count(user_id) FROM users), 2) as percentage
FROM users u
JOIN register r
    ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage desc, contest_id asc