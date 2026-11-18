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
dep_emp(ndep, ndiv, matr) as(
	select departamento.nome, divisao.nome, empregado.matr
	from departamento, divisao, empregado
	where divisao.cod_dep = departamento.cod_dep
		and empregado.lotacao_div = divisao.cod_divisao
)
select ndep as Departamento, empregado.nome as Empregado, coalesce(round(vencimento,2),0) as "Salario Bruto", coalesce(round(desconto,2),0) as "Total Desconto",
((select coalesce(vencimento, 0)
  from calculo_vencimento
  where empregado.matr = calculo_vencimento.matr)
  -
  (select coalesce(desconto, 0)
  from calculo_desconto
  where empregado.matr = calculo_desconto.matr)
) as "Salario Liquido"
from dep_emp, empregado, calculo_vencimento,calculo_desconto
where dep_emp.matr = empregado.matr
	and calculo_vencimento.matr = empregado.matr
	and calculo_desconto.matr = empregado.matr
order by "Salario Liquido" desc;
