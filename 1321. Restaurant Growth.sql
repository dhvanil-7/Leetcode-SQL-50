SELECT
    visited_on,
    amount,
    round(amount/7, 2) as average_amount
FROM(SELECT
    visited_on,
    sum(amount) over(order by visited_on ROWS BETWEEN 6 preceding and current ROW ) as amount
FROM (SELECT
    visited_on,
    sum(amount) as amount
from customer
group by visited_on
order by visited_on) as sub) as sub2
Where visited_on >= (select min(visited_on) + interval 6 day from customer)