select b1.branch_name
from branch as b1, branch as b2
where b1.branch_city = "Brooklyn"
	and b2.branch_city = "Brooklyn"
    and b1.actives > b2.actives;