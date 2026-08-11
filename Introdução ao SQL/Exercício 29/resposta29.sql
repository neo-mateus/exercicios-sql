/*Como o esquema não possui o departamento Music, troquei
por Math.*/

select *
from student as S
where name like "D%"
	and dept_name = "History"
    and (select count(distinct(takes.course_id))
		from takes, course
        where takes.ID = S.ID
			and takes.course_id = course.course_id
            and course.dept_name = "Math") >= 5;