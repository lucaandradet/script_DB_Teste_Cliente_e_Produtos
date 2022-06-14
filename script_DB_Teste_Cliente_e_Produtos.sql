-- Criando Banco de dados
CREATE DATABASE DBExemploClientes;

-- Usando Banco de dados
USE DBExemploClientes;

-- Criando tabela
CREATE TABLE cliente (
	clienteID int not null primary key,
	nome varchar(50) not null,
	endereco varchar(50) not null,
	cidade varchar(35) not null default 'Natal',
	estado char(02) not null default 'RN',
	sexo char(01) not null check (sexo IN ('M', 'F')),
	renda decimal(12,2) not null check (renda >= 750)
	);
	
CREATE TABLE marcas
(produto_id INT,
descricao VARCHAR (50),
tipo VARCHAR(2)
);

CREATE TABLE produto
(
cliente_id INT,
marcas_id INT,
nome VARCHAR(100),
preco MONEY,
fotos varchar(50)
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
INSERT INTO marcas VALUES (1,'Broto legal','A'),(2,'Prato fino','A'),(3,'Carmil','B'),(4,'Scala','B');

-- Inserindo Produtos
INSERT INTO produto VALUES (1,1,'Feijão',3,'fbl.png'), (3,2,'Arroz Sinhá',5,'fbl.png'), (6,3,'Arroz Dedá',5,'fbl.png'), (9,4,'Macarrão Parafuso',3,'fbl.png');

---

-- Atualizando clientes
UPDATE cliente SET endereco = 'Av. Maria Lacerda' where nome='Ana';

UPDATE cliente Set cidade = 'Caicó', endereco = 'Av. Coronel Martiniano' where nome = 'Ana' or nome = 'Pedro';

---

-- Realizando consultas
select * from cliente;
select * from marcas;
select * from produto;

-- Consulta
SELECT nome, cidade, sexo
FROM cliente
ORDER BY nome ASC, cidade DESC;

--Faça um relatório que exiba apenas o nome, o endereço, e a cidade do cliente da cidade de Caicó e renda menor do 6000
SELECT nome, ENDERECO, cidade, renda 
       FROM cliente where cidade = 'Caicó'
	   AND renda <= 6000;

-- Renda entre 3000 e 5000
SELECT * FROM cliente WHERE RENDA BETWEEN 3000 AND 5000;