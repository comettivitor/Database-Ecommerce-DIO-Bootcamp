-- Criação DB para o cenário de E-Commerce
create database ecommerce;
use ecommerce;

-- Criar tabela Cliente
create table Clients(
	idClient int auto_increment primary key,
    FirstName varchar(10),
    LastName varchar(30),
    CPF char(11) not null,
    Adress varchar(45),
    constraint unique_cpf_client unique(CPF)
);

-- Criar tabela Produto
create table Product(
	idProduct int auto_increment primary key,
    ProductName varchar(30),
    Category enum('Eletronico','Vestimenta','Brinquedo','Alimento'),
    ProductDescription varchar(50),
	Price double
);

-- Criar tabela Pedido
create table Orders(
	idOrders int auto_increment primary key,
    idOrdersClient int,
    OrdersStatus enum('Cancelado','Confirmado','Processando') default 'Processando',
    OrdersDescription varchar(255),
    TypePayment enum('Boleto', 'Cartão','Dois Cartões') not null,
	Shipping float default 10,
    constraint fk_orders_client foreign key(idOrdersClient) references Clients(idClient)
);

-- Criar tabela Estoque
create table ProductStorage(
	idProdStorage int auto_increment primary key,
    Quantity double default 0,
    Localization varchar(20) not null
);

-- Criar tabela Fornecedor
create table Supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(20) not null,
    CNPJ char(15) not null,
    Contact char(10) not null,
    constraint unique_supplier unique(CNPJ)
);

-- Criar tabela Vendedor
create table Seller(
	idSeller int auto_increment primary key,
    SocialName varchar(20) not null,
    CNPJ char(15) not null,
	Contact char(10) not null,
    constraint unique_seller unique(CNPJ)
);

-- Criar relacionamento produtoxvendedor
create table ProductSeller(
	idPSeller int,
    idProduct int,
    Quantity int default 1,
    primary key(idPSeller, idProduct),
    constraint fk_product_seller foreign key(idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key(idProduct) references Product(idProduct)
);

-- Criar relacionamento produtoxpedido
create table ProductOrder(
	idPOProduct int,
    idPOOrder int,
    POQuantity int default 1,
    POStatus enum('Disponivel','Fora de estoque') default 'Disponivel',
    primary key (idPOProduct, idPOOrder),
    constraint fk_productorder_seller foreign key(idPOProduct) references Product(idProduct),
    constraint fk_productorder_product foreign key(idPOOrder) references Orders(idOrders)
);

-- Criar relacionamento produtoxestoque
create table LocationStorage(
	idLProduct int,
    idLStorage int,
    Location varchar(255) not null,
    primary key (idLProduct, idLStorage),
    constraint fk_productsl_seller foreign key(idLProduct) references Product(idProduct),
    constraint fk_productsl_product foreign key(idLStorage) references ProductStorage(idProdStorage)
);

-- Cria relacionamento produtoxfornecedor
create table ProductSupplier(
	idPSSupplier int,
    idPSProduct int,
    PSQuantity int not null,
    primary key (idPSSupplier, idPSProduct),
    constraint fk_productsup_seller foreign key(idPSSupplier) references supplier(idSupplier),
    constraint fk_productsup_product foreign key(idPSProduct) references Product(idProduct)
);