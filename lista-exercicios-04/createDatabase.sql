create database base_de_dados;
use base_de_dados;

create table curso (
	idCurso int primary key unique not null auto_increment,
    tipo char(1),
    nome varchar(50)
)Engine = InnoDB;

create table grade (
	idGrade int primary key unique not null auto_increment,
    ano smallint,
    chTotal smallint,
    idCurso int not null,
    foreign key (idCurso) 
    references curso (idCurso)
)Engine = InnoDB;

create table disciplina (
	idDisciplina int primary key unique not null auto_increment,
    nome varchar(50),
    ch smallint
)Engine = InnoDB;

create table composta (
	idDisciplina int not null,
    idGrade int not null,
    primary key(idDisciplina, idGrade),
	foreign key (idDisciplina) 
    references disciplina (idDisciplina),
    foreign key (idGrade) 
    references grade (idGrade)
)Engine = InnoDB;

create table aluno (
	idAluno int primary key unique not null auto_increment,
    nome varchar(100)
)Engine = InnoDB;

create table matricula (
	matricula varchar(15) primary key unique not null,
    anoIngresso smallint,
    idGrade int not null,
    idAluno int not null,
	foreign key (idGrade) 
    references grade (idGrade),
    foreign key (idAluno) 
    references aluno (idAluno)
)Engine = InnoDB;

create table historico (
	idHistorico int primary key unique not null auto_increment,
    status varchar(10),
    nota decimal(10,2),
    data datetime,
    matricula varchar(15) not null,
    idDisciplina int not null,
	foreign key (matricula) 
    references matricula (matricula),
    foreign key (idDisciplina) 
    references disciplina (idDisciplina)
)Engine = InnoDB;

create table pre_requisito (
    posterior int not null,
    idAnterior int not null,
    primary key(posterior, idAnterior),
    foreign key (posterior) 
    references disciplina (idDisciplina),
    foreign key (idAnterior) 
    references disciplina (idDisciplina)
)Engine = InnoDB;

INSERT INTO `base_de_dados`.`aluno` (`nome`) VALUES ('Mateus Rangel');
INSERT INTO `base_de_dados`.`aluno` (`nome`) VALUES ('Kate Chienne');
INSERT INTO `base_de_dados`.`aluno` (`nome`) VALUES ('Tales de Mileto');

INSERT INTO `base_de_dados`.`curso` (`tipo`, `nome`) VALUES ('0', 'Engenharia InformÃ¡tica');
INSERT INTO `base_de_dados`.`curso` (`tipo`, `nome`) VALUES ('0', 'GestÃ£o de Marketing');

INSERT INTO `base_de_dados`.`grade` (`ano`, `chTotal`, `idCurso`) VALUES ('2020', '450', '1');
INSERT INTO `base_de_dados`.`grade` (`ano`, `chTotal`, `idCurso`) VALUES ('2021', '500', '1');
INSERT INTO `base_de_dados`.`grade` (`ano`, `chTotal`, `idCurso`) VALUES ('2020', '150', '2');
INSERT INTO `base_de_dados`.`grade` (`ano`, `chTotal`, `idCurso`) VALUES ('2021', '100', '2');

INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('Algoritmos estruturados', '150');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('LÃ³gica de programaÃ§Ã£o', '150');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('Banco de Dados', '150');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('AdministraÃ§Ã£o de Banco de Dados', '150');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('ProgramaÃ§Ã£o Web', '200');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('AdministraÃ§Ã£o de redes', '150');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('LideranÃ§a e gestÃ£o', '100');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('ConstruÃ§Ã£o do pensamento', '50');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('Ã‰tica e Responsabilidade Social', '50');
INSERT INTO `base_de_dados`.`disciplina` (`nome`, `ch`) VALUES ('Comunicador Digital', '50');

INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('1', '1');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('2', '1');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('3', '1');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('4', '2');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('5', '2');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('6', '2');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('7', '3');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('8', '3');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('9', '4');
INSERT INTO `base_de_dados`.`composta` (`idDisciplina`, `idGrade`) VALUES ('10', '4');

INSERT INTO `base_de_dados`.`pre_requisito` (`posterior`, `idAnterior`) VALUES ('4', '3');

INSERT INTO `base_de_dados`.`matricula` (`matricula`, `anoIngresso`, `idGrade`, `idAluno`) VALUES ('TPSI2020038', '2020', '1', '1');
INSERT INTO `base_de_dados`.`matricula` (`matricula`, `anoIngresso`, `idGrade`, `idAluno`) VALUES ('EINF2010010', '2020', '1', '2');

INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '8', '2020-02-15 14:02:45', 'TPSI2020038', '1');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '9', '2020-02-15 14:22:12', 'TPSI2020038', '2');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '5', '2020-02-15 14:20:22', 'TPSI2020038', '3');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Aprovado', '10', '2020-02-15 14:45:36', 'EINF2010010', '1');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Aprovado', '7', '2020-02-15 14:51:51', 'EINF2010010', '2');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '4', '2020-02-15 14:37:32', 'EINF2010010', '3');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '8', '2021-02-09 14:02:25', 'TPSI2020038', '4');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '7', '2021-02-08 14:03:31', 'TPSI2020038', '5');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '4', '2021-02-09 14:15:42', 'TPSI2020038', '6');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Aprovado', '7', '2021-02-09 15:26:45', 'EINF2010010', '4');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Aprovado', '10', '2021-02-08 14:21:26', 'EINF2010010', '5');
INSERT INTO `base_de_dados`.`historico` (`status`, `nota`, `data`, `matricula`, `idDisciplina`) VALUES ('Reprovado', '6', '2021-02-09 14:18:24', 'EINF2010010', '6');