select course_id,sec_id, 
	(select count(ID)
	from takes
	where takes.year = section.year
		and takes.semester = section.semester
		and takes.course_id = section.course_id
		and takes.sec_id = section.sec_id)
		as matriculas
from section
where semester = "Fall" and year = 2010;