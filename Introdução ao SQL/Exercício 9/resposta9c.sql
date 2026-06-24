select ID 
from works
where ID not in (select ID
				from works
				where company_name = "First Bank Corporation");