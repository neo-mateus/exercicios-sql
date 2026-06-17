select distinct takes.ID
from takes, teaches
where takes.course_id = teaches.course_id and teaches.ID = 50330;