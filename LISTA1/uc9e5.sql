CREATE DATABASE uc9e5;

USE uc9e5;

CREATE TABLE curso (
id INT NOT NULL AUTO_INCREMENT,
nome_curso VARCHAR(100),
PRIMARY KEY (id));

CREATE TABLE professor (
id INT NOT NULL AUTO_INCREMENT,
cpf VARCHAR(11) NOT NULL,
nome VARCHAR(100),
data_nascimento DATE,
titulacao VARCHAR(100),
telefone VARCHAR(20),
PRIMARY KEY (id));

CREATE TABLE turma (
id INT NOT NULL AUTO_INCREMENT,
id_curso INT,
quantidade_alunos INT,
horario_aula TIME,
data_inicial DATE,
data_final DATE,
PRIMARY KEY (id),
FOREIGN KEY (id_curso) REFERENCES curso(id));

CREATE TABLE aluno (
id INT NOT NULL AUTO_INCREMENT,
data_matricula DATE,
nome VARCHAR(100),
endereco VARCHAR(255),
telefone VARCHAR(20),
data_nascimento DATE,
altura DECIMAL(5,2),
peso DECIMAL(5,2),
PRIMARY KEY (id));

CREATE TABLE monitor (
id INT NOT NULL AUTO_INCREMENT,
id_aluno INT,
id_turma INT,
PRIMARY KEY (id),
FOREIGN KEY (id_aluno) REFERENCES aluno(id),
FOREIGN KEY (id_turma) REFERENCES turma(id));

CREATE TABLE matricula_turma (
codigo_matricula INT,
id_turma INT,
ausencias INT,
FOREIGN KEY (codigo_matricula) REFERENCES aluno(id),
FOREIGN KEY (id_turma) REFERENCES turma(id));
