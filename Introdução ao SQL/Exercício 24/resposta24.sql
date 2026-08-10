with physics_mentor(sec_id) as (
	select sec_id
    from teaches
    where ID in (select ID
				from instructor
                where dept_name = "Physics")
)
select student.ID, name
from student, takes
where dept_name = "Accounting"
	and takes.ID = student.ID
    and takes.sec_id in (select sec_id
						from physics_mentor);
