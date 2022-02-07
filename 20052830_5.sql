select distinct enterprisenumber
from (select enterprisenumber, type, count(distinct license_plate) 
	  from type inner join carmodel on type = name
		  		inner join car	    using(brand, model)
		  		inner join branch   using(enterprisenumber)
	  group by enterprisenumber, type) as subq
group by enterprisenumber
having max(count) >= 0.3 * sum(count)