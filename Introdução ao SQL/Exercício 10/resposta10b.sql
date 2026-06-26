update works 
set salary = case
				when salary*1.1 > 9999.00 then salary = salary*1.03
				else salary = salary*1.1 
			end
where company_name= "First Bank Corporation"
	and ID in (select ID
				from manage);
                
/*Declarei o tipo de dado do salary errado portanto coloquei
o valor máximo do tipo, peço escusas pelo engano!*/