select max(matriculas)
from (select count(ID) as matriculas
	from section, takes
	where takes.year = section.year
		and takes.semester = section.semester
		and takes.course_id = section.course_id
		and takes.sec_id = section.sec_id
		and takes.semester = "Fall" 
        and takes.year = 2010
        group by takes.course_id, takes.sec_id)
        as tabela_matriculas;