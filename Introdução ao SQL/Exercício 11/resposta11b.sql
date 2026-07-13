select ID, name
from student
where not exists (select *
				from takes
                where year < 2017);