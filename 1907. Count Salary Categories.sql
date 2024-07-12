WITH category_data as (
    SELECT
        *,
        CASE WHEN income < 20000 then "Low Salary"
            WHEN income > 50000 then "High Salary"
            ELSE "Average Salary"
            END as category
    FROM accounts
),
category as (
    SELECT "Low Salary" as category
    UNION
    SELECT"Average Salary" as category
    UNION
    SELECT "High Salary" as category
)

Select
    c.category,
    CASE WHEN cd.accounts_count is Null then 0 else cd.accounts_count END as accounts_count
from category c
LEFT JOIN (
    SELECT
        category,
        count(category) as accounts_count
    FROM category_data
    GROUP BY category
) as cd
ON cd.category = c.category