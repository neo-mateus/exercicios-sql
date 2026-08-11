select ID, name
from instructor as I
where ID in (select ID
			from teaches, course
            where teaches.course_id = course.course_id
				and teaches.ID = I.ID
                and I.dept_name = course.dept_name)
order by name asc;