select distinct(ID), course_id
from takes as T
where (select count(course_id)
	  from takes
	  where takes.course_id = T.course_id
		and takes.ID = T.ID) >= 3
order by ID asc;
