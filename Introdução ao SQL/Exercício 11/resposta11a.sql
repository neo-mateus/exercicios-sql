select ID, name, dept_name
from student as E
where exists (select ID
			from takes, course
            where takes.ID = E.ID
				and course.course_id = takes.course_id
                and dept_name = "Comp. Sci.");