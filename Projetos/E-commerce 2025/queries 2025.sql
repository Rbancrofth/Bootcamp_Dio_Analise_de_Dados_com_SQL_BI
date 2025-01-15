use ecommerce;

insert into clients (fname, midname, lastname, cpf, address)
		values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'), 
			('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'), 
            ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'), 
            ('Julia','S','França', 789123456,'rua lareijas 861, Centro - Cidade das flores'), 
            ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
            ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');
            
insert into product (pname, classification_kids, category, avaliação, size) 
		values ('Fone de ouvido', false, 'Eletrônico', '4', null),
			('Barbie Elsa', true, 'Brinquedos', '3', null),
			('Body Carters', true, 'Vestimenta', '5', null),
            ('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
            ('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
            ('Farinha de arroz', false, 'Alimentos', '2', null),
            ('Fire Stick Amazon', false, 'Eletrônico', '3', null);

select * from product;

delete from orders where idorderclient in (1,2,3,4);
insert into orders (idorderclient, orderStatus, orderdescription, sendvalue, paymentcash) 
		values (1, default, 'compra via aplicativo', null, 1), 
			(2, default, 'compra via aplicativo', 50, 0), 
			(3, 'Confirmado', null, null, 1), 
			(4, default, 'compra via web site', 150, 0);
            
select * from orders;
INSERT INTO orders (idorderclient, orderStatus, orderdescription)
VALUES 
    (1, 'Em processamento', 'Pedido para teste 1'), -- Ajuste o `idorderclient` para IDs existentes na tabela `clients`
    (2, 'Em processamento', 'Pedido para teste 2');
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
		values (1,5,2,null), 
			(2,5,1,null), 
			(3,6,1,null);
            
insert into productStorage (storageLocation, quantidade) 
		values ('Rio de Janeiro', 1000), 
			('Rio de Janeiro', 500),
            ('São Paulo', 10),
            ('São Paulo', 100),
            ('São Paulo', 10),
            ('Brasília', 60);

insert into storageLocation (idLproduct, idLstorage, location) 
		values (1,2,'RJ'), 
			(2,6,'GO');

insert into supplier (SocialName, CNPJ, contact) 
		values ('Almeida e filhos', 123456789123456, '21985474'),
			('Eletrônicos Silva', 854519649143457, '21985484'),
            ('Eletrônicos Valma', 934567893934695, '21975474');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) 
		values (1, 1, 500), 
			(1, 2, 400), 
            (2, 4, 633),
            (3, 3, 5),
            (2, 5, 10);

INSERT INTO seller (socialName, abstratName, cnpj, cpf, location, contact)
VALUES 
    ('Tech electronics', NULL, 123456789456321, NULL, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', NULL, NULL, 123456783, 'Rio de Janeiro', 219567895),
    ('Kids World', NULL, 456789123654485, NULL, 'São Paulo', 1198657484);

INSERT INTO productSeller (idPSeller, idPproduct, prodQuantity)
VALUES 
    (1, 6, 80),
    (2, 7, 10);

-- 01 -- QUANTOS PEDIDOS FORAM REALIZADOS
SELECT 
    idClient, 
    fname,
    COUNT(idOrder) 
FROM clients 
INNER JOIN orders ON idClient = idOrderClient 
INNER JOIN productOrder ON idPOorder = idOrder 
GROUP BY idClient;

-- 02 -- TODOS OS CLIENTES E OS PEDIDOS REALIZADOS, INCLUINDO O STATUS DOS PEDIDOS
SELECT 
    c.idclient, 
    CONCAT(c.fname, ' ', c.lastname) AS nome_completo, 
    o.idorder, 
    o.orderStatus 
FROM clients c
LEFT JOIN orders o ON c.idclient = o.idorderclient;

 -- 03 -- OS PRODUTOS DISPONÍVEIS, SUAS CATEGORIAS E AVALIAÇÕES.
SELECT 
    pname AS produto, 
    category AS categoria, 
    avaliação AS avaliacao 
FROM product;        

-- 04 -- PRODUTOS COM AVALIAÇÃO MAIOR OU IGUAL A 4.
SELECT * 
FROM product 
WHERE avaliação >= 4;

-- 05 -- EXIBIR NOME COMPLETO DOS CLIENTES E ABREVIAÇÃO DO CPF
SELECT 
    CONCAT(fname, ' ', lastname) AS nome_completo, 
    CONCAT(LEFT(cpf, 3), '***', RIGHT(cpf, 3)) AS cpf_abreviado 
FROM clients;

-- 06 -- ORDENAR CLIENTES POR SOBRENOME E CPF
SELECT fname, lastname, cpf 
FROM clients 
ORDER BY lastname, fname;

-- 07 -- ORDENAR PRODUTOS POR AVALIAÇÃO
SELECT pname, category, avaliação 
FROM product 
ORDER BY avaliação DESC;

-- 08 -- CLIENTES QUE REALIAZARAM 2 OU MAIS PEDIDOS NO TOTAL
SELECT 
    c.idclient, 
    CONCAT(c.fname, ' ', c.lastname) AS nome_completo, 
    COUNT(o.idorder) AS total_pedidos 
FROM clients c
JOIN orders o ON c.idclient = o.idorderclient
GROUP BY c.idclient
HAVING total_pedidos >= 2;

-- 09 -- FORNECEDORES COM 2 OU MAIS PRODUTOS FORNECIDOS
SELECT 
    s.socialName AS fornecedor, 
    COUNT(ps.idPsProduct) AS produtos_fornecidos 
FROM supplier s
JOIN productSupplier ps ON s.idsupplier = ps.idPsSupplier
GROUP BY s.idsupplier
HAVING produtos_fornecidos >= 2;

-- 10 -- LISTAR PEDIDOS, CLIENTES E STATUS DE ENTREGA COM CÓDIGO DE RASTREIO
SELECT 
    o.idorder AS pedido, 
    CONCAT(c.fname, ' ', c.lastname) AS cliente, 
    o.orderStatus AS status, 
    CONCAT('Rastreamento-', o.idorder) AS codigo_rastreio
FROM orders o
JOIN clients c ON o.idorderclient = c.idclient;