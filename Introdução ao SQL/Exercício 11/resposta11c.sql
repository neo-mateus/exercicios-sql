select max(salary), dept_name
from instructor
group by dept_name;