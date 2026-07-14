with average_salary(company_name, average) as (
	select company_name, avg(salary)
    from works
    group by company_name
)
(select company_name
from average_salary)
except
(select a1.company_name
from average_salary as a1, average_salary as a2
where a1.average > a2.average);