-- 1. Cria um relatório para todos os pedidos de 1996 e seus clientes (152 linhas)
select * 
from orders o
left join customers c
on o.customer_id = c.customer_id
where EXTRACT(YEAR from o.order_date) = 1996;

-- 2. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem funcionários (5 linhas)
select e.city as cidade,
	COUNT(DISTINCT e.employee_id) as quantidade_funcionarios,
	COUNT(DISTINCT c.customer_id) as quantidade_clientes
from employees e
left join customers c
on e.city = c.city
group by e.city
order by e.city;

-- 3. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem clientes (69 linhas)
select e.city as cidade,
	COUNT(DISTINCT e.employee_id) as quantidade_funcionarios,
	COUNT(DISTINCT c.customer_id) as quantidade_clientes
from employees e
left join customers c
on e.city = c.city
group by e.city
order by e.city;    

-- 4.Cria um relatório que mostra o número de funcionários e clientes de cada cidade (71 linhas)
SELECT
	COALESCE(e.city, c.city) AS cidade,
	COUNT(DISTINCT e.employee_id) AS numero_de_funcionarios,
	COUNT(DISTINCT c.customer_id) AS numero_de_clientes
FROM employees e 
FULL JOIN customers c ON e.city = c.city
GROUP BY e.city, c.city
ORDER BY cidade;

-- 5. Cria um relatório que mostra a quantidade total de produtos encomendados.
-- Mostra apenas registros para produtos para os quais a quantidade encomendada é menor que 200 (5 linhas)
select p.product_id, p.product_name, sum(o.quantity) as quantidade_total
from order_details o
join products p on o.product_id = p.product_id
group by p.product_id, p.product_name
having sum(o.quantity) < 200
order by quantidade_total desc;

-- 6. Cria um relatório que mostra o total de pedidos por cliente desde 31 de dezembro de 1996.
-- O relatório deve retornar apenas linhas para as quais o total de pedidos é maior que 15 (5 linhas)
SELECT customer_id, COUNT(order_id) AS total_de_pedidos
FROM orders
WHERE order_date > '1996-12-31'
GROUP BY customer_id
HAVING COUNT(order_id) > 15
ORDER BY total_de_pedidos;