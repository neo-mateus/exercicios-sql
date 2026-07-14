select sum(value) as total_loan
from loan
group by branch_name;