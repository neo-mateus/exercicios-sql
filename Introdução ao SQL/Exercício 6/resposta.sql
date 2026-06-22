select title, dept_name
from course
where lower(dept_name) like "%sci%";