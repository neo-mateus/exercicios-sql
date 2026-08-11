(select ID, name
from instructor
where ID not in (select teaches.ID
				from takes, teaches
				where grade <> null
					and teaches.course_id = takes.course_id
					and teaches.sec_id = takes.sec_id))
except
(select ID, name
from instructor
where ID not in (select ID
				from teaches));