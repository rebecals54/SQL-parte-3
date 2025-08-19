--GROUP BY: serve para agrupar registros semelhantes de uma coluna
-- normalmente utilizado em conjunto com as funções de agregação

--Exemplo 1: Contagem agrupada de uma coluna. Calcule o n° de clientes
-- da tebla customers por estado 

select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc

--Exemplo 2: Contagem agrupada de várias colunas 
-- calcule o n° de clientes por estado e status profissional 
select state, professional_status, count(*) as contagem
from sales.customers
group by state, professional_status
order by state, contagem desc

--ou:
select state, professional_status, count(*) as contagem
from sales.customers
group by 1,2 --são colunas 
order by state, contagem desc

--Exemplo 3: Seleção de valores distintos. Selecione os estados 
-- distintos na tabela customers utilizando o group by
select distinct state 
from sales.customers

select state
from sales.customers
group by state


--RESUMO:
--(1) Serve para agrupar registros semelhantes de uma coluna,
--(2)Normalmente utilizado em conjunto com as Funções de agregação,
--(3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal
-- 9ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela)
--(4) o GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas
