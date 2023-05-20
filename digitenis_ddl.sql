create database digitenis;

use digitenis;

create table fornecedor (
    id_fornecedor int,
    cnpj varchar(14),
    nome varchar(50),
    email varchar(50),
    primary key (id_fornecedor)
);

create table telefone (
    id_fornecedor int,
    telefone varchar(11)
    primary key (id_fornecedor, telefone),
    foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

create table funcionario (
    id_funcionario int,
    primeiro_nome varchar(50),
    sobrenome varchar(50),
    cpf varchar(11),
    cargo varchar(50),
    primary key (id_funcionario)
);

create table produto (
    id_produto int,
    nome varchar(50),
    tamanho int,
    categoria varchar(50),
    valor_compra float,
    valor_venda float,
    id_fornecedor int,
    primary key (id_produto),
    foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

create table venda (
    id_venda int,
    valor_total float,
    "data" date,
    hora time,
    id_funcionario int,
    primary key (id_venda),
    foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table item_venda (
    id_produto int,
    id_venda int,
    quantidade int,
    desconto float,
    primary key (id_produto, id_venda),
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_venda) references venda(id_venda)
);

create table estoque (
    id_produto int,
    quantidade int,
    primary key (id_produto),
    foreign key (id_produto) references produto(id_produto)
);