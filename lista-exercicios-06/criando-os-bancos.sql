/*
### Criando o banco de dados instituicao de ensino
*/

CREATE DATABASE IF NOT EXISTS int_ensino;

-- Selecionando o banco para trabalhar nele

USE int_ensino;

-- Criando a tabela instituição

CREATE TABLE IF NOT EXISTS int_ensino.instituicao (
	id_instituicao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao VARCHAR(255)
)
COMMENT "Tabela que armazena as instituições";

-- Criando a tabela Curso

CREATE TABLE IF NOT EXISTS int_ensino.curso (
	id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_instituicao INT NOT NULL,
    nome VARCHAR(255),
    carga_horaria INT,
	FOREIGN KEY (id_instituicao) REFERENCES instituicao(id_instituicao)
)
COMMENT "Tabela que armazena os cursos de cada instituicao";

/*
### Criando o banco de dados endereços
*/

CREATE DATABASE IF NOT EXISTS endereco;

-- Selecionando o banco para trabalhar nele

USE endereco;

-- Criando a tabela endereco

CREATE TABLE IF NOT EXISTS endereco.endereco (
	id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(255),
    numero INT,
    complemento VARCHAR(255)
)
COMMENT "Tabela que armazena as endereco";

-- Criando a tabela cidade

CREATE TABLE IF NOT EXISTS endereco.cidade (
	id_cidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_endereco INT NOT NULL,
    nome VARCHAR(255),
	FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
)
COMMENT "Tabela que armazena a cidade do endereco";

-- Criando a tabela estado

CREATE TABLE IF NOT EXISTS endereco.estado (
	id_estado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cidade INT NOT NULL,
    nome VARCHAR(255),
	FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
)
COMMENT "Tabela que armazena o estado do endereco";

-- Criando a tabela país

CREATE TABLE IF NOT EXISTS endereco.pais (
	id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_estado INT NOT NULL,
    nome VARCHAR(255),
	FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
)
COMMENT "Tabela que armazena o país do endereco";

/*
### Criando o banco de dados pessoas
*/

CREATE DATABASE IF NOT EXISTS pessoas;

-- Selecionando o banco para trabalhar nele

USE pessoas;

-- Criando a tabela pessoas

CREATE TABLE IF NOT EXISTS pessoas.pessoas (
	id_pessoa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT
)
COMMENT "Tabela que armazena as pessoas";

-- Criando a tabela o contado da pessoa

CREATE TABLE IF NOT EXISTS pessoas.contato (
	id_contato INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefone VARCHAR(11),
    endereco VARCHAR(255),
	FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
)
COMMENT "Tabela que armazena os contato de cada pessoa";

-- Criando a tabela o usuario da pessoa

CREATE TABLE IF NOT EXISTS pessoas.usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT NOT NULL,
    usuario VARCHAR(20),
    senha VARCHAR(20),
	FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
)
COMMENT "Tabela que armazena o usuario de cada pessoa";


