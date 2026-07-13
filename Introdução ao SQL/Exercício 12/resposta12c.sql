insert into takes
		(select ID, "1", "1", "Fall", "2017", null
		from student
        where dept_name = "Comp. Sci.");