-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE cliente (
id_cliente Foreign Key(id_Cliente) References Cliente (id_Cliente) PRIMARY KEY,
nome_cliente varchar(50)
)

CREATE TABLE pedido (
id_pedido Foreign Key(id_Cliente) References Cliente (id_Cliente) PRIMARY KEY,
data_pedido datetime not null,
id_cliente Foreign Key(id_Cliente) References Cliente (id_Cliente),
FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente)
)

CREATE TABLE produto+estoque (
id_produto int auto_increment primary key,
nome_produto varchar(100) not null,
id_estoque int auto_increment primary key,
quantidade int not null,
PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE fornecedor (
id_fornecedor int auto_increment primary key PRIMARY KEY,
razao_social varchar(100)
)

CREATE TABLE produto (
id_produto int auto_increment primary key PRIMARY KEY,
nome_produto varchar(100)
)



CREATE TABLE Relação_2+id_item (
id_produto int not null,
id_fornecedor int not null,
id_item int auto_increment primary key PRIMARY KEY,
valor decimal (10,2)
)

