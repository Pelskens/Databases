select distinct email
from registration
where (period_end - period_begin + 1) = (select max(period_end - period_begin + 1) from registration)
and period_begin <= (select min(period_begin) from registration)