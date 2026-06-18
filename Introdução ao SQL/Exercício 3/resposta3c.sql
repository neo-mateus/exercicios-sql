insert into instructor
select ID,name,dept_name,30000
from student
where tot_cred > 100;

/*No meu caso há uma restrição de salário mínimo de
30000 na relação instructor*/
    
