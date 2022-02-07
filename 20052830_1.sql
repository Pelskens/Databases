select distinct license_plate, count(distinct period_begin)::integer
from carmodel 	inner join car 			using(brand, model)
		  		left join registration 	using(license_plate)
where type = 'minibus'
group by license_plate
having count(distinct period_begin) <= 3
order by count desc