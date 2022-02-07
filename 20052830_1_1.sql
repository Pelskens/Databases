select license_plate
from car
where license_plate not in (select license_plate 
							from registration
							where  to_char(period_begin, 'ID') = '6'
								or to_char(period_begin, 'ID') = '7')