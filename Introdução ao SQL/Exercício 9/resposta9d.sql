select W1.ID
from works as W1, works as W2
where W1.salary > W2.salary
	and W1.company_name = W2.company_name
    and W1.company_name = "Small Bank Corporarion";