select ID
from client as C
where not exists (select ID, A.loan_num
				 from applicant as A, loan as L
				 where A.loan_num = L.loan_num);               
                
show columns from client;