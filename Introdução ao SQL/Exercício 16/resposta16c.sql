with average_salary(company_name, average) as (
	select company_name, avg(salary)
    from works
    group by company_name
)
select employed.ID, employed.employed_name
from employed, average_salary, works
where works.company_name = average_salary.company_name
	and works.ID = employed.ID
    and works.salary > average_salary.average;