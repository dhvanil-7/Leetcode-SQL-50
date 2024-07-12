WITH ranked_data as(
    SELECT
        *,
        dense_rank() over(partition by class order by student) as  rn
    FROM courses
)

SELECT
    class
FROM ranked_data
WHERE rn = 5