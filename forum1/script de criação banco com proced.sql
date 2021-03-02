/* CRIACAO DO BANCO DE DADOS */
create database consultorio;

use consultorio;

/* CRIACAO DAS ESTRUTURAS DO BANCO DE DADOS */
create table tipo_pessoa (
  tipo_pessoa_id int(3) not null auto_increment,
  descricao varchar(20) not null,
  primary key (tipo_pessoa_id)
);

create table pessoa (
  pessoa_id int(5) not null auto_increment,
  nome varchar(80) not null,
  dt_nascimento date not null,
  logradouro varchar(50) not null,
  numero varchar(10) default null,
  bairro varchar(30) not null,
  cidade varchar(40) not null,
  uf varchar(2) not null,
  cep varchar(9) not null,
  cns varchar(20) not null,
  cpf varchar(11),
  primary key (pessoa_id)
); 

create table pessoa_telefone (
  pessoa_fone_id int(10) not null auto_increment,
  pessoa_id int(5) not null,
  numero varchar(15) not null,
  primary key (pessoa_fone_id),
  unique key uk_pt_pesid_tel (pessoa_id, numero),
  constraint fk_pt_pesid foreign key (pessoa_id) references pessoa (pessoa_id)
);

create table pessoa_tipo (
   pessoa_tipo_id int(5) not null auto_increment,
   pessoa_id int(5) not null,
   tipo_pessoa_id int(3) not null,
   primary key(pessoa_tipo_id),
   unique key uk_ptp_pesid_ctppes (pessoa_id, tipo_pessoa_id),
   constraint fk_ptp_pes_id foreign key (pessoa_id) references pessoa (pessoa_id),
   constraint fk_ptp_tppesid foreign key (tipo_pessoa_id) references tipo_pessoa (tipo_pessoa_id)
);

create table convenio (
   convenio_id int(3) not null auto_increment,
   razao_social varchar(80) not null,
   cnpj varchar(14) not null,
   primary key(convenio_id)
);

create table procedimento (
   pro_id int(5) not null auto_increment,
   descricao varchar(50) not null,
   tipo varchar(1) not null,
   aparelho varchar(2),
   primary key(pro_id)
);

create table convenio_procedimento_valor (
	conv_proc_val_id int(5) not null auto_increment,
    convenio_id int(3) not null,
    pro_id int(5) not null,
    valor double(10,2) default 0,
    primary key (conv_proc_val_id),
    unique key uk_cpv_convid_proid (convenio_id, pro_id),
    constraint fk_cpv_conv_id foreign key (convenio_id) references convenio (convenio_id),
    constraint fk_cpv_pro_id foreign key (pro_id) references procedimento (pro_id)
);

create table agendamento (
	agendamento_id int(6) not null auto_increment,
    dt_agenda date not null,
    horario varchar(5) not null,
    pessoa_id int(5) not null,
    convenio_id int(3) not null,
    med_pessoa_id int(5) not null,
    pro_id int(5) not null,
    valor double(10,2) default 0,
    chegou varchar(1) default 'N',
    realizado varchar(1) default 'N',
    faturado varchar(1) default 'N',
    primary key (agendamento_id),
    unique key uk_ag_dta_hor (dt_agenda, horario),
    constraint fk_ag_pes_id foreign key (pessoa_id) references pessoa (pessoa_id),
    constraint fk_ag_conv_id foreign key (convenio_id) references convenio (convenio_id),
    constraint fk_ag_medpes_id foreign key (med_pessoa_id) references pessoa (pessoa_id),
    constraint fk_ag_pro_id foreign key (pro_id) references procedimento (pro_id)
);

create table worklist_aparelhos (
	worklist_id int(6) not null auto_increment,
    agendamento_id int(6) not null,
    dt_exame date not null,
    paciente varchar(80) not null,
    dt_nascimento date,
    convenio varchar(80) not null,
    procedimento varchar(100) not null,
    aparelho varchar(2) not null,
    integrado varchar(1) default 'N',
    primary key (worklist_id)
);

create table integracao_aparelhos (
	integracao_id int(6) not null auto_increment,
    worklist_id int(6) not null,
    dt_realizacao date,
    primary key (integracao_id)
);

/* INSERINDO REGISTROS NAS ESTRUTURAS */
insert into tipo_pessoa (descricao) values ('COLABORADOR');
insert into tipo_pessoa (descricao) values ('MEDICO');
insert into tipo_pessoa (descricao) values ('PACIENTE');

insert into pessoa 
	(nome, dt_nascimento, logradouro, numero, bairro, cidade, uf, cep, cns, cpf)
values 
	('Ana Maria', '1976-06-14', 'Alameda Dom Predro I', '432', 'IndependÃªncia', 'SÃ£o Paulo', 'SP', '04470-010', '230099165770018','18233799157');
    
insert into pessoa 
	(nome, dt_nascimento, logradouro, numero, bairro, cidade, uf, cep, cns, cpf)
values 
	('Marilda Dutra', '1979-01-23', 'Rua Adolfo Belini', '621', 'SÃ£o Francisco', 'SÃ£o Paulo', 'SP', '01005-020', '778693370540008','24698752183');    
    
insert into pessoa 
	(nome, dt_nascimento, logradouro, numero, bairro, cidade, uf, cep, cns, cpf)
values 
	('AcÃ¡cio Moura', '1985-04-29', 'Avenida General Costa e Silva', '908', 'Vila Militar', 'SÃ£o Paulo', 'SP', '06442-007', '234736304680008','71558660402');  

insert into pessoa 
	(nome, dt_nascimento, logradouro, numero, bairro, cidade, uf, cep, cns, cpf)
values 
	('Gustavo Camilo', '1983-08-25', 'Avenida Siqueira Campos', '2784', 'Centro', 'Barueri', 'SP', '06411-210', '270832524070006','82251731717');

insert into pessoa 
	(nome, dt_nascimento, logradouro, numero, bairro, cidade, uf, cep, cns, cpf)
values 
	('JosÃ© de Souza', '1991-03-17', 'Avenida Joao Paulo II', '3425', 'Oliveira', 'SÃ£o Pedro', 'SP', '06172-200', '169963985310004','94652218800');
    
insert into pessoa_telefone (pessoa_id, numero) values (1, '(11) 3235-4567');
insert into pessoa_telefone (pessoa_id, numero) values (2, '(11) 3212-3456');
insert into pessoa_telefone (pessoa_id, numero) values (3, '(11) 3879-2123');
insert into pessoa_telefone (pessoa_id, numero) values (4, '(11) 3902-9856');
insert into pessoa_telefone (pessoa_id, numero) values (5, '(11) 3574-9271');
insert into pessoa_telefone (pessoa_id, numero) values (1, '(11) 3213-5890');
 
insert into pessoa_tipo (pessoa_id, tipo_pessoa_id) values (1, 2);
insert into pessoa_tipo (pessoa_id, tipo_pessoa_id) values (2, 1);
insert into pessoa_tipo (pessoa_id, tipo_pessoa_id) values (3, 2);
insert into pessoa_tipo (pessoa_id, tipo_pessoa_id) values (4, 3);
insert into pessoa_tipo (pessoa_id, tipo_pessoa_id) values (5, 3);

insert into convenio (razao_social, cnpj) values ('UNIMED','88638266000105');
insert into convenio (razao_social, cnpj) values ('AMIL','33202172000105');
insert into convenio (razao_social, cnpj) values ('SULAMERICA','87015579000144');

insert into procedimento (descricao, tipo, aparelho) values ('RAIO X DE TORAX', 'I', 'RX');
insert into procedimento (descricao, tipo, aparelho) values ('ULTRASSONOGRAFIA DE ABDOMEN TOTAL', 'I', 'US');
insert into procedimento (descricao, tipo) values ('CONSULTA MÃ‰DICA', 'C');

insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (1, 1, 50);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (2, 1, 52.5);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (3, 1, 51.45);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (1, 2, 65);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (2, 2, 62.6);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (3, 2, 61.30);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (1, 3, 90);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (2, 3, 91.2);
insert into convenio_procedimento_valor (convenio_id, pro_id, valor) values (3, 3, 90.25);

insert into agendamento (dt_agenda, horario, pessoa_id, convenio_id, med_pessoa_id, pro_id)	values ('2019-01-15', '08:00', 4, 1, 1, 3);
insert into agendamento (dt_agenda, horario, pessoa_id, convenio_id, med_pessoa_id, pro_id)	values ('2019-01-15', '08:30', 5, 2, 1, 3);
insert into agendamento (dt_agenda, horario, pessoa_id, convenio_id, med_pessoa_id, pro_id)	values ('2019-01-15', '09:00', 4, 1, 3, 1);
insert into agendamento (dt_agenda, horario, pessoa_id, convenio_id, med_pessoa_id, pro_id)	values ('2019-01-15', '09:30', 5, 2, 3, 2);

create table worklist_aparelhos (
  worklist_id int(6) not null auto_increment,
  agendamento_id int(6) not null,
  dt_exame date not null,
  paciente varchar(80) not null,
  dt_nascimento date default null,
  convenio varchar(80) not null,
  procedimento varchar(100) not null,
  aparelho varchar(2) not null,
  integrado varchar(1) default 'N',
  primary key (worklist_id)
);

delimiter $$
create procedure incluir_worklist (in agend_id int)
begin
    /*1. Passo: busca os dados do agendamento */
    select a.dt_agenda
         , p.nome
         , p.dt_nascimento
         , c.razao_social
         , pr.descricao
         , pr.aparelho
	  into @dt_agenda
         , @nome
         , @dt_nascimento
         , @convenio
         , @descricao
         , @aparelho
     from agendamento a 
          inner join pessoa p on p.pessoa_id = a.pessoa_id
          inner join convenio c on c.convenio_id = a.convenio_id
          inner join procedimento pr on pr.pro_id = a.pro_id
	where a.agendamento_id = agend_id;
    
    insert into worklist_aparelhos (agendamento_id, dt_exame, paciente, dt_nascimento, convenio, procedimento, aparelho)
		values (agend_id, @dt_agenda, @nome, @dt_nascimento, @convenio, @descricao, @aparelho);

end $$	  
delimiter ;

delimiter $$
create procedure confirmar_realizacao_exame (in workl_id int)
begin
    
    select wa.agendamento_id
         , cpv.valor
	  into @agend_id
         , @valor
      from worklist_aparelhos wa
           inner join agendamento a on a.agendamento_id = wa.agendamento_id
           inner join convenio_procedimento_valor cpv on cpv.pro_id = a.pro_id and cpv.convenio_id = a.convenio_id
	 where wa.worklist_id = workl_id;
     
    update agendamento a
       set a.realizado = 'S'
         , a.valor = @valor
	 where a.agendamento_id = @agend_id;

end $$	  
delimiter ;

call incluir_worklist(3);

select * from worklist_aparelhos;

call confirmar_realizacao_exame(1);

select * from agendamento;

select * from convenio_procedimento_valor cpv where cpv.pro_id = 1 and cpv.convenio_id = 1;

truncate worklist_aparelhos;

alter table worklist_aparelhos auto_increment = 1;
