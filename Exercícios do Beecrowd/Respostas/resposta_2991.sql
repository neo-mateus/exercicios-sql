with calculo_vencimento(matr, vencimento, cod_dep, cod_divisao) as(
	select matr, 
		(select sum(valor)
	 	from vencimento as V, emp_venc as E
		where E.cod_venc = V.cod_venc
		and E.matr = emp.matr) as vencimento, departamento.cod_dep, cod_divisao
	from empregado as emp, departamento, divisao
	where emp.lotacao = departamento.cod_dep 
		and emp.lotacao_div = divisao.cod_divisao

),
calculo_desconto(matr, desconto, cod_dep, cod_divisao) as (
	select matr, 
		(select sum(coalesce(valor,0))
	 	from desconto as DE, emp_desc as D
		where D.cod_desc = DE.cod_desc
		and D.matr = emp.matr) as desconto, departamento.cod_dep, cod_divisao
	from empregado as emp, departamento, divisao
	where emp.lotacao = departamento.cod_dep 
		and emp.lotacao_div = divisao.cod_divisao
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
)
select ndep as departamento, ndiv as divisao, round(avg(salario),2) as media, max(salario) as maior
from dep_emp, emp_sal
where dep_emp.matr = emp_sal.matr
group by ndep, ndiv
order by media desc;with calculo_vencimento(matr, vencimento, cod_dep, cod_divisao) as(
	select matr, 
		(select sum(valor)
	 	from vencimento as V, emp_venc as E
		where E.cod_venc = V.cod_venc
		and E.matr = emp.matr) as vencimento, departamento.cod_dep, cod_divisao
	from empregado as emp, departamento, divisao
	where emp.lotacao = departamento.cod_dep 
		and emp.lotacao_div = divisao.cod_divisao

),
calculo_desconto(matr, desconto, cod_dep, cod_divisao) as (
	select matr, 
		(select sum(coalesce(valor,0))
	 	from desconto as DE, emp_desc as D
		where D.cod_desc = DE.cod_desc
		and D.matr = emp.matr) as desconto, departamento.cod_dep, cod_divisao
	from empregado as emp, departamento, divisao
	where emp.lotacao = departamento.cod_dep 
		and emp.lotacao_div = divisao.cod_divisao
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
)
select ndep as "Nome Departamento", count(emp_sal.matr) as "Numero de Empregados", round(avg(salario),2) as "Media Salarial", max(salario) as "Maior Salario", min(salario) as "Menor Salario"
from dep_emp, emp_sal
where dep_emp.matr = emp_sal.matr
group by ndep
order by "Media Salarial" desc;
