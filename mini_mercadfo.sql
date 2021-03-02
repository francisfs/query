create database minimercado;
use minimercado;

create table produto (
codigo_produto int(5) not null auto_increment,
descricao varchar(40) not null,
quantidade_estoque double(10,1) not null default 0,
constraint pk_produto primary key (codigo_produto),
constraint uk_descr_prod unique key (descricao)
);

create table cliente (
cpf_cliente varchar(11) not null,
nome varchar(80) not null,
endereco varchar(80) not null,
constraint pk_client primary key (cpf_cliente),
constraint uk_client unique key (cpf_cliente)
);

create table compra (
codigo_compra int(11) not null auto_increment,
data date not null,
cpf_cliente varchar(11) not null,
constraint uk_cod_comp primary key(codigo_compra),
constraint fk_clien_compr foreign key (cpf_cliente) references cliente(cpf_cliente)
);

create table compra_produto (
id_compra_produto int(11) not null auto_increment,
codigo_compra int(11) not null,
codigo_produto int(5) not null,
quantidade double (10,1) not null default 1,
preco double(10,2) not null,
constraint pk_compra_produto primary key (id_compra_produto),
constraint fk_compprod_codigo_compra foreign key (codigo_compra) references compra(codigo_compra),
constraint fk_compprod_codigo_produto foreign key (codigo_produto) references produto(codigo_produto)


);

