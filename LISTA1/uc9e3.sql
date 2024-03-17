CREATE DATABASE uc9e3;
#EMPREGADO (idemp, nomeemp, aniversario, enderecoemp, sexoemp,salarioemp, nrdep)

CREATE TABLE empregado (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) DEFAULT '',
data_nasc DATE DEFAULT '0000-00-00',
endereco VARCHAR(150),
sexo CHAR(1) DEFAULT '',
salario FLOAT(10,2) DEFAULT '0',
id_dependente INT NOT NULL DEFAULT '0',
PRIMARY KEY (id),
KEY (id_dependente)); 

#DEPARTAMENTO (nrdep, nomedep, idgerente, horario)
CREATE TABLE departamento (
id INT NOT	NULL AUTO_INCREMENT,
nome VARCHAR(100),
id_gerente INT DEFAULT '0',
horario TIME DEFAULT '00:00:00',
PRIMARY KEY (id),
KEY (id_gerente));

#LOCALIZAÇÃO (localizacao , nrdep)
CREATE TABLE localizacao (
localizacao VARCHAR(150) DEFAULT '',
id_departamento INT,
FOREIGN KEY(id_departamento) REFERENCES departamento(id));

#TRABALHA_EM (idemp, nrprojeto, horas)
CREATE TABLE trabalha_em (
id_empregado INT NOT NULL,
id_projeto INT NOT NULL DEFAULT '0',
horas TIME DEFAULT '00:00:00',
KEY (id_empregado),
KEY (id_projeto));

#PROJETO (nrproj, nomeproj, nrdep)
CREATE TABLE projeto (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50),
id_departamento INT DEFAULT '0',
PRIMARY KEY (id));

#DEPENDENTE (iddepende, idemp, nomedep, sexodep, aniversariodep,parentesco)
CREATE TABLE dependente (
id INT NOT NULL AUTO_INCREMENT,
id_empregado INT DEFAULT '0',
nome VARCHAR(100) DEFAULT '',
sexo CHAR(1) DEFAULT '',
data_nasc DATE,
parentesco VARCHAR(15) DEFAULT '',
PRIMARY KEY(id),
FOREIGN KEY(id_empregado) REFERENCES empregado(id));

-- Inserções para EMPREGADO
INSERT INTO empregado (nome, data_nasc, endereco, sexo, salario, id_dependente) 
VALUES 
  ('João Silva', '1990-01-01', 'Rua A, 123', 'M', 5000.00, 1),
  ('Maria Oliveira', '1995-02-15', 'Avenida B, 456', 'F', 6000.00, 2),
  ('Carlos Santos', '1988-04-20', 'Rua C, 789', 'M', 5500.00, 3),
  ('Ana Pereira', '1992-06-10', 'Avenida D, 321', 'F', 7000.00, 4),
  ('Pedro Mendes', '1985-08-22', 'Rua E, 567', 'M', 6500.00, 5),
  ('Mariana Lima', '1991-10-03', 'Avenida F, 876', 'F', 8000.00, 6),
  ('Fernando Costa', '1987-12-05', 'Rua G, 234', 'M', 7500.00, 7),
  ('Luciana Rocha', '1994-02-18', 'Avenida H, 789', 'F', 9000.00, 8),
  ('Ricardo Almeida', '1989-04-30', 'Rua I, 987', 'M', 8500.00, 9),
  ('Patrícia Nunes', '1993-07-12', 'Avenida J, 654', 'F', 10000.00, 10),
  ('Luiz Ferreira', '1986-09-25', 'Rua K, 321', 'M', 9500.00, 11),
  ('Gabriela Oliveira', '1997-11-07', 'Avenida L, 876', 'F', 11000.00, 12),
  ('Roberto Silva', '1984-01-19', 'Rua M, 543', 'M', 10500.00, 13),
  ('Camila Costa', '1996-03-22', 'Avenida N, 210', 'F', 12000.00, 14),
  ('Daniel Mendes', '1983-05-05', 'Rua O, 876', 'M', 11500.00, 15),
  ('Isabel Rocha', '1998-07-17', 'Avenida P, 432', 'F', 13000.00, 16),
  ('Eduardo Lima', '1982-09-29', 'Rua Q, 567', 'M', 12500.00, 17),
  ('Amanda Pereira', '1990-12-11', 'Avenida R, 321', 'F', 14000.00, 18),
  ('Alexandre Almeida', '1981-02-23', 'Rua S, 876', 'M', 13500.00, 19),
  ('Danielle Silva', '1995-04-06', 'Avenida T, 987', 'F', 15000.00, 20);

-- Inserções para DEPARTAMENTO
INSERT INTO departamento (nome, id_gerente, horario) 
VALUES 
  ('Vendas', 1, '08:00:00'),
  ('Produção', 2, '09:00:00'),
  ('Recursos Humanos', 3, '10:00:00'),
  ('TI', 4, '11:00:00'),
  ('Financeiro', 5, '12:00:00'),
  ('Marketing', 6, '13:00:00'),
  ('Logística', 7, '14:00:00'),
  ('Qualidade', 8, '15:00:00'),
  ('Jurídico', 9, '16:00:00'),
  ('Desenvolvimento', 10, '17:00:00'),
  ('Compras', 11, '18:00:00'),
  ('Projetos', 12, '19:00:00'),
  ('Suporte Técnico', 13, '20:00:00'),
  ('Engenharia', 14, '21:00:00'),
  ('Treinamento', 15, '22:00:00'),
  ('RH', 16, '23:00:00'),
  ('Marketing Digital', 17, '00:00:00'),
  ('Infraestrutura', 18, '01:00:00'),
  ('Comunicação', 19, '02:00:00'),
  ('Administração', 20, '03:00:00');

-- Inserções para LOCALIZAÇÃO
INSERT INTO localizacao (localizacao, id_departamento) 
VALUES 
  ('Sala 101', 1),
  ('Andar 2', 2),
  ('Prédio B', 3),
  ('Rio de Janeiro', 4),
  ('Torre D', 5),
  ('Sala E', 6),
  ('Andar 7', 7),
  ('Edifício F', 8),
  ('Sala G', 9),
  ('Andar 10', 10),
  ('Prédio H', 11),
  ('Sala I', 12),
  ('Torre J', 13),
  ('Edifício K', 14),
  ('Andar 15', 15),
  ('Rio de Janeiro', 16),
  ('Escritório M', 17),
  ('Prédio N', 18),
  ('Andar O', 19),
  ('Edifício P', 20);

-- Inserções para TRABALHA_EM
INSERT INTO trabalha_em (id_empregado, id_projeto, horas) 
VALUES 
  (1, 101, '40:00:00'),
  (2, 102, '35:30:00'),
  (3, 103, '38:15:00'),
  (4, 104, '42:45:00'),
  (5, 105, '37:30:00'),
  (6, 106, '41:00:00'),
  (7, 107, '39:15:00'),
  (8, 108, '36:45:00'),
  (9, 109, '40:30:00'),
  (10, 110, '38:00:00'),
  (11, 111, '43:30:00'),
  (12, 112, '37:00:00'),
  (13, 113, '39:45:00'),
  (14, 114, '36:15:00'),
  (15, 115, '41:30:00'),
  (16, 116, '38:45:00'),
  (17, 117, '42:00:00'),
  (18, 118, '37:45:00'),
  (19, 119, '39:00:00'),
  (20, 120, '44:00:00');

-- Inserções para PROJETO
INSERT INTO projeto (nome, id_departamento) 
VALUES 
  ('Projeto Alpha', 1),
  ('Projeto Beta', 2),
  ('Projeto Gama', 3),
  ('Projeto Delta', 4),
  ('Projeto Epsilon', 5),
  ('Projeto Zeta', 6),
  ('Projeto Eta', 7),
  ('Projeto Teta', 8),
  ('Projeto Iota', 9),
  ('Projeto Kappa', 10),
  ('Projeto Lambda', 11),
  ('Projeto Mi', 12),
  ('Projeto Ni', 13),
  ('Projeto Xi', 14),
  ('Projeto Omicron', 15),
  ('Projeto Pi', 16),
  ('Projeto Rho', 17),
  ('Projeto Sigma', 18),
  ('Projeto Tau', 19),
  ('Projeto Ômega', 20);

-- Inserções para DEPENDENTE
INSERT INTO dependente (id_empregado, nome, sexo, data_nasc, parentesco) 
VALUES 
  (1, 'Filha1 Silva', 'F', '2010-01-01', 'Filha'),
  (2, 'Filho1 Oliveira', 'M', '2011-02-02', 'Filho'),
  (3, 'Filha2 Santos', 'F', '2012-03-03', 'Filha'),
  (4, 'Filho2 Pereira', 'M', '2013-04-04', 'Filho'),
  (5, 'Filha3 Mendes', 'F', '2014-05-05', 'Filha'),
  (6, 'Filho3 Lima', 'M', '2015-06-06', 'Filho'),
  (7, 'Filha4 Costa', 'F', '2016-07-07', 'Filha'),
  (8, 'Filho4 Rocha', 'M', '2017-08-08', 'Filho'),
  (9, 'Filha5 Almeida', 'F', '2018-09-09', 'Filha'),
  (10, 'Filho5 Nunes', 'M', '2019-10-10', 'Filho'),
  (11, 'Filha6 Ferreira', 'F', '2020-11-11', 'Filha'),
  (12, 'Filho6 Oliveira', 'M', '2021-12-12', 'Filho'),
  (13, 'Filha7 Silva', 'F', '2022-01-01', 'Filha'),
  (14, 'Filho7 Costa', 'M', '2023-02-02', 'Filho'),
  (15, 'Filha8 Lima', 'F', '2024-03-03', 'Filha'),
  (16, 'Filho8 Rocha', 'M', '2025-04-04', 'Filho'),
  (17, 'Filha9 Lima', 'F', '2026-05-05', 'Filha'),
  (18, 'Filho9 Pereira', 'M', '2027-06-06', 'Filho'),
  (19, 'Filha10 Almeida', 'F', '2028-07-07', 'Filha'),
  (20, 'Filho10 Silva', 'M', '2029-08-08', 'Filho');


#1. Recuperar o nome e o endereço de todos os empregados que trabalham para o departamento de Compras.
SELECT empregado.nome, empregado.endereco
FROM empregado
JOIN localizacao ON empregado.id = localizacao.id_departamento
JOIN departamento ON localizacao.id_departamento = departamento.id
WHERE departamento.nome = 'Compras';

#2. Para cada projeto localizado no ‘Rio de Janeiro’, exibir o número do projeto, o número do
#departamento que o controla e a identidade de seu gerente, seu endereço e a data de seu
#aniversário

CREATE TABLE gerente (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
data_nasc DATE DEFAULT '0000-00-00',
PRIMARY KEY (id));

INSERT INTO gerente (nome, data_nasc) VALUES
('Ana Silva', '1980-01-15'),
('Carlos Oliveira', '1975-03-22'),
('Mariana Santos', '1982-05-10'),
('Pedro Costa', '1978-07-08'),
('Camila Lima', '1985-09-12'),
('Roberto Pereira', '1976-11-25'),
('Isabel Rocha', '1988-02-03'),
('Fernando Almeida', '1972-04-17'),
('Luciana Nunes', '1983-06-20'),
('José Mendes', '1974-08-28'),
('Amanda Souza', '1986-10-01'),
('Ricardo Ferreira', '1979-12-05'),
('Patrícia Oliveira', '1984-02-15'),
('Alexandre Lima', '1973-04-30'),
('Carla Costa', '1987-07-18'),
('Daniel Pereira', '1977-09-23'),
('Lúcia Santos', '1989-11-06'),
('Gustavo Silva', '1971-01-10'),
('Tatiane Costa', '1981-03-26'),
('Paulo Oliveira', '1970-05-15');

SELECT
  projeto.id AS numero_do_projeto,
  projeto.id_departamento AS numero_do_departamento,
  gerente.id AS identidade_do_gerente,
  gerente.nome AS nome_do_gerente,
  gerente.data_nasc AS aniversario_do_gerente,
  localizacao.localizacao AS endereco_do_gerente
FROM
  projeto
JOIN
  localizacao ON projeto.id_departamento = localizacao.id_departamento
JOIN
  departamento ON localizacao.id_departamento = departamento.id
JOIN
  gerente ON departamento.id_gerente = gerente.id
WHERE
  localizacao.localizacao = 'Rio de Janeiro';
  
INSERT INTO projeto VALUES (101,'Projeto João',20)

#3. Descobrir os nomes dos projetos onde trabalham empregados com o nome ‘João’.
SELECT projeto.nome AS nome_do_projeto
FROM projeto
JOIN trabalha_em ON projeto.id = trabalha_em.id_projeto
JOIN empregado ON trabalha_em.id_empregado = empregado.id
WHERE empregado.nome LIKE '%João Silva%';

