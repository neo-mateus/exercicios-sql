with repeat_student(ID, course_id) as (
	select distinct(ID), course_id
	from takes as T
	where (select count(course_id)
		 from takes
		 where takes.course_id = T.course_id
			and takes.ID = T.ID) >= 2)
select distinct(ID)
from repeat_student as T
where (select count(course_id)
		from repeat_student
        where repeat_student.ID = T.ID) >= 3
order by ID;
        
