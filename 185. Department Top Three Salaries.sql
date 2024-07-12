select
    d.name as department,
    sub.name as employee,
    sub.salary
from (
    select
        *,
        dense_rank() over(partition by departmentId order by salary desc) as drn
    from employee
) as sub
JOIN department d
    ON sub.departmentId = d.id
where drn <= 3