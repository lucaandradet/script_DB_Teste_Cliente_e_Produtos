-- Criando Banco de dados
CREATE DATABASE DBExemploClientes;

-- Usando Banco de dados
USE DBExemploClientes;

-- Criando tabela
CREATE TABLE cliente (
	cliente_id int not null primary key,
	nome_cliente varchar(50) not null,
	endereco_cliente varchar(50) not null,
	cidade_cliente varchar(35) not null default 'Natal',
	estado_cliente char(02) not null default 'RN',
	sexo_cliente char(01) not null check (sexo_cliente IN ('M', 'F')),
	renda_cliente decimal(12,2) not null check (renda_cliente >= 750)
	);
	
CREATE TABLE marca
(marca_id INT,
descricao_marca VARCHAR (50),
tipo_marca VARCHAR(2)
);

CREATE TABLE produto
(
produto_id INT,
produto_marca_id INT,
produto_cliente_id INT,
nome_produto VARCHAR(100),
preco_produto MONEY,
fotos_produto varchar(50)
);
	
---

-- Inserindo clientes
INSERT INTO cliente VALUES (1,'João', 'Av. Salgado Filho','Natal','RN','M',6000);

INSERT INTO cliente VALUES (2,'Ana','Av. Hermes da Fonseca','Natal','RN','F',3500);

INSERT INTO cliente VALUES (3,'Pedro','Av. Hermes da Fonseca','Natal','RN','M',5500);

INSERT INTO cliente VALUES (4,'Manuel','Rua Manuel Dantas','Caicó','RN','M',1500);

INSERT INTO cliente VALUES (5,'Lucas','Av. Salgado Filho','Natal','RN','M',4500);

INSERT INTO cliente VALUES (6,'Cláudio','Rua Manuel Dantas','Caicó','RN','M',1890);

INSERT INTO cliente VALUES (7,'José','Av. Roberto Freire','Natal','RN','M',5000);

INSERT INTO cliente VALUES (8,'Marcos','Rua Ipê Roxo','Caicó','RN','M',1800);

INSERT INTO cliente VALUES (9,'Maria','Av. Salgado Filho','Natal','RN','F',6500);

INSERT INTO cliente VALUES (10,'Manuela','Rua Manuel Dantas','Caicó','RN','F',1800);

INSERT INTO cliente VALUES (11,'Márcia','Av. Ayrton Senna','Natal','RN','F',1400);

INSERT INTO cliente VALUES (12,'Flávia','Rua Dantas de Sousa','Parnamirim','RN','F',1750);

INSERT INTO cliente VALUES (13,'Laura','Rua dos Coqueiros','Parnamirim','RN','F',4500);

INSERT INTO cliente VALUES (14,'Levi','Rua dos Cajueiros','Natal','RN','M',5900);

INSERT INTO cliente VALUES (15,'Miguel','Rua da Pitangueira','Parnamirim','RN','M',8000);

-- Inserindo Marcas
INSERT INTO marca 
VALUES 	(1,'Broto legal','A'),
		(2,'Prato fino','A'),
		(3,'Carmil','B'),
		(4,'Scala','B'),
		(5,'Nestle','C'),
		(6,'Bauducco','D'),
		(7,'Yoki','E'),
		(8,'Sadia','F'),
		(9,'Seara','G'),
		(10,'Marilan','H'),
		(11,'Danone','I'),
		(12,'Coca-cola','J');

-- Inserindo Produtos
INSERT INTO produto 
VALUES 	(1,1,1,'Feijão',4.79,'fbl.png'), 
		(2,2,2,'Arroz Sinhá',6.50,'fbl.png'), 
		(3,3,15,'Arroz Dedé',5.49,'fbl.png'), 
		(4,4,4,'Macarrão Parafuso',3.49,'fbl.png'),
		(5,5,5,'Biscoito Nestle',2.90,'fbl.png'), 
		(6,6,14,'Biscoito Bauducco',3.45,'fbl.png'), 
		(7,7,7,'Farofa Yoki',5.89,'fbl.png'), 
		(8,8,8,'Salsicha Sadia',15.99,'fbl.png'),
		(9,9,13,'Salsicha Seara',11.90,'fbl.png'), 
		(10,10,10,'Bolacha Marilan',1.89,'fbl.png'), 
		(11,11,2,'Danoninho',3.59,'fbl.png'), 
		(12,12,12,'Refrigerante Coca-cola 2L',9.99,'fbl.png');

---

-- Atualizando clientes
UPDATE cliente SET endereco_cliente = 'Av. Maria Lacerda' where nome_cliente='Ana';

UPDATE cliente Set cidade_cliente = 'Caicó', endereco_cliente = 'Av. Coronel Martiniano' where nome_cliente = 'Ana' or nome_cliente = 'Pedro';

---

-- Realizando consultas
select * from cliente;
select * from marca;
select * from produto;

-- Consulta
SELECT nome_cliente, cidade_cliente, sexo_cliente
FROM cliente
ORDER BY nome_cliente ASC, cidade_cliente DESC;

--Faça um relatório que exiba apenas o nome, o endereço, e a cidade do cliente da cidade de Caicó e renda menor do 6000
SELECT nome_cliente, endereco_cliente, cidade_cliente, renda_cliente 
FROM cliente where cidade_cliente = 'Caicó' AND renda_cliente <= 6000;

-- Renda entre 3000 e 5000
SELECT * FROM cliente WHERE renda_cliente BETWEEN 3000 AND 5000;

-- Query com mais de uma tabela - INNER JOIN
SELECT nome_cliente as CLIENTE, nome_produto AS PRODUTO 
FROM cliente 
INNER JOIN produto ON cliente.cliente_id = produto.produto_cliente_id 
ORDER BY nome_cliente

--Sub-Select trazendo os produtos a cima do valor médio dos preços
SELECT produto_id, nome_produto, preco_produto
FROM produto 
WHERE preco_produto > (SELECT AVG(preco_produto) FROM produto)

-- Query com mais de uma tabela - INNER JOIN e SUB-SELECT
SELECT produto_id AS ID_PRODUTO, nome_produto AS PRODUTO,preco_produto AS PRECO_DO_PRODUTO, nome_cliente as CLIENTE
FROM cliente 
INNER JOIN produto ON cliente.cliente_id = produto.produto_cliente_id 
WHERE preco_produto > (SELECT AVG(preco_produto) FROM produto)
ORDER BY preco_produto DESC;
