/*Para provarmos que <> all é idêntico a not in, realizaremos
uma comprovação por contradição, isto é, iremos comprovar
que existe uma tupla em que está em <> all mas não em not in
e vice-versa.Caso o resultado seja nulo, eles serão idênticos.
Consideremos,então, o caso em que temos duas relações r1 e r2, 
em que ambos possuem os mesmos atributos r1[A] = r2[A], iremos 
mostrar que se a união de r1 - r2 e r2 - r1 forem nulas, elas 
serão idênticas. r1 e r2 serão a relação estudante que não 
faz parte do departamento 'Comp. Sci.', cada um usando
operadores <>all e not in respectivamente e A sua ID."*/
with diff_all_student(ID) as (
	select ID
    from student
    where ID <> all(select ID
					from student
                    where dept_name = "Comp. Sci.")
),
not_in_student(ID) as (
	select ID
    from student
    where ID not in(select ID
					from student
                    where dept_name = "Comp. Sci.")
)
((select ID
from diff_all_student)
except
(select ID
from not_in_student))
union
((select ID
from not_in_student)
except
(select ID
from diff_all_student));