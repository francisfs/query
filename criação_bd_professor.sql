create database bd_agenda2;
use bd_agenda2;
create table curso (
codigo int not null auto_increment,
descricao varchar(50) not null,
constraint pk_curso primary key (codigo),
constraint uk_cur_des unique key (descricao)
);

create table professor (
matricula int not null auto_increment,
nome varchar(50) not null,
dt_nascimento date not null,
logradouro varchar(50) not null,
numero varchar(10),
bairro varchar(30) not null,
cidade varchar (40) not null,
uf varchar(2) not null,
cep varchar(9) not null,
salario float (10,2) default 0,
constraint pk_professor primary key (matricula)
);

create table professor_telefone (
professor_fone_id int not null auto_increment,
matricula int not null,
numero varchar(15) not null,
constraint pk_professor_telefone primary key (professor_fone_id),
constraint fk_professor_matricula foreign key(matricula) references professor (matricula),
constraint uk_pt_mat_tel unique key (matricula, numero)
);

create table curso_professor (
curso_prof_id int not null auto_increment,
codigo_curso int not null,
matricula_prof int not null,
constraint pk_curso_professor primary key (curso_prof_id),
constraint fk_cp_cod_curso foreign key (codigo_curso) references curso (codigo),
constraint fk_cp_mat_prof foreign key (matricula_prof) references professor (matricula),
constraint uk_cp_cur_mat unique key (codigo_curso, matricula_prof) 
);