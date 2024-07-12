select 
    case when id % 2 = 1 and id in (select max(id) from seat) then id
        when id % 2 = 1 and id not in (select max(id) from seat) then id+1
        Else id - 1
        end as id,
    student
from seat
order by id 