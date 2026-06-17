select sum(credits*points) 
from takes, grade_points, course
where takes.course_id = course.course_id
	and takes.ID = 12173
	and takes.grade = grade_points.grade;