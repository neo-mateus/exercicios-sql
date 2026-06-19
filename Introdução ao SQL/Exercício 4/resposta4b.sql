delete from car
where vin in (select vin
			from have
			where id_driver = 12345);