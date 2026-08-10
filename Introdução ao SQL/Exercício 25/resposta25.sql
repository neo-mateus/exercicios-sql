select dept_name
from department
where budget > (select budget
				from department
                where dept_name = "Psychology")
order by dept_name asc;