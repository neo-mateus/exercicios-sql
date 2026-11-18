WITH calculo_vencimento(matr, vencimento, departamento, divisao) as (
	SELECT E.matr, 
		(SELECT sum(valor)
		FROM vencimento
		WHERE cod_venc in (SELECT cod_venc
				  FROM emp_venc as A
				  WHERE A.matr = E.matr)) as vencimento, D.cod_dep, cod_divisao
	FROM empregado as E, departamento as D, divisao
	WHERE E.lotacao = D.cod_dep
		AND E.lotacao_div = divisao.cod_divisao

),
calculo_desconto(matr, desconto, departamento, divisao) as (
        SELECT E.matr,
                (SELECT sum(valor)
                FROM desconto
                WHERE cod_desc in (SELECT cod_desc 
			FROM emp_desc as B
                                  WHERE B.matr = E.matr)) as desconto, D.cod_dep, cod_divisao
        FROM empregado as E, departamento as D, divisao
        WHERE E.lotacao = D.cod_dep
                AND E.lotacao_div = divisao.cod_divisao
),
emp_sal(matr, salario) as(
	select matr as M,
	((select  coalesce(vencimento,0)
	 from calculo_vencimento as A
	 where A.matr = emp.matr)
	 -
	 (select coalesce(desconto,0)
	 from calculo_desconto as B
	 where B.matr = emp.matr)) as salario
	from empregado as emp
	where emp.matr in ((select matr
				from calculo_vencimento)
				union
				(select matr
				from calculo_desconto))
),
dep_emp(ndep, ndiv, matr) as(
	select departamento.nome, divisao.nome, empregado.matr
	from departamento, divisao, empregado
	where divisao.cod_dep = departamento.cod_dep
		and empregado.lotacao_div = divisao.cod_divisao
),
div_media(ndep,ndiv, media) as (
	select ndep, ndiv,avg(salario)
	from dep_emp, emp_sal
	where dep_emp.matr = emp_sal.matr
	group by ndep, ndiv
)
select C.ndep as departamento, C.ndiv as divisao, round(C.media,2)
	from (select ndep, max(media) as media
	      from div_media
	      group by ndep) as D, div_media as C
where C.media = D.media
order by C.media desc;
