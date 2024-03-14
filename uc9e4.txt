CREATE DATABASE uc9e4;

USE uc9e4;

CREATE TABLE turma (
id INT NOT NULL AUTO_INCREMENT,
id_disciplina INT DEFAULT '0',
sigla VARCHAR(3),
ano INT DEFAULT '0',
PRIMARY KEY (id));


CREATE TABLE aluno (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
id_turma INT DEFAULT '0',
PRIMARY KEY (id),
FOREIGN KEY (id_turma) REFERENCES turma(id));


CREATE TABLE prova (
id INT NOT NULL AUTO_INCREMENT,
id_turma INT,
DATA DATE,
PRIMARY KEY (id),
FOREIGN KEY (id_turma) REFERENCES turma(id));


CREATE TABLE nota (
id_turma INT,
id_aluno INT,
id_prova INT,
nota DECIMAL(5,2),
FOREIGN KEY (id_turma) REFERENCES turma(id),
FOREIGN KEY (id_aluno) REFERENCES aluno(id),
FOREIGN KEY (id_prova) REFERENCES prova(id));

