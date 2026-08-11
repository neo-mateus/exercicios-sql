select ID, name
from instructor
where ID not in (select teaches.ID
				from takes, teaches
				where grade = "A"
					and teaches.course_id = takes.course_id
					and teaches.sec_id = takes.sec_id);