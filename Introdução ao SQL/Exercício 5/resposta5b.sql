select count(ID), grade
from (select ID,
		(case 
			when score < 40 then 'F'
			when score >= 40 and score < 60 then 'C'
			when score >= 60 and score < 80 then 'B'
			when score >= 80 then 'A'
			else '??'
		end) as grade
	from release_score)
group by grade;

/*Uma alternativa seria
with grades as(
	select ID,
	case 
		when score < 40 then 'F'
        when score >= 40 and score < 60 then 'C'
        when score >= 60 and score < 80 then 'B'
        when score >= 80 then 'A'
        else '??'
	end as grade
	from release_score)
select grade, count(grade)
from grades
group by grade;
*/

