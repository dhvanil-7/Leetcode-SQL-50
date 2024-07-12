SELECT
    person_name
FROM (
    SELECT
        person_name,
        sum(weight) over(order by turn) as cumsum,
        turn
    FROM queue
) as sub
WHERE cumsum <= 1000
order by turn desc
limit 1
