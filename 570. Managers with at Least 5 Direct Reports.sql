SELECT name
FROM employee e1
WHERE id IN (
    SELECT managerId FROM employee
    group by managerId
    Having count(managerId) >= 5
)