select employeenumber, 
	   coalesce(during.sum::integer, 0)  as renting_days_during_contract, 
	   coalesce(outside.sum::integer, 0) as renting_days_outside_contract
from (select employeenumber, sum(r.period_end - r.period_begin + 1)
	  from contract c inner join employee 		using(employeenumber)
					  inner join person  		using(email)
					  inner join registration r using(email)
	  where c.period_begin <= r.period_begin and r.period_begin <= c.period_end
	  group by employeenumber) as during
	full join 
	 (select employeenumber, sum(r.period_end - r.period_begin + 1)
	  from contract c inner join employee 		using(employeenumber)
					  inner join person 		using(email)
					  inner join registration r using(email)
	  where r.period_begin < c.period_begin or r.period_begin > c.period_end
	  group by employeenumber) as outside
	using(employeenumber)