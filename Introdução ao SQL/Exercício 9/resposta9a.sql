select employed_name, city
from employed, works
where works.ID = employed.ID
	and works.company_name = "First Bank Corporation";