-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.


CREATE TABLE clientes(
id_clientes int auto_increment primary key,
telefone varchar(15) not null,
nome varchar(50) not null unique,
data_cadastro datetime not null,
email varchar(20) not null,
CPF varchar(15) not null unique
);

CREATE TABLE Programa_fidelidade (
id_programa int auto_increment primary key,
nivel_categoria varchar not null(20),
data_ultima_atualizacao date not null,
saldo_pontos int not null,
data_cadastro datetime not null
);

CREATE TABLE Funcionários (
id_funcionario int auto_increment primary key PRIMARY KEY,
CPF varchar(14) not null unique,
salario float not null,
nome varchar(20) not null,
cargo varchar(20) not null,
data_admissao datetime not null
);

CREATE TABLE Produtos (
id_produtos int PRIMARY KEY,
nome varchar(100) not null,
descricao varchar(100) not null,
preco_unitario float,
categoria varchar(100) not null
);

CREATE TABLE Pedidos (
id_pedido int auto_increment PRIMARY KEY,
status varchar(20) not null,
valor_total float not null,
data_hora datetime not null,
tipo_pedido enum ('presencial', 'delivery') default 'delivery'
);



CREATE TABLE Pagamento (
id_pagamento int auto_increment primary key PRIMARY KEY,
valor_pago float not null,
data_hora_pagamento datetime not null,
status_pagamento varchar(20) not null,
forma_pagamento enum ('pix', 'cartao', 'dinheiro') default 'pix'
);

CREATE TABLE estoque ( 
id_insumo int auto_increment PRIMARY KEY,
nome_insumo varchar(100) not null,
quantidade_minima int not null,
quantidade_atual int not null,
unidade_medida enum ('kg', 'ml', 'mg') default 'kg'
);

CREATE TABLE delivery (
id_delivery int auto_increment PRIMARY KEY,
endereco_entrega varchar(100) not null,
taxa_entrega int not null,
status_entrega varchar(100) not null,
data_hora_saida datetime not null
);


