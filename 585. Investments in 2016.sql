select
    round(sum(tiv_2016), 2) as tiv_2016
from insurance
where pid not in ( select pid from insurance group by tiv_2015 having count(tiv_2015) = 1)
    and pid in ( select pid from insurance group by lat, lon having count(pid) = 1)