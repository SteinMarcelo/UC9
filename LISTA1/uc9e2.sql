CREATE DATABASE uc9e2;

#ALUNO (aluno_id, nome, curso, nivel, idade)
CREATE TABLE aluno (
id INT(10) NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) DEFAULT '',
curso VARCHAR(50) DEFAULT '',
nivel VARCHAR(30) DEFAULT '',
dt_nasc DATE DEFAULT '000-00-00',
PRIMARY KEY (id)
);

#3TURMA (turma_id, nometurma, sala, horario)
CREATE TABLE turma (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50),
sala INT NOT NULL DEFAULT '0',
turno VARCHAR(5),
PRIMARY KEY (id)
);

#MATRÍCULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, nr_faltas)
CREATE TABLE matricula (
id INT NOT NULL AUTO_INCREMENT,
id_aluno INT NOT NULL DEFAULT '0',
id_turma INT DEFAULT '0',
nota_1 DECIMAL(2,1) NULL DEFAULT '0.0',
nota_2 DECIMAL(2,1) NULL DEFAULT '0.0',
nota_3 DECIMAL(2,1) NULL DEFAULT '0.0',
nota_final DECIMAL(2,1) NULL DEFAULT '0.0',
faltas INT NOT NULL DEFAULT '0',
PRIMARY KEY(id),
FOREIGN KEY(id_aluno) REFERENCES aluno(id),
FOREIGN KEY(id_turma) REFERENCES turma(id)
);


INSERT INTO uc9e2.aluno (nome, curso, nivel, dt_nasc) VALUES
  ('Alice Silva', 'Engenharia Elétrica', 'Graduação', '1995-05-15'),
  ('Bruno Santos', 'Ciência da Computação', 'Graduação', '1998-09-22'),
  ('Clara Lima', 'Medicina', 'Graduação', '1993-02-10'),
  ('Daniel Costa', 'Administração', 'Graduação', '1990-11-30'),
  ('Eduarda Oliveira', 'Psicologia', 'Graduação', '1997-04-18'),
  ('Fábio Pereira', 'Arquitetura', 'Graduação', '1992-07-05'),
  ('Giovanna Almeida', 'Direito', 'Graduação', '1999-01-20'),
  ('Henrique Souza', 'Economia', 'Graduação', '1996-08-12'),
  ('Isabela Santos', 'Engenharia Civil', 'Graduação', '1991-03-25'),
  ('João Lima', 'Medicina Veterinária', 'Graduação', '1994-06-08'),
  ('Karen Oliveira', 'Design Gráfico', 'Graduação', '1998-12-01'),
  ('Lucas Costa', 'Biologia', 'Graduação', '1992-05-14'),
  ('Mariana Almeida', 'Nutrição', 'Graduação', '1997-10-07'),
  ('Nathan Pereira', 'Física', 'Graduação', '1993-04-22'),
  ('Olivia Souza', 'Jornalismo', 'Graduação', '1990-09-15'),
  ('Pedro Santos', 'Engenharia Química', 'Graduação', '1995-02-28'),
  ('Quiteria Lima', 'História', 'Graduação', '1999-07-11'),
  ('Rafaela Costa', 'Matemática', 'Graduação', '1994-12-24'),
  ('Samuel Oliveira', 'Gastronomia', 'Graduação', '1991-06-17'),
  ('Thais Silva', 'Enfermagem', 'Graduação', '1996-11-03');

-- Inserções para a tabela turma
INSERT INTO uc9e2.turma (nome, sala, turno) VALUES
  ('Turma A', 101, 'Manhã'),
  ('Turma B', 202, 'Tarde'),
  ('Turma C', 303, 'Noite'),
  ('Turma D', 104, 'Manhã'),
  ('Turma E', 205, 'Tarde'),
  ('Turma F', 306, 'Noite'),
  ('Turma G', 107, 'Manhã'),
  ('Turma H', 208, 'Tarde'),
  ('Turma I', 309, 'Noite'),
  ('Turma J', 110, 'Manhã'),
  ('Turma K', 211, 'Tarde'),
  ('Turma L', 312, 'Noite'),
  ('Turma M', 113, 'Manhã'),
  ('Turma N', 214, 'Tarde'),
  ('Turma O', 315, 'Noite'),
  ('Turma P', 116, 'Manhã'),
  ('Turma Q', 217, 'Tarde'),
  ('Turma R', 318, 'Noite'),
  ('Turma S', 119, 'Manhã'),
  ('Turma T', 220, 'Tarde');

#Inserções para a tabela matricula
INSERT INTO uc9e2.matricula (id_aluno, id_turma, nota_1, nota_2, nota_3, nota_final, faltas) VALUES
  (1, 1, 8.5, 7.5, 9.0, 8.3, 2),
  (2, 2, 7.0, 8.0, 7.5, 7.5, 1),
  (3, 3, 9.0, 9.5, 8.5, 9.0, 0),
  (4, 4, 6.5, 7.0, 7.0, 6.8, 3),
  (5, 5, 8.0, 8.5, 9.0, 8.5, 1),
  (6, 6, 7.5, 6.5, 8.0, 7.3, 2),
  (7, 7, 9.5, 8.0, 9.5, 9.3, 0),
  (8, 8, 6.0, 6.5, 7.0, 6.5, 4),
  (9, NULL, 8.5, 8.0, 8.5, 8.3, 1),
  (10, 10, 7.0, 7.5, 7.0, 7.2, 2),
  (11, 11, 9.0, 9.5, 8.0, 9.0, 0),
  (12, 12, 6.5, 7.0, 7.5, 7.0, 3),
  (13, 13, 8.0, 8.5, 8.0, 8.2, 1),
  (14, 14, 7.5, 6.5, 8.5, 7.5, 2),
  (15, 15, 9.5, 8.0, 9.0, 9.0, 0),
  (16, 16, 6.0, 6.5, 7.0, 6.5, 4),
  (17, 17, 8.5, 8.0, 8.5, 8.3, 1),
  (18, 18, 7.0, 7.5, 7.0, 7.2, 2),
  (19, 19, 9.0, 9.5, 8.0, 9.0, 0),
  (20, 20, 6.5, 7.0, 7.5, 7.0, 3);
#1. Quais os nomes de todos os alunos?
SELECT nome FROM aluno;

#2. Quais os números das matrículas dos alunos?
SELECT matricula.id AS Matricula ,aluno.`nome` AS Nome FROM matricula INNER JOIN aluno ON aluno.id = matricula.`id_aluno`;

#3. Quais os números das matrículas dos alunos que não estão matriculados em uma turma?
SELECT aluno.`nome`, matricula.`id` AS Matricula
FROM aluno
LEFT JOIN matricula ON aluno.`id` = matricula.`id_aluno`
WHERE matricula.`id_turma` IS NULL;

#4. Quais os números dos alunos matriculados em uma turma de número '30'?
SELECT id_aluno FROM matricula JOIN aluno ON matricula.id_aluno = aluno.`id` WHERE matricula.`id_turma` = 30;
#5. Qual o horário da turma do aluno 'Dick Vigarista'?
UPDATE aluno SET nome = 'Dick Vigarista' WHERE id = 6;

SELECT aluno.`nome`,turma.`turno` FROM matricula JOIN turma ON matricula.`id_turma` = turma.`id` 
JOIN aluno ON aluno.`id` = matricula.`id_aluno` WHERE aluno.nome = 'Dick Vigarista';

#6. Quais os nomes dos alunos matriculados em uma turma de número '30'?
SELECT aluno.`id`,aluno.`nome`,matricula.`id_turma` FROM matricula JOIN turma ON matricula.`id_turma` = turma.`id` 
JOIN aluno ON aluno.`id` = matricula.`id_aluno` WHERE turma.id = 30;

#7. Quais os nomes dos alunos que não estão matriculados na turma de número '30'?
SELECT aluno.nome, turma.id
FROM aluno
JOIN matricula ON aluno.id = matricula.id_aluno JOIN turma ON matricula.id_turma = turma.id WHERE turma.id NOT IN (30);

#8. Quais os nomes das turmas com alunos com nota final maior que 8?
SELECT turma.nome,turma.`id` FROM turma INNER JOIN matricula ON matricula.`id_turma` = turma.`id` WHERE nota_final > 8;