select distinct branch_name
from account as A
where exists (select acc_num
			 from depositor as D, client as C
             where D.acc_num = A.acc_num
				and client.ID = depositor.ID
                and client.client_city = "Harrison");
			