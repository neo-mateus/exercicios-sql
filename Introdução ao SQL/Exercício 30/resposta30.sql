/*Uma outra instância em que o resultado da consulta não seria
zero seria a possibilidade da existência de instrutores
com salários nulos no banco de dado, uma vez que as funções
agregadas eliminam valores nulos para entregar resultados.
A função avg apenas executa salários de instrutores que possuem
salários não nulos, por sua vez, a função sum apenas soma
salários não nulos também, entretanto, o peso da média é 
diferente, o calculo puro da média pelo subtraendo da operação
está contando instrutores com salários nulos, já o calculo pelo
avg, não, logo a diferença sera diferente de zero para estas
instâncias*/