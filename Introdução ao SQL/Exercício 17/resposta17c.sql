delete from works
where company_name = "Small Bank Corporation"
	and ID not in (select ID
					from manage);