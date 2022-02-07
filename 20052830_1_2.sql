select distinct brand
from carmodel
group by brand
having count(distinct type) > 1