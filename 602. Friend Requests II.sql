select
    id,
    count(id) as num
from (select
    requester_id as id
from requestaccepted
UNION ALL
select
    accepter_id as id
from requestaccepted) as sub
group by id
order by num desc
limit 1