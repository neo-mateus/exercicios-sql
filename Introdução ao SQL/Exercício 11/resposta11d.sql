with max_salary(salary, dept_name) as (
	select max(salary), dept_name
    from instructor
    group by dept_name)
(select salary, dept_name
from max_salary)
except
(select m1.salary, m1.dept_name
from max_salary as m1, max_salary as m2
where m1.salary > m2.salary);

