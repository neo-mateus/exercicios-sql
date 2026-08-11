with number_student(course_id, sec_id, year, semester, room_number) as (
	select distinct course_id , sec_id, year, semester, 
		(select (count(distinct ID)) 
		from takes 
		where sec_id = T.sec_id
		and course_id = T.course_id
		and year = T.year
		and semester = T.semester) as room_number
	from takes as T)
select *
from number_student
where room_number = some(select max(room_number)
					 from number_student
					 group by sec_id);




