select employed_name, street, city
from employed, works
where works.ID = employed.ID
	and works.company_name = "First Bank Corporation"
    and salary > 1000.00;