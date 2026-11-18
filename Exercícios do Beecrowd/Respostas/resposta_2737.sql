((select distinct name, customers_number
from ((select name, customers_number
      from lawyers)
      except 
     (select L1.name, L1.customers_number
      from lawyers as L1, lawyers as L2
      where L1.customers_number < L2.customers_number)) as max_customers)
union
(select distinct name, customers_number
from ((select name, customers_number
      from lawyers)
      except
     (select L1.name, L1.customers_number
      from lawyers as L1, lawyers as L2
      where L1.customers_number > L2.customers_number)) as min_customers)
order by customers_number desc)
union
(select 'Average', round(avg(customers_number),0)
from lawyers);

