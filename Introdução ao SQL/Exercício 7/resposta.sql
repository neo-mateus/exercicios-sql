/*No caso, temos uma consulta que seleciona uma tupla 
presente em uma das relações especificadas na mesma. Para o 
caso em que uma das tuplas seja desconhecida pela relação r1 
ou r2 cairá em uma contingência conhecida, por exemplo, r1.a1 
seja nulo, a proposição r1.a1=p.a1 é unknown (o mesmo para r2),
entretanto se a outra parte constituinte da operação lógica OR
for true a lógica será verdadeira. Caso contrário a resposta 
sempre será unknown. /*