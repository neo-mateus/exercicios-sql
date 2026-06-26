select C.company_name
from company as CS, company as C
where CS.company_name = "Small Bank Corporation"
	and CS.city = C.city
    and C.company_name <> "Small Bank Corporation";