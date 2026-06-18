/* Não, o código não funcionaria com notas nulas pois a 
relação realiza um teste de igualdade entre a nota da relação
realiza com a nota_pontos, se falhar a tupla é eliminada da 
relação resultado, para contornar esse caso podemos unir
valores de notas nulas de alunos que não cursaram aquela
disciplina.
 */

/*Alternativa A*/
(select sum(credits*points) 
from takes as A, grade_points, course
where A.course_id = course.course_id
	and A.ID = 12173
	and A.grade = grade_points.grade)
union
(select 0
from student as S
where S.ID = 12173
	and not exists (select * from takes where takes.ID = S.ID)
);

/*Alternativa B*/
(select sum(credits*points)/sum(credits) as CR
from takes, grade_points, course
where takes.ID = 12173
	and takes.course_id = course.course_id
    and grade_points.grade = takes.grade)
union
(select null as CR
	from student as S
    where S.ID = 12173 
		and not exists (select * from takes where takes.ID = S.ID)
	);
        
        
/*Alternativa C*/
(select takes.ID, sum(credits*points)/sum(credits) as CR
from takes, grade_points, course
where takes.course_id = course.course_id
    and grade_points.grade = takes.grade
    and takes.grade is not null
group by ID)
union
(select S.ID, null as CR
from student as S
where not exists (select * from takes where takes.ID = S.ID)
group by S.ID
);