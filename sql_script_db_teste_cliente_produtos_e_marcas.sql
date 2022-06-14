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
prod_cliente_id INT,
prod_marca_id INT,
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

-- Inserindo Marcas
INSERT INTO marca VALUES (1,'Broto legal','A'),(2,'Prato fino','A'),(3,'Carmil','B'),(4,'Scala','B');

-- Inserindo Produtos
INSERT INTO produto VALUES (1,1,'Feijão',3,'fbl.png'), (3,2,'Arroz Sinhá',5,'fbl.png'), (6,3,'Arroz Dedé',5,'fbl.png'), (9,4,'Macarrão Parafuso',3,'fbl.png');

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
       FROM cliente where cidade_cliente = 'Caicó'
	   AND renda_cliente <= 6000;

-- Renda entre 3000 e 5000
SELECT * FROM cliente WHERE renda_cliente BETWEEN 3000 AND 5000;

-- Query com mais de uma tabela - INNER JOIN
SELECT nome_cliente as CLIENTE, nome_produto AS PRODUTO FROM cliente INNER JOIN produto ON cliente.cliente_id = produto.prod_cliente_id ORDER BY nome_cliente
