select ID
from depositor, account, branch
where account.acc_num = depositor.acc_num
	and branch.branch_name = account.branch_name
    and branch_city = "Brooklyn";
