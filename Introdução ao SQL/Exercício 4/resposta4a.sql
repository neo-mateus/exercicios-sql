select count(id_driver) as total_driver_accident
from (select id_driver
	from people as P
	where id_driver in (select id_driver
						from have
						where vin is not null)
						intersect
						(select id_driver
						from participed,accident
						where participed.sinister_num = accident.sinister_num
							and accident.year = 2017)
                        )as driver_accident;