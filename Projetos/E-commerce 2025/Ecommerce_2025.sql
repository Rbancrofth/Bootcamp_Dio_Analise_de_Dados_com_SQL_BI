-- drop database ecommerce;

create database ecommerce;
use ecommerce;

-- criar tabelas

create table clients(
    idclient INT auto_increment primary key,
    fname varchar(20),
    midname char(3),
    lastname varchar(25),
    cpf char(11),
    cnpj char(14),
    client_type enum('PF', 'PJ') not null,
    address varchar(255),
    constraint unique_cpf_client unique(cpf),
    constraint unique_cnpj_client unique(cnpj),
    constraint chk_client_type check(
        (client_type = 'PF' and cpf is not null and cnpj is null) or 
        (client_type = 'PJ' and cnpj is not null and cpf is null)
    )
);

alter table clients auto_increment=1;

create table product(
	idproduct INT auto_increment primary key,
    pname varchar(255) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Móveis', 'Alimentos') not null,
	avaliação float default 0,
    size varchar(15)
);

create table orders(
	idorder INT auto_increment primary key,
    idorderclient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderdescription varchar(255),
    sendvalue float default 10,
    paymentcash bool default false,
	deliveryStatus enum('Aguardando Envio', 'Em Trânsito', 'Entregue', 'Cancelado') default 'Aguardando Envio',
    trackingCode varchar(50),
    constraint fk_orders_client foreign key (idorderclient) references clients(idclient)
			on update cascade
			on delete set null
);

create table payment (
    idpayment INT auto_increment primary key,
    idclient INT not null,
    typepayment enum('cash', 'card', 'two cards', 'pix', 'boleto') not null,
    limitAvailible float,
    datevalid date,
    constraint fk_payment_client foreign key (idclient) references clients(idclient)
        on update cascade
        on delete cascade
);
    
create table productStorage(
	idproductStorage INT auto_increment primary key,
    storageLocation varchar(255),
    quantidade int default 0
);

create table supplier(
	idsupplier INT auto_increment primary key,
    socialName varchar(255) not null,
    cnpj char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (cnpj)
);

create table seller(
	idseller INT auto_increment primary key,
    socialName varchar(255) not null,
    abstratName varchar(255),
    cnpj char(15),
    cpf char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique (cpf)
);

create table productSeller(
	idPSeller INT,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPSeller) references seller (idseller),
    constraint fk_product_product foreign key (idPproduct) references product (idproduct)
);

create table productOrder(
	idPOproduct INT,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel','Sem Estoque') default 'Disponivel',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product (idproduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders (idorder)
);

create table storageLocation(
	idLproduct INT,
    idLstorage int,
    location varchar (255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product (idproduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idproductStorage)
);

create table productSupplier(
	idPsSupplier INT,
    idPsProduct int,
    Quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idsupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product (idproduct)
);

