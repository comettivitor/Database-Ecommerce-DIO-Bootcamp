-- Recuperação de dados
use ecommerce;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrdersClient;
select FirstName,LastName,idOrders,ordersstatus from clients c, orders o where c.idClient = idOrdersClient;
select concat(firstname, ' ' , lastname) as Client, idorders as Request, ordersstatus as Status From clients c, orders o where c.idClient = idOrdersClient;
select count(*) from clients c, orders o where c.idClient = idOrdersClient;
select * from clients left outer join orders on idClient = idOrdersClient;
select c.idClient, count(*) as number_of_orders from clients c inner join orders o on c.idClient = o.idOrdersClient group by idClient;
select count(*) from orders o, clients c where c.idClient = idOrdersClient group by idClient;
