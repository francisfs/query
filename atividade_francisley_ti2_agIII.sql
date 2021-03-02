create database francisley_ti2_ag3;
use francisley_ti2_ag3;

create table sindico(
matric_sind int not null auto_increment,
nome varchar(40) not null,
endereco varchar(50) not null,
telefone varchar(12) not null,
constraint pk_matri_sind primary key(matric_sind)
);

create table condominio(
condominio_cod int not null,
nome varchar(20) not null,
endereco varchar (50) not null,
sindico_resp int not null,
constraint pk_cond primary key(condominio_cod),
constraint fk_sind_resp_cond foreign key (sindico_resp) references sindico (matric_sind)
);

create table proprietario (
proprietario_id int not null auto_increment,
rg varchar(9) not null,
nome varchar (40) not null,
telefone varchar(11) not null,
email varchar (20) not null,
constraint pk_proprietario primary key (proprietario_id)
);

create table apartamento(
apartamento_id int not null auto_increment ,
numero varchar(5) not null,
tipo varchar(2) not null,
condominio_cod int not null,
proprietario int not null,
constraint pk_apartamento primary key(apartamento_id),
constraint fk_apart_cond foreign key (condominio_cod) references condominio (condominio_cod),
constraint fk_apart_prop foreign key (proprietario) references proprietario (proprietario_id)
);

create table garagem (
gar_numero int not null auto_increment,
tipo varchar(7) not null,
apartamento int not null,
constraint pk_garag primary key (gar_numero),
constraint fk_garag_apto foreign key (apartamento) references apartamento (apartamento_id)
);





