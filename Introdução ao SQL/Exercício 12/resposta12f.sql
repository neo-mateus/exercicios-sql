delete from takes
where course_id in (select course_id
					from course
                    where lower(title) like "%database%");
					