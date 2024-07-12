with user as (SELECT
    name as results
FROM (
    SELECT
        mr.user_id,
        u.name,
        count(rating) as cn
    FROM movierating mr
    JOIN users u
        ON u.user_id = mr.user_id
    group by user_id
) as sub
order by cn desc, name asc
limit 1),

rating as (SELECT
    title as results
FROM (
    SELECT
        mr.movie_id,
        m.title,
        avg(rating) as rt
    FROM movierating mr
    JOIN movies m
        ON mr.movie_id = m.movie_id
    where EXTRACT(month from created_at) = 2 and EXTRACT(year from created_at) = 2020
    group by mr.movie_id
) as sub2
order by rt desc, title asc
limit 1)

select * from user
UNION ALL
select * from rating