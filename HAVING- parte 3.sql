--HAVING: filtrar linhas da selação  por uma coluna agrupada.

--Exemplo 1: Seleção com filtro no HAVING. Calcule o n° de clientes por 
-- estado filtrando apenas os estados acima de 100 clientes
select state, count(*)
from sales.customers
--where count(*)>100, apresenta o seguinte  ERROR:  funções de agregação 
--não são permitidas em WHERE. Where= só filtra colunas não agregadas.
group by state
having count(*)>100

--ex, onde where funciona 
select state, count(*)
from sales.customers
where state <> 'MG'
group by state
having count(*)>100

--ou para obter o mesmo resultado:
select state, count(*)
from sales.customers
group by state
having count(*)>100 -- colunas agregadas
       and state <> 'MG' -- colunas não agregadas


--RESUMO:
--(1)Tem a mesma função de WHERE mas pode ser usado para filtra os resultados 
-- das funções agregadas enquanto o WHERE possui essa limitação
--(2)A função HAVING também pode filtrar colunas não agregadas