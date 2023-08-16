-- Persistencia de dados
use ecommerce;

desc clients;
insert into clients (FirstName, LastName,CPF,Adress) 
values('Vitor','Cometti','12345678901','Rua Montevideu n111 Vila Nova'),
('Alexis','Texas','45612378912','Rua Hollywood n1 Centro'),
('João','Doe','78945612332','Rua X n18 Vila'),
('Jane','Doe','13278945685','Rua Y n171 Nova'),
('Jimy','Texas','15935745685','Rua Z n7567 New Island');
select * from clients;

desc product;
-- categoria truncada, deve seguir o padrão ->('Eletronico','Vestimenta','Brinquedo','Alimento')
insert into product (ProductName, Category, ProductDescription, Price)
values('Fone de ouvido','Eletronico','headset razer','200.00'),
('Boneco DBZ','Brinquedo','Boneco acao dragon ball Z','45.50'),
('Caixa de Barra Cereal','Alimento','Caixa com 20un de Barra Cereal Fitness','32.90'),
('Jaqueta de Couro','Vestimenta','Couro Original','450.90');
select * from product;

desc orders;
insert into orders (idOrdersClient,OrdersStatus,OrdersDescription, TypePayment, Shipping)
values(1,default,'Compra via app','Boleto',null),
(1,default,'Compra via app','Boleto',null),
(1,default,'Compra via app','Boleto',null),
(2,'Confirmado','Compra via app','Cartão','50.00'),
(3,'Cancelado','Compra via app','Boleto','100.90');
select * from orders;

desc productOrder;
insert into productOrder (idPOProduct, idPOOrder, POQuantity, POStatus)
values(1,11,2,default),
(2,11,1,default),
(3,12,1,default);
select * from productOrder;

desc productstorage;
insert into productstorage (Quantity, Localization)
values('100','Rio de Janeiro'),
('300', 'São Paulo'),
('120', 'Santa Catarina');
select * from productstorage;

desc locationstorage;
insert into locationstorage(idLProduct, idLStorage, Location)
values(1,2,'RJ'),
(2,3,'SP');
select * from locationstorage;

desc Supplier;
insert into Supplier(SocialName,CNPJ,Contact)
values('Almeida e filhos',111111111111111, 1111111111),
('StoreMac',111134516111111, 9898989898),
('Popstore',00000000000000, 1231231258);

desc productsupplier;
insert into productsupplier(idPSSupplier, idPSProduct, PSQuantity)
values (1,1,50),
(2,1,30),
(1,3,300);

desc seller;
insert into seller(SocialName, cnpj, contact)
values('Tech Eletronics', 111111223344556, 2039485761),
('Kids World', 398475927472937, 2917458208);

desc ProductSeller;
insert into productseller(idpseller, idproduct, quantity)
values(1,2,30),
(2,1,100),
(2,2,45);

