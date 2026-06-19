select ID,
	case 
		when score < 40 then 'F'
        when score >= 40 and score < 60 then 'C'
        when score >= 60 and score < 80 then 'B'
        when score >= 80 then 'A'
        else '??'
	end
from release_score;