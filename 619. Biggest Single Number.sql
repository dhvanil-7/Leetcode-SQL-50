WITH count_data as (
    SELECT
        num,
        count(num) as cn
    FROM mynumbers
    GROUP BY num
)

SELECT
    COALESCE(max(num), null)
FROM count_data
WHERE cn = 1
