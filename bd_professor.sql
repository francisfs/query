create database bd_agenda2;
use bd_agenda2;

create table curso(
codigo int3 not null auto_increment,
descricao varchar(50) not null unique key,
constraint pk_cod_curso primary key (codigo)
);

create table professor(
matricula int not null auto_increment,
dt_nascimento date not null,
logradouro varchar(50)not null,
numero varchar(10),
bairro varchar(30)not null,
cidade varchar(40)not null,
uf varchar(2)not null,
cep varchar(9)not null,
salario double(10,2) default 0,
constraint pk_matr_prof primary key(matricula)
);


