
CREATE DATABASE escola_abc CHARACTER SET = 'utf8' COLLATE= 'utf8_general_ci';



-- Table aluno



CREATE TABLE IF NOT EXISTS aluno (

   id INT NOT NULL ,

  nome VARCHAR(100) NOT NULL ,

   matricula VARCHAR(45) NOT NULL ,

   data_nascimento DATE NULL ,

   data_matricula DATE NOT NULL ,

 PRIMARY KEY ( id ) ,

 UNIQUE INDEX matricula_UNIQUE ( matricula ASC) )

ENGINE = InnoDB;



-- Table prova

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS prova (

   id INT NOT NULL ,

   data_realizacao DATE NOT NULL ,

   descricao VARCHAR(255) NOT NULL ,

 PRIMARY KEY ( id ) )

ENGINE = InnoDB;

-- -----------------------------------------------------

-- Table nota



CREATE TABLE IF NOT EXISTS nota (

   aluno_id INT NOT NULL ,

   prova_id INT NOT NULL ,

   valor_nota DECIMAL(15,2) NULL ,

 PRIMARY KEY ( aluno_id , prova_id ) ,

 INDEX fk_aluno_has_prova_prova1 ( prova_id ASC) ,

 INDEX fk_aluno_has_prova_aluno1 ( aluno_id ASC) ,

 CONSTRAINT fk_aluno_has_prova_aluno1

    FOREIGN KEY ( aluno_id )

    REFERENCES aluno ( id )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

 CONSTRAINT fk_aluno_has_prova_prova1

    FOREIGN KEY ( prova_id )

    REFERENCES prova ( id )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;



#População das tabelas

-- INSERINDO ALUNOS

INSERT INTO aluno (id, nome, matricula, data_nascimento,

data_matricula) VALUES (1,'ALUNO01', '123A', STR_TO_DATE('23/08/1993','%d/%m/%Y'), CURRENT_DATE()),

(2,' ALUNO02', '400B', STR_TO_DATE('10/04/1993','%d/%m/%Y'), CURRENT_DATE()),

(3,' ALUNO03', '420B', STR_TO_DATE('30/07/1983','%d/%m/%Y'), CURRENT_DATE()),

(4,' ALUNO04', '010A', NULL, STR_TO_DATE('25/01/2004','%d/%m/%Y'));

 

-- INSERINDO PROVAS

INSERT INTO prova(id, data_realizacao, descricao) VALUES (1, STR_TO_DATE('30/03/2014', '%d/%m/%Y'), 'Prova A1'),

(2, STR_TO_DATE('30/04/2014', '%d/%m/%Y'), 'Prova B1'), (3, STR_TO_DATE('30/05/2014', '%d/%m/%Y'), 'Prova C1'),

(4, STR_TO_DATE('30/07/2014', '%d/%m/%Y'), 'Prova A2'), (5, STR_TO_DATE('30/08/2014', '%d/%m/%Y'), 'Prova B2'),

(6, STR_TO_DATE('30/09/2014', '%d/%m/%Y'), 'Prova C2');


INSERT INTO nota (aluno_id, prova_id, valor_nota) VALUES

#ALUNO 1

(1, 1, 10),

(1, 2, 9.8),

(1, 3, 8),

(1, 4, 10),

(1, 5, 10),

(1, 6, 9),

 

#ALUNO 2

(2, 1, 7),

(2, 2, 7.5),

(2, 3, 6),

(2, 4, 8),

(2, 5, 8.5),

(2, 6, 9),


#ALUNO 3

(3, 1, 9),

(3, 2, 9),

(3, 3, 9),

(3, 4, 10),

(3, 5, 10),

(3, 6, 9.8),

 

#ALUNO 4

(4, 1, 3),

(4, 2, 6),

(4, 3, 7),

(4, 4, 8),

(4, 5, 7),

(4, 6, 7);