DELETE
from person
where id in (
    select
        id
    from (
        Select
            *,
            row_number() over(partition by email order by id) as rn
        from person
    ) as sub
    where rn > 1
)