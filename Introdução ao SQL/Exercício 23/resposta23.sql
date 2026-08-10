select dept_name, value
from (select dept_name, sum(salary) as value
	 from instructor
     group by dept_name) as total_dept,
     (select avg(value2) as value1
		from (select sum(salary) as value2
		from instructor
		group by dept_name) as total_dept) 
        as media_dept
where total_dept.value > media_dept.value1;