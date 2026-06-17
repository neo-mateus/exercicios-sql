select sum(credits*points)/sum(credits) as CR
from takes, grade_points, course
where takes.course_id = course.course_id
    and grade_points.grade = takes.grade
group by ID;