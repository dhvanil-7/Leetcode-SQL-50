SELECT
    distinct(l1.num) as ConsecutiveNums
FROM logs l1
INNER JOIN logs l2
    ON l2.id -1 = l1.id
        AND l1.num = l2.num
INNER JOIN logs l3
    ON l3.id -1 = l2.id
        AND l3.num = l2.num