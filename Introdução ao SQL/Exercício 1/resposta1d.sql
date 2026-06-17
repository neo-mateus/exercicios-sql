(select *
from instructor)
except
(select I1.*
from instructor as I1, instructor as I2
where I1.salary < I2.salary);