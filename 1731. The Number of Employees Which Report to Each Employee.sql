SELECT
    e2.employee_id,
    e2.name,
    count(e1.employee_id) as reports_count,
    round(avg(e1.age)) as average_age
FROM employees e1
INNER JOIN employees e2
    ON e1.reports_to = e2.employee_id
GROUP BY e2.employee_id
ORDER BY e2.employee_id
