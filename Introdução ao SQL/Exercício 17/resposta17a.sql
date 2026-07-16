update works
set salary = salary*1.1
where company_name = "First Bank Corporation"
	and ID not in (select ID
					from manage);