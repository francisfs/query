
create database bdforum1;
use bdforum1;
create table departamento (
codigo int(3) ,
descricao varchar(50) not null,
unique key descricao_unica (descricao),
primary key (codigo) 	
);

create table funcionario(
matricula int(11) auto_increment,
nome varchar(80) not null,
dt_nascimento varchar(10) not null,
logradouro varchar(80) not null,
numero varchar(10) not null,
bairro varchar(50),
cidade varchar(50) not null,
uf varchar (2),
CEP varchar(9),
salario float(15,2) not null,
codigo_departamento int(3),
primary key(matricula),
constraint fk_func_cod_dep foreign key(codigo_departamento) references departamento (codigo)
);

create table funcionario_telefone(
codigo int (11) auto_increment,
matricula_func int(11),
telefone varchar(15) not null unique,
primary key(codigo),
constraint fk_func_cod_tel foreign key (matricula_func) references funcionario(matricula)
);