select distinct subq.enterprisenumber, subq.max as period_begin, employeenumber
from (select enterprisenumber, max(period_begin)
	  from contract 
	  group by enterprisenumber) as subq
	inner join contract c on subq.enterprisenumber = c.enterprisenumber 
					and subq.max = c.period_begin