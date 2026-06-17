select sum(credits*points)/sum(credits) as CR
from takes, grade_points, course
where takes.ID = 12173
	and takes.course_id = course.course_id
    and grade_points.grade = takes.grade;