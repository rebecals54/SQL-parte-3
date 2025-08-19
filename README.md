
# 🚀 Funções Agregadas, GROUP BY e HAVING

Este repositório reúne minhas anotações e exemplos práticos de consultas em **SQL**, com foco em **funções agregadas** e no uso de **GROUP BY** e **HAVING**.

## 🔹 Funções Agregadas

As funções agregadas servem para executar operações aritméticas nos registros de uma coluna.
Principais funções:

* `COUNT()` → conta os registros
* `SUM()` → soma os valores
* `MIN()` → retorna o menor valor
* `MAX()` → retorna o maior valor
* `AVG()` → calcula a média

### Exemplos:

**1. Contagem de todas as visitas realizadas ao site:**

```sql
select count(*)
from sales.funnel;
```

**2. Contagem apenas dos pagamentos registrados:**

```sql
select count(paid_date)
from sales.funnel;
```

**3. Contagem distinta de produtos visitados em Jan/21:**

```sql
select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31';
```

**4. Preço mínimo, máximo e médio dos produtos:**

```sql
select min(price), max(price), avg(price)
from sales.products;
```

**5. Produto mais caro da tabela:**

```sql
select *
from sales.products
where price = (select max(price) from sales.products);
```

📌 **Resumo das Funções Agregadas:**

1. Executam operações aritméticas nos registros de uma coluna
2. Não consideram valores nulos (`NULL`)
3. `COUNT(*)` conta todos os registros
4. `COUNT(DISTINCT)` conta apenas valores exclusivos

---

## 🔹 GROUP BY

O `GROUP BY` agrupa registros semelhantes de uma coluna e normalmente é utilizado junto com funções agregadas.

### Exemplos:

**1. Número de clientes por estado:**

```sql
select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc;
```

**2. Número de clientes por estado e status profissional:**

```sql
select state, professional_status, count(*) as contagem
from sales.customers
group by state, professional_status
order by state, contagem desc;
```

**3. Seleção de estados distintos (equivalente ao DISTINCT):**

```sql
select state
from sales.customers
group by state;
```

📌 **Resumo do GROUP BY:**

1. Agrupa registros semelhantes
2. Usado com funções agregadas
3. Pode usar posição ordinal: `GROUP BY 1,2`
4. `GROUP BY` sozinho funciona como `DISTINCT`

---

## 🔹 HAVING

O `HAVING` é usado para **filtrar resultados de funções agregadas**, enquanto o `WHERE` filtra apenas colunas não agregadas.

### Exemplos:

**1. Estados com mais de 100 clientes:**

```sql
select state, count(*)
from sales.customers
group by state
having count(*) > 100;
```

**2. Filtro combinado (HAVING + condição não agregada):**

```sql
select state, count(*)
from sales.customers
group by state
having count(*) > 100
   and state <> 'MG';
```

📌 **Resumo do HAVING:**

1. Filtra resultados de funções agregadas
2. Pode também filtrar colunas não agregadas
3. WHERE = antes da agregação | HAVING = depois da agregação

---

## ✅ Conclusão

Esse estudo me ajudou a entender melhor como trabalhar com **análises e agrupamentos em SQL**, explorando:

* Funções agregadas (`COUNT, SUM, MIN, MAX, AVG`)
* Agrupamentos com `GROUP BY`
* Filtros com `HAVING`
