-- 1. Obter todas as colunas das tabelas Clientes, Pedidos e Fornecedores
select * from customers;

select * from orders;

select * from suppliers;

-- 2. Obter todos os Clientes em ordem alfabética por país e nome
select * from customers
order by country ASC, contact_name ASC;

-- 3. Obter os 5 pedidos mais antigos
select * from orders
order by order_date
limit 5

-- 4. Obter a contagem de todos os Pedidos feitos durante 1997
select COUNT(*) as "Number of Orders During 1997" from orders
where order_date between '1997-01-01' and '1997-12-31';


-- 5. Obter os nomes de todas as pessoas de contato onde a pessoa é um gerente, em ordem alfabética
select contact_name from customers
where upper(contact_title) like '%MANAGER%'
order by contact_name;


-- 6. Obter todos os pedidos feitos em 19 de maio de 1997
select * from orders
where order_date = '1997-05-19'