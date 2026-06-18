/*Para realizar estas exclusões, precisamos remover todas as
relações de chaves estrangeiras referenciadas pelas chave
course_id, para isso, realizamos uma exclusão dos cursos
pré-requisitos que não estão presentes na relação seção.*/

delete from prereq as P
where not exists (select *
				  from section as S
                  where P.course_id = S.course_id
					or P.prereq_id = S.course_id);

/*Agora sim, excluímos todos os cursos que sequer foram
oferecidos. */

delete from course as C
where not exists (select *
				  from section as S
                  where C.course_id = S.course_id);