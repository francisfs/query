create schema IF NOT exists `projeto_final` default character SET latin1;
USE `projeto_final`;

-- tabela projeto final ---
create table if not exists `projeto_final`.`usuario`(
idusuario int (11) not null auto_increment,
nome varchar (150) null default null,
cpf varchar (11) not null,
dataNascimento date null default null,
email varchar (150) null default null,
senha varchar (45) null default null,
primary key (idusuario),
unique index cpf_UNIQUE (cpf asc))
engine InnoDB
default char set = latin1;

-- tabela projeto_final.formação academica --

create table if not exists `projeto_final.formacaoAcademica`(
idformacaoAcademica int (11) not null auto_increment,
idusuario int (11) not null,
inicio date not null,
fim date null default null,
descricao varchar(150) null default null,
primary key (idformacaoAcademica),
index IDUSUARIO_idx (idusuario asc),
constraint idusuario
foreign key (idusuario)
references projeto_final.usuario (idusuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION)

ENGINE InnoDB
default character set = latin1;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
 





