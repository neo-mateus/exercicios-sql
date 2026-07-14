select employed.ID, employed_name
from employed, works, company
where employed.ID = works.ID
	and works.company_name = company.company_name
    and employed.city = company.city;