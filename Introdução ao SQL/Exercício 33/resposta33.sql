with section_middleday(course_id, sec_id, end_hr) as(
	select course_id, sec_id, end_hr
	from section, time_slot
	where section.time_slot_id = time_slot.time_slot_id
		and end_hr >= 12)
select course_id, title
from course
where course_id in (select course_id
					from section_middleday)
	and dept_name = "Comp. Sci.";